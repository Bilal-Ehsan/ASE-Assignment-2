module MockTree where

import BST (BST(..))

mockTree :: BST
mockTree = InternalNode 5 "Sarah" 
           (InternalNode 3 "Bob" Leaf (InternalNode 4 "Vanessa" Leaf Leaf)) 
           (InternalNode 7 "Kevin" Leaf (InternalNode 9 "Neil" Leaf Leaf))
