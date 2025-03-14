function UpdateAllTheThings {
    if [[ "$(uname -s)" == "Darwin" ]]; then
	echo "===Updating Brew==="
	brew update && brew upgrade -g && brew cleanup
	return $?
    fi

    if grep -q "Arch Linux" /etc/os-release; then
	echo "===Checking for arch news==="
	yay -Pw
	read -p "Press enter to continue (or ctrl+c to bail)"

	if [[ $? -eq 0 ]]; then
	    echo -e "\n\n===Running yay==="
	    yay -Syu
	fi

	echo -e "\n\n===Flatpak upgrade==="
	flatpak upgrade

	return $?
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

function UpdateWeztermAppImage {
    local url="https://github.com/wez/wezterm/releases/download/nightly/WezTerm-nightly-Ubuntu20.04.AppImage"
    local hash_url="https://github.com/wez/wezterm/releases/download/nightly/WezTerm-nightly-Ubuntu20.04.AppImage.sha256"

    echo "Getting hash..."
    local remote_hash=$(curl -L $hash_url | cut -d' ' -f1)
    local current_hash=$(sha256sum $HOME/bin/wezterm | cut -d' ' -f1)
    if [[ $remote_hash == $current_hash ]]; then
	echo "Wezterm is up to date"
	return 0
    fi

    rm $HOME/bin/wezterm_download
    curl -Lo $HOME/bin/wezterm_download $url
    if [[ $? -ne 0 ]]; then
	return 1
    fi

    local download_hash=$(sha256sum $HOME/bin/wezterm_download | cut -d' ' -f1)
    if [[ $remote_hash != $download_hash ]]; then
	echo 'ERROR Hash of download failed to verify'
	return 1
    fi

    rm $HOME/bin/wezterm && mv $HOME/bin/wezterm_download $HOME/bin/wezterm && chmod +x $HOME/bin/wezterm
}
