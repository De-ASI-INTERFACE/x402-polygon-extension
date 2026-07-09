-- x402-Polygon Payment Verification Formal Model
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09

import Mathlib.Data.Finset.Basic

namespace X402Polygon

structure PaymentAuth where
  nonce         : Nat
  amount        : Nat
  expires_block : Nat
  deriving Repr

structure FacilitatorState where
  used_nonces   : Finset Nat
  current_block : Nat
  deriving Repr

def not_expired (a : PaymentAuth) (s : FacilitatorState) : Prop :=
  s.current_block ≤ a.expires_block

def nonce_fresh (a : PaymentAuth) (s : FacilitatorState) : Prop :=
  a.nonce ∉ s.used_nonces

def verify (a : PaymentAuth) (s : FacilitatorState) : Prop :=
  not_expired a s ∧ nonce_fresh a s

theorem replay_prevented (a : PaymentAuth) (s : FacilitatorState)
    (h : verify a s) : a.nonce ∉ s.used_nonces := h.2

end X402Polygon
