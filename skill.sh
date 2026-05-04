#!/usr/bin/env bash

set -eu

if [[ $# -eq 0 ]]; then
  echo "Usage: source ./skill.sh <skill-name>"
  echo "Available skills: design-taste"
  return 0 2>/dev/null || exit 0
fi

skill_name="$1"

case "$skill_name" in
  design-taste)
    echo "skills/design-taste/SKILL.md"
    ;;
  *)
    echo "Unknown skill: $skill_name" >&2
    echo "Available skills: design-taste" >&2
    return 1 2>/dev/null || exit 1
    ;;
esac
