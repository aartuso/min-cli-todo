#!/usr/bin/env bash

. "${BASH_SOURCE%/*}/_todo-core.sh"

IS_NUMBER_REGEX='^[0-9]+$';

if [[ "${1}" ]]; then
    if [[ ${1} =~ ${IS_NUMBER_REGEX} ]]; then
        if [[ ${2} = "rm" ]]; then
            remove ${1};
        else
            check ${1};
        fi
    elif [[ ${1} = "" ]]; then
        print;
    elif [[ ${1} = "mkr" ]]; then
        mkr;
    elif [[ ${1} = "clean" ]]; then
        clean;
    elif [[ ${1} = "recover" ]]; then
        recover;
    elif [[ ${1} = "save" ]]; then
        save;
    elif [[ ${1} = "--help" ]]; then
        help;
    fi
else
    print;
fi

