install_pyenv_dependencies() {
	sudo nala install -y make build-essential libssl-dev zlib1g-dev \
		libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev \
		libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
}

install_pyenv() {
	curl https://pyenv.run | bash
}

set_bashrc_pyenv() {
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
	echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(pyenv init -)"' >> ~/.bashrc
}

set_profile_pyenv() {
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
	echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
	echo 'eval "$(pyenv init -)"' >> ~/.profile
}

main() {
	install_pyenv_dependencies
	install_pyenv
	# set_bashrc_pyenv
	set_profile_pyenv
}

main   
