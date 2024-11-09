# 12100


```console
ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load Main.hs 
[1 of 3] Compiling Vectors          ( Vectors.hs, interpreted )
[2 of 3] Compiling Main             ( Main.hs, interpreted )
Ok, two modules loaded.
λ v2 :: Vector Float = Vector2 {x = 7, y = 9}
λ v3 :: Vector Float = Vector3 {x = 7, y = 9, z = 56}
λ add v2 v2
Vector2 {x = 14.0, y = 18.0}
λ add v3 v3
Vector3 {x = 14.0, y = 18.0, z = 112.0}
λ scale 3 v2
Vector2 {x = 21.0, y = 27.0}
λ scale 3 v3
Vector3 {x = 21.0, y = 27.0, z = 168.0}
λ inner v2 v2
130.0
λ inner v3 v3
3266.0
```
