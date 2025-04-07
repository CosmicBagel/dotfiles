completions_path="$HOME/dotfiles/zshrc_helpers/completions/"
fpath=($completions_path $fpath)

autoload -Uz compinit
compinit
