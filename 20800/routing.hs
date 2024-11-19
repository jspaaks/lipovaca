module Main (main) where

    data Section = Section Int Int Int deriving (Show)

    data Road = A | B deriving (Show)

    data FollowOrCross = Follow Road
                       | Cross
                       deriving (Show)

    type Route = [FollowOrCross]

    type Duration = Int

    data Choices = Choices { aa :: (Route, Duration)
                           , ab :: (Route, Duration)
                           , ba :: (Route, Duration)
                           , bb :: (Route, Duration)
                           } deriving (Show)


    main = steps $ selectQuickest $ accumulate $ subRouteChoices heathrowToLondon

    heathrowToLondon :: [Section]
    heathrowToLondon = [ Section 50 10 30
                       , Section 5 90 20
                       , Section 40 2 25
                       , Section 10 8 0
                       ]


    subRouteChoices :: [Section] -> [Choices]
    subRouteChoices = map f where
        f (Section a b cross) = Choices { aa = ([Follow A], a)
                                        , ab = ([Follow A, Cross], a + cross)
                                        , ba = ([Follow B, Cross], b + cross)
                                        , bb = ([Follow B], b)
                                        }


    accumulate :: [Choices] -> ((Route, Duration), (Route, Duration))
    accumulate = foldl f start where
        f acc@(a,b) item@(Choices { aa
                                  , ab
                                  , ba
                                  , bb
                                  }) = acc' where

            acc' = ( update a b aa ba
                   , update a b ab bb
                   )

            update :: (Route, Duration) -> (Route, Duration) -> (Route, Duration) -> (Route, Duration) -> (Route, Duration)
            update (ra,da) (rb,db) (rac,dac) (rbc,dbc)
                | da + dac <= db + dbc = (ra <> rac, da + dac)
                | otherwise            = (rb <> rbc, db + dbc)

        start = (([],0), ([],0))


    selectQuickest :: ((Route, Duration), (Route, Duration)) -> (Route, Duration)
    selectQuickest ((ra, da), (rb,db))
        | da < db = (ra,da)
        | da == db && length ra <= length rb = (ra, da)
        | da == db && length ra > length rb = (rb, db)
        | da > db = (rb,db)


    steps :: (Route, Duration) -> IO ()
    steps (route,duration) = putStr $ unlines $ zipWith f as bs where
        f a b = show a <> ". " <> b
        as = [1..]
        bs = map show route
