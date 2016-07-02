# Path to your oh-my-zsh installation.
export ZSH=/Users/CulloFiles/.oh-my-zsh

ZSH_THEME="agnoster"
# Uncomment the following line to use case-sensitive completion.
 CASE_SENSITIVE="true"

 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# disable marking untracked files under VCS as dirty.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"
