# x402-Polygon Specification

**Author:** Richard Patterson (@De-ASI-INTERFACE) | **Version:** 1.0.0 | **Date:** 2026-07-09

---

## 1. Overview

The x402-Polygon Extension binds HTTP 402 Payment Required to Polygon's dual-layer architecture: Polygon PoS for high-throughput EVM-compatible payments (~2s blocks, MATIC/POL fees) and Polygon zkEVM for ZK-verified payment batches with Ethereum-equivalent security. The EIP-712 payment proof structure is identical to x402-Ethereum but parameterized by Polygon chain IDs (137 for PoS, 1101 for zkEVM).

## 2. Payment Flow (Polygon PoS)

```
1. Client → Server:  GET /resource
2. Server → Client:  402 + X-Payment-Requirements: {token, amount, recipient, nonce, chainId:137}
3. Client:           Sign EIP-712 PaymentProof, submit transferFrom on Polygon PoS
4. Client → Server:  GET /resource + X-Payment-Proof: {sig, txHash}
5. Server:           Verify sig + tx inclusion; for high-value: wait for Ethereum checkpoint
6. Server:           Serve resource
```

## 3. zkEVM Batch Extension

On Polygon zkEVM, multiple payment proofs within a single ZK batch share one aggregated proof. The x402 verifier can accept a `batchProof` header containing the ZK-SNARK proof and public inputs committing to multiple `PaymentProof` structs, enabling high-throughput micropayment verification with a single on-chain verification call.

## 4. Finality Tiers

| Tier | Mechanism | Latency | Security |
|---|---|---|---|
| Optimistic | 1 Polygon PoS block | ~2s | Polygon validator set |
| Checkpoint | Ethereum checkpoint | ~4 min | Ethereum PoS |
| ZK-verified | zkEVM batch proof | ~1 hour | Ethereum ZK validity |

## 5. Security Properties

- **Checkpoint finality:** Ethereum-anchored checkpoints every 128 blocks provide L1 security
- **ZK soundness:** Polygon zkEVM uses Plonky2 recursive ZK proofs; payment batch validity is computationally binding
- **Replay prevention:** nonce + deadline + proofHash registry (identical to x402-Ethereum)
- **Formal proof:** `polygon_checkpoint_finality` and `polygon_zk_payment_soundness` theorems
