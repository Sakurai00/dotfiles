install:
	-./script/set_path.sh
	-./script/install.sh
	-./script/link.sh

link:
	-./script/set_path.sh
	-./script/link.sh

update:
	-./script/update.sh