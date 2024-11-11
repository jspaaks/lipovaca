module Main (main) where
    main = do
        putStrLn "Enter the text that you wanted printed in reverse:"
        line <- getLine
        let reversed = reverseWords line
        if length reversed > 0 then do
            putStrLn reversed
            main
        else do
            putStrLn "Quitting."
            return ()

    reverseWords = unwords . map reverse . words
