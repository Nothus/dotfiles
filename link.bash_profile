[[ -s "/Users/mvazquez/.bashrc" ]] && source "/Users/mvazquez/.bashrc"

export JAVA_HOME=$(/usr/libexec/java_home)
eval "$(hub alias -s)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

