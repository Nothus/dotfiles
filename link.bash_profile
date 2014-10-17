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

# Set the default editor emacs.
export EDITOR="emacs"
export ESHELL="/usr/local/bin/bash --login"

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


#completion
#proml

[[ -s "/Users/mvazquez/.rvm/scripts/rvm" ]] && source "/Users/mvazquez/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "/home/mvazquez/.rvm/scripts/rvm" ]] && source "/home/mvazquez/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function err_handle {
    say Damn! & disown
}
#trap 'err_handle' ERR

# For lynx
export LYNX_CFG=~/.lynxrc
export WWW_HOME=http://google.com/

[[ -s "/Users/mvazquez/.bashrc" ]] && source "/Users/mvazquez/.bashrc"
