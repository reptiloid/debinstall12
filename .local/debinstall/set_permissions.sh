main() {
	printf '%s\n' "Setting permissions" && sleep 1
	cd ~/.local/bin || exit
	for file in chwall-dmenu chwall ; do chmod u+x "$file" ; done
}

main
