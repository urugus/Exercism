module DNA (toRNA) where

nucleotideToRNA :: Char -> Either Char Char
nucleotideToRNA n
  | n == 'G' = Right 'C'
  | n == 'C' = Right 'G'
  | n == 'T' = Right 'A'
  | n == 'A' = Right 'U'
  | otherwise = Left n

toRNA :: String -> Either Char String
toRNA = traverse nucleotideToRNA
