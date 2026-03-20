import Mathlib

-- The absolute value is always non-negative
theorem abs_nonneg' (x : ℝ) : 0 ≤ |x| := abs_nonneg x

-- The square of a real number is non-negative
theorem sq_nonneg' (x : ℝ) : 0 ≤ x ^ 2 := sq_nonneg x

-- Triangle inequality
theorem triangle_ineq (a b : ℝ) : |a + b| ≤ |a| + |b| := abs_add a b

-- If x > 0 then x ≠ 0
theorem pos_ne_zero (x : ℝ) (h : 0 < x) : x ≠ 0 := ne_of_gt h
