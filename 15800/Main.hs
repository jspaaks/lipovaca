module Main (main) where

    import Data.Char (toUpper)

    main = do
        putStrLn "What's your first name?"
        firstName <- getLine
        putStrLn "What's your last name?"
        lastName <- getLine
        let firstNameWritLarge = map toUpper firstName
            lastNameWritLarge = map toUpper lastName
            msg = "Hello, " ++ firstNameWritLarge ++ " " ++ lastNameWritLarge ++ "!"
        putStrLn msg
