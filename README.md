# x402-Polygon Extension

**HTTP 402 Payment-Gated Routing on Polygon (PoS + zkEVM)**
**Author:** Richard Patterson (@De-ASI-INTERFACE)
**Version:** 1.0.0 | **Date:** 2026-07-09 | **License:** MIT

---

## Overview

Canonical specification for HTTP 402 Payment-Gated Routing on Polygon, covering both the Polygon PoS chain (Bor/Heimdall consensus) and Polygon zkEVM (ZK-rollup with Ethereum data availability). Originated and authored by Richard Patterson.

The x402-Polygon Extension leverages Polygon's native MATIC/POL gas token, EIP-712 payment proofs (fully EVM-compatible), EIP-2612 permit approvals, and — on zkEVM — ZK proof verification for payment validity. Polygon PoS achieves ~2s block times with 128-checkpoint Ethereum finality; zkEVM achieves Ethereum-equivalent security with ZK-verified state transitions.

## Architecture

- **Payment Token:** ERC-20 (USDC, USDT, or native POL)
- **Signature Scheme:** EIP-712 (identical to Ethereum, chainId 137 PoS / 1101 zkEVM)
- **Finality Model:** PoS: 128 block checkpoint (~4 min Ethereum finality); zkEVM: ZK proof batch (~1 hr)
- **Verifier Surface:** Solidity `IX402PolygonVerifier` — identical ABI to Ethereum but checkpoint-aware
- **ZK Extension:** zkEVM payment proofs can be batched and verified in a single ZK proof
- **Formal Verification:** Lean 4 checkpoint finality and ZK soundness theorems

## Citation
```bibtex
@software{patterson2026x402polygon,
  author={Patterson, Richard}, title={{x402-Polygon: HTTP 402 Payment-Gated Routing on Polygon}},
  version={1.0.0}, date={2026-07-09},
  url={https://github.com/De-ASI-INTERFACE/x402-polygon-extension}, license={MIT}}
```
