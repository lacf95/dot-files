# Dot Files for Zsh, Tmux and Vim
Zsh, tmux and neovim Development Dot files for Unix based SOs

Tools included
- Zsh
  - Prezto
- Tmux
  - Tmux Resurrect
- Vim
  - Plug (all vim plugins are listed on `nvim/init.vim`)

I like to install all the libraries and files inside the `.config` directory at the user's home directory.

- [Requirements](#requirements)
- [Installation](#installation)

## Requirements

You need to install the following applications

- git
- curl
- zsh
- tmux
- neovim
- ripgrep

## Installation

Clone this repo with its submodules:
```shell
cd && git clone --recursive https://github.com/lacf95/dot-files.git && cd dot-files
```

Run the install script

```shell
./install.sh
```

Finally, you have to set zsh as the default shell.
You can do it by directly writing to the `/etc/passwd` and change it to the user you want to apply it, or a faster way to do it is:
```shell
chsh -s $(which zsh)
```

And finally logout from your user session in order to apply the changes.
