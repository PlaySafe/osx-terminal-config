#!/usr/bin/env bash

# home directory
cp ./home/.zshrc $HOME
source $HOME/.zshrc

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install vim
brew install neovim
brew install ripgrep
brew install lua
brew install luajit
brew install luarocks

brew install tree
brew install tree-sitter
brew install openjdk@17

# maven config
brew install maven
mkdir -p $HOME/.m2/repository
cp ./maven/settings.xml $HOME/.m2

# script command
brew install git
brew install git-gui
cp ./script/gitconfig/.gitconfig $HOME/.gitconfig
cp ./bin/run /usr/local/bin

brew install yamllint
brew install rust
brew install pwgen

brew install go
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/go-delve/delve/cmd/dlv@latest

brew install python3
python3 -m pip install --user --upgrade pynvim

brew install jq
brew install tflint
brew install ctags-exuberant

#Config the screenshot
defaults write com.apple.screencapture type jpg
defaults write com.apple.screencapture location ~/Desktop/Screenshot
