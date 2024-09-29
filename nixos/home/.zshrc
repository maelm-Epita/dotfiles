# use regular (emacs) keybinds
bindkey -e

# env variables
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR="nvim"
export VISUAL="nvim"
# source aliases
. ./.zsh_aliases
# zsh options
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt AUTO_CD
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt GLOBDOTS
# zsh completion
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' file-sort access
zstyle ':completion:*' file-sort access
zstyle ':completion:*' format '✍  completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/mael/.zshrc'
autoload -Uz compinit && compinit -u

# use starship
eval "$(starship init zsh)"
# use fzf
source <(fzf --zsh)
# plugins
plugindir="${HOME}/.config/zsh-plugins"
# autosuggestions
source $plugindir/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept
# syntax highlighting
source $plugindir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# jump
source /home/mael/.autojump/etc/profile.d/autojump.sh
# transient prompt
source $plugindir/zsh-transient-prompt/zsh-transient-prompt.zsh

# pywal
wal -R -q

# style points
fastfetch
