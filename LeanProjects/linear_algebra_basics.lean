import Mathlib

-- Vector addition is commutative
theorem vec_add_comm (u v : Fin 3 → ℝ) : u + v = v + u := by
  funext i; ring

-- Scalar multiplication distributes over addition
theorem smul_add' (a : ℝ) (u v : Fin 3 → ℝ) : a • (u + v) = a • u + a • v := by
  funext i; simp [Pi.smul_apply, Pi.add_apply]; ring

-- Zero vector is the additive identity
theorem zero_add_vec (v : Fin 3 → ℝ) : 0 + v = v := by
  funext i; simp
