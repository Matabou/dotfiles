# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mata"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract jump docker docker-compose sudo)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"
  export NNTPSERVER=news.epita.fr

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'
export GOPATH="$HOME/go"

# Epita Aliases
alias epigcc="gcc -std=c99 -pedantic -Wall -Wextra"
alias epic="g++ -std=c++14 -pedantic -Wall -Wextra"
alias plop="i3lock"

# Usefull Aliases
alias c="clear"
alias t="tree -C"
alias meteo="curl wttr.in"
alias vim="vim -O"
alias v="vim -O"
alias intellij="/usr/idea-IC-145.597.3/bin/idea.sh"
