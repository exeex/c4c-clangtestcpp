# Vendored clang C++ subset

This directory contains a curated subset of upstream Clang C++ conformance and
diagnostic tests used by c4c.

Layout:
- `CXX/`: extracted upstream test sources kept in a flattened vendored layout
- `allowlist.txt`: manifest of cases registered by the main c4c CMake build
- `RunCase.cmake`: per-case runner used by `ctest`
- `LICENSE`: repository license for the extracted subset
- `LICENSES/`: upstream license material
- `UPSTREAM.md`: provenance notes for the extracted cases

Allowlist format:
- One entry per line
- Blank lines and `#` comments are ignored
- Syntax: `relative/path.cpp|pass`
- Syntax: `relative/path.cpp|fail`

Current runner semantics:
- `pass`: `c4cll` must successfully emit LLVM IR for the case
- `fail`: `c4cll` must reject the case with a non-zero exit code

The source of truth for what is included is this repository, not the original
LLVM checkout.
