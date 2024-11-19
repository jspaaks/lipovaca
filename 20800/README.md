# `20800`

Heathrow to London traffic

```console
ghci
```

```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load routing.hs
[1 of 1] Compiling Routing          ( routing.hs, interpreted )
Ok, one module loaded.
λ steps $ selectQuickest $ accumulate $ subRouteChoices heathrowToLondon 
1. Follow B
2. Cross
3. Follow A
4. Cross
5. Follow B
6. Follow B
```
