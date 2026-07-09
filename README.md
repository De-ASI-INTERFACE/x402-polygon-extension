# x402-Polygon Extension

**HTTP 402 Payment-Gated Routing on Polygon**

**Author:** Richard Patterson (@De-ASI-INTERFACE)
**Version:** 1.0.0
**Date:** 2026-07-09
**License:** MIT

## Overview

The x402-Polygon Extension adapts the x402 HTTP 402 payment standard to Polygon PoS and zkEVM networks. It leverages EIP-712 typed signatures over MATIC/POL and ERC-20 tokens, with Uniswap v3 (Polygon) as the canonical DEX routing surface, and a Facilitator contract enforcing payment integrity, nonce replay prevention, and CLTV-equivalent block deadline enforcement. Lean 4 formal proofs verify all invariants machine-check.

**Reference ID:** RP-DEASI-POL-2026-0709-001
