```haskell
import qualified Data.Map as Map

data Key = Key { getKey :: Int -> Int }

instance Eq Key where
  (Key k1) == (Key k2) = k1 1 == k2 1 && k1 2 == k2 2 && k1 3 == k2 3 --Compare at multiple inputs or use a better approach

instance Ord Key where
  compare (Key k1) (Key k2) = compare (k1 1, k1 2, k1 3) (k2 1, k2 2, k2 3) --Compare at multiple inputs or use a better approach

calculate :: Key -> Integer
calculate key =
  let
    cachedResult = Map.lookup key cache
  in
  case cachedResult of
    Just result -> result
    Nothing -> let
               result = expensiveCalculation key
               in
               Map.insert key result cache >>= \newCache -> return result
               
  where
    expensiveCalculation :: Key -> Integer
    expensiveCalculation key = sum [1..1000000]

    cache :: Map.Map Key Integer
    cache = Map.empty
```