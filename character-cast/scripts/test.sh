#!/usr/bin/env bash
# Validates structural invariants of the prompt library and system instruction.
# Mirrors the manual stress test. Exits non-zero on any failure.
# Run from the repo root: ./scripts/test.sh
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SYS="$ROOT/src/00-system-instruction.md"
LIB="$ROOT/src/10-prompt-library.md"

fail=0
check() { # name expected actual
  if [ "$2" = "$3" ]; then
    printf '  PASS  %s\n' "$1"
  else
    printf '  FAIL  %s (expected %s, got %s)\n' "$1" "$2" "$3"
    fail=1
  fi
}

echo "== Verbatim prompt integrity =="
check "14 angle prompts present" 14 "$(grep -c 'Use the uploaded image as the primary reference.' "$LIB")"

echo "== Height line placement =="
check "height line on 3 full-body prompts" 3 "$(grep -c 'thin vertical measurement line' "$LIB")"
check "no height line in headshot/medium/expression" 0 \
  "$(awk '/# PHASE 2|# PHASE 4|# PHASE 6/{f=1} /# PHASE 5/{f=0} f' "$LIB" | grep -c 'thin vertical measurement line')"
check "'No height line' guards present" 3 "$(grep -c 'No height line' "$LIB")"

echo "== Height accuracy (the figure must scale to the line) =="
# each full-body prompt must tie proportions to the height value
check "5A scales body to height" 1 "$(awk '/\*\*5A —/{f=1} /\*\*5B —/{f=0} f' "$LIB" | grep -c 'realistic body')"
check "5B scales body to height" 1 "$(awk '/\*\*5B —/{f=1} /\*\*5C —/{f=0} f' "$LIB" | grep -c 'realistic body')"
check "5C scales body to height" 1 "$(awk '/\*\*5C —/{f=1} /# PHASE 6/{f=0} f' "$LIB" | grep -c 'realistic body')"
# line must be told to span exactly the rendered figure (feet to head) in all 3
check "line spans figure exactly (x3)" 3 "$(grep -c 'true head-to-toe measurement' "$LIB")"
check "label reads the height token (x3)" 3 "$(grep -c 'Label it once' "$LIB")"
check "top cap at crown of head (x3)" 3 "$(grep -c 'highest point of the' "$LIB")"
check "bottom cap at soles (x3)" 3 "$(grep -c 'level with the soles of the feet' "$LIB")"
# [height] placeholder appears in all three full-body prompts and nowhere else
check "[height] in full-body: proportions+label (x6)" 6 "$(grep -c '\[height\]' "$LIB")"
check "[height] absent from headshot/medium/expression" 0 "$(awk '/# PHASE 2|# PHASE 4|# PHASE 6/{f=1} /# PHASE 5/{f=0} f' "$LIB" | grep -c '\[height\]')"

echo "== Build placeholder =="
check "[build] inside full-body prompts only" 0 \
  "$(awk '/# PHASE 2|# PHASE 4|# PHASE 6/{f=1} /# PHASE 5/{f=0} f' "$LIB" | grep -c '\[build\]')"

echo "== Stale-reference sweep (system instruction) =="
check "no leftover numbered menu" 0 "$(grep -c 'present the menu\|numbered menu' "$SYS")"
check "no leftover character-brief gate" 0 "$(grep -c 'output a character brief\|does this look right' "$SYS")"
check "no leftover headshot gate" 0 "$(grep -c 'option 0\|headshot gate\|Headshot anchor' "$SYS")"
check "solid grey background on every prompt (15)" 15 "$(grep -c 'Plain, solid light grey background' "$LIB")"
check "Path 2 flattened header present" 1 "$(grep -c 'NO BRIEF, NO MENU, NO GATE' "$SYS")"
check "height+build fixed in Forge" 1 "$(grep -c 'HEIGHT AND BUILD ARE FIXED HERE' "$SYS")"

echo ""
if [ "$fail" -eq 0 ]; then
  echo "ALL CHECKS PASSED"
else
  echo "SOME CHECKS FAILED"
fi
exit "$fail"
