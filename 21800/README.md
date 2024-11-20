# `21800`

```console
ghci
```

```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ -- Make a Maybe value
λ m = Just 5
λ m
Just 5
λ -- Define a function `f` that unwraps a Maybe, applies `show`,
λ -- then wraps the result back up in a Maybe:
λ :{
┣ f :: Maybe Int -> Maybe String
┣ f (Just x) = Just $ show x
┣ f Nothing = Nothing
┣ :}
λ -- See if it works
λ f m
Just "5"
λ -- Using `fmap` instead obfuscates the need for unwrapping and
λ -- wrapping, just doing the `show` part
λ fmap show m
Just "5"
λ -- This behavior is made possible by Maybe being an instance
λ -- of the Functor typeclass
λ :info Maybe
type Maybe :: * -> *
data Maybe a = Nothing | Just a
        -- Defined in ‘GHC.Maybe’
instance Semigroup a => Monoid (Maybe a) -- Defined in ‘GHC.Base’
instance Semigroup a => Semigroup (Maybe a)
  -- Defined in ‘GHC.Base’
instance Foldable Maybe -- Defined in ‘Data.Foldable’
instance Traversable Maybe -- Defined in ‘Data.Traversable’
instance Read a => Read (Maybe a) -- Defined in ‘GHC.Read’
instance Show a => Show (Maybe a) -- Defined in ‘GHC.Show’
instance Applicative Maybe -- Defined in ‘GHC.Base’
instance Functor Maybe -- Defined in ‘GHC.Base’
instance MonadFail Maybe -- Defined in ‘Control.Monad.Fail’
instance Monad Maybe -- Defined in ‘GHC.Base’
instance Eq a => Eq (Maybe a) -- Defined in ‘GHC.Maybe’
instance Ord a => Ord (Maybe a) -- Defined in ‘GHC.Maybe’
λ -- Let's see how fmapping works for a `Tree`
λ :{
┣ data Tree a = Empty
┣             | Leaf a
┣             | Fork a (Tree a) (Tree a)
┣             deriving (Show)
┣ :}
λ -- Make a `Tree` instance
λ tree = Fork 5 (Leaf 6) (Fork 234 Empty Empty)
λ -- We need to make our `Tree` class an instance of
λ -- Functor typeclass in order to use `fmap`, like so
λ :{
┣ instance Functor Tree where
┣     fmap _ Empty               = Empty
┣     fmap f (Leaf x)            = Leaf $ f x
┣     fmap f (Fork x left right) = Fork (f x) (fmap f left) (fmap f right)
┣ :}
λ tree
Fork 5 (Leaf 6) (Fork 234 Empty Empty)
λ fmap show tree
Fork "5" (Leaf "6") (Fork "234" Empty Empty)
λ fmap (+1) tree
Fork 6 (Leaf 7) (Fork 235 Empty Empty)
```

