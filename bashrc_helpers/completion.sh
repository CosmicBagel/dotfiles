# enable programmable completion features (always prioritize user customized etc)
if ! shopt -oq posix; then
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    elif [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    fi
fi

complete -F _command doas
