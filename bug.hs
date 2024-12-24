This Haskell code suffers from a subtle bug related to lazy evaluation and infinite lists:

```haskell
import Data.List (intersect)

findCommon :: [Int] -> [Int] -> Maybe Int
findCommon xs ys = listToMaybe (xs `intersect` ys)

main :: IO ()
main = do
  let xs = [1..]  -- Infinite list
  let ys = [1000000..] -- Another infinite list
  print (findCommon xs ys) -- This will hang indefinitely
```