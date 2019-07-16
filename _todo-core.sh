#!/usr/bin/env bash

SCRIPT_VERSION=0.1;

COLOR_ERROR="\e[91m";
COLOR_END="\e[0m";
COLOR_SECRET="\e[90m";
COLOR_GREEN="\e[32m";

COMMON_DIR="${BASH_SOURCE%/*}"
FILE_TODO_LIST="$COMMON_DIR/todo.list";

function check() {
    local TODO_DONE=$(sed ''"$1"'q;d' ${FILE_TODO_LIST} | cut -d'§' -f2)
    if [[ "$TODO_DONE" == "t" ]]; then
        cat ${FILE_TODO_LIST} | sed -e ''"$1"'s/§.*/§f/' > tmp.list;
    else
        cat ${FILE_TODO_LIST} | sed -e ''"$1"'s/§.*/§t/' > tmp.list;
    fi
    mv tmp.list ${FILE_TODO_LIST};
    print;
}

function clean() {
    echo "Cleaning todo list..."
    mv ${FILE_TODO_LIST} ${FILE_TODO_LIST}.tmp
    touch ${FILE_TODO_LIST}
    chmod +x ${FILE_TODO_LIST}
    rm ${FILE_TODO_LIST}.tmp
}

function help() {
    echo -e "usage: todo [todo_number] [rm] | t <command>"
    echo ""
    echo "  todo: shows the todo list"
    echo "  todo [todo_number]: mark the selected todo number as done/undone"
    echo "  todo [todo_number] rm: removes the selected todo"
    echo ""
    echo "List of commands:"
    echo ""
    echo "  mkr         Starts the todo maker wizard"
    echo "  save        Saves the actual todo list (into $FILE_TODO_LIST.saved)"
    echo "  clean       Cleans the actual todo list"
    echo "  recover     Recovers the last saved todo list"
    echo ""
}

function mkr() {
    echo "Welcome to todo maker by Andrea Artuso"
    local TODO_INDEX=1;
    print;

    while true; do
        echo -e "Do you want to recover last todo list?";
        read yn;
        if [[ "$yn" == "y" ]] || [[ "$yn" == "Y" ]]; then
	        recover;
	        break;
        elif [[ "$yn" == "n" ]] || [[ "$yn" == "N" ]]; then
            echo -e "Insert todos: $COLOR_SECRET(or CTRL+C to exit)$COLOR_END";
            while true; do
                read input_todo;
                if [[ "$input_todo" ]]; then
                    # add to file
                    echo "$input_todo §f" >> ${FILE_TODO_LIST};
                else
                    echo -e "Please insert a todo $COLOR_SECRET(or CTRL+C to exit)$COLOR_END"
                fi
            done
        else
            echo -e "$COLOR_ALERT Please insert with 'y' or 'n' $COLOR_END";
        fi
    done
}

function print(){
    local TODO_INDEX=1;
    if [[ ! -f ${FILE_TODO_LIST} ]]; then
        echo -e "$COLOR_ERROR $FILE_TODO_LIST not found $COLOR_END"
    elif [[ ! -s ${FILE_TODO_LIST} ]]; then
        echo -e "$COLOR_ERROR No todos. $COLOR_END"
    else
        while IFS= read -r line
            do
                local TODO_ELEM=$(echo ${line} | cut -d'§' -f1);
                local TODO_DONE=$(echo ${line} | cut -d'§' -f2);
                if [[ "$TODO_DONE" == "t" ]]; then
                    echo -e "$COLOR_GREEN ✓ $TODO_ELEM $COLOR_END";
                else
                    echo -e "$COLOR_SECRET $TODO_INDEX $COLOR_END$TODO_ELEM";
                fi
                TODO_INDEX=$(($TODO_INDEX+1));
        done < "$FILE_TODO_LIST"
    fi
}

function recover() {
    if [[ ! -f ${FILE_TODO_LIST}.saved ]]; then
        echo -e "$COLOR_ERROR No todo list to recover $COLOR_END"
    elif [[ ! -s ${FILE_TODO_LIST}.saved ]]; then
        echo -e "$COLOR_ERROR No todo list to recover $COLOR_END"
    else
        echo -e "Recovering todos (from $FILE_TODO_LIST.saved)...";
        cp $FILE_TODO_LIST.saved $FILE_TODO_LIST
    fi
}

function remove() {
    while true; do
        echo "Are you sure to delete the following todo entry?"
        echo -e " $(sed -n "${1}p" ${FILE_TODO_LIST} | cut -d'§' -f1)"
        read yn;
        if [[ "$yn" == "y" ]] || [[ "$yn" == "Y" ]]; then
            sed -e ''"$1"'d' ${FILE_TODO_LIST} > tmp.list;
            mv tmp.list ${FILE_TODO_LIST};
            print;
            break;
        elif [[ "$yn" == "n" ]] || [[ "$yn" == "N" ]]; then
            break;
        else
            echo -e "$COLOR_ALERT Please answer 'y' or 'n' $COLOR_END";
        fi
     done
}

function save() {
    echo -e "Saving todos (in $FILE_TODO_LIST.saved)...";
    cp $FILE_TODO_LIST $FILE_TODO_LIST.saved
}
