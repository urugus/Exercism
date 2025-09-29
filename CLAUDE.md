# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an Exercism solutions repository containing programming exercises across multiple languages:
- **Go** (`go/`)
- **Ruby** (`ruby/`)
- **Haskell** (`haskell/`)

Profile: https://exercism.org/profiles/s-sakashi

## Repository Structure

Each language has its own directory with multiple exercise subdirectories. Each exercise contains:
- Solution implementation file(s)
- Test file(s)
- `README.md` - Exercise description
- `HELP.md` - Language-specific testing instructions

### Go Exercises
- Solution files: `<exercise_name>.go`
- Test files: `<exercise_name>_test.go`
- Each exercise has its own `go.mod` file with module name matching the exercise

### Ruby Exercises
- Solution files: `<exercise_name>.rb`
- Test files: `<exercise_name>_test.rb`

### Haskell Exercises
- Solution files: `src/<ModuleName>.hs`
- Test files: `test/Tests.hs`
- Configuration: `package.yaml`, `stack.yaml`

## Testing Commands

### Go
```bash
# Run tests in an exercise directory
cd go/<exercise-name>
go test

# Run tests with verbose output
go test -v

# Run benchmarks
go test -v --bench . --benchmem
```

### Ruby
```bash
# Run tests in an exercise directory
cd ruby/<exercise-name>
ruby <exercise_name>_test.rb

# With colored output
ruby -r minitest/pride <exercise_name>_test.rb
```

### Haskell
```bash
# Run tests in an exercise directory (requires stack)
cd haskell/<exercise-name>
stack test

# Run interactive REPL
stack ghci

# Setup/install GHC version if needed
stack setup
```

**Note**: Stack is not currently installed. GHC 9.12.2 is installed via Homebrew and cabal is available. If working with Haskell exercises, you may need to install stack or adapt to use cabal.

## Submitting Solutions

Each language uses the Exercism CLI:
```bash
# Go
exercism submit <filename>.go

# Ruby
exercism submit <filename>.rb

# Haskell
exercism submit src/<ModuleName>.hs package.yaml
```

## Development Notes

- Each exercise is independent with its own test suite
- Tests may have `skip` directives for incremental development - remove these to enable all tests
- Go exercises use standard `testing` package
- Ruby exercises use `minitest`
- Haskell exercises use `hspec` for testing