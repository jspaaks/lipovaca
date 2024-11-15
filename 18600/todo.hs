module Main (main) where

    import System.Environment (getArgs)

    import System.IO ( appendFile
                     , hClose
                     , hPutStr
                     , openTempFile
                     )

    import System.Directory ( removeFile
                            , renameFile
                            )

    import Control.Exception ( bracketOnError )

    main = do
        args <- getArgs
        case length args of
            0 -> putStrLn "Specify one of 'add', 'view', or 'remove' as a subcommand"
            _ -> dispatch (head args) (tail args)


    dispatch :: String -> [String] -> IO ()
    dispatch "add"    = add
    dispatch "view"   = view
    dispatch "remove" = remove
    dispatch _        = catchall


    add :: [String] -> IO ()
    add [filename, todoItem] = do
        appendFile filename (todoItem ++ "\n")
        putStrLn "Added a todo item"
    add _ = putStrLn "Subcommand 'add' requires a filename and a todo item as its sole two arguments"


    catchall :: [String] -> IO ()
    catchall _ = do
        let msg = "Expected subcommand to be one of 'add', 'view', or 'remove'"
        putStrLn msg


    remove :: [String] -> IO ()
    remove [filename, i] = do
        contents <- readFile filename
        let contents' = unlines $ deleteAt (i' - 1) items
            items = lines contents

            deleteAt :: Int -> [b] -> [b]
            deleteAt n xs = take n xs <> drop (n + 1) xs

            i' = read i

            try (tempName, tempHandle) = do
                hPutStr tempHandle contents'
                hClose tempHandle
                removeFile filename
                renameFile tempName filename
                putStrLn $ "Deleted item " <> i

            except (tempName, tempHandle) = do
                hClose tempHandle
                removeFile tempName

        bracketOnError (openTempFile "." filename) except try
    remove _ = putStrLn "Subcommand 'remove' requires a filename and a todo item's index as its sole two arguments"


    view :: [String] -> IO ()
    view [filename] = do
        let printNumbered :: [String] -> IO ()
            printNumbered items = putStr $ unlines $ zipWith f [1..] items where
                f a b = show a ++ " - " ++ b

        putStrLn "Your items are:"
        contents <- readFile filename
        printNumbered $ lines contents
    view _ = putStrLn "Subcommand 'view' requires a filename as its sole argument"

