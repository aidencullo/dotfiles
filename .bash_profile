# Aliases

alias c='cd /Users/CulloFiles/Documents/Code'
alias gpu='git push origin master'
alias gpl='git pull origin master'
alias ga='git add . && git status'
alias gc='git commit -m '
alias la='ls -AF'
alias srv='sudo postfix start'
alias stp='sudo postfix stop'

# header

PS1="[\d \t \u@\h:\w ] $"

# shortcuts

cs() { cd "$@" && ls; }
