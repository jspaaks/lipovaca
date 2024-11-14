# `18100`

```console
$ echo -ne "Iron the dishes\nDust the dog\nTake salad out of the oven\n" > todo.txt
$ cat todo.txt
Iron the dishes
Dust the dog
Take salad out of the oven
$ ghc --make deletetodo.hs
[1 of 2] Compiling Main             ( deletetodo.hs, deletetodo.o )
[2 of 2] Linking deletetodo
$ ./deletetodo
Your items are:
1 - Iron the dishes
2 - Dust the dog
3 - Take salad out of the oven
Which item do you want to delete?
2
$ cat todo.txt
Iron the dishes
Take salad out of the oven
$ ./deletetodo
Your items are:
1 - Iron the dishes
2 - Take salad out of the oven
Which item do you want to delete?
2
$ ./deletetodo
Your items are:
1 - Iron the dishes
Which item do you want to delete?
1
$ cat todo.txt
$
```
