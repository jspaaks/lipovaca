# `20800`

Heathrow to London traffic

```console
$ ghc --make routing.hs
[1 of 2] Compiling Main             ( routing.hs, routing.o ) [Source file changed]
[2 of 2] Linking routing [Objects changed]
$ ./routing
Usage: routing FILENAME
   Print optimal route given a system of two parallel roads.
$ cat heathrow.txt
50
10
30
5
90
20
40
2
25
10
8
0
$ ./routing heathrow.txt
1. Follow B
2. Cross
3. Follow A
4. Cross
5. Follow B
6. Follow B
This route takes 75 minutes.
```
