function UpdateAllTheThings {
    echo "Checking for arch news"
    yay -Pw
    read -p "Press enter to continue (or ctrl+c to bail)"

    if [[ $? -eq 0 ]]; then
        echo "Running yay"
        yay -Syu
    fi

    if [[ $? -eq 0 ]]; then
        echo "Flatpak upgrade"
        flatpak upgrade
    fi
}
alias uatt='UpdateAllTheThings'

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
