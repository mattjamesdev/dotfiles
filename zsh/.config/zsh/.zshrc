# =====================================
#       _____    _
#      |__  /___| |__  _ __ ___
#        / // __| '_ \| '__/ __|
#       / /_\__ \ | | | | | (__
#      /____|___/_| |_|_|  \___|
# =====================================

# === PLUGINS =========================
# Download the plugin manager if not already installed
if [[ ! -f ${ZDOTDIR}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR}/.zcomet/bin
fi
source ${ZDOTDIR}/.zcomet/bin/zcomet.zsh
# Set custom directories
ZCOMET[HOME_DIR]=${ZDOTDIR}/.zcomet
ZCOMET[REPOS_DIR]=${ZCOMET[HOME_DIR]}/repos
ZCOMET[SNIPPETS_DIR]=${ZCOMET[HOME_DIR]}/snippets

# Load plugins
zcomet load romkatv/powerlevel10k
zcomet load zsh-users/zsh-syntax-highlighting


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# === PYENV ===========================
# Initialise Pyenv:
if [[ -d "$HOME/.pyenv" ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi


# === COLOURS =========================
# Colours for BSD "ls" command
export CLICOLOR=1
export LSCOLORS='ExFxCxDxBxEgEdabagacad'
# Default is    'exfxcxdxbxegedabagacad'

# Colours for autocomplete/GNU ls/exa
export LS_COLORS='di=1;34:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=1;34;46:cd=1;34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:.DS_Store=38;5;244'


# === AUTO/TAB COMPLETE ===============
# Taken from https://www.youtube.com/watch?v=hLxr9hLfO0Q at 3:32.
autoload -Uz compinit
zstyle ':completion:*' menu select
# Auto complete with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Use same colours as the "ls" command
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden (".*") files.

# Compile compinit's dumpfile to wordcode
zcomet compile "$ZDOTDIR/.zcompinit"


# === VI MODE =========================
bindkey -v


# === GIT =============================
# Display git info in prompt (if in a git repo)
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%B%F{9}%s%f(%F{40}%b%f)%%b"
zstyle ':vcs_info:git*' actionformats "%B%F{9}%s%f(%F{40}%b%f) %a%%b"
precmd() { vcs_info }


# === PROMPT ==========================
# When not using Powerlevel10k
setopt prompt_subst # Evaluates ${} expressions within single quote strings
export PROMPT='%F{046}%n@%m %*%f in %F{135}%~%f ${vcs_info_msg_0_} 
  $ '


# === POWERLEVEL10k ===================
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ `uname` == "Darwin" ]]; then
    # macOS
    __conda_setup="$('/Users/matthewjames/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/matthewjames/opt/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/matthewjames/opt/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/matthewjames/opt/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
elif command -v pacman > /dev/null; then
    # Arch Linux
    __conda_setup="$('/home/matt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/matt/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/matt/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/matt/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi
# <<< conda initialize <<<


# === FUNCTIONS =======================
source ${ZDOTDIR}/.zfunctions

# === ALIASES =========================
source ${ZDOTDIR}/.zaliasrc

