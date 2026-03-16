import Mathlib
import Init.Data.Rat

/-
First random proposition test
-/

def rat_abs (r : Rat) : Rat :=
  if r ≥ 0 then r else -r

def seq_converges_to ( a : ℕ → Rat ) (L : Rat) : Prop :=
  ∀ ε > 0, ∃ N, ∀ n > N, rat_abs (a n - L) < ε

theorem squeeze_theorem (a b c : ℕ → Rat) (L : Rat) :
  (∀ n, a n ≤ b n ∧ b n ≤ c n) →
  seq_converges_to a L →
  seq_converges_to c L →
  seq_converges_to b L := by
  sorry
