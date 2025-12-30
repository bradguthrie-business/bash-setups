#!/bin/bash
# ============================================================
# Bash Profile Test Suite
# ============================================================
# Tests various functions and aliases to ensure they work

set -e

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
WHITE='\033[0m'

TESTS_PASSED=0
TESTS_FAILED=0

printf "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${WHITE}\n"
printf "${CYAN}    Bash Profile Test Suite${WHITE}\n"
printf "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${WHITE}\n\n"

# Test helper function
test_command() {
  local name="$1"
  local command="$2"
  
  printf "Testing: ${YELLOW}%-30s${WHITE} " "$name"
  
  if eval "$command" &>/dev/null; then
    printf "${GREEN}✓ PASS${WHITE}\n"
    ((TESTS_PASSED++))
    return 0
  else
    printf "${RED}✗ FAIL${WHITE}\n"
    ((TESTS_FAILED++))
    return 1
  fi
}

# Test if function exists
test_function_exists() {
  local func="$1"
  test_command "$func function" "declare -f $func"
}

# Test if alias exists
test_alias_exists() {
  local alias_name="$1"
  test_command "$alias_name alias" "alias $alias_name"
}

# Test if variable is set
test_variable_set() {
  local var="$1"
  test_command "$var variable" "[[ -n \"\${$var}\" ]]"
}

printf "${CYAN}Testing Color Variables...${WHITE}\n"
test_variable_set "WHITE"
test_variable_set "RED"
test_variable_set "GREEN"
test_variable_set "YELLOW"
test_variable_set "BLUE"
test_variable_set "PURPLE"
test_variable_set "CYAN"
test_variable_set "BOLD_GREEN"
test_variable_set "GRAY"
printf "\n"

printf "${CYAN}Testing Functions...${WHITE}\n"
test_function_exists "reload_bash_profile"
test_function_exists "edit_bash_profile"
test_function_exists "list_colors"
test_function_exists "list_commands"
test_function_exists "list_all"
test_function_exists "ls_fancy"
test_function_exists "pwd_fancy"
test_function_exists "git_branch"
test_function_exists "up"
test_function_exists "mkcd"
test_function_exists "gs"
test_function_exists "gacp"
test_function_exists "glg"
test_function_exists "find_file"
test_function_exists "extract"
test_function_exists "sysinfo"
printf "\n"

printf "${CYAN}Testing Aliases...${WHITE}\n"
test_alias_exists "ls"
test_alias_exists "pwd"
test_alias_exists "ll"
test_alias_exists "la"
test_alias_exists "srcb"
test_alias_exists "editb"
test_alias_exists "list"
test_alias_exists "g"
test_alias_exists "ga"
test_alias_exists "gst"
test_alias_exists ".."
test_alias_exists "..."
test_alias_exists "c"
test_alias_exists "grep"
printf "\n"

printf "${CYAN}Testing Shell Options...${WHITE}\n"
test_command "histappend" "shopt -q histappend"
test_command "cdspell" "shopt -q cdspell"
test_command "dirspell" "shopt -q dirspell"
test_command "checkwinsize" "shopt -q checkwinsize"
printf "\n"

printf "${CYAN}Testing History Settings...${WHITE}\n"
test_command "HISTSIZE" "[[ \$HISTSIZE -ge 10000 ]]"
test_command "HISTFILESIZE" "[[ \$HISTFILESIZE -ge 20000 ]]"
test_command "HISTCONTROL" "[[ -n \"\$HISTCONTROL\" ]]"
test_command "HISTTIMEFORMAT" "[[ -n \"\$HISTTIMEFORMAT\" ]]"
printf "\n"

printf "${CYAN}Testing Environment...${WHITE}\n"
test_command "PS1 set" "[[ -n \"\$PS1\" ]]"
test_command "LS_COLORS set" "[[ -n \"\$LS_COLORS\" ]]"
test_command "CLICOLOR set" "[[ -n \"\$CLICOLOR\" ]]"
printf "\n"

# Summary
printf "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${WHITE}\n"
printf "${CYAN}    Test Summary${WHITE}\n"
printf "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${WHITE}\n"
printf "\n${GREEN}Passed:${WHITE} $TESTS_PASSED\n"
printf "${RED}Failed:${WHITE} $TESTS_FAILED\n"

TOTAL=$((TESTS_PASSED + TESTS_FAILED))
printf "${CYAN}Total:${WHITE}  $TOTAL\n\n"

if [[ $TESTS_FAILED -eq 0 ]]; then
  printf "${GREEN}✓ All tests passed!${WHITE}\n\n"
  exit 0
else
  printf "${RED}✗ Some tests failed!${WHITE}\n\n"
  exit 1
fi
