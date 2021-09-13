# === PATH ======================

if [[ `uname` == "Darwin" ]]; then
    # macOS
    export XDG_CONFIG_HOME="$HOME/.config"
 
    #eval "${/usr/libexec/path_helper -s}"  # Set default PATH
    export PATH="$PATH:$HOME/opt/anaconda3/bin"          # Anaconda
    export PATH="$PATH:/opt/local/bin:/opt/local/sbin"   # Macports
    export PATH="$PATH:$HOME/bin/matt"                   # personal stuff
    export PATH="/Applications/Lilypond/LilyPond:$PATH"  # LilyPond
    if [[ -d "$HOME/.pyenv" ]]; then  # Pyenv
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init --path)"  # evaluates 'export PATH="$PYENV_ROOT/shims:$PATH"'
    fi
    typeset -U PATH

    export MANPATH="/opt/local/share/man:$MANPATH"  # Macports
    typeset -U MANPATH

elif command pacman > /dev/null; then
    # Arch Linux
    export PATH="$PATH:$HOME/bin/matt"
    if [[ -d "$HOME/.pyenv" ]]; then  # Pyenv
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"  # Pyenv
        eval "$(pyenv init --path)"  # evaluates 'export PATH="$PYENV_ROOT/shims:$PATH"'
    fi

elif command apt > /dev/null; then
    # Debian/Raspberry Pi
    export PATH="$PATH:$HOME/bin"
fi

