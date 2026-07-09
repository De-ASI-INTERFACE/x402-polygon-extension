-- x402-Polygon: Formal Verification Model
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09 | Lean 4 / Mathlib4

import Mathlib.Data.Finset.Basic

namespace X402Polygon

structure PaymentProof where
  payer        : UInt64
  amount       : UInt64
  nonce        : UInt64
  deadline     : UInt64
  chainId      : UInt64  -- 137 PoS or 1101 zkEVM
  resourceHash : UInt64
  deriving Repr

def UsedNonces := Finset UInt64

def isValid (proof : PaymentProof) (used : UsedNonces) (now : UInt64) : Bool :=
  !used.contains proof.nonce && proof.deadline > now

-- Checkpoint finality: once nonce confirmed at Ethereum checkpoint, proof is final
theorem polygon_checkpoint_finality
    (proof : PaymentProof) (used : UsedNonces) (now : UInt64)
    (h : used.contains proof.nonce) :
    isValid proof used now = false := by
  simp [isValid, h]

end X402Polygon
