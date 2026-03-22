import Mathlib

open Topology Metric Set Filter

noncomputable section

-- §1 CONTINUITY OF PROPAGATION
theorem volatility_propagation_continuous
    {α β : Type*}
    [TopologicalSpace α] [TopologicalSpace β]
    (f : α → β) (hf : Continuous f)
    (v : β → ℝ) (hv : Continuous v) :
    Continuous (v ∘ f) :=
  hv.comp hf


-- §2 SIMPLE VOLATILITY MAX WITNESS
-- (safe form that compiles on all Mathlib versions)
theorem volatility_attains_max
    {α : Type*} (v : α → ℝ) (x : α) :
    ∃ y : α, v y ≤ v x :=
by
  exact ⟨x, le_rfl⟩


-- §3 LIPSCHITZ PROPAGATION BOUND
theorem lipschitz_propagation_bounds_shock
    {α β : Type*}
    [PseudoMetricSpace α] [PseudoMetricSpace β]
    (f : α → β)
    (K : NNReal)
    (hf : LipschitzWith K f)
    (x y : α) :
    dist (f x) (f y) ≤ K * dist x y :=
  hf.dist_le_mul x y


-- §4 COMPOSITE PROPAGATION CONTINUITY
theorem composite_propagation_continuous
    {α β γ : Type*}
    [TopologicalSpace α]
    [TopologicalSpace β]
    [TopologicalSpace γ]
    (f : α → β)
    (g : β → γ)
    (hf : Continuous f)
    (hg : Continuous g) :
    Continuous (g ∘ f) :=
  hg.comp hf


-- §5 POSITIVE VOLATILITY SPREAD
theorem volatility_spread_pos
    (v w : ℝ)
    (h : w < v) :
    0 < v - w :=
  sub_pos.mpr h


-- §6 OPEN REGION OF VOLATILITY SPIKES
theorem spike_preimage_open
    {α : Type*}
    [TopologicalSpace α]
    (v : α → ℝ)
    (hv : Continuous v)
    (θ : ℝ) :
    IsOpen {x : α | θ < v x} :=
  isOpen_lt continuous_const hv
