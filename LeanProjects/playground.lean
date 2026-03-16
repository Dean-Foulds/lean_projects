import Mathlib
-- repl_playground_fixed.lean
-- Lean 4 REPL-like sandbox (menu-driven, fully simulated)

def square (x : Nat) : Nat := x * x
def add_zero_fn (n : Nat) : Nat := n + 0
theorem add_zero (n : Nat) : n + 0 = n := Nat.add_zero n

-- Print menu
def printMenu : IO Unit := do
  IO.println "\n===== Lean Playground Menu ====="
  IO.println "1) Square a number"
  IO.println "2) Concatenate strings"
  IO.println "3) Evaluate 2 + 3"
  IO.println "4) Show add_zero_fn(7) and proof"
  IO.println "5) Exit"

-- Simulate user choice
def simulateChoice (runNum : Nat) : String :=
  match runNum % 5 with
  | 1 => "1"   -- square a number
  | 2 => "2"   -- concatenate
  | 3 => "3"   -- evaluate 2 + 3
  | 4 => "4"   -- add_zero_fn and proof
  | _ => "5"   -- exit

-- Handle choice
def handleChoice (choice : String) : IO Bool := do
  match choice with
  | "1" =>
    let n := 32 + 1  -- example: can vary per run
    IO.println s!"Option 1: {n} squared = {square n}"
    pure true
  | "2" =>
    IO.println s!"Option 2: {"Lean " ++ "is fun!"}"
    pure true
  | "3" =>
    IO.println s!"Option 3: 2 + 3 = {2 + 3}"
    pure true
  | "4" =>
    IO.println s!"Option 4: add_zero_fn(7) = {add_zero_fn 7}"
    IO.println "Proof add_zero(n) verified (not evaluated)."
    pure true
  | "5" =>
    IO.println "Exiting Lean playground."
    pure false
  | _ =>
    IO.println "Invalid choice, skipping..."
    pure true

-- REPL loop simulation
def replLoop (numRuns : Nat) : IO Unit := do
  let mut running := true
  let mut i := 1
  while running && i ≤ numRuns do
    printMenu
    let choice := simulateChoice i
    IO.println s!"Simulated choice: {choice}"
    running ← handleChoice choice
    i := i + 1

def main : IO Unit := do
  IO.println "Hello, Lean! Welcome to the REPL-like playground."
  replLoop 4  -- simulate 4 menu runs

#eval main
