{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

module BST (BST(..), lookup, insert, displayTree, emptyBST, remove) where

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
  | newKey > key  = InternalNode key item leftChild (insert rightChild (newKey, newItem))
  | newKey < key  = InternalNode key item (insert rightChild (newKey, newItem)) rightChild

emptyBST :: BST
emptyBST = Leaf

displayTree :: BST -> [String]
displayTree Leaf = []
displayTree (InternalNode key item leftChild rightChild) =
  displayTree leftChild ++ [item] ++ displayTree rightChild

remove :: BST -> Int -> BST
remove Leaf _ = Leaf
remove (InternalNode key item leftChild rightChild) soughtKey
  | key == soughtKey = removeRec(InternalNode key item leftChild rightChild)
  | key > soughtKey  = InternalNode key item (remove leftChild soughtKey) rightChild
  | key < soughtKey  = InternalNode key item leftChild (remove rightChild soughtKey)

removeRec :: BST -> BST
removeRec (InternalNode key item Leaf Leaf) = Leaf
removeRec (InternalNode key item Leaf rightChild) = rightChild
removeRec (InternalNode key item leftChild Leaf) = leftChild
removeRec (InternalNode key item leftChild rightChild) =
  InternalNode newKey newItem leftChild Leaf
    where (newKey, newItem) = minimumNode rightChild

minimumNode :: BST -> (Int, String)
minimumNode (InternalNode key item Leaf _) = (key, item)
minimumNode (InternalNode _ _ leftChild _) = minimumNode leftChild
