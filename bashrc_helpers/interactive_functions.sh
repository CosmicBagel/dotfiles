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

    echo -e "\n\n===Zig master update==="
    zigup master

    echo -e "\n\n===Neovim Nightly Update==="
    read -p "(y)/n: "
    if [ "$REPLY" != "n" ]; then
	yay -S --noconfirm neovim-git
    fi

    echo -e "\n\n===ZLS Nightly Update==="
    read -p "(y)/n: "
    if [ "$REPLY" != "n" ]; then
	yay -S --noconfirm zls-git
    fi
}
alias uatt='UpdateAllTheThings'

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
