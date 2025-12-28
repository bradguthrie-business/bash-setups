# ~/.zshrc
# Pretty Zsh Setup with colors and emojis (optimized for macOS)

# Color definitions for ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Enable color support
alias ls='ls -G'

# Pretty ls aliases with descriptions
alias ll='ls -lh'        # Long format with human-readable sizes
alias la='ls -lha'       # Long format including hidden files
alias l='ls -CF'         # Compact format with indicators
alias lt='ls -lhtr'      # Sort by modification time (oldest first)

# Colorize grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enhanced pwd with emoji
function pwde() {
    echo "📁 $(pwd)"
}

# Directory listing with emojis (enhanced for zsh)
function lse() {
    ls -1 "$@" | while read -r file; do
        if [ -d "$file" ]; then
            echo "📁 $file"
        elif [ -L "$file" ]; then
            echo "🔗 $file"
        elif [ -x "$file" ]; then
            echo "⚙️  $file"
        elif [[ "$file" == *.md ]]; then
            echo "📝 $file"
        elif [[ "$file" == *.txt ]]; then
            echo "📄 $file"
        elif [[ "$file" == *.sh || "$file" == *.zsh ]]; then
            echo "🔧 $file"
        elif [[ "$file" == *.py ]]; then
            echo "🐍 $file"
        elif [[ "$file" == *.js || "$file" == *.ts ]]; then
            echo "📜 $file"
        elif [[ "$file" == *.json || "$file" == *.yaml || "$file" == *.yml ]]; then
            echo "📋 $file"
        elif [[ "$file" == *.zip || "$file" == *.tar.gz || "$file" == *.tar || "$file" == *.dmg ]]; then
            echo "📦 $file"
        elif [[ "$file" == *.jpg || "$file" == *.jpeg || "$file" == *.png || "$file" == *.gif || "$file" == *.svg ]]; then
            echo "🖼️  $file"
        elif [[ "$file" == *.mp4 || "$file" == *.mov || "$file" == *.avi ]]; then
            echo "🎬 $file"
        elif [[ "$file" == *.mp3 || "$file" == *.wav || "$file" == *.flac ]]; then
            echo "🎵 $file"
        elif [[ "$file" == *.pdf ]]; then
            echo "📕 $file"
        elif [[ "$file" == *.csv ]]; then
            echo "📊 $file"
        else
            echo "📄 $file"
        fi
    done
}

# Detailed listing with emojis and descriptions
function lsed() {
    ls -lh "$@" | tail -n +2 | while read -r perms links owner group size month day time file; do
        emoji="📄"
        if [[ "$perms" == d* ]]; then
            emoji="📁"
        elif [[ "$perms" == l* ]]; then
            emoji="🔗"
        elif [[ "$perms" == *x* ]]; then
            emoji="⚙️"
        elif [[ "$file" == *.md ]]; then
            emoji="📝"
        elif [[ "$file" == *.sh || "$file" == *.zsh ]]; then
            emoji="🔧"
        elif [[ "$file" == *.py ]]; then
            emoji="🐍"
        elif [[ "$file" == *.js || "$file" == *.ts ]]; then
            emoji="📜"
        elif [[ "$file" == *.json ]]; then
            emoji="📋"
        fi
        echo "$emoji  $perms $size $month $day $time $file"
    done
}

# Enable git info in prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST

# Colorful prompt with git branch
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}${vcs_info_msg_0_}%f%# '

# Zsh-specific enhancements
setopt AUTO_CD              # Auto cd when typing directory name
setopt HIST_IGNORE_DUPS     # Don't record duplicate commands
setopt SHARE_HISTORY        # Share history between sessions
setopt EXTENDED_GLOB        # Enable extended globbing

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Better tab completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Welcome message
echo "🎉 Pretty Zsh Profile Loaded!"
echo "💡 Try: lse (ls with emojis), lsed (detailed ls with emojis), pwde (pwd with emoji), ll, la"
