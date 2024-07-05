### Prompt ###

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST

PROMPT='%F{green}%n%f@%m %F{green}%2~%f %F{white}${vcs_info_msg_0_}%f$ '
