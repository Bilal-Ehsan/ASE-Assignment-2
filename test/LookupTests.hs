module LookupTests (lookupTests) where

import Test.HUnit (assertEqual, Test(TestLabel, TestCase))

import BST (lookup)
import MockTree (mockTree)

test_lookup_root :: Test
test_lookup_root = TestCase (assertEqual "Should return Sarah" (Just "Sarah") (BST.lookup 5 mockTree))

test_lookup_rightChild :: Test
test_lookup_rightChild = TestCase (assertEqual "Should return Kevin" (Just "Kevin") (BST.lookup 7 mockTree))

test_lookup_leftChild :: Test
test_lookup_leftChild = TestCase (assertEqual "Should return Bob" (Just "Bob") (BST.lookup 3 mockTree))

test_lookup_nonExistent :: Test
test_lookup_nonExistent = TestCase (assertEqual "Should return Nothing" Nothing (BST.lookup 99 mockTree))

test_lookup_innerChild :: Test
test_lookup_innerChild = TestCase (assertEqual "Should return Neil" (Just "Neil") (BST.lookup 9 mockTree))

lookupTests :: [Test]
lookupTests = 
  [
    TestLabel "Looking up the root node" test_lookup_root,
    TestLabel "Testing a recursive search to the right" test_lookup_rightChild,
    TestLabel "Testing a recursive search to the left" test_lookup_leftChild,
    TestLabel "Looking up a key that doesn't exist" test_lookup_nonExistent,
    TestLabel "Looking up an inner child" test_lookup_innerChild
  ]
