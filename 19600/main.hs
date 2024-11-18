module Main (main) where

    import Control.Monad ( unless )

    import System.IO ( getLine
                     , putStrLn )

    import System.Random ( randomR
                         , getStdGen
                         , StdGen
                         )

    main = do
        gen <- getStdGen
        askUserForGuess gen


    askUserForGuess :: StdGen -> IO ()
    askUserForGuess gen = do
        let lower = 1
            upper = 5
            msg = "What number [" <> show lower <> ".." <> show upper <> "] am I thinking of?" 
        putStrLn msg
        line <- getLine
        unless (null line) $ do
            let (actual :: Int, gen') = randomR (lower,upper) gen
                guessed = read line

            if guessed == actual
                then putStrLn "You got it!"
                else putStrLn $ "Nope, it was " <> show actual

            askUserForGuess gen'
