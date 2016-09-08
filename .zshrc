if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export TERM='xterm-256color'

ZSH_THEME="agnoster"
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HISTFILE="${HOME}/.zsh_history"

HISTSIZE=2000
SAVEHIST=2000

# each line is added to the history in this way as it is executed
setopt INC_APPEND_HISTORY

plugins=(git)

	export LANG=en_US.UTF-8

# Compilation flags
	export ARCHFLAGS="-arch x86_64"

# Prompt 

#autoload -Uz colors && colors
#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "

cs() { cd "$@" && ls; } # cs changes directory then lists contents of directory

### Aliases ###

alias g='cd /Users/CulloFiles/Documents/Code/Github'

# git shortcuts
alias gpu='git push origin master'
alias gpl='git pull origin master'
alias ga='git add . && git status'
alias gc='git commit -m '
alias gap="git add . && git status && git commit -m 'updating files' && git push origin master"
alias gl="git log"
alias gd="git diff HEAD"
alias gs="git status"

# start mac email server
alias srv='sudo postfix start'
alias stp='sudo postfix stop'

# other
alias la='ls -AF'
alias sf='sudo find / -name'
alias view='/usr/local/Cellar/pcl/1.8.0_1/pcl_viewer.app/Contents/MacOS/pcl_viewer'
alias py='ipython'
alias rpy='python'
alias ev='vim ~/.vimrc'
alias bru='brew update && brew upgrade && brew cleanup'
alias ez='vim ~/.zshrc && source ~/.zshrc'
alias hist='history 1'
