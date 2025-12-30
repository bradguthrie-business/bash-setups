#!/bin/bash
# ============================================================
# Bash Profile Installer
# ============================================================
# This script installs the custom bash profile to your home directory

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
WHITE='\033[0m'

printf "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${WHITE}\n"
printf "${CYAN}    Bash Profile Installer${WHITE}\n"
printf "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${WHITE}\n\n"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_SOURCE="$SCRIPT_DIR/.bash_profile"
PROFILE_DEST="$HOME/.bash_profile"
BACKUP_DIR="$HOME/.bash_profile_backups"

# Check if source file exists
if [[ ! -f "$PROFILE_SOURCE" ]]; then
  printf "${RED}Error:${WHITE} .bash_profile not found in $SCRIPT_DIR\n"
  exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup existing profile if it exists
if [[ -f "$PROFILE_DEST" ]]; then
  TIMESTAMP=$(date +%Y%m%d_%H%M%S)
  BACKUP_FILE="$BACKUP_DIR/.bash_profile.$TIMESTAMP"
  
  printf "${YELLOW}Backing up existing profile...${WHITE}\n"
  cp "$PROFILE_DEST" "$BACKUP_FILE"
  printf "${GREEN}✓ Backed up to:${WHITE} $BACKUP_FILE\n\n"
else
  printf "${CYAN}No existing profile found. Installing fresh copy.${WHITE}\n\n"
fi

# Copy new profile
printf "${YELLOW}Installing new bash profile...${WHITE}\n"
cp "$PROFILE_SOURCE" "$PROFILE_DEST"
printf "${GREEN}✓ Installed to:${WHITE} $PROFILE_DEST\n\n"

# Ask if user wants to reload now
printf "${CYAN}Installation complete!${WHITE}\n\n"
printf "To apply changes:\n"
printf "  1. ${YELLOW}source ~/.bash_profile${WHITE} (reload in current session)\n"
printf "  2. Restart Git Bash (start fresh)\n\n"

read -p "Would you like to reload now? (y/n) " -n 1 -r
printf "\n"

if [[ $REPLY =~ ^[Yy]$ ]]; then
  # Source the profile
  source "$PROFILE_DEST"
  printf "\n${GREEN}✓ Profile reloaded!${WHITE}\n"
  printf "${CYAN}Type ${YELLOW}list${CYAN} to see all available commands.${WHITE}\n\n"
else
  printf "\n${YELLOW}Remember to reload your profile or restart Git Bash!${WHITE}\n\n"
fi
