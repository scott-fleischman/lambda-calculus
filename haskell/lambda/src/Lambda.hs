module Lambda where

import qualified Data.Set as Set

data Term v
  = Var v
  | Lam v (Term v)
  | Term v :@ Term v
  deriving (Eq, Ord, Show, Read)

getRedexes :: Term v -> [Term v]
getRedexes t@(t1@(Lam _ _) :@ t2) = t : getRedexes t1 ++ getRedexes t2
getRedexes (t1 :@ t2) = getRedexes t1 ++ getRedexes t2
getRedexes (Lam _ t) = getRedexes t
getRedexes (Var _) = []

getFreeVariables :: Ord v => Term v -> Set.Set v
getFreeVariables (Var v) = Set.singleton v
getFreeVariables (Lam v t) = getFreeVariables t `Set.difference` Set.singleton v
getFreeVariables (t1 :@ t2) = getFreeVariables t1 `Set.union` getFreeVariables t2

getSize :: Term v -> Int
getSize (Var _) = 1
getSize (Lam _ t) = 1 + getSize t
getSize (t1 :@ t2) = 1 + getSize t1 + getSize t2
