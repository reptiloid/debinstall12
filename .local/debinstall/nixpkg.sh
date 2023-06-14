#!/bin/sh

install_nix() {
	echo
	printf '%s\n' "Installing Nix" && sleep 1
	sh <(curl -L https://nixos.org/nix/install) --no-daemon
}

install_nix_pkgs() {
	echo
	printf '%s\n' "Installing Nix Pkgs" && sleep 1
	nix-env -iA nixpkgs.librewolf nixpkgs.neovim nixpkgs.picom nixpkgs.htop-vim \
        nixpkgs.obsidian
}

main() {
	install_nix
	install_nix_pkgs
}

main
