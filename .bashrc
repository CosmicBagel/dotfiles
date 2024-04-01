__helpers="$HOME/dotfiles/bashrc_helpers"
. $__helpers/functions.sh
. $__helpers/ue.sh

# Only proceed if running interactively
case $- in
    *i*) ;;
    *) return;;
esac

. $__helpers/ohmybash.sh
. $__helpers/aliases.sh
. $__helpers/config.sh
. $__helpers/completion.sh

eval "$(zoxide init --cmd cd bash)"
