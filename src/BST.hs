module BST (BST (..), lookup) where

import Prelude hiding (lookup)

data BST item = InternalNode Int item (BST item) (BST item) 
              | Leaf

lookup :: Int -> BST item -> Maybe item
lookup soughtKey Leaf = Nothing
lookup soughtKey (InternalNode key item leftChild rightChild)
  | soughtKey > key = lookup soughtKey rightChild
  | soughtKey < key = lookup soughtKey leftChild
  | otherwise       = Just item
