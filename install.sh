#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges."
    exit 1
fi

apt install zsh
zsh

chsh -s /bin/zsh $1
chsh -s /bin/zsh root
cp .zshrc ~
cp zsh/* /usr/share -r

su $1
cp .zshrc ~
