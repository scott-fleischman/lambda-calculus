module Main where

import Lambda

main :: IO ()
main = do
  _ <- putStrLn "Enter term"
  input <- getContents
  let term = parseTerm input
  _ <- putStrLn (seq term "Parsed term:")
  _ <- putStrLn . show $ term
  _ <- putStrLn ""
  let redexes = getRedexes term
  _ <- putStrLn ((show . length $ redexes) ++ " redexes:")
  _ <- mapM_ (putStrLn . (++ "\n") . show) redexes
  return ()

parseTerm :: String -> Term String
parseTerm = read
