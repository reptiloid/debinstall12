install_NvChad() {
	git clone https://github.com/NvChad/NvChad $HOME/.config/NvChad --depth 1
}

clone_custom_config() {
	git clone https://github.com/reptiloid/NvChad_Custom.git $HOME/.local/debinstall/src/NvChad_custom
}

install_custom_config() {
	ln -sfv $HOME/.local/debinstall/src/NvChad_custom $HOME/.config/NvChad/lua/custom
}

main() {
	install_NvChad
	clone_custom_config
	install_custom_config
}

main
