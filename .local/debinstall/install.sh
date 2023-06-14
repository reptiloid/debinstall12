#!/bin/sh

SRC_DIR=~/.local/debinstall/src
DOT_DIR=dotfiles
GIT_SRC=https://bitbucket.org/reptiloid666

install_nala() {
	echo
	printf '%s\n' "Installing Nala" && sleep 1
	sudo apt install -y nala
}

install_pkgs() {
	echo
	printf '%s\n' "Installing packages" && sleep 1
	sudo nala install -y net-tools feh unzip ufw exa \
		ripgrep fzf autojump bash-completion tar \
		fonts-dejavu-extra \
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
	# git clone "$GIT_SRC"/st.git
}

install_st() {
	cd "$SRC_DIR"/st || exit
	sudo make install
}


install_nerdfonts(){
    mkdir -p ~/.local/share/fonts
    cd /tmp || exit
    fonts=(
		"JetBrainsMono"
		# "SourceCodePro"
		# "Ubuntu"
    )

    for font in ${fonts[@]}
    do
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/$font.zip
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
	printf '%s\n' "Installing QTILE" && sleep 1
	pip3 install --force-reinstall xcffib==1.3.0
    pip3 install --no-use-pep517 --no-build-isolation qtile
}

install_qtile12() {
	echo
	printf '%s\n' "Installing QTILE" && sleep 1
    pip3 install --force-reinstall --break-system-packages xcffib==1.3.0
    pip3 install --no-use-pep517 --break-system-packages --no-build-isolation qtile
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
	install_nala
	install_pkgs
	install_nerdfonts
	make_userdirs
	install_qtile12
    get_sl_tools
	install_st

	# get_dotfiles
	# deploy_dotfiles
	
	# enable_firewall
	
	# set_permissions
	# finish
}

main

