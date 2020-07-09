#!/usr/bin/env zsh

# Basic configuration
mkdir -p ~/.config

# Zsh
if [ ! -f ~/.zshrc ]; then
  echo "#!/usr/bin/env zsh" >> ~/.zshrc
fi

cat <(echo) ./zshrc >> ~/.zshrc

cp -r ./zsh ~/.config/zsh

# Prezto
setopt EXTENDED_GLOB
for rcfile in ~/.config/zsh/zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "~/.config/zsh/.${rcfile:t}"
done

# Tmux configuration
if [ -f ~/.tmux.conf ]; then
  cat <(echo) ./tmux.conf >> ~/.tmux.conf
else
  cp ./tmux.conf >> ~/.tmux.conf
fi

cp -r ./tmux ~/.config/tmux

# Neovim
cp -r ./nvim ~/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim -E -s -u ~/.config/nvim/init.vim +PlugInstall +qall

# NERDFont SauceCodePro mono
mkdir -p ~/.local/share/fonts
cp ./fonts/* ~/.local/share/fonts
