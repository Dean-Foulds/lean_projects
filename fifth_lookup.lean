-- fifth_lookup_fixed.lean
-- Safe fifth-element lookup with proof (Lean 4.28+)

open Std  -- opens the standard library

-- Function: lookup fifth element safely
def fifthElement {α : Type} (l : List α) (h : 5 ≤ l.length) : α :=
  -- index 4 (fifth element) as Fin l.length
  l.get ⟨4, Nat.lt_of_lt_of_le (by decide) h⟩

-- Example usage
def exampleList := [10, 20, 30, 40, 50, 60]

#eval fifthElement exampleList (by decide)  -- prints 50
