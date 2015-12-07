module Main where

import Lambda

main :: IO ()
main = putStrLn . show $ Variable "x"
