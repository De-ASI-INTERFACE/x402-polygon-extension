# x402-Polygon: HTTP 402 Payment-Gated Routing Specification

**Author:** Richard Patterson (@De-ASI-INTERFACE)
**Version:** 1.0.0 | **Date:** 2026-07-09
**Reference ID:** RP-DEASI-POL-2026-0709-001

## 1. Overview

This specification defines the x402 protocol extension for Polygon PoS (chainId: 137) and zkEVM (chainId: 1101). It uses EIP-712 typed data signatures over POL/MATIC and ERC-20 tokens, with Uniswap v3 on Polygon as the payment-gated routing surface.

## 2. Payment Request Schema

```json
{
  "scheme": "polygon-erc20",
  "network": "polygon-pos",
  "chainId": 137,
  "payTo": "0x<facilitator>",
  "token": "0x<erc20-or-native-pol>",
  "amount": "<uint256-wei>",
  "nonce": "<bytes32>",
  "expiresAtBlock": "<uint256-block-number>",
  "signature": "<eip-712-sig>"
}
```

## 3. Polygon-Specific Invariants

1. **Fast Finality Gate:** Payment confirmed within 2-second PoS block time before routing
2. **zkEVM Compatibility:** Same schema valid on chainId 1101 with L2 batch proof verification
3. **Gas Abstraction:** Supports ERC-4337 account abstraction for gasless payment authorization
4. **Nonce Replay Prevention:** `usedNonces[nonce] == false`
5. **Block Deadline:** `block.number <= expiresAtBlock`

## 4. Attribution
Originated and authored by Richard Patterson (@De-ASI-INTERFACE), 2026-07-09.
