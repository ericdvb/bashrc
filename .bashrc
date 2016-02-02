export PATH="$PATH:$HOME/bin/node_modules/grunt-cli/bin" # Add path for running google app engine scaffold
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PACKAGE_DIRS="$HOME/work/resources/meteor/packages" #Define PACKAGE_DIRS for local meteor packages
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ewillenson/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export CLICOLOR=true

#Color Constants
RED="\033[0;31m"
GREEN="\033[0;33m"
BLUE="\033[0;34m"
OCHRE="\033[38;5;95m"
WHITE="\033[0;37m"
RESET="\033[0m"

source ~/git-prompt.sh
source ~/git-completion.sh
# wrap hub command with git command
eval "$(hub alias -s)"

function tabc {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Pro"; fi
  osascript -e "tell application \"Terminal\" to set current settings of front window to settings set \"$NAME\""
}

function vim {
  tabc "Solarized Dark"
  /usr/local/bin/vim "$@"
  tabc "Pro"
}

function nfg {
test=$(fg)
  if [[ "$test" == *vim* ]]; then
    tabc "Solarized Dark"
    fg
    tabc "Pro"
  else
    fg
  fi
}

function svim {
  tabc "Solarized Dark"
  sudo vim -u /Users/ewillenson/.vimrc "$@" 
  tabc "Pro"
}

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $GREEN
  else
    echo -e $OCHRE
  fi
}


PS1="[\w\[\$(git_color)\]\$(__git_ps1)\[$RESET\]]$ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/Users/ewillenson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
