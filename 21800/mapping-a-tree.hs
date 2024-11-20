module Main (main) where

    main = undefined

    data Tree a = Empty
                | Leaf a
                | Fork a (Tree a) (Tree a)
                deriving (Show)

    instance Functor Tree where
        fmap _ Empty               = Empty
        fmap f (Leaf x)            = Leaf $ f x
        fmap f (Fork x left right) = Fork (f x) (fmap f left) (fmap f right)
