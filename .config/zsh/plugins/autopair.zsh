if [[ ! -d $HOME/.zsh-autopair ]]; then
    git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi

source $HOME/.zsh-autopair/autopair.zsh
autopair-init
