module Main (main) where

    import System.IO ( openFile
                     , hClose
                     , hGetContents
                     , IOMode (ReadMode)
                     )

    main = do
        handle <- openFile "girlfriend.txt" ReadMode
        contents <- hGetContents handle
        putStr contents
        hClose handle
