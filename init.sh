#!/usr/bin/env bash
set -euo pipefail

# bash -c "$(curl -L raw.github.com/Sakurai00/dotfiles/master/init.sh)"

# 設定
OS="$(uname)"
DOTFILES_REPO_URL="${DOTFILES_REPO_URL:-https://github.com/Sakurai00/dotfiles.git}"
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
DOTFILES_DEFAULT_TAGS="${DOTFILES_DEFAULT_TAGS:-minimum}"
OS_RELEASE_FILE="${OS_RELEASE_FILE:-/etc/os-release}"

# 共通 helper
log_info() {
    printf '[init] %s\n' "$1"
}

log_warn() {
    printf '[init] %s\n' "$1" >&2
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# ============================================================================

# Linux の判定材料を /etc/os-release から読む。
read_os_release_value() {
    local key="$1"

    if [[ ! -f "${OS_RELEASE_FILE}" ]]; then
        return 1
    fi

    awk -F= -v key="${key}" '$1 == key { gsub(/^"|"$/, "", $2); print $2; exit }' "${OS_RELEASE_FILE}"
}

# Linux では利用可能な package manager を自動判定する。
detect_linux_package_manager() {
    local os_id os_like
    os_id="$(read_os_release_value ID || true)"
    os_like="$(read_os_release_value ID_LIKE || true)"

    case " ${os_id} ${os_like} " in
        *" fedora "*|*" rhel "*|*" rocky "*|*" almalinux "*|*" centos "*)
            if command_exists dnf; then
                printf 'dnf\n'
                return 0
            fi
            ;;
        *" debian "*|*" ubuntu "*)
            if command_exists apt; then
                printf 'apt\n'
                return 0
            fi
            ;;
    esac

    if command_exists apt; then
        printf 'apt\n'
        return 0
    fi

    if command_exists dnf; then
        printf 'dnf\n'
        return 0
    fi

    log_warn "Unsupported Linux package manager"
    exit 1
}

# macOS では brew 導入後の shellenv を反映する。
ensure_homebrew() {
    if [[ "${OS}" != "Darwin" ]]; then
        return 0
    fi

    if command_exists brew; then
        return 0
    fi

    log_info "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
}

# Linux 依存の install 差分はここに集約する。
install_linux_packages() {
    local package_manager
    package_manager="$(detect_linux_package_manager)"

    case "${package_manager}" in
        apt)
            log_info "Installing $* with apt"
            log_info "Updating apt package index"
            sudo apt update
            sudo apt install -y "$@"
            ;;
        dnf)
            log_info "Installing $* with dnf"
            sudo dnf --refresh install -y "$@"
            ;;
        *)
            log_warn "Unsupported Linux package manager: ${package_manager}"
            exit 1
            ;;
    esac
}

# pip 経由の Python パッケージ導入をまとめる。
install_pip_packages() {
    if ! command_exists pip3; then
        install_linux_packages python3-pip
    fi
    log_info "Installing $* with pip3"
    pip3 install --user "$@"
}

# ============================================================================

# git は OS ごとの package manager で導入する。
ensure_git() {
    if command_exists git; then
        return 0
    fi

    case "${OS}" in
        Darwin)
            ensure_homebrew
            log_info "Installing git with Homebrew"
            brew install git
            ;;
        Linux)
            install_linux_packages git
            ;;
        *)
            log_warn "Unsupported OS: ${OS}"
            exit 1
            ;;
    esac
}

# ansible は package manager と pip3 を組み合わせて導入する。
ensure_ansible() {
    if command_exists ansible; then
        return 0
    fi

    case "${OS}" in
        Darwin)
            ensure_homebrew
            log_info "Installing ansible with Homebrew"
            brew install ansible
            ;;
        Linux)
            install_pip_packages ansible
            export PATH="$HOME/.local/bin:$PATH"
            ;;
        *)
            log_warn "Unsupported OS: ${OS}"
            exit 1
            ;;
    esac
}

# dotfiles checkout の clone/update を担当する。
sync_repo() {
    if [[ ! -d "${DOTFILES_DIR}/.git" ]]; then
        log_info "Cloning dotfiles repository"
        git clone "${DOTFILES_REPO_URL}" "${DOTFILES_DIR}"
        cd "${DOTFILES_DIR}"
        return 0
    fi

    cd "${DOTFILES_DIR}"

    log_info "Fetching origin/master"
    git fetch origin master

    if git merge-base --is-ancestor HEAD origin/master; then
        if [[ "$(git rev-parse HEAD)" == "$(git rev-parse origin/master)" ]]; then
            log_info "dotfiles is already up to date"
            return 0
        fi

        log_info "Fast-forwarding to origin/master"
        git merge --ff-only origin/master
        return 0
    fi

    log_warn "Cannot fast-forward; manual sync required: ${DOTFILES_DIR}"
}

# playbook 実行は最後にまとめて行う。
run_playbook() {
    local tags="${DOTFILES_TAGS:-$DOTFILES_DEFAULT_TAGS}"

    log_info "Running ansible-playbook (tags: ${tags})"
    ansible-playbook -i ./inventories/production/hosts.yml ./playbook.yml --ask-become-pass --tags "${tags}"
}

# ============================================================================

# main は bootstrap の大まかな流れだけを残す。
main() {
    ensure_git
    ensure_ansible
    sync_repo
    run_playbook
}

if [[ "${DOTFILES_INIT_TESTING:-0}" != "1" ]]; then
    main "$@"
fi
