#/bin/bash

# key target, value symlink
# symlinks_dic[TARGET]=SYMLINK
declare -A symlinks_dic
symlinks_dic["$HOME/dotfiles/profile"]="$HOME/.profile"
symlinks_dic["$HOME/dotfiles/bashrc"]="$HOME/.bashrc"
symlinks_dic["$HOME/dotfiles/gitconfig"]="$HOME/.gitconfig"

symlinks_dic["$HOME/dotfiles/config/chromium-flags.conf"]="$HOME/.config/chromium-flags.conf"
symlinks_dic["$HOME/dotfiles/config/chromium-flags.conf"]="$HOME/.config/brave-flags.conf"
symlinks_dic["$HOME/dotfiles/config/chromium-flags.conf"]="$HOME/.config/electron-flags.conf"
symlinks_dic["$HOME/dotfiles/config/kcminputrc"]="$HOME/.config/kcminputrc"
symlinks_dic["$HOME/dotfiles/config/kglobalshortcutsrc"]="$HOME/.config/kglobalshortcutsrc"
symlinks_dic["$HOME/dotfiles/config/klipperrc"]="$HOME/.config/klipperrc"
symlinks_dic["$HOME/dotfiles/config/kscreenlockerrc"]="$HOME/.config/kscreenlockerrc"
symlinks_dic["$HOME/dotfiles/config/kwinrc"]="$HOME/.config/kwinrc"
symlinks_dic["$HOME/dotfiles/config/kwinrulesrc"]="$HOME/.config/kwinrulesrc"
symlinks_dic["$HOME/dotfiles/config/plasmaparc"]="$HOME/.config/plasmaparc"
symlinks_dic["$HOME/dotfiles/config/plasmarc"]="$HOME/.config/plasmarc"
symlinks_dic["$HOME/dotfiles/config/plasma-localerc"]="$HOME/.config/plasma-localerc"
symlinks_dic["$HOME/dotfiles/config/powerdevilrc"]="$HOME/.config/powerdevilrc"
symlinks_dic["$HOME/dotfiles/config/user-dirs.dirs"]="$HOME/.config/user-dirs.dirs"
symlinks_dic["$HOME/dotfiles/config/kwriterc"]="$HOME/.config/kwriterc"
symlinks_dic["$HOME/dotfiles/config/mimeapps.list"]="$HOME/.config/mimeapps.list"


symlinks_dic["$HOME/dotfiles/config/alacritty"]="$HOME/.config/alacritty"
symlinks_dic["$HOME/dotfiles/config/neovide"]="$HOME/.config/neovide"
symlinks_dic["$HOME/dotfiles/config/kitty"]="$HOME/.config/kitty"
symlinks_dic["$HOME/dotfiles/config/wezterm"]="$HOME/.config/wezterm"
symlinks_dic["$HOME/dotfiles/config/sway"]="$HOME/.config/sway"

symlinks_dic["$HOME/dotfiles/config/fd"]="$HOME/.config/fd"
symlinks_dic["$HOME/dotfiles/config/lazygit"]="$HOME/.config/lazygit"
symlinks_dic["$HOME/dotfiles/config/mpv"]="$HOME/.config/mpv"
symlinks_dic["$HOME/dotfiles/config/nvim"]="$HOME/.config/nvim"
symlinks_dic["$HOME/dotfiles/config/tmux"]="$HOME/.config/tmux"
symlinks_dic["$HOME/dotfiles/config/yazi"]="$HOME/.config/yazi"

symlinks_dic["$HOME/dotfiles/config/omnisharp"]="$HOME/.omnisharp"
symlinks_dic["$HOME/dotfiles/config/unity3d_prefs"]="$HOME/.local/share/unity3d/prefs"
symlinks_dic["$HOME/dotfiles/config/godot"]="$HOME/.config/godot"

symlinks_dic["$HOME/dotfiles/config/vscode/settings.json"]="$HOME/.config/Code/User/settings.json"
symlinks_dic["$HOME/dotfiles/config/vscode/snippets"]="$HOME/.config/Code/User/snippets"
symlinks_dic["$HOME/dotfiles/config/vscode/extensions.json"]="$HOME/.vscode/extensions/extensions.json"

#usage: make_symlink /path/to/new_file /path/to/symlink
#checks if a file at symlink location already exists, skips if it does
function make_symlink {
    if [[ $# -ne 2 ]]; then
        echo "make_symlink must be called with 2 parameters"
        return
    fi

    if [[ -e "$2" ]]; then
        echo "$2 exists, skipping"
        return
        #read -p "$2 exists, do you want to overwrite it? y/[n] " response
        #if [[ $response == 'y' ]]; then
        #    echo 'Overwriting'
        #else
        #    echo 'Not overwriting'
        #    return
        #fi
    fi

    echo "Making symlink $2 -> $1"
    ln -s $1 $2
}

# usage: make_symlink_batch
# assumes global associative array symlinks_dic is populated
# operates on a array/dict of paths (key target value symlink pairs)
# validates all keys have values, and that target paths are valid
function make_symlink_batch {
    for key in "${!symlinks_dic[@]}"; do
        # validate targets are valid files or directories
        if [[ ! -e "$key" ]]; then
            echo "\"$key\" does not exist"
            exit 1
        fi

        # validate each entery has a value
        if [[ "${symlinks_dic[$key]}" == '' ]]; then
            echo "Key \"$key\" has no value, aborting"
            exit 1
        fi
    done


    for key in "${!symlinks_dic[@]}"; do
        make_symlink $key ${symlinks_dic[$key]}
    done
}

make_symlink_batch
