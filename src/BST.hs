module BST (BST(..), lookup, insert) where

import Prelude hiding (lookup)

data BST = InternalNode Int String BST BST
         | Leaf
           deriving (Eq, Show)

lookup :: Int -> BST -> Maybe String
lookup soughtKey Leaf = Nothing
lookup soughtKey (InternalNode key item leftChild rightChild)
  | soughtKey > key = lookup soughtKey rightChild
  | soughtKey < key = lookup soughtKey leftChild
  | otherwise       = Just item

insert :: BST -> (Int, String) -> BST
insert = undefined


