The solution involves forcing evaluation to a finite portion of the infinite lists. We can achieve this by using a function like `take` to restrict the number of elements considered:

```haskell
import Data.List (intersect)

findCommon :: Int -> [Int] -> [Int] -> Maybe Int
findCommon n xs ys = listToMaybe (xs' `intersect` ys')
  where
    xs' = take n xs
    ys' = take n ys

main :: IO ()
main = do
  let xs = [1..]
  let ys = [1000000..]
  print (findCommon 1000000 xs ys) -- Now it works, but might miss it if n is too small
```

This improved version takes a parameter `n`, which sets the upper limit of the elements to consider from both lists.  Now, `intersect` will only work on finite prefixes, resolving the non-termination issue. The value of `n` should be chosen carefully, depending on the expected location of the common elements.