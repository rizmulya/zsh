if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges."
    exit 1
fi

apt install zsh && \
    zsh && \
    chsh -s /bin/bash $1 && \
    su - && \
    chsh -s /bin/bash root

su $1 && \
    cp .zshrc ~
sudo su && \
    cp .zshrc ~
    cp zsh/* /usr/share -r
