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
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# PATH=$PATH:$HOME/work/sync_spike/jmb/cplusplus/src
# eval `$HOME/work/sync_spike/sag/jmb/bin/jiff-env moves-data-intake`
