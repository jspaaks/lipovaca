module Vectors ( add
               , fromList
               , inner
               , scale
               , Vector (..)
               ) where

    data Vector a = Vector2 { x :: a
                            , y :: a
                            }
                  | Vector3 { x :: a
                            , y :: a
                            , z :: a
                            }
                  deriving (Show)


-- Vector addition
    add :: Num a => Vector a -> Vector a -> Vector a
    add (Vector2 {x = xa, y = ya})
        (Vector2 {x = xb, y = yb}) = Vector2 { x = xa + xb
                                             , y = ya + yb
                                             }
    add (Vector3 {x = xa, y = ya, z = za})
        (Vector3 {x = xb, y = yb, z = zb}) = Vector3 { x = xa + xb
                                                     , y = ya + yb
                                                     , z = za + zb
                                                     }
    add _ _ = error "Not implemented. Try adding two Vector2 instances or two Vector3 instances instead."


-- Vector scaling
    scale :: Num a => a -> Vector a -> Vector a
    scale factor (Vector2 x y)   = Vector2 { x = factor * x
                                           , y = factor * y
                                           }
    scale factor (Vector3 x y z) = Vector3 { x = factor * x
                                           , y = factor * y
                                           , z = factor * z
                                           }


-- Vector inner product
    inner :: Num a => Vector a -> Vector a -> a
    inner Vector2 { x = xa, y = ya } Vector2 { x = xb, y = yb } = sum $ zipWith (*) [xa, ya] [xb, yb]
    inner Vector3 { x = xa, y = ya, z = za } Vector3 { x = xb, y = yb, z = zb } = sum $ zipWith (*) [xa, ya, za] [xb, yb, zb]
    inner _ _ = error "Not implemented. Try calculating the inner product of two Vector2 instances or two Vector3 instances instead."

    
-- Construction of a Vector from a list
    fromList :: [a] -> Vector a
    fromList xs
        | ell == 2  = Vector2 {x = xs !! 0, y = xs !! 1}
        | ell == 3  = Vector3 {x = xs !! 0, y = xs !! 1, z = xs !! 2}
        | otherwise = error "Not implemented. Try creating a Vector from a list of length 2 or 3 instead."
        where ell = length xs
