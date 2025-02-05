PLUGIN_AUTOPAIR_DIR="$HOME/.config/zsh/plugins/.zsh-autopair"

if [[ ! -d $PLUGIN_AUTOPAIR_DIR ]]; then
    git clone https://github.com/hlissner/zsh-autopair "$PLUGIN_AUTOPAIR_DIR"
fi

source "$PLUGIN_AUTOPAIR_DIR/autopair.zsh"
autopair-init
