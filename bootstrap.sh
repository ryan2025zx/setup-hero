#!/usr/bin/env bash
set -eou pipefail

_red()    { printf '\033[0;31m%s\033[0m\n' "$*"; }
_green()  { printf '\033[0;32m%s\033[0m\n' "$*"; }
_yellow() { printf '\033[1;33m%s\033[0m\n' "$*"; }
_blue()   { printf '\033[0;34m%s\033[0m\n' "$*"; }

# 1) Install prerequisites
if ! command -v stow &>/dev/null; then
    _yellow "Installing GNU stow..."
    sudo apt-get update && sudo apt-get install -y stow
    _green "stow installed"
else
    _blue "stow already present, skipping"
fi

# 2) Install packages via apt (adjust to your distro)
_yellow "Installing: vim, docker.io, curl"
sudo apt-get install -y vim docker.io curl
_green "Packages installed"

# 3) Install vim configurations
_yellow "Copying vim config..."
cp -r dotfiles/.vimrc "$HOME/.vimrc"
_green ".vimrc in place"

_blue "Bootstrap complete! Reload your shell or run 'source ~/.bashrc'."
