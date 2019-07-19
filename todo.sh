#!/usr/bin/env bash

. "${BASH_SOURCE%/*}/_todo-core.sh"

IS_NUMBER_REGEX='^[0-9]+$';

if [[ ! -f ${FILE_TODO_LIST} ]]; then
    init;
fi

if [[ "${1}" ]]; then
    if [[ ${1} =~ ${IS_NUMBER_REGEX} ]]; then
        check ${1};
    elif [[ ${1} = "" ]] || [[ ${1} = "help" ]]; then
        help;
    elif [[ ${1} = "list" ]]; then
        print;
    elif [[ ${1} = "wizard" ]]; then
        wizard;
    elif [[ ${1} = "clean" ]] || [[ ${1} = "clear" ]]; then
        clean;
    elif [[ ${1} = "recover" ]]; then
        recover;
    elif [[ ${1} = "save" ]]; then
        save;
    elif [[ ${1} = "add" ]]; then
        add ${@:2}
    elif [[ ${1} = "rm" ]]; then
        remove ${2};
    else
        echo -e "Unkonwn command: ${1}"
    fi
else
    help;
fi
