#!/bin/sh

SRC_DIR=~/.local/debinstall/src
DOT_DIR=dotfiles
GIT_SRC=https://bitbucket.org/reptiloid666

install_nala() {
	echo
	printf '%s\n' "Installing Nala" && sleep 1
	sudo apt install -y nala
}

install_librewolf() {
	echo
	printf '%s\n' "Installing Librewolf" && sleep 1
	sudo nala install -y gnupg lsb-release apt-transport-https ca-certificates
	distro=bullseye
	wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg
	
	sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
	Types: deb
	URIs: https://deb.librewolf.net
	Suites: $distro
	Components: main
	Architectures: amd64
	Signed-By: /usr/share/keyrings/librewolf.gpg
	EOF

	sudo nala update
	sudo nala install librewolf -y
}

install_pkgs() {
	echo
	printf '%s\n' "Installing packages" && sleep 1
	sudo nala install -y net-tools feh unzip ufw exa \
		ripgrep fzf autojump bash-completion tar \
		fonts-dejavu-extra thunar \
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
	# install_nala
	# install_pkgs
	# install_nerdfonts
	# make_userdirs
	# install_qtile12
    # get_sl_tools
	# install_st
	
	install_librewolf
	
	# enable_firewall
	
	# finish
}

main

