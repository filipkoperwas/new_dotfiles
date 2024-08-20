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
export PATH="$PATH:/opt/nvim-linux64/bin"

alias python=python3
alias py=python3
alias pip=pip3
alias l1='ls -1 --color=tty'
alias vim=nvim

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

alias xlaunch='/c/Program\ Files/VcXsrv/xlaunch.exe -run ~/xlaunchConfig'
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export LIBGL_ALWAYS_INDIRECT=1
export XDG_RUNTIME_DIR=/home/fkoperwas/
export RUNLEVEL=3


# FZF configuration
# ---------------
export PROJECTS_FOLDER=$HOME/projects
fzfChange() {
  folder_name=$(find $PROJECTS_FOLDER -maxdepth 1 -type d | fzf)
  tmux new -As $folder_name -c "$folder_list/$folder_name"
}

USERNAME=$(whoami)

# bindkey -s '^g' "find ~/projects -maxdepth 1 -type d | fzf --bind 'enter:become(/usr/bin/tmux {})'^M"
bindkey -s '^g' "fzfChange^M"
if [[ ! "$PATH" == */home/$USERNAME/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/$USERNAME/.fzf/bin"
fi

function vimf () { vim $(fzf) }
function vimff () { vim $(fd . $HOME | fzf) }
function vimfw () { vim $(fd . /mnt/c/Users/Filip-PC/Programming/ | fzf) }
function vimffw () { vim $(fd . /mnt/c | fzf) }

function lsf () { ls $(find . -type d | fzf) }
function lsff () { ls $(find $HOME -type d | fzf) }
function lsfw () { ls $(find /mnt/c/Users/Filip-PC/Programming -type d | fzf) }
function lsffw () {lscd $(find /mnt/c -type d | fzf) }

function cdf () { cd $(find . -type d | fzf) }
function cdff () { cd $(find $HOME -type d | fzf) }
function cdfw () { cd $(find /mnt/c/Users/Filip-PC/Programming -type d | fzf) }
function cdffw () { cd $(find /mnt/c -type d | fzf) }

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"


# Autojump configuration
# ---------------
function jo () {
        if [[ ${1} == -* ]] && [[ ${1} != "--" ]]
        then
                autojump ${@}
                return
        fi
        setopt localoptions noautonamedirs
        local output="$(autojump ${@})"
        if [[ -d "${output}" ]]
        then
                case ${OSTYPE} in
                        (linux*) explorer.exe "$(wslpath -w ${output})" ;;
                        (darwin*) open "${output}" ;;
                        (cygwin) cygstart "" $(cygpath -w -a ${output}) ;;
                        (*) echo "Unknown operating system: ${OSTYPE}" >&2 ;;
                esac
        else
                echo "autojump: directory '${@}' not found"
                echo "\n${output}\n"
                echo "Try \`autojump --help\` for more information."
                false
        fi
}


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
