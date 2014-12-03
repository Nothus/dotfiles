# Paths for homebrew and RVM
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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
export PROMPT_COMMAND="history -a"
export HISTFILESIZE=10000

# For lynx
export LYNX_CFG=~/.lynxrc
export WWW_HOME=http://google.com/

[[ -s "/Users/mvazquez/.bashrc" ]] && source "/Users/mvazquez/.bashrc"
