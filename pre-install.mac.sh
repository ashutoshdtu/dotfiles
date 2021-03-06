#!/usr/bin/env bash

set -e

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install tools 
# TODO: vtop, glances, fonts-powerline
brew install mosh tree fzf tldr tmux ag ripgrep ranger fd lolcat grc fasd neofetch figlet neovim thefuck
# brew install pandoc poppler-utils ffmpeg ripgrep cargo

# Brew installs
brew install gcc bat exa navi lazydocker rga pandoc poppler tesseract ffmpeg
brew install jesseduffield/lazygit/lazygit

# pip installs
pip3 install howdoi dotbot mdv

# npm installs
npm install -g how-2 git-delta vtop gtop dockly

# install zsh
brew install zsh

# better colors
mkdir /tmp/LS_COLORS && curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory=/tmp/LS_COLORS --strip=1
( cd /tmp/LS_COLORS && sh install.sh )
#To enable the colors, add the following line to your shell's start-up script:
# For Bourne shell (e.g. ~/.bashrc or ~/.zshrc):
#  . "~/.local/share/lscolors.sh"
# For C shell (e.g. ~/.cshrc):
#  . "~/.local/share/lscolors.csh"
