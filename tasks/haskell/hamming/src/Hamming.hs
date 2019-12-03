module Hamming (distance) where
import Data.Maybe

distance :: String -> String -> Maybe Int

distance xs ys = dist xs ys 0

dist :: String -> String -> Int -> Maybe Int

dist xs ys diff
        | length xs /= length ys = Nothing
	| length xs == 0 = Just diff
        | head xs /= head ys = dist (tail xs) (tail ys) (diff + 1)
	| otherwise = dist (tail xs) (tail ys) diff
