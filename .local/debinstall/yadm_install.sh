#!/bin/sh

GIT_SRC=https://github.com/reptiloid

install_pkgs() {
	echo
	printf '%s\n' "Installing packages" && sleep 1
	sudo apt install -y wget git yadm
}

set_yadm_step1() {
	echo
	printf '%s\n' "Setting YADM" && sleep 1
	yadm clone --depth=1 "$GIT_SRC"/debinstall12.git
}

set_yadm_step2() {
	# echo
	# printf '%s\n' "Setting YADM" && sleep 1
  yadm checkout "$HOME"
}


main() {
	install_pkgs
	set_yadm_step1
	# set_yadm_step2
}

main
