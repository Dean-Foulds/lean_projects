# �� Lean Theorem Proving Projects

A collection of formal mathematics proofs written in **Lean 4**, using the [Mathlib4](https://github.com/leanprover-community/mathlib4) library. This repository covers foundational theorems across multiple areas of mathematics, with a focus on building rigorous, machine-verified proofs.

---

## 🚀 Getting Started

### Prerequisites
- [Lean 4](https://leanprover.github.io/lean4/doc/quickstart.html)
- [Lake](https://github.com/leanprover/lake) (Lean's build system)
- [elan](https://github.com/leanprover/elan) (Lean version manager)

### Installation
```bash
git clone https://github.com/Dean-Foulds/lean_projects
cd lean_projects
lake exe cache get   # Download precompiled Mathlib (saves hours of build time)
lake build
```

---

## 📂 Project Structure
```
lean_projects/
├── LeanProjects/
│   ├── analysis_basics.lean        # Real analysis & calculus
│   ├── combinatorics_basics.lean   # Combinatorics & finite sets
│   ├── decide_theorems.lean        # Decidability theorems
│   ├── fifth_lookup.lean           # Lookup & search theorems
│   ├── hello.lean                  # Introduction to Lean 4
│   ├── linear_algebra_basics.lean  # Vector spaces & linear maps
│   ├── logic_basics.lean           # Logic & type theory
│   ├── playground.lean             # Experimental proofs
│   ├── rfl_theorems.lean           # Reflexivity theorems
│   └── squeeze.lean                # Squeeze theorem & inequalities
├── lakefile.toml                   # Lake build configuration
├── lean-toolchain                  # Lean version pinning
└── README.md
```

---

## 📖 Theorem Areas

### Analysis & Calculus
- Absolute value non-negativity
- Triangle inequality
- Square non-negativity
- Positivity implications

### Logic & Type Theory
- Modus ponens
- Double negation elimination
- De Morgan's laws
- Conjunction commutativity

### Combinatorics
- Sum of first *n* natural numbers
- Finite set cardinality
- Empty set properties

### Linear Algebra
- Vector addition commutativity
- Scalar multiplication distributivity
- Zero vector identity

---

## 🛠️ Built With

- [Lean 4](https://leanprover.github.io/) — Functional programming language & theorem prover
- [Mathlib4](https://leanprover-community.github.io/mathlib4_docs/) — Community mathematics library
- [Lake](https://github.com/leanprover/lake) — Lean build system

---

## 👤 Author

**Dean Foulds** — Data Scientist & ML Engineer  
🌐 [deanfoulds.xyz](https://deanfoulds.xyz) | 💼 [LinkedIn](https://www.linkedin.com/in/dean-foulds) | 🐙 [GitHub](https://github.com/Dean-Foulds)

---

## 📄 Licence

MIT
