# Dot Files for Zsh, Tmux and Vim
Development Dot files for OS X / Linux based SOs

I like to install all the libraries and files inside the `.config` directory at the user's home directory.

Just clone this repo:
```shell
foo@bar:~$ cd && git clone git@github.com:lacf95/dot-files.git
```

- [Zsh Configuration](#zsh-configuration)
- [Tmux Configuration](#tmux-configuration)
- [Vim Configuration](#vim-configuration)

## Zsh configuration
First you need to install Zsh:

Debian based Linux distros
```shell
foo@bar:~$ sudo apt install zsh
```
OS X
```shell
foo@bar:~$ brew install zsh
```

Next you have to set it as the default shell.
You can do it by directly writing to the `/etc/passwd` and change it to the user you want to apply it, or a faster way to do it is:
```shell
foo@bar:~$ chsh -s $(which zsh)
```
Then you have to copy the `.zshrc` to your home directory
```shell
foo@bar:~$ cp dot-files/.zshrc ~/
```
And finally logout from your user session in order to apply the changes.

We are almost done, I use [Prezto](https://github.com/sorin-ionescu/prezto) for all the plugins and configurations, just follow their instructions. It will install inside `.config/zsh` automatically.

## Tmux configuration
Tmux is basically the same, lets install it:

Debian based Linux distros
```shell
foo@bar:~$ sudo apt install tmux
```
OS X
```shell
foo@bar:~$ brew install tmux
```

Then you have to copy the `.tmux.conf` to your home directory and `tmux` directory to `.config`
```shell
foo@bar:~$ cp dot-files/.tmux.conf ~/
foo@bar:~$ cp -r dot-files/tmux ~/.config/
```

## Vim configuration
I use NeoVim, to install it:

Debian based Linux distros
```shell
foo@bar:~$ sudo apt install neovim
```
OS X
```shell
foo@bar:~$ brew install neovim
```

Then you have to copy the `nvim` directory to `.config`
```shell
foo@bar:~$ cp -r dot-files/nvim ~/.config/
```

Next, you have to install [Plug](https://github.com/junegunn/vim-plug) following their instructions.

And finally, install the nvim (NeoVim) plugins:
```shell
foo@bar:~$ nvim
```
It will give you an error, it does not matter, yous press <kbd>enter</kbd> to continue.
Inside nvim, use <kbd>:PlugInstall</kbd>

And then recharge the configuration within nvim with <kbd>:source ~/.config/nvim/init.vim<kbd>
