{-# LANGUAGE TemplateHaskell #-}

import Test.Framework.TH
import Test.Framework.Providers.QuickCheck2
import Test.QuickCheck
import Lambda

instance (Arbitrary v) => Arbitrary (Term v) where
  arbitrary = do
    n <- choose (0, 2) :: Gen Int
    case n of
      0 -> do
        v <- arbitrary
        return $ Var v
      1 -> do
        v <- arbitrary
        t <- arbitrary
        return $ Lam v t
      2 -> do
        t1 <- arbitrary
        t2 <- arbitrary
        return $ t1 :@ t2

prop_freeVariableSizeLessThanEqualSize :: Term String -> Bool
prop_freeVariableSizeLessThanEqualSize t = (length . getFreeVariables) t <= getSize t

main :: IO ()
main = $defaultMainGenerator
