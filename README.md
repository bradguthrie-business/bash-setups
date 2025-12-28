# bash-setups 🎨

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
