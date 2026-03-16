import Mathlib
-- rfl_theorems.lean
-- Demonstrating proofs using `rfl` in Lean 4

-- 1️ Addition
theorem add_example : 2 + 3 = 5 :=
  rfl  -- reflexivity works because 2 + 3 simplifies to 5

-- 2️ Subtraction
theorem sub_example : 15 - 8 = 7 :=
  rfl  -- reflexivity works because 15 - 8 simplifies to 7

-- 3️ String append
theorem string_example : "Hello, ".append "world" = "Hello, world" :=
  rfl  -- Lean can compute string literals, so rfl works

-- 4️ Inequality
-- theorem lt_example : 5 < 18 :=
--   rfl  --  This will NOT work

/-
Why rfl fails for 5 < 18:

`rfl` only works when the **two sides of an equation are definitionally equal**,
i.e., they compute to the exact same value.

- `2 + 3 = 5` works because Lean can compute `2 + 3` to `5`.
- `5 < 18` is a proposition (`Prop`) about an ordering.
  It is **not definitionally equal to `True`**, so `rfl` cannot prove it.
  You would need a different proof tactic, e.g., `norm_num`:

    example : 5 < 18 := by norm_num
-/
def main : IO Unit := do
  IO.println "All theorems in rfl_theorems.lean have been checked by Lean."
