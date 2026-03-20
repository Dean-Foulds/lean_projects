import Mathlib

-- ============================================================
-- Volatility Spike Detection – Formal Proofs
-- Relates to Aircraft Parts Volatility Index (APVI) model
-- ============================================================

-- A spike occurs when a value exceeds mean + k standard deviations
def is_spike (v μ σ k : ℝ) : Prop := v > μ + k * σ

-- Raising the threshold k makes spikes harder to trigger
theorem spike_monotone_k (v μ σ k₁ k₂ : ℝ)
    (hσ : 0 < σ) (hk : k₁ < k₂)
    (h : is_spike v μ σ k₂) : is_spike v μ σ k₁ := by
  unfold is_spike at *
  linarith [mul_lt_mul_of_pos_right hk hσ]

-- Realized volatility (std dev) is always non-negative
theorem realized_vol_nonneg (n : ℕ) (returns : Fin n → ℝ) :
    0 ≤ Real.sqrt (∑ i, (returns i) ^ 2 / n) := Real.sqrt_nonneg _

-- APVI (average of two volatility measures) is non-negative
theorem apvi_nonneg (equity_vol ppi_vol : ℝ)
    (h1 : 0 ≤ equity_vol) (h2 : 0 ≤ ppi_vol) :
    0 ≤ (equity_vol + ppi_vol) / 2 := by linarith

-- APVI is bounded above by the maximum of its two components
theorem apvi_le_max (equity_vol ppi_vol : ℝ) :
    (equity_vol + ppi_vol) / 2 ≤ max equity_vol ppi_vol := by
  simp [max_def]
  split_ifs with h
  · linarith
  · linarith

-- If both components spike, the composite APVI spikes
theorem apvi_spike (eq_vol ppi_vol μ_eq μ_ppi σ_eq σ_ppi k : ℝ)
    (h1 : is_spike eq_vol μ_eq σ_eq k)
    (h2 : is_spike ppi_vol μ_ppi σ_ppi k) :
    (eq_vol + ppi_vol) / 2 > (μ_eq + μ_ppi) / 2 + k * (σ_eq + σ_ppi) / 2 := by
  unfold is_spike at *
  linarith

-- Rolling mean is bounded above by the maximum value in the window
theorem mean_bounded_by_max (n : ℕ) (v : Fin (n + 1) → ℝ) (M : ℝ)
    (hM : ∀ i, v i ≤ M) :
    (∑ i : Fin (n + 1), v i) / (↑(n + 1) : ℝ) ≤ M := by
  have hpos : (0 : ℝ) < ↑(n + 1) := by positivity
  rw [div_le_iff₀ hpos]
  calc ∑ i : Fin (n + 1), v i
      ≤ ∑ _i : Fin (n + 1), M := Finset.sum_le_sum (fun i _ => hM i)
    _ = ↑(n + 1) * M := by simp [Finset.sum_const]
    _ = M * ↑(n + 1) := by ring
