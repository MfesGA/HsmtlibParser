module Smtlib.Syntax.ShowSL where

import Data.List 
import Smtlib.Syntax.Syntax

class ShowSL a where
  showSL :: a -> String

instance ShowSL Command where
  showSL (SetLogic s) = "(set-logic " ++ s ++ ")"
  showSL (SetOption opt) = "(set-option " ++ showSL opt ++ ")"
  showSL (SetInfo info) = "(set-info " ++ showSL info ++ ")"
  showSL (DeclareSort str val) = 
    "(declare-sort " ++ str ++ " " ++ show val ++ ")"
  showSL (DefineSort str strs sort) = "(define-sort " ++ str ++ " ( " ++
      joinA sort ++ " ) " ++ showSL sort ++ ") "
    where joinA x = (intercalate " ").fmap showSL x

{-
  SetLogic s = "(set-logic " ++ showSL s ++ ")"
  SetOption opt =  "(set-option " ++ showSL opt ++ ")"
  SetInfo info = "(set-info " ++ showSL info ++ ")"
  DeclareSort str val = 
    "(declare-sort " ++ showSL str ++ " " ++ showSL val ++")"
  DefineSort str vals sort = 
    "(define-sort " ++  str ++ " ( " ++ joinA vals ++ " )" ++ 
      showSL sort ++ ")"
  DeclareFun str sorts sort = 
    "(declare-fun " ++ str ++ " ( " ++ joinA sorts ++ " )" ++
      showSl sort ++ ")" 
  DefineFun str srvs sort term = 
    "(define-fun " ++ str ++ " ( " ++ joinA srvs ++ " ) " ++ 
      showSL sort ++ " " ++  showSL term ++ ")"
  Push n = "(push " ++ show n ++ ")"
  Pop n = "(pop " ++ show n ++ ")"
  Assert term = "(assert " ++ showSL term ++ ")"
  CheckSat = "(check-sat)"
  GetAssertions = "(get-assertions)"
  GetProof = "(get-proof)"
  GetUnsatCore = "(get-unsat-core)"
  GetValue terms = "( (" ++ joinA terms ++ ") )"
  GetAssignment =  "(get-assignment)"
  GetOption opt = "(get-option " ++ opt ++ ")"
  GetInfo info = "(get-info " ++ showSL info ++ " )"
  Exit = "(exit)"
  where joinA x = (intercalate " ").fmap showSL x
-}