# Haskell Lazy Evaluation Bug

This repository demonstrates a subtle bug in Haskell code that arises from the interaction of lazy evaluation and infinite lists. The `intersect` function from `Data.List`, when used with infinite lists, can lead to non-termination if the common elements are not found early. 

## Bug Description

The `findCommon` function attempts to find the first common element between two lists.  The problem occurs when both lists are infinite. Even if a common element exists, the `intersect` function might never return it, resulting in infinite execution. This happens because Haskell only evaluates as much as it needs to, and in this scenario, it gets stuck evaluating increasingly large parts of the lists without ever finding the intersection.