#visual
PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='\[\e[38;5;189;7m\][\A]\[\e[0m\] | \[\e[1m\]@\[\e[38;5;147m\]\W\n\[\e[0m\]<\[\e[38;5;147;1m\]${PS1_CMD1}\[\e[0m\]> \[\e[97m\]\u\[\e[0m\]@\[\e[97m\]\h\[\e[0m\] > '

#alises
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

#zoxide
eval "$(zoxide init bash --cmd cd)"

#opam
eval $(opam env)


