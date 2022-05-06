module RemoveTests (removeTests) where

import Test.HUnit (assertEqual, Test(TestLabel, TestCase))

import BST (remove, BST(..))
import MockTree (mockTree)

test_remove_removeLeaf :: Test
test_remove_removeLeaf = TestCase (assertEqual
  "Should remove the leaf node from the tree"
  (InternalNode 5 "Rengoku" Leaf Leaf)
  (BST.remove (InternalNode 5 "Rengoku" Leaf (InternalNode 6 "Tengen" Leaf Leaf)) 6)
  )

test_remove_removeRoot :: Test
test_remove_removeRoot = TestCase (assertEqual
  "Should remove the root and make the minimum node in the right sub-tree the new node"
  (InternalNode 7 "Billy" (InternalNode 3 "Bobby" Leaf Leaf) Leaf)
  (BST.remove (InternalNode 5 "Root" (InternalNode 3 "Bobby" Leaf Leaf) (InternalNode 7 "Billy" Leaf Leaf)) 5)
  )

test_remove_removeNonExistent :: Test
test_remove_removeNonExistent = TestCase (assertEqual
  "Should return the original tree"
  mockTree
  (BST.remove mockTree 99)
  )

test_remove_removeRootOnlyRightChild :: Test
test_remove_removeRootOnlyRightChild = TestCase (assertEqual
  "Should delete the root and make the right child the new root"
  (InternalNode 3 "Sculthorpe" Leaf Leaf)
  (BST.remove (InternalNode 4 "Neil" Leaf (InternalNode 3 "Sculthorpe" Leaf Leaf)) 4)
  )

test_remove_removeRootOnlyLeftChild :: Test
test_remove_removeRootOnlyLeftChild = TestCase (assertEqual
  "Should delete the root and make the left child the new root"
  (InternalNode 3 "Sculthorpe" Leaf Leaf)
  (BST.remove (InternalNode 4 "Neil" (InternalNode 3 "Sculthorpe" Leaf Leaf) Leaf) 4)
  )

removeTests :: [Test]
removeTests = 
  [
    TestLabel "Removing the leaf node from a tree" test_remove_removeLeaf,
    TestLabel "Removing the root node from a tree" test_remove_removeRoot,
    TestLabel "Removing the root and making the right child the new root" test_remove_removeRootOnlyRightChild,
    TestLabel "Removing the root and making the left child the new root" test_remove_removeRootOnlyLeftChild
  ]
