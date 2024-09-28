# env variables
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# source aliases
. ./.zsh_aliases

# use starship
eval "$(starship init zsh)"

# plugins
plugindir="${HOME}/.config/zsh-plugins"
# autosuggestions
source $plugindir/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^@' autosuggest-accept
# syntax highlighting
source $plugindir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
