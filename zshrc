#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

TYPEWRITTEN_PROMPT_LAYOUT="singleline"
#TYPEWRITTEN_SYMBOL="$ "
#TYPEWRITTEN_RELATIVE_PATH="home"
export TYPEWRITTEN_COLOR_MAPPINGS="primary:default;secondary:green;notice:red"
export TYPEWRITTEN_LEFT_PROMPT_PREFIX_FUNCTION=(date +%H:%M:%S)

autoload -Uz promptinit
promptinit
prompt typewritten

# Customize to your needs...
export PATH=$PATH:/home/kaon/.spicetify
