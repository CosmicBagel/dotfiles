__helpers="$HOME/dotfiles/bashrc_helpers"
. $__helpers/paths.sh
. $__helpers/functions.sh
. $__helpers/ue.sh

# Only proceed if running interactively
case $- in
    *i*) ;;
    *) return;;
esac

# OhMyBash may play around with configuration I want, so we run it first
# then run my personal stuff
. $__helpers/ohmybash.sh
. $__helpers/aliases.sh
. $__helpers/config.sh
. $__helpers/completion.sh
. $__helpers/interactive_functions.sh

eval "$(zoxide init --cmd cd bash)"
