# bashtodo - CLI to-do app 📝

A simple **CRUD** CLI to-do list app built using **Bash** scripting. Manage your tasks directly from the terminal with simple commands like **add**, **list**, **remove**, and **mark as done**!

![screenshot](ss.png)

## Usage 
- **`bashtodo -t`**: Add a new task
- **`bashtodo -l`**: List all current tasks
- **`bashtodo -r`**: Remove a task by its number
- **`bashtodo -d`**: Mark a task as done
- **`bashtodo -h`**: Show the help menu

## Installation

### Prerequisites

- **Bash** (most Linux and macOS systems come with Bash by default)
- A terminal or command-line interface

### Steps to Install

1. **Clone the repository** to your local machine:
    
    ```bash
    git clone https://github.com/ayahbash/bashtodo.git
    cd bashtodo
    ```
    
2. **Make the script executable**:
    
    ```bash
    chmod +x todo.sh
    ```
    
3. **Move the script to a directory in your PATH** (optional, but recommended for global use):

    ```bash
    sudo mv todo.sh /usr/local/bin/bashtodo
    ```
    This allows you to run `bashtodo` from anywhere in your terminal!
    