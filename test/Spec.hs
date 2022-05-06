import Test.HUnit (Test(TestList), runTestTT)

import BST ()
import LookupTests (lookupTests)
import InsertTests (insertTests)
import DisplayTests (displayTests)
import RemoveTests (removeTests)

main :: IO ()
main = do
  runTestTT (TestList (lookupTests ++ insertTests ++ displayTests ++ removeTests))
  return ()
