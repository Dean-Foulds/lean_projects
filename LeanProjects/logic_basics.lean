import Mathlib

-- Modus ponens
theorem modus_ponens (P Q : Prop) (hp : P) (hpq : P → Q) : Q := hpq hp

-- Double negation elimination
theorem double_neg (P : Prop) (h : ¬¬P) : P := by exact Classical.byContradiction (fun hn => h hn)

-- De Morgan's law
theorem de_morgan (P Q : Prop) (h : ¬(P ∨ Q)) : ¬P ∧ ¬Q := by
  constructor
  · intro hp; exact h (Or.inl hp)
  · intro hq; exact h (Or.inr hq)

-- Conjunction is commutative
theorem and_comm' (P Q : Prop) (h : P ∧ Q) : Q ∧ P := ⟨h.2, h.1⟩
