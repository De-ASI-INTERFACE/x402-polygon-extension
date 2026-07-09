import Lake
open Lake DSL

package «x402-polygon» where
  name := "x402-polygon"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.14.0"

lean_lib «X402Polygon» where
  roots := #[`X402Polygon]
