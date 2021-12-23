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

PROMPT_COMMAND="PS1='$green\u:$blue\$(get_pwd)$red\$(__git_ps1)$white\$ '"
