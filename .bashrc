export PATH="$HOME/bin/node_modules/grunt-cli/bin:$PATH" # Add path for running google app engine scaffold
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

function tabc {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Pro"; fi
  osascript -e "tell application \"Terminal\" to set current settings of front window to settings set \"$NAME\""
}

function vim {
  tabc "Solarized Dark"
  /usr/bin/vim "$@"
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
