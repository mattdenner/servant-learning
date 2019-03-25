module Main where

import Lib

main :: IO ()
main = do
  putStrLn "Starting server ..."
  startApp 8080
