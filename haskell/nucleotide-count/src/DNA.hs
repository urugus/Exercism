module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map)
import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

charToNucleotide :: Char -> Maybe Nucleotide
charToNucleotide 'A' = Just A
charToNucleotide 'C' = Just C
charToNucleotide 'G' = Just G
charToNucleotide 'T' = Just T
charToNucleotide _ = Nothing

maybeToEither :: Maybe a -> Either String a
maybeToEither (Just x) = Right x
maybeToEither Nothing = Left "error"

emptyCounts :: Map Nucleotide Int
emptyCounts = Map.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

updateCount :: Map Nucleotide Int -> Nucleotide -> Map Nucleotide Int
updateCount counts nucleotide = Map.insertWith (+) nucleotide 1 counts

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs =
  case maybeToEither (traverse charToNucleotide xs) of
    Left err -> Left err
    Right counts -> Right (foldl updateCount emptyCounts counts)
