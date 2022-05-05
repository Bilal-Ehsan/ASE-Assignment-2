module InsertTests (insertTests) where

import Test.HUnit (assertEqual, Test(TestLabel, TestCase))

import BST (insert, BST(..))

test_insert_insertIntoEmptyTree :: Test
test_insert_insertIntoEmptyTree = TestCase (assertEqual
  "Should create a new tree with the given node as the root node"
  (InternalNode 1 "Garry" Leaf Leaf)
  (BST.insert (InternalNode 1 "Garry" Leaf Leaf) (1, "Garry"))
  )

insertTests :: [Test]
insertTests = 
  [
    TestLabel "Inserting into an empty tree" test_insert_insertIntoEmptyTree
  ]
