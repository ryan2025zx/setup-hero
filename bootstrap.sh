#!/usr/bin/env bash
set -eou pipefail

# 1) Install prerequisites
if ! command -v stow &>/dev/null; then
    echo "Installing GNU stow..."
    sudo apt-get update && sudo apt-get install -y stow
fi

# 2) Install packages via apt (adjust to your distro)
echo "Installing: vim, docker.io, curl"
sudo apt-get install -y vim docker.io curl

echo "Bootstrap complete! Reload your shell or run 'source ~/.bashrc'."
