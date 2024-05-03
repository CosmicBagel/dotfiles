function UpdateAllTheThings {
    echo "===Checking for arch news==="
    yay -Pw
    read -p "Press enter to continue (or ctrl+c to bail)"

    if [[ $? -eq 0 ]]; then
        echo -e "\n\n===Running yay==="
        yay -Syu
    fi

    echo -e "\n\n===Flatpak upgrade==="
    flatpak upgrade

    echo -e "\n\n===Neovim Nightly Update==="
    read -p "Press enter to continue (or ctrl+c to bail)"
    yay -S neovim-git

    echo -e "\n\n===Zig Nightly Update==="
    read -p "Press enter to continue (or ctrl+c to bail)"
    yay -S zig-dev-bin
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
