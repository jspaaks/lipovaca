# `18300`

With simulated error and `except` branch basically a noop, temp file remains:

```console
$ echo -ne "Iron the dishes\nDust the dog\nTake salad out of the oven\n" > todo.txt
$ ghc --make delete-todo.hs
[1 of 2] Compiling Main             ( delete-todo.hs, delete-todo.o )
[2 of 2] Linking delete-todo
$ ./delete-todo
Your items are:
1 - Iron the dishes
2 - Dust the dog
3 - Take salad out of the oven

Which item do you want to delete?
1
trying
excepting (noop)
delete-todo: simulated error
CallStack (from HasCallStack):
  error, called at delete-todo.hs:48:17 in main:Main
$ ls -1
delete-todo
delete-todo.hi
delete-todo.hs
delete-todo.o
README.md
todo63075-0.txt
todo.txt
```

With simulated error, temp file is cleaned up from `except` branch:

```console
$ echo -ne "Iron the dishes\nDust the dog\nTake salad out of the oven\n" > todo.txt
$ ghc --make delete-todo.hs
[1 of 2] Compiling Main             ( delete-todo.hs, delete-todo.o )
[2 of 2] Linking delete-todo
$ ./delete-todo
Your items are:
1 - Iron the dishes
2 - Dust the dog
3 - Take salad out of the oven

Which item do you want to delete?
1
trying
excepting
delete-todo: simulated error
CallStack (from HasCallStack):
  error, called at delete-todo.hs:48:17 in main:Main
$ ls -1
delete-todo
delete-todo.hi
delete-todo.hs
delete-todo.o
README.md
todo.txt
```

With simulated error commented out, `except` branch is never touched, temp file is cleaned up normally

```console
$ echo -ne "Iron the dishes\nDust the dog\nTake salad out of the oven\n" > todo.txt
$ ghc --make delete-todo.hs
[1 of 2] Compiling Main             ( delete-todo.hs, delete-todo.o )
[2 of 2] Linking delete-todo
$ ./delete-todo
Your items are:
1 - Iron the dishes
2 - Dust the dog
3 - Take salad out of the oven

Which item do you want to delete?
1
trying
$ ls -1
delete-todo
delete-todo.hi
delete-todo.hs
delete-todo.o
README.md
todo.txt
```
