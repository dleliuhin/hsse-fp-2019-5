module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
    if length xs /= length ys then Nothing
    else if null xs || null ys then Just 0
    else Just (length (filter id (zipWith (/=) xs ys)))

