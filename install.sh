INS_DIR=~/.local/debinstall

# Install APT Pkgs
source "$INS_DIR"/pkg_install.sh

# Install NIX Pkgs
source "$INS_DIR"/nixpkg.sh

# Install NVIM Configs
source "$INS_DIR"/nvim_configs.sh



sudo apt autoremove

printf "\e[1;32mDone! you can now reboot.\e[0m\n"