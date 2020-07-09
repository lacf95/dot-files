export EDITOR=nvim
export ZDOTDIR=~/.config/zsh
export TMUXDOTDIR=~/.config/tmux

if [ -f $ZDOTDIR/.zshrc ]; then
  source $ZDOTDIR/.zshrc
fi
