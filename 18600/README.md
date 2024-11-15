# `18600`

```console
$ echo -ne "Iron the dishes\nDust the dog\nTake salad out of the oven\n" > todo.txt
$ ghc --make todo.hs
[1 of 2] Compiling Main             ( todo.hs, todo.o ) [Source file changed]
[2 of 2] Linking todo [Objects changed]
$ ./todo view todo.txt
Your items are:
1 - Iron the dishes
2 - Dust the dog
3 - Take salad out of the oven
$ ./todo add todo.txt "Pick up children from dry cleaners"
Added a todo item
$ ./todo view todo.txt
Your items are:
1 - Iron the dishes
2 - Dust the dog
3 - Take salad out of the oven
4 - Pick up children from dry cleaners
$ ./todo remove todo.txt 3
Deleted item 3
$ ./todo view todo.txt
Your items are:
1 - Iron the dishes
2 - Dust the dog
3 - Pick up children from dry cleaners
$ ./todo
Specify one of 'add', 'view', or 'remove' as a subcommand
$ ./todo add
Subcommand 'add' requires a filename and a todo item as its sole two arguments
$ ./todo view
Subcommand 'view' requires a filename as its sole argument
$ ./todo remove
Subcommand 'remove' requires a filename and a todo item's index as its sole two arguments
$ ./todo unknown-cmd
Expected subcommand to be one of 'add', 'view', or 'remove'
$ ./todo view "todo.txt" something extra
Subcommand 'view' requires a filename as its sole argument
```
