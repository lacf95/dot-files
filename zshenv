export ZDOTDIR=~/.config/zsh
export TMUXDOTDIR=~/.config/tmux

if [ -f $ZDOTDIR/.zshenv ]; then
  source $ZDOTDIR/.zshenv
fi
