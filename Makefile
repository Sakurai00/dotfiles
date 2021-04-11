install:
	-./script/install.sh
	-./script/link.sh

link:
	-./script/link.sh

ubuntu-init:
	-./script/ubuntu.sh
	-./script/install.sh
	-./script/link.sh
