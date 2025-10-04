module Bob (responseFor) where

import Data.Char (isAlpha, isUpper)

responseFor :: String -> String
responseFor input
  | isClaim && isQuestion = "Calm down, I know what I'm doing!"
  | isQuestion = "Sure."
  | null input = "Fine. Be that way!"
  | isClaim = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    isQuestion = last input == '?'
    isClaim = all isUpper (filter isAlpha input)
