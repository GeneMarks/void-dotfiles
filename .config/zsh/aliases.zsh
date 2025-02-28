### Aliases ###

# Void has bug where shutdown/reboot hang when network
# shares are mounted.
alias shutdown="sudo umount -a -r -t nfs,nfs4,cifs && loginctl poweroff"
alias reboot="sudo umount -a -r -t nfs,nfs4,cifs && loginctl reboot"
alias win10="sudo efibootmgr --bootnext 0000 && reboot"

alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias tp="trash-put"
alias dv="yt-dlp"
