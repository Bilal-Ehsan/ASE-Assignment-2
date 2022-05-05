{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

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
insert Leaf (key, item) = InternalNode key item Leaf Leaf
insert (InternalNode key item leftChild rightChild) (newKey, newItem)
  | newKey == key = InternalNode newKey newItem leftChild rightChild  -- Updates in place 
  | newKey > key = InternalNode key item leftChild (insert rightChild (newKey, newItem))
  | newKey < key = InternalNode key item (insert rightChild (newKey, newItem)) rightChild
