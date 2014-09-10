# bashrc file for shimabara

# increase the size of the bash command history
export HISTFILESIZE=10000

# aliases
alias la="ls -Al"
alias ll="ls -l"
alias mj="make -j"
alias rr="rake run"
alias rd="rake debug"
alias rrl="rake run DEFINES=TEST_LAYOUT"

# terminal colors
# assume that we will be using a
# decent terminal most of the time
export TERM=xterm-256color

NO_COLOR="\[\033[0m\]"
function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }

# set a fancy prompt
export PS1="`EXT_COLOR 172`\u@`EXT_COLOR 171`\h:`EXT_COLOR 39`\w\$${NO_COLOR} "

export PATH=/usr/local/bin:$PATH
# emacs stuff
export PATH="/Applications/Aquamacs.app/Contents/MacOS/bin:$PATH"

# python stuff
export PATH=/usr/local/share/python:$PATH
export PATH="/usr/local/share/npm/bin:$PATH"

export NODE_PATH='/usr/local/lib/node_modules'

# haskell stuff
export PATH="~/.cabal/bin":$PATH

# ls colors!
export LSCOLORS=excxxxxxfxxxxxxxxxxxxx
export export CLICOLOR=1

export EDITOR=emacsclient

# bash autocompletion
# case-insensitive autocomplete
bind 'set completion-ignore-case on'
export FIGNORE='.csproj:.unityproj'
