#!/usr/bin/env bash
# ============================================================
# File: ~/.bash_profile
# ============================================================
# Author: Brad Guthrie
# Last updated: 2025-12-28
# Description: Custom bash profile with enhanced productivity features
# ============================================================

# Load standard bash files if present
[[ -f ~/.profile ]] && source ~/.profile
[[ -f ~/.bashrc ]] && source ~/.bashrc

# ============================================================
# Colors (ANSI)
# ============================================================

# Basic colors
export WHITE='\033[0m'      # reset / default
export BLACK='\033[0;30m'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'   # bold yellow
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export MAGENTA='\033[0;35m'  # alias for purple
export CYAN='\033[0;36m'

# Bold colors
export BOLD='\033[1m'
export BOLD_RED='\033[1;31m'
export BOLD_GREEN='\033[1;32m'
export BOLD_BLUE='\033[1;34m'
export BOLD_CYAN='\033[1;36m'

# Dim colors
export DIM='\033[2m'
export GRAY='\033[90m'

# ============================================================
# ls colors (Git Bash safe)
# ============================================================

export CLICOLOR=1
export LS_COLORS="\
di=33:\
ex=32:\
fi=34:\
ln=36:\
pi=33:\
so=33:\
bd=33:\
cd=33:\
or=31:\
mi=31:\
*.md=36:"

# ============================================================
# Custom Prompt (PS1) with Git Branch
# ============================================================

# Function to get current git branch
git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  if [[ -n "$branch" ]]; then
    printf " ${CYAN}on${WHITE} ${PURPLE}⎇ %s${WHITE}" "$branch"
  fi
}

# Set custom prompt: user@host:path (branch)
export PS1="${BOLD_GREEN}\u${WHITE}@${BOLD_BLUE}\h${WHITE}:${YELLOW}\w${WHITE}$(git_branch)\n${CYAN}❯${WHITE} "

# ============================================================
# Utility functions
# ============================================================

reload_bash_profile() {
  if [[ -f ~/.bash_profile ]]; then
    source ~/.bash_profile
    printf "\n✅ ${GREEN}Reloaded${WHITE} ${YELLOW}~/.bash_profile${WHITE}\n📌 ${CYAN}Location: ${YELLOW}~/.bash_profile${WHITE}\n\n"
  else
    printf "\n${RED}Error:${WHITE} ${YELLOW}~/.bash_profile${WHITE} not found!\n\n"
    return 1
  fi
}

edit_bash_profile() {
  if command -v cursor &>/dev/null; then
    cursor ~/.bash_profile
    printf "\n✅ ${GREEN}Opened${WHITE} ${YELLOW}~/.bash_profile${WHITE} in ${CYAN}Cursor${WHITE}\n\n"
  elif command -v code &>/dev/null; then
    code ~/.bash_profile
    printf "\n✅ ${GREEN}Opened${WHITE} ${YELLOW}~/.bash_profile${WHITE} in ${CYAN}VS Code${WHITE}\n\n"
  else
    printf "\n${RED}Error:${WHITE} No editor found. Install Cursor or VS Code.\n\n"
    return 1
  fi
}

list_colors() {
  printf "
  ----- ${PURPLE}Color Variables${WHITE} -----
  ${WHITE}WHITE${WHITE} (default), ${BLACK}BLACK${WHITE}, ${RED}RED${WHITE}, ${GREEN}GREEN${WHITE}, ${YELLOW}YELLOW${WHITE}
  ${BLUE}BLUE${WHITE}, ${PURPLE}PURPLE${WHITE}, ${CYAN}CYAN${WHITE}, ${GRAY}GRAY${WHITE}
  ${BOLD_RED}BOLD_RED${WHITE}, ${BOLD_GREEN}BOLD_GREEN${WHITE}, ${BOLD_BLUE}BOLD_BLUE${WHITE}, ${BOLD_CYAN}BOLD_CYAN${WHITE}
  "
}

list_commands() {
  printf "
  ----- ${PURPLE}Functions & Commands${WHITE} -----
  ${YELLOW}reload_bash_profile${WHITE}   (alias: ${CYAN}srcb${WHITE}) - Reload bash profile
  ${YELLOW}edit_bash_profile${WHITE}     (alias: ${CYAN}editb${WHITE}) - Edit bash profile in editor
  ${YELLOW}list_colors${WHITE}           (alias: ${CYAN}listcolors${WHITE}) - Show color variables
  ${YELLOW}list_commands${WHITE}         (alias: ${CYAN}listcommands${WHITE}) - Show this list
  ${YELLOW}up [n]${WHITE}                - Go up n directories (default: 1)
  ${YELLOW}mkcd <dir>${WHITE}            - Create directory and cd into it
  ${YELLOW}gs${WHITE}                    - Git status (fancy)
  ${YELLOW}gacp <msg>${WHITE}            - Git add, commit, and push
  ${YELLOW}glg [n]${WHITE}               - Git log graph (last n commits, default: 10)
  ${YELLOW}find_file <pattern>${WHITE}   - Search for files by name
  ${YELLOW}extract <file>${WHITE}        - Extract archives (.zip, .tar.gz, etc.)
  ${YELLOW}sysinfo${WHITE}               - Display system information

  ----- ${PURPLE}Navigation Aliases${WHITE} -----
  ${CYAN}..${WHITE}, ${CYAN}...${WHITE}, ${CYAN}....${WHITE}         - Go up 1, 2, or 3 directories
  ${CYAN}-${WHITE}                     - Go back to previous directory
  ${CYAN}dev${WHITE}                  - cd to ~/Documents/Development
  ${CYAN}docs${WHITE}, ${CYAN}dl${WHITE}, ${CYAN}dt${WHITE}         - cd to Documents, Downloads, Desktop

  ----- ${PURPLE}List Aliases${WHITE} -----
  ${CYAN}ls${WHITE}                   - Fancy ls with icons 📁 📘 📜 ⚙️  📄
  ${CYAN}ll${WHITE}                   - Long format ls
  ${CYAN}la${WHITE}                   - Show all (including hidden)
  ${CYAN}lla${WHITE}                  - Long format + hidden files
  ${CYAN}lt${WHITE}                   - Sort by modification time
  ${CYAN}lsize${WHITE}                - Sort by file size

  ----- ${PURPLE}Git Aliases${WHITE} -----
  ${CYAN}g${WHITE}                    - git
  ${CYAN}ga${WHITE}, ${CYAN}gaa${WHITE}             - git add / git add all
  ${CYAN}gc${WHITE}, ${CYAN}gcm${WHITE}             - git commit / git commit -m
  ${CYAN}gp${WHITE}, ${CYAN}gpl${WHITE}             - git push / git pull
  ${CYAN}gst${WHITE}                  - git status
  ${CYAN}gd${WHITE}                   - git diff
  ${CYAN}gb${WHITE}                   - git branch
  ${CYAN}gco${WHITE}, ${CYAN}gcb${WHITE}            - git checkout / checkout -b
  ${CYAN}glog${WHITE}                 - git log graph

  ----- ${PURPLE}Other Useful Aliases${WHITE} -----
  ${CYAN}c${WHITE}, ${CYAN}cls${WHITE}              - Clear screen
  ${CYAN}h${WHITE}                    - History
  ${CYAN}path${WHITE}                 - Pretty print PATH variable
  ${CYAN}now${WHITE}                  - Current date and time
  "
}

list_all() {
  printf "
  ${WHITE}----- ${PURPLE}List of all custom commands, aliases, and colors${WHITE} -----
  "
  list_commands
  list_colors
} 

# ============================================================
# Fancy ls (icons + colors)
# ======================================================s======

ls_fancy() {
  command ls -F --color=always "$@" | awk '
    {
      raw = $NF
      name = raw
      gsub(/\x1b\[[0-9;]*m/, "", name)

      if (name ~ /\/$/) {
        sub(/\/$/, "", name)
        if (name == "node_modules" || name == ".git") {
          $NF = "📁 \033[90m" raw "\033[0m"
        } else {
          $NF = "📁 " raw
        }
      }
      else if (name ~ /\.md$/) {
        $NF = "📘 " raw
      }
      else if (name ~ /\.(js|mjs|cjs)$/) {
        $NF = "📜 " raw
      }
      else if (name ~ /\.(ts|tsx)$/) {
        $NF = "📘 " raw
      }
      else if (name ~ /\.jsx$/) {
        $NF = "⚛️  " raw
      }
      else if (name ~ /\.(json|jsonc)$/) {
        $NF = "⚙️  " raw
      }
      else if (name ~ /\.(yml|yaml)$/) {
        $NF = "📋 " raw
      }
      else if (name ~ /\.(env|env\..*|.*rc)$/ || name ~ /\.config\.(js|ts|json)$/) {
        $NF = "⚙️  " raw
      }
      else if (name ~ /\.(sh|bash|zsh)$/) {
        $NF = "🔧 " raw
      }
      else if (name ~ /\.(py|pyc)$/) {
        $NF = "🐍 " raw
      }
      else if (name ~ /\.(java|class|jar)$/) {
        $NF = "☕ " raw
      }
      else if (name ~ /\.(cpp|c|h|hpp)$/) {
        $NF = "⚡ " raw
      }
      else if (name ~ /\.(html|htm|xml)$/) {
        $NF = "🌐 " raw
      }
      else if (name ~ /\.(css|scss|sass|less)$/) {
        $NF = "🎨 " raw
      }
      else if (name ~ /\.(jpg|jpeg|png|gif|svg|ico|webp)$/) {
        $NF = "🖼️  " raw
      }
      else if (name ~ /\.(mp4|avi|mov|mkv|webm)$/) {
        $NF = "🎥 " raw
      }
      else if (name ~ /\.(mp3|wav|flac|ogg|m4a)$/) {
        $NF = "🎵 " raw
      }
      else if (name ~ /\.(zip|tar|gz|rar|7z|bz2)$/) {
        $NF = "📦 " raw
      }
      else if (name ~ /\.(pdf)$/) {
        $NF = "📕 " raw
      }
      else if (name ~ /\.(txt|log)$/) {
        $NF = "📝 " raw
      }
      else if (name ~ /\.(lock|lockb)$/ || name == "package-lock.json" || name == "yarn.lock") {
        $NF = "🔒 \033[90m" raw "\033[0m"
      }
      else if (name ~ /^(README|LICENSE|Makefile|Dockerfile)/) {
        $NF = "📋 " raw
      }
      else if (name ~ /^\./) {
        $NF = "👁️  \033[90m" raw "\033[0m"
      }
      else {
        $NF = "📄 " raw
      }

      print
    }
  '
}

# ============================================================
# Pretty pwd (alternating colors)
# ============================================================

pwd_fancy() {
  local path
  path="$(command pwd)"
  local IFS='/'
  local parts=($path)
  local out=""
  local i=0

  for part in "${parts[@]}"; do
    [[ -z "$part" ]] && continue
    if (( i % 2 == 0 )); then
      out+="${YELLOW}/$part"
    else
      out+="${CYAN}/$part"
    fi
    ((i++))
  done

  printf "%b\n" "${out}${WHITE}"
}

# ============================================================
# Navigation helpers
# ============================================================

# Quick directory navigation
up() {
  local levels
  levels=${1:-1}
  local path=""
  for ((i=0; i<levels; i++)); do
    path="../$path"
  done
  cd "$path" || return
}

# Create directory and cd into it
mkcd() {
  if [[ -z "$1" ]]; then
    printf "${RED}Error:${WHITE} Please provide a directory name\n"
    return 1
  fi
  mkdir -p "$1" && cd "$1" || return
  printf "${GREEN}Created and entered:${WHITE} ${YELLOW}$1${WHITE}\n"
}

# Quick cd to common directories
alias dev='cd ~/Documents/Development'
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'

# ============================================================
# Git helpers
# ============================================================

# Git status with fancy formatting
gs() {
  printf "\n${CYAN}━━━ Git Status ━━━${WHITE}\n"
  git status
}

# Quick git add, commit, push
gacp() {
  if [[ -z "$1" ]]; then
    printf "${RED}Error:${WHITE} Please provide a commit message\n"
    return 1
  fi
  git add .
  git commit -m "$1"
  git push
  printf "\n${GREEN}✓ Committed and pushed:${WHITE} $1\n"
}

# Git log with pretty format
glg() {
  git log --oneline --decorate --graph --all -n ${1:-10}
}

# ============================================================
# File operations
# ============================================================

# Quick file search in current directory
find_file() {
  if [[ -z "$1" ]]; then
    printf "${RED}Error:${WHITE} Please provide a search pattern\n"
    return 1
  fi
  find . -iname "*$1*" 2>/dev/null
}

# Extract various archive types
extract() {
  if [[ -z "$1" ]]; then
    printf "${RED}Error:${WHITE} Please provide a file to extract\n"
    return 1
  fi
  if [[ ! -f "$1" ]]; then
    printf "${RED}Error:${WHITE} File not found: $1\n"
    return 1
  fi
  case "$1" in
    *.tar.gz|*.tgz)  tar -xzf "$1" ;;
    *.tar.bz2|*.tbz2) tar -xjf "$1" ;;
    *.tar)     tar -xf "$1" ;;
    *.gz)      gunzip "$1" ;;
    *.zip)     unzip "$1" ;;
    *.rar)     unrar x "$1" ;;
    *.7z)      7z x "$1" ;;
    *)         printf "${RED}Error:${WHITE} Unknown archive format\n"; return 1 ;;
  esac
  printf "${GREEN}✓ Extracted:${WHITE} $1\n"
}

# ============================================================
# System info
# ============================================================

# Display system info
sysinfo() {
  printf "\n${CYAN}━━━ System Information ━━━${WHITE}\n\n"
  printf "${YELLOW}User:${WHITE}     $(whoami)\n"
  printf "${YELLOW}Host:${WHITE}     $(hostname)\n"
  printf "${YELLOW}OS:${WHITE}       $(uname -s)\n"
  printf "${YELLOW}Shell:${WHITE}    $SHELL\n"
  printf "${YELLOW}Date:${WHITE}     $(date)\n"
  printf "\n"
}

# ============================================================
# Aliases
# ============================================================

# Fancy ls and pwd by default
alias ls='ls_fancy'
alias pwd='pwd_fancy'

# List variations
alias ll='ls -lh'         # long format
alias la='ls -A'          # show hidden
alias lla='ls -lhA'       # long format + hidden
alias lt='ls -lt'         # sort by time
alias lsize='ls -lhS'     # sort by size

# Safety nets
alias rm='rm -i'          # confirm before delete
alias cp='cp -i'          # confirm before overwrite
alias mv='mv -i'          # confirm before overwrite

# Profile management
alias srcb='reload_bash_profile'
alias editb='edit_bash_profile'
alias listcolors='list_colors'
alias listcommands='list_commands'
alias list='list_all'
alias listall='list_all'
alias srctest='srcb && list'

# Git shortcuts
alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gst='git status'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias glog='git log --oneline --decorate --graph'

# Git typo forgiveness
alias got='git'
alias gut='git'
alias gir='git'
alias giy='git'
alias ggit='git'

# Quick navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'         # go back to previous directory

# Clear shortcuts
alias c='clear'
alias cls='clear'

# Grep with color
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Disk usage
alias du='du -h'
alias df='df -h'

# Process management
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'  # search processes

# Network
alias ports='netstat -tulanp'

# Shortcuts for common commands
alias h='history'
alias j='jobs'
alias path='echo -e ${PATH//:/\\n}'  # pretty print PATH
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias week='date +%V'

# Make common typos work
alias cler='clear'
alias claer='clear'
alias celar='clear'
alias cd..='cd ..'
alias pdw='pwd'

# ============================================================
# History settings
# ============================================================

export HISTSIZE=10000          # Number of commands in memory
export HISTFILESIZE=20000      # Number of commands in history file
export HISTCONTROL=ignoredups:erasedups  # Ignore duplicates
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S  "  # Add timestamps
shopt -s histappend            # Append to history, don't overwrite

# ============================================================
# Other shell options
# ============================================================

shopt -s checkwinsize          # Update LINES and COLUMNS after each command
shopt -s cdspell               # Autocorrect typos in cd commands
shopt -s dirspell              # Correct directory spelling errors
shopt -s nocaseglob            # Case-insensitive globbing

# ============================================================
# Welcome message
# ============================================================

if [[ -n "$PS1" ]]; then  # Only show in interactive shells
  printf "\n"
  printf "  ${BOLD_CYAN}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${WHITE}\n"
  printf "  ${BOLD_CYAN}┃${WHITE}  Welcome back, ${BOLD_GREEN}$(whoami)${WHITE}!  $(date +"%b %d, %Y")  ${BOLD_CYAN}┃${WHITE}\n"
  printf "  ${BOLD_CYAN}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${WHITE}\n"
  printf "\n  ${GRAY}Type ${CYAN}list${GRAY} to see available commands${WHITE}\n\n"
fi

