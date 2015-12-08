module Lambda where

data Term v
  = Var v
  | Lam v (Term v)
  | App (Term v) (Term v)
  deriving (Eq, Ord, Show, Read)

getRedexes :: Term v -> [Term v]
getRedexes t@(App t1@(Lam _ _) t2) = t : getRedexes t1 ++ getRedexes t2
getRedexes (App t1 t2) = getRedexes t1 ++ getRedexes t2
getRedexes (Lam _ t) = getRedexes t
getRedexes (Var _) = []
