module Lambda where

data Term v
  = Variable v
  | Abstraction v (Term v)
  | Application (Term v) (Term v)
  deriving (Eq, Ord, Show, Read)
