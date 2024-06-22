### Prompt ###

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST

PROMPT='%F{blue}%n%f@%m %F{blue}%2~%f %F{green}${vcs_info_msg_0_}%f$ '
