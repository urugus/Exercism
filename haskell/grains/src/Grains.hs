module Grains (square, total) where

import Data.Maybe (mapMaybe)

squareLimit :: Integer
squareLimit = 64

square :: Integer -> Maybe Integer
square n
  | n >= 1 && n <= squareLimit = Just (2 ^ (n - 1))
  | otherwise = Nothing

total :: Integer
total = sum $ mapMaybe square [1 .. squareLimit]
