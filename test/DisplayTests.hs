module DisplayTests (displayTests) where

import Test.HUnit (assertEqual, Test(TestLabel, TestCase))

import BST (displayTree, emptyBST, BST(..))

test_display_displayEmpty :: Test
test_display_displayEmpty = TestCase (assertEqual
  "Should return an empty list"
  []
  (BST.displayTree BST.emptyBST)
  )

test_display_displayInOrder :: Test
test_display_displayInOrder = TestCase (assertEqual
  "Should return a list of values in an in-order fashion"
  ["Erwin", "Levi", "Hange"]
  (BST.displayTree (InternalNode 5 "Levi" (InternalNode 3 "Erwin" Leaf Leaf) (InternalNode 7 "Hange" Leaf Leaf)))
  )

displayTests :: [Test]
displayTests = 
  [
    TestLabel "Display an empty tree" test_display_displayEmpty,
    TestLabel "Display a normal tree" test_display_displayInOrder
  ]
