# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cloud"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    git
    autojump
    fasd
    wd
    web-search
    copypath
    copyfile
)


# User configuration

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/nvim/bin"

alias python=python3
alias py=python3
alias pip=pip3
alias l1='ls -1 --color=tty'
alias vim=nvim

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


# FZF configuration
# ---------------
USERNAME=$(whoami)

if [[ ! "$PATH" == */home/$USERNAME/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/$USERNAME/.fzf/bin"
fi

function vimf () { vim $(fzf) }
function vimff () { vim $(fd . $HOME | fzf) }

function lsf () { ls $(find . -type d | fzf) }
function lsff () { ls $(find $HOME -type d | fzf) }

function cdf () { cd $(find . -type d | fzf) }
function cdff () { cd $(find $HOME -type d | fzf) }

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"
bindkey '^w' forward-word
bindkey '^b' backward-word


# zsh-autosuggestions configuration
# ---------------
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Auto-completion
# ---------------
#source "$HOME/.fzf/shell/completion.zsh"
#autoload -U compinit; compinit

# source oh-my-zsh at the end
# ---------------
source $ZSH/oh-my-zsh.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
