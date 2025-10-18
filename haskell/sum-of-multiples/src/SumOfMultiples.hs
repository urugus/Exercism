module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

multiplesUpTo :: Integer -> Integer -> [Integer]
multiplesUpTo limit factor = [x * factor | x <- [1 .. limit], x * factor < limit]

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ nub $ concatMap (multiplesUpTo limit) factors
