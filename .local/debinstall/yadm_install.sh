#!/bin/sh

GIT_SRC=https://bitbucket.org/reptiloid666

install_pkgs() {
	echo
	printf '%s\n' "Installing packages" && sleep 1
	sudo apt install -y wget curl git yadm
}

set_yadm() {
	echo
	printf '%s\n' "Setting YADM" && sleep 1
    yadm clone "$GIT_SRC"/dotfiles.git
}

main() {
	install_pkgs
	set_yadm
}

main

