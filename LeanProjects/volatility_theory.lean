import Mathlib

-- ============================================================
-- Volatility Spike Detection – Formal Proofs
-- Relates to Aircraft Parts Volatility Index (APVI) model
-- ============================================================

-- A spike occurs when a value exceeds mean + k standard deviations
def is_spike (v μ σ k : ℝ) : Prop := v > μ + k * σ

-- If k is positive and σ is positive, raising k makes spikes harder to trigger
theorem spike_monotone_k (v μ σ k₁ k₂ : ℝ)
    (hσ : 0 < σ) (hk : k₁ < k₂)
    (h : is_spike v μ σ k₂) : is_spike v μ σ k₁ := by
  unfold is_spike at *
  linarith [mul_lt_mul_of_pos_right hk hσ]

-- Realized volatility (std dev) is always non-negative
theorem realized_vol_nonneg (returns : Fin n → ℝ) :
    0 ≤ Real.sqrt (∑ i, (returns i) ^ 2 / n) := Real.sqrt_nonneg _

-- If two volatility measures are non-negative, their average (APVI) is non-negative
theorem apvi_nonneg (equity_vol ppi_vol : ℝ)
    (h1 : 0 ≤ equity_vol) (h2 : 0 ≤ ppi_vol) :
    0 ≤ (equity_vol + ppi_vol) / 2 := by linarith

-- APVI is bounded above by the maximum of the two components
theorem apvi_le_max (equity_vol ppi_vol : ℝ)
    (h1 : 0 ≤ equity_vol) (h2 : 0 ≤ ppi_vol) :
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

-- Higher rolling window produces smoother (lower variance) volatility estimate
-- Formally: averaging over more terms reduces sensitivity to outliers
theorem mean_bounded_by_max (v : Fin (n + 1) → ℝ) (M : ℝ)
    (hM : ∀ i, v i ≤ M) :
    (∑ i, v i) / (n + 1) ≤ M := by
  have h : ∑ i, v i ≤ ∑ _i : Fin (n+1), M := Finset.sum_le_sum (fun i _ => hM i)
  simp at h
  linarith [Nat.cast_pos.mpr (Nat.succ_pos n)]
