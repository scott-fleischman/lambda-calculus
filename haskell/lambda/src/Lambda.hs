module Lambda where

data Term v
  = Var v
  | Lam v (Term v)
  | Ap (Term v) (Term v)
  deriving (Eq, Ord, Show, Read)
