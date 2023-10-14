main() {
	printf '%s\n' "Setting permissions" && sleep 1
	cd ~/.local/bin || exit
	for file in chwall-dmenu chwall sxpape ; do chmod u+x "$file" ; done
}

main
