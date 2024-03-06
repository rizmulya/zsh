#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges."
    exit 1
fi

if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

cp -r zsh/* /usr/share/
echo "Copied Zsh configuration to /usr/share"

chsh -s /bin/zsh root
cp .zshrc /root
echo "Changed default shell to Zsh for root."

chsh -s /bin/zsh $1
if [[ -n $1 ]]; then
    HOME_DIR=$(eval echo ~$1)
    cp .zshrc "$HOME_DIR"
    chown $1: "$HOME_DIR/.zshrc"
fi
echo "Changed default shell to Zsh for user: $1"
echo "--------- everythings good -----------"
