#/bin/bash

# key target, value symlink
# symlinks_dic[TARGET]=SYMLINK
declare -A symlinks_dic
symlinks_dic["$HOME/dotfiles/.profile"]="$HOME/.profile"
symlinks_dic["$HOME/dotfiles/.bashrc"]="$HOME/.bashrc"

#usage: make_symlink /path/to/new_file /path/to/symlink
#checks if a file at symlink location already exists and asks 
#if you want to overwrite (assumes being run interactively)
function make_symlink {
    if [[ $# -ne 2 ]]; then
        echo "make_symlink must be called with 2 parameters"
        return
    fi

    if [[ -e "$2" ]]; then
        read -p "$2 exists, do you want to overwrite it? y/[n] " response
        if [[ $response == 'y' ]]; then
            echo 'Overwriting'
        else 
            echo 'Not overwriting'
            return
        fi
    fi

    echo "Making symlink $2 -> $1"
    ln -sf $1 $2
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
