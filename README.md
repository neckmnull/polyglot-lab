<div align="center">

# Polyglot Lab

**One tiny message. Many languages. Different ways of thinking.**

[![Integrity](https://github.com/neckmnull/polyglot-lab/actions/workflows/integrity.yml/badge.svg)](https://github.com/neckmnull/polyglot-lab/actions/workflows/integrity.yml)
![Languages](https://img.shields.io/badge/languages-18-00E5FF?style=flat-square)
![Purpose](https://img.shields.io/badge/purpose-language%20exploration-7C3AED?style=flat-square)
[![License: MIT](https://img.shields.io/badge/license-MIT-A9B7C6?style=flat-square)](./LICENSE)

</div>

---

## Why this exists

Programming languages are tools for thought. This repository uses the smallest useful
program—printing `Hello, polyglot world!`—to compare syntax and discover ideas across
imperative, functional, logical, concurrent, stack-based, historical, and esoteric
ecosystems.

This is deliberately a **learning laboratory**, not a claim of production expertise in
every language listed here. Each example is small enough to inspect in seconds and has
a reproducible command based on the language's commonly used implementation.

## Language atlas

| Family | Language | Idea worth noticing | Source | Run with |
|---|---|---|---|---|
| Systems | Zig | Explicit control without hidden allocation | [`hello.zig`](./systems/zig/hello.zig) | `zig run hello.zig` |
| Systems | Nim | High-level syntax compiled to efficient native code | [`hello.nim`](./systems/nim/hello.nim) | `nim r hello.nim` |
| Systems | Ada | Strong typing and reliability-oriented design | [`hello.adb`](./systems/ada/hello.adb) | `gnatmake hello.adb && ./hello` |
| Scientific | Fortran | Array-oriented scientific computing heritage | [`hello.f90`](./scientific/fortran/hello.f90) | `gfortran hello.f90 -o hello && ./hello` |
| Historical | COBOL | Readable, business-oriented division structure | [`hello.cob`](./historical/cobol/hello.cob) | `cobc -x hello.cob && ./hello` |
| Historical | Pascal | Structured programming and explicit program shape | [`hello.pas`](./historical/pascal/hello.pas) | `fpc hello.pas && ./hello` |
| Functional | Haskell | Pure functional expressions and explicit effects | [`Hello.hs`](./functional/haskell/Hello.hs) | `runghc Hello.hs` |
| Functional | OCaml | Expression-oriented ML with powerful type inference | [`hello.ml`](./functional/ocaml/hello.ml) | `ocaml hello.ml` |
| Functional | Clojure | Lisp data syntax on a practical hosted runtime | [`hello.clj`](./functional/clojure/hello.clj) | `clojure -M hello.clj` |
| Functional | Racket | A language-oriented programming toolkit | [`hello.rkt`](./functional/racket/hello.rkt) | `racket hello.rkt` |
| Concurrent | Elixir | Actor-style concurrency on the BEAM | [`hello.exs`](./concurrent/elixir/hello.exs) | `elixir hello.exs` |
| Logic | Prolog | Declaring a fact and querying a relation | [`hello.pl`](./logic/prolog/hello.pl) | `swipl -q -s hello.pl` |
| Scripting | Raku | Expressive gradual typing and a rich grammar | [`hello.raku`](./scripting/raku/hello.raku) | `raku hello.raku` |
| Scripting | Lua | A tiny, embeddable language core | [`hello.lua`](./scripting/lua/hello.lua) | `lua hello.lua` |
| Stack-based | Forth | Concatenative composition through words and a stack | [`hello.fs`](./stack-based/forth/hello.fs) | `gforth hello.fs` |
| Esoteric | Brainfuck | Computation with eight commands | [`hello.bf`](./esoteric/brainfuck/hello.bf) | `bf hello.bf` |
| Esoteric | Befunge-93 | Two-dimensional instruction flow | [`hello.bf93`](./esoteric/befunge/hello.bf93) | `befunge hello.bf93` |
| Esoteric | LOLCODE | Humor as syntax, still with a formal grammar | [`hello.lol`](./esoteric/lolcode/hello.lol) | `lci hello.lol` |

> Commands assume the corresponding compiler or interpreter is installed and that the
> terminal is opened in the source file's directory.

## Repository contract

Every entry is described in [`catalog.json`](./catalog.json). The integrity workflow:

1. parses the catalog;
2. ensures paths are unique and files exist;
3. verifies each source is non-empty UTF-8 text;
4. checks that the README links every catalog entry;
5. enforces the expected output contract.

Run the same check locally with PowerShell 7+:

```powershell
pwsh ./scripts/validate.ps1
```

## Add another language

1. Put a minimal, idiomatic program in the matching paradigm directory.
2. Add its metadata and exact run command to `catalog.json`.
3. Add one row to the language atlas.
4. Run `pwsh ./scripts/validate.ps1`.
5. Explain the language idea—not just its file extension—in your pull request.

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for the acceptance criteria.

## Scope and limitations

- Programs are intentionally tiny; they demonstrate syntax, not architecture.
- The CI validates repository consistency, not every third-party compiler toolchain.
- Commands target commonly used implementations and can differ across operating systems.
- Language count is never a proxy for engineering depth.

## License

Code is available under the [MIT License](./LICENSE).