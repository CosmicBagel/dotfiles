__helpers="$HOME/dotfiles/zshrc_helpers"
# __systemhelpers="$HOME/system-config/zshrc_helpers"

. $__helpers/paths.sh
. $__helpers/functions.sh
. $__helpers/ue.sh
# . $__systemhelpers/functions.sh

# Only proceed if running interactively
case $- in
    *i*) ;;
    *) return;;
esac

. $__helpers/ohmyzsh.sh
. $__helpers/aliases.sh
. $__helpers/config.sh
. $__helpers/completion.sh
. $__helpers/interactive_functions.sh
# . $__systemhelpers/interactive_functions.sh

eval "$(zoxide init --cmd cd zsh)"
