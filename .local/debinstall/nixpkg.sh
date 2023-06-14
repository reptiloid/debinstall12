#!/bin/sh

install_nix() {
	echo
	printf '%s\n' "Installing Nix" && sleep 1
	sh <(curl -L https://nixos.org/nix/install) --no-daemon
	. /home/rep/.nix-profile/etc/profile.d/nix.sh
}

install_nix_pkgs() {
	echo
	printf '%s\n' "Installing Nix Pkgs" && sleep 1
	nix-env -iA nixpkgs.neovim nixpkgs.picom nixpkgs.htop-vim \
        # nixpkgs.obsidian nixpkgs.librewolf
}

main() {
	install_nix
	install_nix_pkgs
}

main
