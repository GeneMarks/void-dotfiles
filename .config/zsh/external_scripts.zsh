### External scripts ###

# autopair
if [[ ! -d $HOME/.zsh-autopair ]]; then
    git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi

source $HOME/.zsh-autopair/autopair.zsh
autopair-init

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
