#!/usr/bin/env zsh

# Basic configuration
mkdir -p ~/.config

# Zsh
if [ ! -f ~/.zshenv ]; then
  echo "#!/usr/bin/env zsh" >> ~/.zshenv
fi

cat <(echo) ./zshenv >> ~/.zshenv

cp -r ./zsh ~/.config/zsh

# Tmux configuration
if [ -f ~/.tmux.conf ]; then
  cat <(echo) ./tmux.conf >> ~/.tmux.conf
else
  cp ./tmux.conf ~/.tmux.conf
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

# Prezto
setopt EXTENDED_GLOB
for rcfile in ~/.config/zsh/prezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" ~/.config/zsh/."${rcfile:t}"
done

echo 'bindkey "^A" vi-beginning-of-line' >> ~/.config/zsh/.zshrc
echo 'bindkey "^H" backward-delete-char' >> ~/.config/zsh/.zshrc
echo 'bindkey "^W" backward-kill-word' >> ~/.config/zsh/.zshrc
echo 'bindkey "^U" kill-whole-line' >> ~/.config/zsh/.zshrc
echo 'bindkey "^P" history-substring-search-up' >> ~/.config/zsh/.zshrc
echo 'bindkey "^N" history-substring-search-down' >> ~/.config/zsh/.zshrc

sed -i 's/\.zprezto/prezto/g' ~/.config/zsh/.zshrc

sed -i "/'history-substring-search'/i \ \ 'autosuggestions'\ \\\\" ~/.config/zsh/.zpreztorc

sed -i "s/'prompt'/'prompt'\ \\\\/g" ~/.config/zsh/.zpreztorc

sed -i "/'prompt'\ \\\\/a \ \ 'git'" ~/.config/zsh/.zpreztorc

sed -i "s/key-bindings\ 'emacs'/key-bindings\ 'vi'/g" ~/.config/zsh/.zpreztorc

sed -i "s/theme\ 'sorin'/theme\ 'agnoster'/g" ~/.config/zsh/.zpreztorc

sed -i "s/#\ zstyle\ ':prezto:module:tmux:auto-start'\ local\ 'yes'/zstyle\ ':prezto:module:tmux:auto-start'\ local\ 'yes'/g" ~/.config/zsh/.zpreztorc

sed -i "s/EDITOR='nano'/EDITOR='nvim'/g" ~/.config/zsh/.zprofile

sed -i "s/VISUAL='nano'/VISUAL='nvim'/g" ~/.config/zsh/.zprofile

# Alacritty
if command -v alacritty &> /dev/null; then
  cp -r ./alacritty ~/.config/alacritty
fi
