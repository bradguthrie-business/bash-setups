# 🚀 Bash Setup & Configuration

A comprehensive, feature-rich bash profile for Git Bash on Windows, designed to enhance productivity and make terminal work more enjoyable.

## ✨ Features

### 🎨 Visual Enhancements

- **Custom Prompt (PS1)** with Git branch display
- **Colorized ls** with file-type specific icons (📁 📘 📜 🐍 ☕ etc.)
- **Colorized pwd** with alternating colors for easy reading
- **Welcome message** on shell startup
- **Rich color palette** with 15+ color variables

### 🛠️ Productivity Functions

- **`up [n]`** - Navigate up n directories quickly
- **`mkcd <dir>`** - Create and cd into directory in one command
- **`gs`** - Enhanced git status display
- **`gacp <msg>`** - Git add, commit, and push in one command
- **`glg [n]`** - Pretty git log with graph
- **`find_file <pattern>`** - Quick file search
- **`extract <file>`** - Universal archive extractor (.zip, .tar.gz, .rar, etc.)
- **`sysinfo`** - Display system information

### ⚡ Smart Aliases

#### Navigation

```bash
..      # cd ..
...     # cd ../..
....    # cd ../../..
-       # cd to previous directory
dev     # cd ~/Documents/Development
docs    # cd ~/Documents
dl      # cd ~/Downloads
dt      # cd ~/Desktop
```

#### List Commands

```bash
ll      # Long format
la      # Show hidden files
lla     # Long + hidden
lt      # Sort by time
lsize   # Sort by size
```

#### Git Shortcuts

```bash
g       # git
ga      # git add
gaa     # git add .
gc      # git commit
gcm     # git commit -m
gp      # git push
gpl     # git pull
gst     # git status
gd      # git diff
gb      # git branch
gco     # git checkout
gcb     # git checkout -b
glog    # git log --graph
```

#### Other Useful Aliases

```bash
c, cls  # Clear screen
h       # History
path    # Pretty print PATH
now     # Current timestamp
```

### 🎯 Quality of Life Improvements

- **History enhancements**: 10,000 commands in memory, timestamps, no duplicates
- **Auto-correction**: Typo correction for `cd` commands
- **Case-insensitive**: Glob patterns work regardless of case
- **Safety nets**: Confirm before `rm`, `cp`, `mv`
- **Typo forgiveness**: `got`, `gut`, `gir` all work as `git`

## 📦 Installation

### Quick Install

1. **Backup your current bash profile** (if you have one):

   ```bash
   cp ~/.bash_profile ~/.bash_profile.backup
   ```

2. **Copy the new profile**:

   ```bash
   cp .bash_profile ~/.bash_profile
   ```

3. **Reload your profile**:
   ```bash
   source ~/.bash_profile
   ```
   Or simply restart Git Bash.

### What Gets Installed

The `.bash_profile` file in your home directory (`~/.bash_profile`) will be configured with:

- Color definitions
- Custom PS1 prompt with git branch
- Enhanced ls and pwd commands
- All helper functions and aliases
- Shell options and history settings

## 🎨 Customization

### Changing Colors

Edit the color variables at the top of `~/.bash_profile`:

```bash
export RED='\033[0;31m'
export GREEN='\033[0;32m'
# ... etc
```

### Adding Custom Aliases

Add your own aliases in the "Aliases" section:

```bash
alias myalias='my command here'
```

### Modifying the Prompt

The PS1 prompt can be customized in the "Custom Prompt" section:

```bash
export PS1="${BOLD_GREEN}\u${WHITE}@${BOLD_BLUE}\h${WHITE}:${YELLOW}\w${WHITE}\$(git_branch)\n${CYAN}➯${WHITE} "
```

### Adding More File Icons

Extend `ls_fancy()` function with new patterns:

```bash
else if (name ~ /\.myext$/) {
  $NF = "🎯 " raw
}
```

## 📚 Usage Examples

### Navigation

```bash
# Go up 3 directories
up 3

# Create and enter new project
mkcd my-new-project

# Quick jump to development folder
dev
```

### Git Workflow

```bash
# Quick status check
gs

# Add, commit, and push in one command
gacp "Initial commit"

# View last 20 commits in graph
glg 20
```

### File Operations

```bash
# Find all JavaScript files
find_file "*.js"

# Extract any archive
extract my-archive.tar.gz
```

### System Info

```bash
# View system details
sysinfo

# See current timestamp
now

# View PATH nicely formatted
path
```

## 🔧 Management Commands

```bash
srcb        # Reload bash profile
editb       # Open profile in Cursor or VS Code
list        # Show all commands, aliases, and colors
listcolors  # Show color variables only
listcommands# Show commands and aliases only
```

## 📝 File Structure

```
bash-setups/
├── .bash_profile      # The main bash profile
├── .gitignore         # Git ignore rules
├── backup.sh          # Create timestamped backups
├── CHANGELOG.md       # Version history and changes
├── CONTRIBUTING.md    # Contribution guidelines
├── install.sh         # Installation script
├── LICENSE            # MIT License
├── QUICKREF.md        # Quick reference card
├── README.md          # This file
└── test.sh            # Test suite for the profile
```

## 🐛 Troubleshooting

### Colors not showing?

- Ensure your terminal supports ANSI colors
- Git Bash should support this by default

### Icons not displaying?

- Your terminal font needs to support Unicode/Emoji
- Try fonts like: Cascadia Code, Fira Code, JetBrains Mono

### Editor not opening?

- Install Cursor or VS Code
- Update the `edit_bash_profile()` function to use your preferred editor

### Command not found?

- Run `srcb` to reload your profile
- Check if the command exists with `type <command>`

## 🤝 Contributing

Feel free to fork and customize for your own use! Suggestions and improvements are welcome.

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## 📜 Scripts Included

### install.sh

Installs the bash profile to your home directory with automatic backup of existing profile.

```bash
./install.sh
```

### backup.sh

Creates a timestamped backup of your current bash profile.

```bash
./backup.sh
```

### test.sh

Runs a comprehensive test suite to verify all functions, aliases, and settings.

```bash
./test.sh
```

## 📚 Additional Resources

- **[QUICKREF.md](QUICKREF.md)** - Quick reference card for common commands
- **[CHANGELOG.md](CHANGELOG.md)** - Version history and changes
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - How to contribute to this project

## 📄 License

MIT License - See LICENSE file for details

## 👤 Author

Brad Guthrie

---

**Pro Tip**: Type `list` after installation to see all available commands and aliases!
🎨

A repository of pretty, colorful bash and zsh configurations that make your terminal experience more enjoyable with colors and emojis! 🚀

## Overview

This repository provides ready-to-use shell configurations for both Bash and Zsh that include:

- 🌈 Colorized `ls` output for easy file/directory identification
- 📁 Emoji indicators for different file types
- 🎨 Colorful command prompts with git branch information
- ⚡ Useful aliases and functions to boost productivity

## Features

### Colorized Output

Both configurations automatically colorize your terminal output:

- **Directories**: Show in different colors for easy identification
- **Files**: Different colors based on file types
- **Git info**: Branch names displayed in your prompt

### Emoji File Types 📝

The custom `lse` command displays files with intuitive emojis:

- 📁 Directories
- 📝 Markdown files (.md)
- 🐍 Python files (.py)
- 📜 JavaScript/TypeScript files (.js, .ts)
- 🔧 Shell scripts (.sh, .zsh)
- 📋 Config files (.json, .yaml, .yml)
- 📦 Archives (.zip, .tar.gz, .dmg)
- 🖼️ Images (.jpg, .png, .gif, .svg)
- 🎬 Videos (.mp4, .mov, .avi)
- 🎵 Audio files (.mp3, .wav, .flac)
- 📕 PDF documents
- 📊 CSV files
- ⚙️ Executable files

### Enhanced Commands

- `lse` - List files with emoji indicators
- `lsed` - Detailed list with emojis (zsh only)
- `pwde` - Show current directory with 📁 emoji
- `ll` - Long listing format with human-readable sizes
- `la` - Long listing including hidden files
- `lt` - List sorted by modification time (zsh)

## Installation

### For Bash (Linux/Mac/Windows Git Bash)

1. **Backup your existing configuration** (if you have one):

   ```bash
   cp ~/.bash_profile ~/.bash_profile.backup
   ```

2. **Copy the configuration**:

   ```bash
   cp .bash_profile ~/.bash_profile
   ```

3. **Reload your shell**:
   ```bash
   source ~/.bash_profile
   ```

### For Zsh (macOS default shell)

1. **Backup your existing configuration** (if you have one):

   ```bash
   cp ~/.zshrc ~/.zshrc.backup
   ```

2. **Copy the configuration**:

   ```bash
   cp .zshrc ~/.zshrc
   ```

3. **Reload your shell**:
   ```bash
   source ~/.zshrc
   ```

## Configuration Details

### .bash_profile

The Bash configuration includes:

- Cross-platform color support (Linux and macOS)
- Colorized prompt with username, hostname, and current directory
- Git branch display in prompt
- Emoji-enhanced file listing function
- Standard colorized `ls` output
- Grep colorization

### .zshrc

The Zsh configuration includes all Bash features plus:

- Advanced Zsh completion with menu selection
- Case-insensitive tab completion
- Auto-cd (type directory name without `cd`)
- Enhanced history management (ignores duplicates, shared across sessions)
- Additional file type emoji support (videos, audio, PDFs)
- Detailed emoji listing with file permissions and sizes (`lsed`)
- Extended globbing patterns

## Customization

Feel free to customize these configurations to your liking:

### Changing Colors

Edit the `LSCOLORS` or `LS_COLORS` variables at the top of each file.

### Adding More Emoji Types

Add conditions to the `lse` function to recognize additional file extensions:

```bash
elif [[ "$file" == *.cpp || "$file" == *.hpp ]]; then
    echo "⚡️ $file"
```

### Modifying the Prompt

Edit the `PS1` (bash) or `PROMPT` (zsh) variable to customize your command prompt.

## Compatibility

- **Bash**: Works on Linux, macOS, and Windows (Git Bash, WSL)
- **Zsh**: Optimized for macOS (default shell since macOS Catalina) but works on Linux too

## Tips

1. **Emoji Support**: Make sure your terminal supports Unicode/emoji characters. Most modern terminals do!
2. **Terminal Theme**: These configs work best with dark terminal themes
3. **Git Integration**: The git branch display only works when you're inside a git repository

## Contributing

Feel free to submit pull requests with improvements or additional shell configurations!

## License

See LICENSE file for details.

---

Enjoy your pretty terminal! 🎉✨
