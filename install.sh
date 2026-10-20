#!/usr/bin/env bash
# Symlink every skills/<name>/ folder into each harness's global skills folder.
# Usage: ./install.sh [--uninstall]
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"

TARGETS=(
  "$HOME/.claude/skills"   # Claude Code
  "$HOME/.agents/skills"   # Codex and other open-skills harnesses
)

install() {
  local target="$1" src name link
  mkdir -p "$target"
  for src in "$SKILLS_DIR"/*/; do
    [[ -f "$src/SKILL.md" ]] || continue
    src="${src%/}"
    name="$(basename "$src")"
    link="$target/$name"
    if [[ -L "$link" && "$(readlink "$link")" == "$src" ]]; then
      echo "  ok      $link"
    elif [[ -e "$link" || -L "$link" ]]; then
      echo "  skip    $link (exists and is not ours)" >&2
    else
      ln -s "$src" "$link"
      echo "  linked  $link"
    fi
  done
}

uninstall() {
  local target="$1" link
  [[ -d "$target" ]] || return 0
  for link in "$target"/*; do
    [[ -L "$link" && "$(readlink "$link")" == "$SKILLS_DIR"/* ]] || continue
    rm "$link"
    echo "  removed $link"
  done
}

case "${1:-}" in
  "")          action=install ;;
  --uninstall) action=uninstall ;;
  *)           echo "usage: $0 [--uninstall]" >&2; exit 1 ;;
esac

for target in "${TARGETS[@]}"; do
  echo "$target"
  "$action" "$target"
done
