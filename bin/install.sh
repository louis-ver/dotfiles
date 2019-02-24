#!/bin/bash
set -e
set -o pipefail

# Install Xcode Developer Tools
xcode-select --install

# Install Homebrew
if ! command -v brew > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install all packages
brew install go \
    neovim \
    python \
    shellcheck \
    the_silver_searcher \
    zsh

# Allows for download of old versions
brew tap homebrew/cask-versions

brew cask install 1password \
    1password-cli \
    alfred \
    dash \
    docker \
    google-backup-and-sync \
    iterm2 \
    marked \
    paw \
    slack \
    spectacle \
    tower2 \
    transmission \
    vlc

brew cleanup && brew cask cleanup

# Configure vim and get all related packages
pip3 install neovim --upgrade
cd "$HOME" && git clone https://github.com/louis-ver/.vim.git
# Get all packages
cd ~/.vim/bundle && git submodule update --init
# Symlink vimrc to nvim config file
mkdir -p "${HOME}/.config/nvim"
ln -s "${HOME}/.vim/.vimrc" "${HOME}/.config/nvim/init.vim"
# Install pathogen
curl -LSso "${HOME}/.vim/autoload/pathogen.vim" https://tpo.pe/pathogen.vim
