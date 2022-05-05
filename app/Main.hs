module Main where

import BST (displayTree, insert, BST(Leaf))

exampleTree :: BST
exampleTree = Leaf

main :: IO ()
main = do
  let tree_1 = BST.insert exampleTree (5, "Levi")
  let tree_2 = BST.insert tree_1 (3, "Erwin")
  let tree_3 = BST.insert tree_2 (7, "Hange")
  print (BST.displayTree tree_3)
