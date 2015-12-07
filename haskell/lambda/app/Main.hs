module Main where

import Lambda

main :: IO ()
main = do
  _ <- putStrLn "Enter term"
  go
  where
    go = do
      input <- getLine
      if null input then
        return ()
      else
        do
          _ <- putStrLn . printTerm . parseTerm $ input
          go

parseTerm :: String -> Term String
parseTerm = read

printTerm :: Term String -> String
printTerm = show
