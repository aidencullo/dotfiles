export ZSH=/Users/CulloFiles/.oh-my-zsh

ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HISTFILE="${HOME}/.zsh_history"

# set history size
HISTSIZE=2000
SAVEHIST=2000

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# each line is added to the history in this way as it is executed
setopt INC_APPEND_HISTORY
setopt clobber

plugins=(git osx)
plugins=(zsh-autosuggestions)

	export LANG=en_US.UTF-8

# Compilation flags
	export ARCHFLAGS="-arch x86_64"

### Aliases ###

# git shortcuts
alias gpu='git push origin master'
alias gpl='git pull origin master'
alias ga='git add . && git status'
alias gc='git commit -m '
alias gap="git add . && git status && git commit -m 'updating files' && git push origin master"
alias gra='git remote add origin'
alias gl='git log'
alias gd='git diff HEAD'
alias gs='git status'

# other
alias la='ls -AF'
alias sf='sudo find / -name'
alias i='ipython'
alias ev='vim ~/.vimrc'
alias ez='vim ~/.zshrc && source ~/.zshrc'
alias eb='vim ~/.bashrc'
alias bru='brew update && brew upgrade && brew cleanup'
alias hist='history 1'
alias m='make'
alias p='python3'
alias cl='echo "" > '

# template
alias tp='cp ~/.template' 

# homebrew
alias bup='brew update'
alias bug='brew upgrade'
alias bc='brew clean'
alias bp='brew prune'
alias bd='brew doctor'
alias bm='brew missing'
alias b="awk '\$0 == \"# homebrew\" {i=1;next};i && i++ <= 6' ~/.zshrc"

# ssh
alias ssl='ssh acullo1@remote.cs.binghamton.edu'
alias ssr='ssh aiden@tula.binghamton.edu'
alias ssn='ssh acullo@m.ndc.nasa.gov'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=red'

source $ZSH/oh-my-zsh.sh
