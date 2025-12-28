# ~/.bash_profile
# Pretty Bash Setup with colors and emojis

# Color definitions
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Enable color support for ls
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    alias ls='ls -G'
fi

# Pretty ls aliases with emojis
alias ll='ls -lh'
alias la='ls -lha'
alias l='ls -CF'

# Colorize grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enhanced pwd with emoji
function pwde() {
    echo "📁 $(pwd)"
}

# Colorized prompt with git branch support
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set colorful prompt
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "

# Directory listing with emojis (function to show file types)
function lse() {
    ls -1 "$@" | while read -r file; do
        if [ -d "$file" ]; then
            echo "📁 $file"
        elif [ -x "$file" ]; then
            echo "⚙️  $file"
        elif [[ "$file" == *.md ]]; then
            echo "📝 $file"
        elif [[ "$file" == *.txt ]]; then
            echo "📄 $file"
        elif [[ "$file" == *.sh ]]; then
            echo "🔧 $file"
        elif [[ "$file" == *.py ]]; then
            echo "🐍 $file"
        elif [[ "$file" == *.js ]]; then
            echo "📜 $file"
        elif [[ "$file" == *.json ]]; then
            echo "📋 $file"
        elif [[ "$file" == *.zip || "$file" == *.tar.gz || "$file" == *.tar ]]; then
            echo "📦 $file"
        elif [[ "$file" == *.jpg || "$file" == *.png || "$file" == *.gif ]]; then
            echo "🖼️  $file"
        else
            echo "📄 $file"
        fi
    done
}

# Welcome message
echo "🎉 Pretty Bash Profile Loaded!"
echo "💡 Try: lse (ls with emojis), pwde (pwd with emoji), ll, la"
