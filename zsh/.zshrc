# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source ~/.bash_profile

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(command-time)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# aliases

# altering profiles
alias zshrc="emacs ~/.zshrc&"
alias vimrc="emacs ~/.vimrc&"
alias gitig="emacs ~/.gitignore_global&"
alias gitconf="emacs ~/.gitconfig&"
alias emac="emacs ~/.emacs.d/init.el&"
alias src="source ~/.zshrc"

# alias suffixes
alias -s {js,json,md,html,css,py,cpp,c,txt}=emacs
alias -s git="git clone"

# program (re)assignments
alias emacs=/Applications/Emacs.app/Contents/MacOS/Emacs

# mongodb
alias mongod="sudo mongod --dbpath='/usr/local/var/mongodb'"

#tools
alias howbig="stat -f '%N: %Z bytes'"

# displaying execution time

# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=0

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="%s s"

# Message color.
ZSH_COMMAND_TIME_COLOR="cyan"

# Exclude some commands
ZSH_COMMAND_TIME_EXCLUDE=(vim mcedit)

zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME "
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min $sec"
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours $min  $sec"
            else
                timer_show="$fg[red]$min  $sec "
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}

# history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
export PATH="/usr/local/opt/node@18/bin:$PATH"
 
# # Load Angular CLI autocompletion.
# source <(ng completion script)

# export PATH="/usr/local/opt/ruby/bin:$PATH"

# # Ruby

# if [ -d "/usr/local/opt/ruby/bin" ]; then
#   export PATH=/usr/local/opt/ruby/bin:$PATH
#   export PATH=`gem environment gemdir`/bin:$PATH
# fi
# export PATH="/usr/local/opt/libpq/bin:$PATH"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export PYTHONPATH=$PYTHONPATH:/Users/aiden/Github/problem_solutions/data_structures

# access python version
export PATH="/usr/local/opt/python@3.12/libexec/bin:$PATH"
