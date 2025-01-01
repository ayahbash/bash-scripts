#!/bin/bash

declare task
todo_dir="$HOME/todo"
todo_file="$todo_dir/todo.txt"

# check if directory exists
if [ ! -d "$todo_dir" ]; then
    mkdir "$todo_dir"
    echo "Created new directory for tasks."
fi

# check if file exists
if [ ! -f "$todo_file" ]; then
    touch "$todo_file"
fi

# check task number
validate_task_number() {
    if [[ ! "$task_number" =~ ^[0-9]+$ ]] || [ "$task_number" -lt 1 ] || [ "$task_number" -gt $(wc -l < "$todo_file") ]; then
        echo "Invalid task number!"
        return 1
    fi
    return 0
}

# help menu
show_usage() {
    echo "Usage:"
    echo "-t: add a new task"
    echo "-l: list current tasks"
    echo "-q: quit"
    echo "-r: remove a task by number"
    echo "-d: mark a task as done"
    echo "-h: help menu :3"
}

# greetings!
echo "Hello $USER! :3"

# if no arguments are passed, displays the help menu
if [ $# -eq 0 ]; then
    show_usage
    exit 1
fi

# parsing options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -t) # add new task
            echo "Enter a new task:"
            read -r task
            echo "$task" >> "$todo_file"
            echo "Task added!"
            shift;;
        -d) # mark task as done (by number)
            echo "Enter task number to mark as done:"
            read task_number
            if validate_task_number; then
                sed -i "${task_number}s/$/ - done/" "$todo_file"
                echo "Task marked as done!"
            fi
            shift;;
        -r) # remove a task (by number)
            echo "Enter the task number to remove:"
            read task_number
            if validate_task_number; then
                sed -i "${task_number}d" "$todo_file"
                echo "Task removed!"
            fi
            shift;;
        -l) # list current tasks
            if [ -s "$todo_file" ]; then
                echo "Your tasks:"
                nl "$todo_file"
            else
                echo "No tasks yet :c"
            fi
            shift;; 
        -q) # quit
            echo "Goodbye!"
            exit 0
            shift;;
        -h) # help menu
            show_usage
            shift;;
        *)
            echo "Invalid option: $1"
            show_usage
            exit 1
            ;;
    esac
done