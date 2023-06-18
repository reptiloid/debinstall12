#!/bin/sh

SRC_DIR=~/.local/debinstall/src

clone_am() {
	echo
	printf '%s\n' "Getting AM-application-manager.git" && sleep 1
	cd "$SRC_DIR" || exit
	git clone https://github.com/ivan-hc/AM-application-manager.git
}

install_am() {
	cd "$SRC_DIR"/AM-application-manager || exit
	chmod a+x INSTALL
	sudo ./INSTALL
}

install_pkgs() {
	am -i neovim chromium
}

main() {
	clone_am
	install_am
	install_pkgs
}

main
