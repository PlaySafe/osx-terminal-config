#!/usr/bin/env bash

# home directory
cp ./home/.zshrc $HOME
source $HOME/.zshrc

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim ripgrep lua luajit luarocks jq tflint ctags-exuberant
brew install tree tree-sitter parallel wget
brew install git git-gui
cp ./script/gitconfig/.gitconfig $HOME/.gitconfig
cp ./bin/run /usr/local/bin

brew install yamllint pwgen
brew install rust go delve
brew install python@3.11 && python3 -m pip install --user --upgrade pynvim

#Config the screenshot
defaults write com.apple.screencapture type jpg
defaults write com.apple.screencapture location ~/Desktop/Screenshot

brew install maven
brew install openjdk@17 && sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
