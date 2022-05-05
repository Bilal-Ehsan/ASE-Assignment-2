import Test.HUnit (Test(TestList), runTestTT)

import BST ()
import LookupTests (lookupTests)
import InsertTests (insertTests)

main :: IO ()
main = do
  runTestTT (TestList (lookupTests ++ insertTests))
  return ()
