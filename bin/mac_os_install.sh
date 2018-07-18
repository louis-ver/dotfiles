#!/bin/bash
set -e
set -o pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

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
    tower \
    transmission \
    vlc

brew cleanup && brew cask cleanup

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Make zsh the default shell
zsh_path="$(command -v zsh)"
echo "$zsh_path" >> /etc/shells
chsh -s "$zsh_path"

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
