INS_DIR=~/.local/debinstall

## Colors ----------------------------
Color_Off='\033[0m'
BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'



install_apt_pkgs() {
  echo -e ${BBlue}"\n[*] Installing Apt Packages + Fonts...\n" ${Color_Off}
  source "$INS_DIR"/pkg_install.sh
}


install_nix_pkgs() {
  echo -e ${BYellow}"\n[*] Installing Nix Pkgs...\n" ${Color_Off}
  source "$INS_DIR"/nixpkg.sh
}

install_appimg_pkgs() {
  echo -e ${BPurple}"\n[*] Installing AppImg Pkgs...\n" ${Color_Off}
  source "$INS_DIR"/appimg_manager.sh
}


install_chadnvim() {
  echo -e ${BGreen}"\n[*] Installing ChadNvim Config.\n" ${Color_Off}
  source "$INS_DIR"/nvim_configs.sh
}


install_rofi() {
  echo -e ${BBlue}"\n[*] Installing rofi configs + Fonts...\n" ${Color_Off}
  source "$INS_DIR"/roficfg.sh
}

# Install PyEnv
# source "$INS_DIR"/python_install.sh

set_permissions() {
  echo -e ${BPurple}"\n[*] Setting permissions...\n" ${Color_Off}
  source "$INS_DIR"/set_permissions.sh
}

# 72726LV-7JFW5TZ-AMAEXUH-MBREDU7-X52GVUK-BBZJKP6-IDTPQY6-KTZQZAF

final_step() {
  clear
  echo -e ${BRed}"\n[*] Cleaning...\n" ${Color_Off}
  sudo apt autoremove
  echo -e ${BRed}"\n[*] All Done! You Can Now Reboot.\n" ${Color_Off}
}

test123() {
  echo -e ${BPurple}"\n[*] Updating...\n" ${Color_Off}
  sudo nala update
}

main() {
  install_apt_pkgs
  install_nix_pkgs
  install_appimg_pkgs
  install_chadnvim
  install_rofi
  set_permissions
  final_step
}

time main
