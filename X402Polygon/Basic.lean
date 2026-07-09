-- ============================================================
-- x402-Polygon: Basic Re-export Shim
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- Chain: Polygon PoS / ERC-20 / QuickSwap v3
--
-- Re-exports X402Polygon.PaymentVerification as the single
-- authoritative source of all shared types and definitions.
-- Chain-prefixed theorem aliases are provided for ergonomic use.
-- ============================================================
import X402Polygon.PaymentVerification

namespace X402Polygon

/-- Alias: replay prevention under the Polygon chain prefix. -/
theorem polygon_replay_prevented
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    a.nonce ∉ s.used_nonces :=
  replay_prevented a s h

/-- Alias: expiry enforcement under the Polygon chain prefix. -/
theorem polygon_not_expired
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    s.block_time ≤ a.expires_at :=
  within_expiry a s h

end X402Polygon
