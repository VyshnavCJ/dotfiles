# alias
alias nv=nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -Ux TMUX_CONF $HOME/.config/tmux/tmux.conf
alias tmux "tmux -u"
abbr --add dev cd /workstation/dev
abbr --add work cd /workstation/dev/work
bind \ef 'tmux-sessionizer'


set -U fish_greeting
:
# path
fish_add_path -U $HOME/.local/share/bin
fish_add_path -U /usr/local/go/bin
fish_add_path -U $HOME/.dotnet
fish_add_path -U $HOME/go/bin
fish_add_path -U $HOME/.dotnet/tools


# git keybindings
source ~/.config/fish/git.fish

# fish shell intergration
starship init fish | source


# defaults
# set -gx BROWSER /usr/bin/wslview
set -Ux DOTNET_ROOT $HOME/.dotnet
