# alias
alias nv=nvim
abbr --add ext cd /run/media/cj/workstation
abbr --add dev cd /run/media/cj/workstation/dev
abbr --add work cd /run/media/cj/workstation/work
bind \ef 'tmux-sessionizer'


set -U fish_greeting

# path
fish_add_path $HOME/.local/share/bin

# git keybindings
source ~/.config/fish/git.fish

