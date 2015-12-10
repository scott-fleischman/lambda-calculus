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

  _ <- putStrLn $ "Size: " ++ (show . getSize $ term)
  _ <- putStrLn ""

  let freeVariables = getFreeVariables term
  _ <- printSeparateLines "free variables" freeVariables

  let redexes = getRedexes term
  _ <- printSeparateLines "redexes" redexes
  return ()

printSeparateLines :: (Show a, Foldable t) => String -> t a -> IO ()
printSeparateLines s xs = do
  _ <- putStrLn ((show . length $ xs) ++ " " ++ s ++ ":")
  _ <- mapM_ (putStrLn . (++ "\n") . show) xs
  return ()

parseTerm :: String -> Term String
parseTerm = read
