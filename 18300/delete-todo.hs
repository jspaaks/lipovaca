module Main (main) where

    import Control.Exception ( bracketOnError )

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

            filename = "todo.txt"

        putStrLn "Your items are:"
        contents <- readFile filename
        let items = lines contents
        printNumbered items

        putStrLn "Which item do you want to delete?"
        input <- getLine
        let contents' = unlines $ deleteAt (i - 1) items

            deleteAt :: Int -> [b] -> [b]
            deleteAt n xs = take n xs <> drop (n + 1) xs

            i = read input

            try (tempName, tempHandle) = do
                putStrLn "trying"
                error "simulated error"
                hPutStr tempHandle contents'
                hClose tempHandle
                removeFile filename
                renameFile tempName filename

            except (tempName, tempHandle) = do
                putStrLn "excepting"
                -- putStrLn "excepting (noop)"
                hClose tempHandle
                removeFile tempName


        bracketOnError (openTempFile "." filename) except try

        return ()
