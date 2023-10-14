INS_DIR=~/.local/debinstall

## Colors ----------------------------
Color_Off='\033[0m'
BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'



echo -e ${BBlue}"\n[*] Installing Apt Packages + Fonts..." ${Color_Off}
source "$INS_DIR"/pkg_install.sh


echo -e ${BYellow}"[*] Installing Nix Pkgs...\n" ${Color_Off}
source "$INS_DIR"/nixpkg.sh


echo -e ${BPurple}"[*] Installing AppImg Pkgs..." ${Color_Off}
source "$INS_DIR"/appimg_manager.sh


echo -e ${BGreen}"[*] Installing ChadNvim Config.\n" ${Color_Off}
source "$INS_DIR"/nvim_configs.sh


echo -e ${BBlue}"[*] Installing rofi configs + Fonts..." ${Color_Off}
source "$INS_DIR"/roficfg.sh

# Install PyEnv
# source "$INS_DIR"/python_install.sh

# Set Permissions
echo -e ${BPurple}"[*] Setting permissions..." ${Color_Off}
source "$INS_DIR"/set_permissions.sh

# 72726LV-7JFW5TZ-AMAEXUH-MBREDU7-X52GVUK-BBZJKP6-IDTPQY6-KTZQZAF

clear
echo -e ${BRed}"[*] Cleaning..." ${Color_Off}
sudo apt autoremove

printf "\e[1;32mAll Done! You Can Now Reboot.\e[0m\n"
