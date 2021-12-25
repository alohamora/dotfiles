for f in /opt/homebrew/etc/bash_completion.d/*; do source $f; done
source ~/.git-prompt.sh


function get_pwd() {
    case $PWD in
        $HOME) HPWD="~";;
        $HOME/*/*) HPWD="${PWD#"${PWD%/*/*}/"}";;
        $HOME/*) HPWD="~/${PWD##*/}";;
        /*/*/*) HPWD="${PWD#"${PWD%/*/*}/"}";;
        *) HPWD="$PWD";;
    esac
    echo $HPWD
}
green="\[\033[01;32m\]"
blue="\[\033[01;34m\]"
red="\[\033[01;31m\]"
white="\[\033[00m\]"


export GO111MODULE=on
export CGO_ENABLED=0
export GOPRIVATE="github.com/unacademy"
export GOPATH="/Users/adityaarora/code/go"
export PATH="/opt/homebrew/bin:$PATH"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/adityaarora/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/adityaarora/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/adityaarora/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/adityaarora/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function get_conda_env() {
    echo $CONDA_DEFAULT_ENV
}

PROMPT_COMMAND="PS1='(\$(get_conda_env)) $green\u:$blue\$(get_pwd)$red\$(__git_ps1)$white\$ '"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export CPATH=/Library/Developer/CommandLineTools/usr/include/c++/v1
