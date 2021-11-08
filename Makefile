install: set_path link
	-./script/install.sh

link: set_path
	-./script/link.sh

update: set_path
	-./script/update.sh

set_path:
	-./script/set_path.sh
