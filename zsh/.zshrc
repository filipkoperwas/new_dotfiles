# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cloud"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:$HOME/.local/bin"

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
function lsf () { ls $(find $HOME -type d | fzf) }
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


# source oh-my-zsh at the end
# ---------------
source $ZSH/oh-my-zsh.sh

# Auto-completion
# ---------------
#source "$HOME/.fzf/shell/completion.zsh"
#autoload -U compinit; compinit
