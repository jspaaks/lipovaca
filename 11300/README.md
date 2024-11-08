# 11300

Abstract data types, export lists, modules

```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
Loaded GHCi configuration from /home/nlesc/.config/ghc/ghci.conf
λ :load Main.hs 
[1 of 3] Compiling Shapes           ( Shapes.hs, interpreted )
[2 of 3] Compiling Main             ( Main.hs, interpreted )
Ok, two modules loaded.
λ mkPoint2 4 3
mkPoint2 4.0 3.0
λ mkCircle 5
mkCircle 5.0
λ mkRect 100 20
mkRect 100.0 20.0
λ nudgx 10 $ mkCircle 3
nudgx 10.0 $ mkCircle 3.0
λ nudgy 100 $ nudgx 10 $ mkCircle 3
nudgx 10.0 $ nudgy 100.0 $ mkCircle 3.0
λ nudgx 10 $ mkRect 100 20
nudgx 10.0 $ mkRect 100.0 20.0
λ nudgy 50 $ nudgx 10 $ mkRect 100 20
nudgx 10.0 $ nudgy 50.0 $ mkRect 100.0 20.0
```
