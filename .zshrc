zstyle :compinstall filename '/home/gene/.zshrc'
autoload -Uz compinit
compinit
unsetopt BEEP

alias g='garbage'
alias gp='garbage put'
alias feh='feh --scale-down'

source /usr/share/nvm/init-nvm.sh
