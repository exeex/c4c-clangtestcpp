# Upstream

This repository is an extracted subset derived from the LLVM/Clang test suite.

Upstream project:
- https://github.com/llvm/llvm-project

Primary source area:
- `clang/test/CXX/`

Extraction note:
- The subset currently tracked in this tree was derived from upstream commit
  `d21a45d7d2b2a2f6ad39717c0337f9b728622b8c`.

Repository policy:
- Only files intentionally copied into this directory are part of the managed subset.
- `allowlist.txt` controls which vendored cases the main c4c build registers.
- If cases are edited locally for c4c-specific reasons, keep the edits minimal and
  document notable deviations in commit messages or pull requests.
