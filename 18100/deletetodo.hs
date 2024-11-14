module Main (main) where

    import System.IO ( getLine
                     , hClose
                     , hPutStr
                     , openTempFile
                     , readFile
                     )
    import System.Directory ( removeFile
                            , renameFile
                            )


    main = do
        let printNumbered :: [String] -> IO ()
            printNumbered items = putStrLn $ unlines $ zipWith f [1..] items where
                f a b = show a ++ " - " ++ b

            -- printNumbered :: [String] -> IO ()
            -- printNumbered items = mapM_ putStrLn $ zipWith f [1..] items where
            --     f a b = show a ++ " - " ++ b

            -- printNumbered :: [String] -> IO ()
            -- printNumbered items = sequence_ $ map putStrLn $ zipWith f [1..] items where
            --     f a b = show a ++ " - " ++ b

            deleteAt :: Int -> [b] -> [b]
            deleteAt n xs = take n xs <> drop (n + 1) xs

            filename = "todo.txt"

        putStrLn "Your items are:"
        contents <- readFile filename
        let items = lines contents
        printNumbered items

        putStrLn "Which item do you want to delete?"
        input <- getLine
        let contents' = unlines $ deleteAt (i - 1) items
            i = read input
        (tempName, tempHandle) <- openTempFile "." filename
        hPutStr tempHandle contents'
        hClose tempHandle
        removeFile filename
        renameFile tempName filename

        return ()

