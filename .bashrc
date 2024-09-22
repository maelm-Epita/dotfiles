#visual
PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='\n\[\e[38;5;232;48;5;255m\][\A]\[\e[0m\] | \[\e[1m\]@\W | <${PS1_CMD1}> \n\[\e[0m\]$ '

wal -R -q

#alises
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

#eval
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND='rg --files --hidden'
