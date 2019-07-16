# min-cli-todo #
min-cli-todo is an hyper minimalistic todo list handler for your hyper minimalistic needs.

 
Handle your todos straight from the terminal with some really simple commands:

## Screenshot ##

![alt text](https://github.com/aartuso/min-cli-todo/blob/master/screenshot.png "Screenshot")

## Demo ##

[Demo](https://media.giphy.com/media/jncCr6bcQEQprSfwI1/giphy.gif)

## Installation ##

    git clone https://github.com/aartuso/min-cli-todo.git
    cd min-cli-todo
    ./todo.sh --help

## Create an alias

Sometimes you want direct access to the todo whenever you are.
You need to create an alias on your profile.

On MacOsx:

    open -e ~/.bash_profile
    
If file does not exists you must create it with:

    touch ~/.bash_profile
    
And then you can open it with previous command.    
    
Then add a new line at the end of the file:

    alias todo='~/min-cli-todo/todo.sh'

Close and save the file. Restart the Terminal.
Now you can try typing:
    
    todo
    
If you want it to be total minimalistic I'll suggest you to use "t" alias instead of "todo",
so it will become only "t" command:

    t
    

## Usage ##

	usage: todo [todo_number] [rm] | t <command>
 	
	todo: shows the todo list
	todo [todo_number]: mark the selected todo number as done/undone
	todo [todo_number] rm: removes the selected todo
	
## List of commands: ##
    	
        mkr         Starts the todo maker wizard
        save        Saves the actual todo list (into $FILE_TODO_LIST.saved)
        clean       Cleans the actual todo list
        recover     Recovers the last saved todo list
        
