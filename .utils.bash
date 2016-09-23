#! /bin/bash
#
# Helper functions for my lazyscripts
# 

RED_COLOUR='\033[0;31m'
GREEN_COLOUR='\033[0;32m'
NO_COLOUR='\033[0m'

function log() {
    stdfile=1
    COLOUR=$GREEN_COLOUR
    if [[ $1 = ERROR ]];
    then
        COLOUR=$RED_COLOUR
        stdfile=2
    fi

    # redirecting string on stderr or stdout
    printf "${COLOUR}[$1] ### $2 ${NO_COLOUR}\n" >&$stdfile 
}
