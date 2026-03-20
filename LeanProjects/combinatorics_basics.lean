import Mathlib

-- Sum of first n natural numbers
theorem sum_range (n : ℕ) : 2 * ∑ i ∈ Finset.range (n + 1), i = n * (n + 1) := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ]
    ring_nf
    linarith

-- A finite set has non-negative cardinality
theorem card_nonneg' (s : Finset ℕ) : 0 ≤ s.card := Nat.zero_le s.card

-- Empty set has cardinality zero
theorem empty_card : (∅ : Finset ℕ).card = 0 := Finset.card_empty
