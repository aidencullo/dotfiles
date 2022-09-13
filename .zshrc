export ZSH=/Users/CulloFiles/.oh-my-zsh
<<<<<<< HEAD
=======
#testbranch
>>>>>>> 5bde805... still playing around with rebasing

ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
alias hist='history 1'
alias m='make'
alias p='python3'

# homebrew
alias bru='brew update && brew upgrade && brew cleanup'
alias bup='brew update'
alias bug='brew upgrade'
alias bc='brew clean'
alias bp='brew prune'
alias bd='brew doctor'
alias bm='brew missing'

source $ZSH/oh-my-zsh.sh
