#!/usr/bin/env bash
set -euo pipefail

# Email drafting — Installer
# Deploys the skill files to ~/.claude/skills/email-drafting/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$HOME/.claude/skills/email-drafting"

if [ -t 1 ]; then
    GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
else
    GREEN=''; YELLOW=''; RED=''; NC=''
fi

info()  { echo -e "${GREEN}OK${NC} $1"; }
warn()  { echo -e "${YELLOW}!!${NC} $1"; }
error() { echo -e "${RED}XX${NC} $1" >&2; }

FORCE=false
case "${1:-}" in
    --force) FORCE=true ;;
    --uninstall)
        rm -rf "$SKILL_DIR"
        info "Uninstalled $SKILL_DIR"
        exit 0
        ;;
    --help|-h)
        echo "Usage: install.sh [--force | --uninstall]"
        exit 0
        ;;
    "") ;;
    *) error "Unknown option: $1"; exit 1 ;;
esac

if [ ! -f "$SCRIPT_DIR/SKILL.md" ]; then
    error "SKILL.md missing in $SCRIPT_DIR"
    exit 1
fi

mkdir -p "$SKILL_DIR"

if [ "$FORCE" = true ]; then
    cp -f "$SCRIPT_DIR/SKILL.md" "$SKILL_DIR/SKILL.md"
else
    cp -n "$SCRIPT_DIR/SKILL.md" "$SKILL_DIR/SKILL.md"
fi

info "Installed to $SKILL_DIR"
