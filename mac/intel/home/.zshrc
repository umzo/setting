export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# anyenvのpathを通す
if [ -e "$HOME/.anyenv" ]
then
    export ANYENV_ROOT="$HOME/.anyenv"
    export PATH="$ANYENV_ROOT/bin:$PATH"
    if command -v anyenv 1>/dev/null 2>&1
    then
        eval "$(anyenv init -)"
    fi
fi

# zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# Powerline
function powerline_precmd() {
PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
for s in "${precmd_functions[@]}"; do
if [ "$s" = "powerline_precmd" ]; then
return
fi
done
precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
install_powerline_precmd
fi

function powerline_precmd() {
PS1="$(powerline-shell --shell zsh $?)
>++(°> "
}
# Powerline end

# Alias
alias vi='nvim'
alias note='/Volumes/Develop/second-brain'
