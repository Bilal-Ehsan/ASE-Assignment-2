module InsertTests (insertTests) where

import Test.HUnit (assertEqual, Test(TestLabel, TestCase))

import BST (insert, BST(..))

test_insert_insertIntoEmptyTree :: Test
test_insert_insertIntoEmptyTree = TestCase (assertEqual
  "Should create a new tree with the given node as the root node"
  (InternalNode 1 "Garry" Leaf Leaf)
  (BST.insert Leaf (1, "Garry"))
  )

test_insert_replaceExistingNodeValue :: Test
test_insert_replaceExistingNodeValue = TestCase (assertEqual
  "Should update the node where the key matches with the new value"
  (InternalNode 1 "Historia" (InternalNode 2 "Bob" Leaf Leaf) Leaf)
  (BST.insert (InternalNode 1 "Christa" (InternalNode 2 "Bob" Leaf Leaf) Leaf) (1, "Historia"))
  )

test_insert_insertBiggerValue :: Test
test_insert_insertBiggerValue = TestCase (assertEqual
  "Should insert a node to the right child of the root"
  (InternalNode 1 "Eren" Leaf (InternalNode 2 "Mikasa" Leaf Leaf))
  (BST.insert (InternalNode 1 "Eren" Leaf Leaf) (2, "Mikasa"))
  )

test_insert_insertSmallerValue :: Test
test_insert_insertSmallerValue = TestCase (assertEqual
  "Should insert a node to the left child of the root"
  (InternalNode 2 "Eren" (InternalNode 1 "Mikasa" Leaf Leaf) Leaf)
  (BST.insert (InternalNode 2 "Eren" Leaf Leaf) (1, "Mikasa"))
  )

insertTests :: [Test]
insertTests = 
  [
    TestLabel "Inserting into an empty tree" test_insert_replaceExistingNodeValue,
    TestLabel "Replacing the value of an existing node" test_insert_replaceExistingNodeValue,
    TestLabel "Add node to right side" test_insert_insertBiggerValue,
    TestLabel "Add node to left side" test_insert_insertSmallerValue
  ]
