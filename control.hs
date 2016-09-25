import Control.Parallel

--Guard case showing different paths and a catch-all at the end.
describeInt :: Int -> String
describeInt a
 | a == 0 = "This is a zero"
 | a > 0 = "This is a positive integer"
 | otherwise = "This is a negative integer" --Otherwise == True and used as a catch-all at the end.
 
 -- Similar to guards, Haskell's version of a switch statement.
caseExample :: [Char] -> [Char]
caseExample color =
 case color of
  "Blue" -> "The best color!"
  "Black" -> "Too dark for me."
  "White" -> "A perfect blend."
  _ -> "An unknown color to me." --catch-all if none pass
  
--Patterns fall through as they fail until one passes, can be called recursively
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)
 
--Same as factorial for parallel example
evensSquared x = [a^2 | a <- [0..x], a `mod` 2 == 0]
 
--Multi threaded main function splits up the tasks into 4 parts(a,b,c,d) and a case statement at the end.
main = a `par` b `par` c`par` d `par`
 do
  putStrLn $"Factorial of 12: " ++ show (a) ++ " Evens from 0 to 6 squared" ++ show (b)
  putStrLn $"Describing 12: " ++ show (c)
  putStrLn $"Describing -4: " ++ show (d)
  putStrLn $"Blue is: " ++ caseExample ("Blue") ++ " But Red is: " ++ caseExample("Red")
  --Showing that Haskell waits on functions until it's aware of what its for.
  where
   a = factorial 12
   b = evensSquared 6
   c = describeInt (12)
   d = describeInt (-4)
