alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcb="docker compose build"
alias k=kubectl
#alias sudoedit="sudo nvim"
alias lg="lazygit"
alias n="nvim"
alias nl="nvr -s" # neovim listen (will open socket at /tmp/nvimsocket)
alias vim="nvim"
alias vi="nvim"
alias ls="eza"
alias la="eza -a"
alias ll="eza -lag"
alias doas="sudo"
alias godot="godot-mono"
alias zbr="zig build run"
alias zb="zig build"
alias zbt="zig build test"
alias av="clamdscan -i -m"
# Force xterm-color on ssh sessions, also works around machines not recognizing
# wezterm
alias ssh='TERM=xterm-256color ssh'
alias cat=bat

# don't alias xdg-open on MacOS
if [[ $OSTYPE != "darwin"* ]]; then
    alias open="xdg-open"
fi

