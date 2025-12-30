# Quick Reference Card

## Most Useful Commands

### Essential

```bash
list          # Show all commands, aliases, and colors
srcb          # Reload bash profile
editb         # Edit bash profile
```

### Navigation

```bash
up 3          # Go up 3 directories
mkcd mydir    # Create and enter directory
..            # Up one directory
...           # Up two directories
-             # Go to previous directory
dev           # cd ~/Documents/Development
```

### Git Workflow

```bash
gs            # Git status (pretty)
gacp "msg"    # Add all, commit, and push
gst           # Git status
ga .          # Git add all
gcm "msg"     # Git commit with message
gp            # Git push
gpl           # Git pull
glog          # Git log graph
glg 20        # Last 20 commits
```

### File Operations

```bash
ll            # Long list format
la            # Show hidden files
lla           # Long + hidden
lt            # Sort by time
lsize         # Sort by size
find_file pattern  # Search for files
extract file.zip   # Extract any archive
```

### System

```bash
sysinfo       # System information
path          # View PATH nicely
now           # Current timestamp
h             # History
c             # Clear screen
```

## File Icons in ls

| Icon | File Type                       |
| ---- | ------------------------------- |
| 📁   | Directories                     |
| 📘   | Markdown (.md)                  |
| 📜   | JavaScript (.js, .mjs, .cjs)    |
| 📘   | TypeScript (.ts, .tsx)          |
| ⚛️   | React JSX (.jsx)                |
| ⚙️   | Config files (.json, .env, .rc) |
| 📋   | YAML (.yml, .yaml)              |
| 🔧   | Shell scripts (.sh, .bash)      |
| 🐍   | Python (.py)                    |
| ☕   | Java (.java)                    |
| 🌐   | HTML/XML                        |
| 🎨   | CSS/SCSS                        |
| 🖼️   | Images                          |
| 🎥   | Videos                          |
| 🎵   | Audio                           |
| 📦   | Archives                        |
| 📕   | PDF                             |
| 📝   | Text/Logs                       |
| 🔒   | Lock files (dimmed)             |
| 👁️   | Hidden files (dimmed)           |

## Git Aliases

| Alias | Command         |
| ----- | --------------- |
| g     | git             |
| ga    | git add         |
| gaa   | git add .       |
| gc    | git commit      |
| gcm   | git commit -m   |
| gp    | git push        |
| gpl   | git pull        |
| gst   | git status      |
| gd    | git diff        |
| gb    | git branch      |
| gco   | git checkout    |
| gcb   | git checkout -b |

## Color Variables

Use in your own scripts:

```bash
printf "${GREEN}Success!${WHITE}\n"
printf "${RED}Error!${WHITE}\n"
printf "${YELLOW}Warning!${WHITE}\n"
```

Available: WHITE, BLACK, RED, GREEN, YELLOW, BLUE, PURPLE, CYAN, GRAY, BOLD_RED, BOLD_GREEN, BOLD_BLUE, BOLD_CYAN

## Prompt Features

- Shows username@hostname
- Colorized current path
- Git branch indicator (⎇ branch-name)
- Two-line prompt for cleaner look

## Tips & Tricks

1. **Chain commands**: Use `&&` for success chains, `||` for fallbacks

   ```bash
   mkcd project && git init
   ```

2. **Quick edits**:

   ```bash
   editb         # Opens in Cursor/VS Code
   ```

3. **Directory stack**:

   ```bash
   up 3          # Go up 3 levels
   -             # Go back
   ```

4. **File search**:

   ```bash
   find_file "*.js"   # Find all JS files
   ```

5. **Archive handling**:

   ```bash
   extract file.tar.gz    # Automatically detects type
   ```

6. **Safety**: rm, cp, mv ask for confirmation by default

## Getting Help

- `list` - Show all commands
- `listcommands` - Show commands only
- `listcolors` - Show color variables
- Check README.md for full documentation
