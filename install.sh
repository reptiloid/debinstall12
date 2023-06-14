INS_DIR=~/.local/debinstall

# Install APT Pkgs
source "$INS_DIR"/pkg_install.sh

# Install NIX Pkgs
source "$INS_DIR"/nixpkg.sh

# Install NVIM Configs
source "$INS_DIR"/nvim_configs.sh

# 72726LV-7JFW5TZ-AMAEXUH-MBREDU7-X52GVUK-BBZJKP6-IDTPQY6-KTZQZAF

sudo apt autoremove

printf "\e[1;32mDone! you can now reboot.\e[0m\n"