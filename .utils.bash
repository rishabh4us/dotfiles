#! /bin/bash
#
# Helper functions for my lazyscripts
# 

RED_COLOUR='\033[0;31m'
GREEN_COLOUR='\033[0;32m'
NO_COLOUR='\033[0m'

function log() {

    stdfile=
    COLOUR=

    if [[ $1 = INFO ]]
    then
        COLOUR=$GREEN_COLOUR
        stdfile=1
    elif [[ $1 = ERROR ]]
    then
        stdfile=2
        COLOUR=$RED_COLOUR
    fi

    # redirecting string on stderr or stdout
    printf "${COLOUR}[ $(date +%Y-%m-%dT%H:%M:%S%z) ] $1: $2 ${NO_COLOUR}\n" >&$stdfile 
}

function abort() {
    log ERROR "$1"
    exit 1
}
