#!/bin/bash
# ============================================================
# Bash Profile Backup Script
# ============================================================
# Creates a timestamped backup of your current bash profile

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
WHITE='\033[0m'

PROFILE="$HOME/.bash_profile"
BACKUP_DIR="$HOME/.bash_profile_backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/.bash_profile.$TIMESTAMP"

printf "\n${CYAN}Creating backup...${WHITE}\n\n"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Check if profile exists
if [[ ! -f "$PROFILE" ]]; then
  printf "${YELLOW}Warning:${WHITE} No .bash_profile found at $PROFILE\n"
  exit 1
fi

# Create backup
cp "$PROFILE" "$BACKUP_FILE"

printf "${GREEN}✓ Backup created:${WHITE}\n"
printf "  ${YELLOW}$BACKUP_FILE${WHITE}\n\n"

# Show recent backups
printf "${CYAN}Recent backups:${WHITE}\n"
ls -lt "$BACKUP_DIR" | head -n 6 | tail -n 5
printf "\n"
