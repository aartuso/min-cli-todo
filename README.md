# min-cli-todo #
min-cli-todo is an hyper minimalistic todo list handler for your hyper minimalistic needs.

Handle your todos straight from the terminal with some really simple commands:

## Screenshot ##

![alt text](https://github.com/aartuso/min-cli-todo/blob/master/Screenshot.png "Screenshot")

## Installation ##
    git clone https://github.com/aartuso/min-cli-todo.git
    cd min-cli-todo
    ./todo.sh --help

[Installation demo](https://media.giphy.com/media/hS9q43nRvkAW9JbZBC/giphy.gif "Installation Demo")

## Create an alias

Sometimes you want direct access to the todo whenever you are.
You need to create an alias on your profile.

On MacOsx:

    open -e ~/.bash_profile
    
If file does not exists you must create it with:

    touch ~/.bash_profile
    
And then you can open it with previous command.    
    
Then add these three lines at the end of the file:

    # Todo
    alias todo='~/min-cli-todo/todo.sh'
    alias todos='~/min-cli-todo/todo.sh list'

Close and save the file. Restart the Terminal.
Now you can try typing:
    
    todos
    
If you want it to be total minimalistic I'll suggest you to use "t" alias instead of "todo",
so it will become only "t" command:

    t
    
[Alias demo](https://media.giphy.com/media/kaByKnihKm9nNtfeUW/giphy.gif "Alias Demo")

## Usage ##

	usage: todo [COMMAND] | todo [todo_number] | t [COMMAND [todo_content]]

	List of commands:

	  add [todo_content]  Adds a todo
	  rm [todo_number]    Removes the selected todo
	  [todo_number]       Marks the selected todo number as done/undone
	  list                Shows all todos
	  wizard              Starts the todo maker wizard
	  save                Saves the actual todo list (into ./.todo.list.saved)
	  clean               Cleans the actual todo list
	  recover             Recovers the last saved todo list

        
[Usage demo](https://media.giphy.com/media/fwQJogVu1XmLozIcyk/giphy.gif "Usage demo")
