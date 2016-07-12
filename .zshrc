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

	export LANG=en_US.UTF-8

# Compilation flags
	export ARCHFLAGS="-arch x86_64"

# Aliases/Shortcuts

	alias c='cd /Users/CulloFiles/Documents/Code'
	alias gpu='git push origin master'
	alias gpl='git pull origin master'
  alias ga='git add . && git status'
	alias gc='git commit -m '
	alias la='ls -AF'
	alias srv='sudo postfix start'
	alias stp='sudo postfix stop'
	cs() { cd "$@" && ls; } # cs changes directory then lists contents of directory

# Start

cd ~/Documents/Code
