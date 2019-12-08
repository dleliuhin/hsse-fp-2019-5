module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys = distance' xs ys 0
		where 
        distance' [] [] a = Just a
        distance' xs [] _ = Nothing
        distance' [] ys _ = Nothing 
        distance' (h1:t1) (h2:t2) a | h1 /= h2 = distance' t1 t2 (a + 1)
                                  | otherwise = distance' t1 t2 a