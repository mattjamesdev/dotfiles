# 
# .zprofile
#
# This is mainly to set environment variables.

### macOS ###
if [[ `uname` == "Darwin" ]]; then
    # POETRY_HOME (for the Python package manager Poetry)
    export POETRY_HOME="$HOME/.pypoetry"

    # PATH
    #eval "${/usr/libexec/path_helper -s}"  # Set default PATH
    export PATH="$PATH:$HOME/opt/anaconda3/bin"          # Anaconda
    export PATH="$PATH:/opt/local/bin:/opt/local/sbin"   # Macports
    export PATH="$PATH:$HOME/bin/matt"                   # personal stuff
    export PATH="/Applications/Lilypond/LilyPond:$PATH"  # LilyPond
    export PATH="$POETRY_HOME/bin:$PATH"  # Poetry
    if [[ -d "$HOME/.pyenv" ]]; then  # Pyenv
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"  # initialise the pyenv command
        eval "$(pyenv virtualenv-init -)"  # initialise the pyenv-virtualenv command
    fi
    typeset -U PATH

    # MANPATH
    export MANPATH="/opt/local/share/man:$MANPATH"  # Macports
    typeset -U MANPATH


### Arch Linux ###
elif command -v pacman > /dev/null; then
    # PATH
    export PATH="$PATH:$HOME/bin/matt"
    if [[ -d "$HOME/.pyenv" ]]; then  # Pyenv
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"  # Pyenv
        eval "$(pyenv init --path)"  # evaluates 'export PATH="$PYENV_ROOT/shims:$PATH"'
    fi


### Debian/Raspberry Pi ###
elif command -v apt > /dev/null; then
    export PATH="$PATH:$HOME/bin"
fi

