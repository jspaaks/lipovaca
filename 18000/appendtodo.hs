module Main (main) where

    import System.IO ( appendFile
                     , getLine
                     )

    main = do
        todoItem <- getLine
        appendFile "todo.txt" (todoItem ++ "\n")
        
