module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isUpper)

responseFor :: String -> String
responseFor input
  | null trimmed = "Fine. Be that way!"
  | isClaim && isQuestion = "Calm down, I know what I'm doing!"
  | isQuestion = "Sure."
  | isClaim = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    trimmed = filter (not . isSpace) input
    isQuestion = last trimmed == '?'
    isClaim = all isUpper (filter isAlpha trimmed) && any isAlpha trimmed
