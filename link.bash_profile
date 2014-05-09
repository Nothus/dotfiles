# Paths for homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/bin

# Color ls
export CLICOLOR=1

# Color grep
export GREP_OPTIONS='--color=always'

# Color less
export LESS='-R'

# Set the default editor to vim.
export EDITOR="emacs"
 
# Avoid succesive duplicates in the bash command history AND anything that begins with a space.
export HISTCONTROL=ignoreboth

# Make keeping track of history more solid
shopt -s histappend
export PROMPT_COMMAND="history -a"
HISTFILESIZE=10000

# ctrl-d no longer exits
set -o ignoreeof
# don't overwrite files with >, use >|
set -o noclobber
# bail if you try to expand an unset variable
#set -o nounset # doesn't work with tab completion

#alias emacs="/usr/local/Cellar/emacs/23.4/Emacs.app/Contents/MacOS/Emacs -nw"
#alias emacs="Emacs -nw"
# Open OSX emacs
#alias oemacs='open -a Emacs'
# Find and grep that I always type
alias gfind='find . -type f | xargs grep'
# Simple . and .. aliases
#alias .='pwd'
#alias ..='cd ..'
# Make rm more interactive
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'

alias e='emacsclient -t'
#alias ls='gls --color' # Fix termcap to include TMUX and remove --color
#alias ls='ls --color' # Fix termcap to include TMUX and remove --color

function xtitle()      # Adds some text in the terminal frame.
{
    echo -n -e "\033]0;$*\007" 
}

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
   #export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]X_X\[\e[0m\]; fi\` ${TITLEBAR}${NO_COLOUR}${GREY}[${MILD_BLUE}\$(date +%H:%M)${GREY}][${MILD_BLUE}\u${WHITE}:${MILD_BLUE}\w${GREY}]${ORANGE}\$(parse_git_branch)${NO_COLOUR}\$ "
   #export PS1=${TITLEBAR}${NO_COLOUR}${GREY}'['${MILD_BLUE}'$(date +%H:%M)'${GREY}']['${MILD_BLUE}'\u'${WHITE}':'${MILD_BLUE}'\w'${GREY}']'${GREEN}'$(parse_git_branch)'${NO_COLOUR}
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

[[ -s "/Users/mvazquez/.rvm/scripts/rvm" ]] && source "/Users/mvazquez/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "/home/mvazquez/.rvm/scripts/rvm" ]] && source "/home/mvazquez/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function err_handle {
    say Damn! & disown
}
#trap 'err_handle' ERR

# For lynx
export LYNX_CFG=~/.lynxrc
export WWW_HOME=http://google.com/
