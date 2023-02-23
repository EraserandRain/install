#!/usr/bin/env zsh
local SCRIPTFILE=$0
local ZSHFILE=
function print_usage() {
    cat <<EOF
    
    Description: update local zshrc file ($HOME/.zshrc) 

    Usage: $SCRIPTFILE [OPTIONS]    

    OPTIONS:
        -w : in WSL env
        -d : in Docker env
        -c : in Common env
        -h : show this help and exit    

EOF
    exit 1
}

function update_local_zsh() {
    source ${HOME}/env-manager/PROJECT_ENV
    cat ${ENV_LOAD}/zsh/settings/${ZSHFILE} > ${HOME}/.zshrc
    source ${HOME}/.zshrc
}

# Main
while getopts "h w d c" OPT
do
    case $OPT in
        h)
            print_usage
            ;;
        w)
            ZSHFILE=WSL
            update_local_zsh
            ;;
        d)
            ZSHFILE=Docker
            update_local_zsh
            ;;
        c)
            ZSHFILE=Common
            update_local_zsh
            ;;
        *)
            print_usage
            ;;
    esac
done