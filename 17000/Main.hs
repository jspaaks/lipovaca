module Main ( isPalindrome
            , main
            , main1
            , main2
            , main3
            , main4
            , main5
            , respondPalindrome
            , shortLinesOnly
            ) where

    import Control.Monad (forever)
    import Data.Char (toUpper)

    main1 = forever $ do
        putStrLn "main1"
        line <- getLine
        putStrLn $ map toUpper line

    main2 = do
        putStrLn "main2"
        contents <- getContents
        putStrLn $ map toUpper contents

    main3 = do
        putStrLn "main3"
        contents <- getContents
        putStrLn $ shortLinesOnly contents

    main4 = do
        putStrLn "main4"
        interact shortLinesOnly

    main5 = do
        putStrLn "main5"
        interact respondPalindrome

    main = main5


    shortLinesOnly :: [Char] -> [Char]
    shortLinesOnly = unlines . filter pred . lines where
        pred x = length x < 10


    respondPalindrome :: [Char] -> [Char]
    respondPalindrome = unlines . map respond . lines where
        respond line
            | isPalindrome line = "palindrome"
            | otherwise         = "not a palindrome"


    isPalindrome :: Eq a => [a] -> Bool
    isPalindrome xs = all id $ zipWith (==) as bs where
        as = take n $ xs
        bs = take n $ reverse xs
        n = length xs `div` 2
