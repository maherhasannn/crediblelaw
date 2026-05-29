#!/bin/bash
set -euo pipefail

# Only run in remote (web) sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

REPO_DIR="$CLAUDE_PROJECT_DIR"

# ── 1. Restore skills to ~/.claude/skills ─────────────────────────────────────
SKILLS_SRC="$REPO_DIR/.claude/skills"
SKILLS_DST="$HOME/.claude/skills"

if [ -d "$SKILLS_SRC" ]; then
  mkdir -p "$SKILLS_DST"
  cp -r "$SKILLS_SRC"/. "$SKILLS_DST/"
  echo "[session-start] Skills restored to $SKILLS_DST"
fi

# ── 2. Load .env into the session environment ─────────────────────────────────
ENV_FILE="$REPO_DIR/.env"

if [ -f "$ENV_FILE" ] && [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  while IFS= read -r line || [ -n "$line" ]; do
    # Skip blank lines and comments
    [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
    echo "export $line" >> "$CLAUDE_ENV_FILE"
  done < "$ENV_FILE"
  echo "[session-start] Environment variables loaded from .env"
fi

echo "[session-start] Done."
