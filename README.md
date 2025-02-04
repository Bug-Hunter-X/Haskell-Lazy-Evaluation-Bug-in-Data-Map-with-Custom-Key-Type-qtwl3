# Haskell Lazy Evaluation Bug in Data.Map

This repository demonstrates a subtle bug in Haskell code that arises from the interaction between lazy evaluation and the `Data.Map` data structure when using a custom key type with a potentially flawed equality instance. The `Key` type uses a function, which needs a proper `Eq` and `Ord` instance to prevent unexpected caching issues.

## Problem Description

The `calculate` function attempts to cache results using `Data.Map`. However, if the equality function for the `Key` type is incomplete, it may compare keys incompletely, leading to incorrect caching and redundant computations. The comparison function only compares the results of the function at input 1, not for all inputs. Therefore, two different functions which have the same value at 1 are considered the same key, causing inaccurate caching.

## Solution

The solution involves defining a proper `Eq` and `Ord` instance that provide proper comparison that can distinguish keys reliably.  This ensures that the `Data.Map` functions correctly.  This usually involves comparing the result of the function for all relevant inputs. If that's not feasible, a better approach would be to redesign the data structure to avoid comparing functions directly.
