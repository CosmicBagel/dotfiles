__helpers="$HOME/dotfiles/zshrc_helpers"
__systemhelpers="$HOME/system-config/zshrc_helpers"

. $__helpers/paths.sh
. $__helpers/functions.sh
. $__helpers/ue.sh
. $__systemhelpers/functions.sh

# Only proceed if running interactively
case $- in
    *i*) ;;
    *) return;;
esac

echo "ohmyzsh not setup yet"
echo "1 loading aliases"
. $__helpers/aliases.sh
echo "2 loading config"
. $__helpers/config.sh
echo "3 loading completions"
. $__helpers/completion.sh
echo "4 loading interactive functions"
. $__helpers/interactive_functions.sh
echo "5 loading system specific interactive functions"
. $__systemhelpers/interactive_functions.sh

echo "5 loading zoxide"
eval "$(zoxide init --cmd cd zsh)"
