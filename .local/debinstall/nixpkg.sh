#!/bin/sh

install_nix() {
	echo
	printf '%s\n' "Installing Nix" && sleep 1
	sh <(curl -L https://nixos.org/nix/install) --no-daemon
	. /home/rep/.nix-profile/etc/profile.d/nix.sh
}

install_nix_pkgs_nonfree() {
	echo
	printf '%s\n' "Installing Unfree Nix Pkgs" && sleep 1
	export NIXPKGS_ALLOW_UNFREE=1
	nix-env -iA nixpkgs.obsidian
}

install_nix_additional_pkgs() {
	echo
	printf '%s\n' "Installing Unfree Nix Pkgs" && sleep 1
	nix-env -iA nixpkgs.syncthing \
 				nixpkgs.freetube \
 		
}

install_nix_base_pkgs() {
	echo
	printf '%s\n' "Installing Nix Base Pkgs" && sleep 1
	nix-env -iA nixpkgs.picom \
 				nixpkgs.htop-vim \
				nixpkgs.lf \
				nixpkgs.starship
}

main() {
	install_nix
	install_nix_base_pkgs
	# install_nix_pkgs_nonfree
	# install_nix_additional_pkgs
}

main
