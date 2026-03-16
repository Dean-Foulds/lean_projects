import Mathlib
-- decide_theorems.lean
-- Using `by decide` to prove equalities and inequalities

-- 1️ Addition
theorem add_example : 2 + 3 = 5 := by decide

-- 2️ Subtraction
theorem sub_example : 15 - 8 = 7 := by decide

-- 3️3 String append
theorem string_example : "Hello, ".append "world" = "Hello, world" := by decide

-- 4️4 Inequality
theorem lt_example : 5 < 18 := by decide

-- Optional: add a main to print confirmation
def main : IO Unit := do
  IO.println "All theorems using `by decide` have been verified by Lean!"

#eval main
