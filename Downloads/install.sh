#!/bin/sh

SRC_DIR=~/.local/src
DOT_DIR=dotfiles
GIT_SRC=https://bitbucket.org/reptiloid666

install_pkgs() {
	echo
	printf '%s\n' "Installing packages" && sleep 1
	sudo apt install -y htop wget curl git unzip ufw yadm \
        libx11-dev libxft-dev libharfbuzz-dev \
        xinit xserver-xorg x11-xserver-utils xdg-user-dirs \
        libpangocairo-1.0-0 python3-pip python3-xcffib python3-cairocffi
}

get_sl_tools() {
	echo
	printf '%s\n' "Getting custom Suckless tools repositories" && sleep 1
	mkdir -p "$SRC_DIR"
	cd "$SRC_DIR" || exit
    git clone https://github.com/lukesmithxyz/st
	# git clone "$GIT_SRC"/dwm.git
	# git clone "$GIT_SRC"/dmenu.git
	# git clone "$GIT_SRC"/st.git
}

install_st() {
	cd "$SRC_DIR"/st || exit
	sudo make install
}

set_yadm() {
	echo
	printf '%s\n' "Getting dotfiles" && sleep 1
    yadm clone "$GIT_SRC"/dotfiles.git
}

get_dotfiles() {
	echo
	printf '%s\n' "Getting dotfiles" && sleep 1
	cd "$SRC_DIR" || exit
	git clone "$GIT_SRC"/dotfiles.git
}

install_nerdfonts(){
    mkdir -p ~/.local/share/fonts
    cd /tmp || exit
    fonts=(
    # "CascadiaCode"
    # "FiraCode"
    # "Go-Mono"
    # "Hack"
    # "Inconsolata"
    # "Iosevka"
    "JetBrainsMono"
    # "Mononoki
    # "RobotoMono"
    # "SourceCodePro"
    "Ubuntu"
    )

    for font in ${fonts[@]}
    do
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/$font.zip
        # wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/$font.zip
        unzip $font.zip -d $HOME/.local/share/fonts/$font/
        rm $font.zip
    done
    fc-cache
}

deploy_dotfiles() {
	echo
	printf '%s\n' "Deploying dotfiles" && sleep 1
	for file in dunst mpv mutt newsboat picom sxhkd vifm ; do cp -r "$SRC_DIR"/"$DOT_DIR"/.config/"$file" ~/.config/ ; done
	for file in chwall-dmenu mpvload netcon poweroffreboot statusbar.sh usbmount usbunmount usbpoweroff ; do cp -r "$SRC_DIR"/"$DOT_DIR"/.local/bin ~/.local/ ; done
	mkdir -p ~/.local/share
	cp -r "$SRC_DIR"/"$DOT_DIR"/.local/share/fonts ~/.local/share/
	mkdir -p ~/Pictures	# In case xdg-user-dirs-update failed for some reason
	cp -r "$SRC_DIR"/"$DOT_DIR"/Pictures/Wallpapers ~/Pictures/
	touch ~/Pictures/defwall.jpg
	ln -sf ~/Pictures/Wallpapers/wallpaper0002.jpg ~/Pictures/defwall.jpg
	for file in .vimrc .xinitrc .Xresources ; do cp -r "$SRC_DIR"/"$DOT_DIR"/"$file" ~/ ; done
}

install_qtile() {
	echo
	printf '%s\n' "Installing qtile" && sleep 1
    pip3 install --force-reinstall xcffib==1.3.0
    pip3 install --no-use-pep517 --no-build-isolation qtile
}

make_userdirs() {
	xdg-user-dirs-update
}

enable_firewall() {
	echo
	printf '%s\n' "Enabling firewall" && sleep 1
	sudo ufw enable
}

main() {
	# install_pkgs
	# enable_firewall
	# make_userdirs

	# install_qtile

    # get_sl_tools
	# install_st

	# get_dotfiles
	# deploy_dotfiles

    install_nerdfonts

	# set_permissions
	# finish
}

main

