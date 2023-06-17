#!/bin/sh

GIT_SRC=https://github.com/reptiloid

install_pkgs() {
	echo
	printf '%s\n' "Installing packages" && sleep 1
	sudo apt install -y wget git yadm
}

set_yadm() {
	echo
	printf '%s\n' "Setting YADM" && sleep 1
	yadm clone "$GIT_SRC"/debinstall12.git
}

main() {
	install_pkgs
	set_yadm
}

main
