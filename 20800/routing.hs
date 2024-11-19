module Main (main) where

    import System.Environment ( getArgs
                              , getProgName
                              )

    import System.IO ( readFile
                     )

    data Section = Section Int Int Int deriving (Read, Show)

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


    main = do
        program <- getProgName
        args <- getArgs
        if null args
            then do
                putStrLn $ "Usage: " <> program <> " FILENAME"
                putStrLn "   Print optimal route given a system of two parallel roads."
            else do
                let filename = head args
                contents <- readFile filename

                let (route, duration) = selectQuickest $ accumulate $ subRouteChoices network

                    network = mkSection $ map read $ lines contents

                    mkSection :: [Int] -> [Section]
                    mkSection [] = []
                    mkSection (a:b:c:rest) = Section a b c : mkSection rest
                    mkSection _ = error "Expected input length to be a multiple of 3, aborting."

                printSteps route
                putStrLn $ "This route takes " <> show duration <> " minutes."


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


    printSteps :: Route -> IO ()
    printSteps route = putStr $ unlines $ zipWith f as bs where
        f a b = show a <> ". " <> b
        as = [1..]
        bs = map show route
