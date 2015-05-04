# History is appended
shopt -s histappend

# ctrl-d no longer exits
set -o ignoreeof
# don't overwrite files with >, use >|
set -o noclobber
# bail if you try to expand an unset variable
#set -o nounset # doesn't work with tab completion

#alias emacs="/usr/local/Cellar/emacs/23.4/Emacs.app/Contents/MacOS/Emacs -nw"
#alias emacs="Emacs -nw"
# Open OSX emacs
alias oemacs='open -a Emacs'
# Find and grep that I always type
alias gfind='find . -type f | xargs grep'
# Simple . and .. aliases
#alias .='pwd'
#alias ..='cd ..'
# Make rm more interactive
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias grep='grep --color=always'

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'

alias e='emacsclient -t'
#alias ls='gls --color' # Fix termcap to include TMUX and remove --color
#alias ls='ls --color' # Fix termcap to include TMUX and remove --color

function xtitle()      # Adds some text in the terminal frame.
{
    echo -n -e "\033]0;$*\007" 
}

function err_handle {
    say Damn! & disown
}
#trap 'err_handle' ERR

function proml {
    local red='\e[0;31m'
    local RED='\e[1;31m'
    local green='\e[0;32m'
    local GREEN='\e[1;32m'
    local blue='\e[0;34m'
    local BLUE='\e[1;34m'
    local cyan='\e[0;36m'
    local CYAN='\e[1;36m'
    local NC='\e[0m'              # No Color
    case $TERM in
	xterm*|rxvt*)
            TITLEBAR='\[\e]0;\u:\w\007\]'
            ;;
	*)
            TITLEBAR=""
            ;;
    esac

    function parse_git_dirty {
	git diff --quiet HEAD &>/dev/null
	[[ $? == 1 ]] && echo "*"
    }
    function parse_git_branch {
	local branch=$(__git_ps1 "%s")
	[[ $branch ]] && echo "[$branch$(parse_git_dirty)]"
    }
    export PS1="${green}\u@\h:\w \$(parse_git_branch)>${NC}\n\$ "
    export PS2='> '
    export PS4='+ '
}

function completion {
    if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	. /usr/local/etc/bash_completion.d/git-completion.bash
    fi

    if [ -f ~/.gitcomplete ]; then
	. ~/.gitcomplete
    fi

    if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
	. /usr/local/etc/bash_completion.d/git-prompt.sh
    fi
}

completion
proml

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

[[ -s "/Users/mvazquez/.rvm/scripts/rvm" ]] && source "/Users/mvazquez/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "/home/mvazquez/.rvm/scripts/rvm" ]] && source "/home/mvazquez/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
