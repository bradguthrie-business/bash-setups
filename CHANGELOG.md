# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-12-28

### Added

- **Custom PS1 Prompt** with git branch display
- **Expanded color palette** (15+ colors including bold variants and gray)
- **Navigation helpers**:
  - `up [n]` - Go up n directories
  - `mkcd <dir>` - Create and cd into directory
  - Quick aliases: `dev`, `docs`, `dl`, `dt`
- **Git helper functions**:
  - `gs` - Fancy git status
  - `gacp <msg>` - Git add, commit, push
  - `glg [n]` - Pretty git log with graph
- **File operations**:
  - `find_file <pattern>` - Quick file search
  - `extract <file>` - Universal archive extractor
- **System info function** - `sysinfo` command
- **Enhanced ls_fancy** with 20+ file type icons:
  - Programming languages (Python, Java, C++, etc.)
  - Web files (HTML, CSS, images)
  - Media files (video, audio)
  - Archives, PDFs, hidden files
- **Comprehensive aliases**:
  - List variations (ll, la, lla, lt, lsize)
  - Git shortcuts (g, ga, gaa, gc, gcm, gp, gpl, etc.)
  - Navigation shortcuts (.., ..., ....., -)
  - Safety nets (interactive rm, cp, mv)
  - Typo corrections
- **History enhancements**:
  - 10,000 commands in memory
  - 20,000 in history file
  - Timestamps on history entries
  - Duplicate removal
- **Shell options**:
  - Auto-correction for cd typos
  - Case-insensitive globbing
  - Window size checking
- **Welcome message** on shell startup
- **Better error handling** in functions with validation
- **Fallback editor support** (Cursor or VS Code)
- **Installation script** (`install.sh`)
- **Backup script** (`backup.sh`)

### Changed

- Replaced `test -f` with `[[ -f ]]` for better bash compatibility
- Replaced `.` with `source` for clarity
- Improved `list_commands()` to show all new features
- Updated `list_colors()` to display new color variables
- Enhanced error messages with color coding
- Made dimmed colors for node_modules, .git, lock files, and hidden files

### Documentation

- Comprehensive README with installation guide
- Usage examples for all features
- Troubleshooting section
- Customization guide
- CONTRIBUTING.md for contributors
- Inline code comments throughout

## [1.0.0] - 2025-12-27

### Initial Release

- Basic color definitions (7 colors)
- Simple ls_fancy with icons for common files
- Pretty pwd with alternating colors
- Basic utility functions:
  - `reload_bash_profile`
  - `edit_bash_profile`
  - `list_colors`
  - `list_commands`
- Simple aliases (srcb, editb, list)
- Git typo forgiveness (got, gut, gir, giy)
- Basic LS_COLORS configuration
