install_NvChad() {
	git clone https://github.com/NvChad/NvChad ~/.config/NvChad --depth 1
}

install_custom_config() {
	ln -s $HOME/.local/debinstall/src/NvChad_custom $HOME/.config/NvChad/lua/custom
}

main() {
	install_NvChad
	install_custom_config
}

main    
