#!/usr/bin/env bash
# Builds all deployable artifacts from src/.
#   build/character-cast.md   — merged single-file system prompt (Custom GPT / API)
#   SKILL.md                  — assembled skill manifest (Claude skill)
#   build/character-cast.skill.zip — installable skill package
# Run from repo root: ./scripts/build.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SYS="$ROOT/src/00-system-instruction.md"
LIB="$ROOT/src/10-prompt-library.md"
mkdir -p "$ROOT/build"

# 1. Merged single-file prompt
MERGED="$ROOT/build/character-cast.md"
{ cat "$SYS"; printf '\n\n'; cat "$LIB"; printf '\n'; } > "$MERGED"
echo "Built $MERGED"

# 2. Assemble SKILL.md from its template + src bodies
SKILL="$ROOT/SKILL.md"
TEMPLATE="$ROOT/scripts/SKILL.template.md"
# keep a pristine template the first time
if [ ! -f "$TEMPLATE" ]; then cp "$SKILL" "$TEMPLATE"; fi
python3 - "$TEMPLATE" "$SYS" "$LIB" "$SKILL" << 'PY'
import sys
template, sysf, libf, out = sys.argv[1:5]
t = open(template).read()
t = t.replace("<!-- BUILD:INSERT-SYSTEM-INSTRUCTION -->", open(sysf).read())
t = t.replace("<!-- BUILD:INSERT-PROMPT-LIBRARY -->", open(libf).read())
open(out, "w").write(t)
PY
echo "Built $SKILL"

# 3. Package the installable skill
PKG="$ROOT/build/character-cast.skill.zip"
rm -f "$PKG"
( cd "$ROOT" && zip -q "$PKG" SKILL.md )
echo "Built $PKG"

echo "Done."
