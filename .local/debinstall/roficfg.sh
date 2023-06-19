#!/bin/sh

SRC_DIR=~/.local/debinstall/src

clone_rofi_cfg() {
	echo
	printf '%s\n' "Getting rofi config" && sleep 1
	cd "$SRC_DIR" || exit
  git clone --depth=1 https://github.com/adi1090x/rofi.git
}

install_rofi_cfg() {
	cd "$SRC_DIR"/rofi || exit
  chmod +x setup.sh
  ./setup.sh
}

main() {
	# clone_rofi_cfg
	install_rofi_cfg
}

main
