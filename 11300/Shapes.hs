module Shapes ( Point2
              , Shape2
              , mkPoint2
              , mkCircle
              , mkRect
              , nudgx
              , nudgy
              ) where

    data Point2 = Point2 Float Float deriving (Show, Eq)
    data Shape2 = Circle Point2 Float
                | Rect Point2 Point2
                deriving (Show, Eq)

    mkPoint2 x y = Point2 x y

    mkCircle r = Circle center r where
        center = Point2 0 0

    mkRect w h = Rect lefttop rightbottom where
        lefttop = Point2 0 h
        rightbottom = Point2 w 0

    nudgx :: Float -> Shape2 -> Shape2
    nudgx dx shape = case shape of
        Circle (Point2 x y) r                        -> Circle (Point2 x' y) r where
            x' = x + dx
        Rect (Point2 left top) (Point2 right bottom) -> Rect (Point2 left' top) (Point2 right' bottom) where
            left' = left + dx
            right' = right + dx


    nudgy :: Float -> Shape2 -> Shape2
    nudgy dy shape = case shape of 
        Circle (Point2 x y) r                        -> Circle (Point2 x y') r where
            y' = y + dy
        Rect (Point2 left top) (Point2 right bottom) -> Rect (Point2 left top') (Point2 right bottom') where
            top' = top + dy
            bottom' = bottom + dy
