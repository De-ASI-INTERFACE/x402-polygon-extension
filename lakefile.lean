import Lake
open Lake DSL

package «x402-polygon» where
  version := v!"0.1.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.14.0"

lean_lib «X402Polygon» where
  roots := #[`X402Polygon]
