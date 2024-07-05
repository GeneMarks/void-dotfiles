### Aliases ###

# Void has bug where shutdown/reboot hang when network
# shares are mounted.
alias sd='sudo umount -a -r -t nfs,nfs4,cifs && loginctl poweroff'
alias rb='sudo umount -a -r -t nfs,nfs4,cifs && loginctl reboot'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias t='trash'
