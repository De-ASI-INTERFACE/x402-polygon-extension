# Release Notes — v1.0.0

**Title:** x402-Polygon: HTTP 402 Payment-Gated Routing on Polygon
**Version:** 1.0.0 | **Date:** 2026-07-09 | **Author:** Richard Patterson (@De-ASI-INTERFACE)

## Summary
First stable release. Canonical x402 payment-gated routing specification for Polygon PoS and zkEVM, with checkpoint-aware finality and ZK batch proof extensions.

## Contents

| File | Description |
|---|---|
| `docs/x402-polygon-specification.md` | Full technical specification |
| `docs/prior-art-and-attribution.md` | Prior art record |
| `docs/x402-polygon-council-charter.md` | Stewardship council charter |
| `docs/reference-implementations.md` | Implementation links |
| `docs/formal-models/PolygonPaymentVerifier.lean` | Lean 4 checkpoint + ZK soundness |
| `CITATION.cff` | Academic citation metadata |
| `lakefile.lean` + `lean-toolchain` | Lean 4 v4.14.0 + Mathlib4 |
| `.github/workflows/lean-build.yml` | CI theorem verification |

## Attribution
All artifacts originated and authored by Richard Patterson (@De-ASI-INTERFACE).
