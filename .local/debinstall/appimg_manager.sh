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

install_dep_pkgs() {
	echo
	printf '%s\n' "Installing packages" && sleep 1
	sudo nala install -y thunar zsync
}

install_additional_pkgs() {
	am -i chromium freetube obsidian
}

install_base_pkgs() {
	am -i nvim
}

main() {
  install_dep_pkgs
	clone_am
	install_am
	install_base_pkgs
  # install_additional_pkgs
}

main
