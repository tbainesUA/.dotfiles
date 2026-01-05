# # # Eza Configuration
# if command -v eza >/dev/null 2>&1; then
#     # Base Aliases
#     alias ls='eza --icons --group-directories-first'
#     alias ll='eza -lh --icons --git --group-directories-first --time-style=long-iso'
#     alias la='eza -a --icons --git --group-directories-first'
#     alias lt='eza --tree --level=2 --icons'
    
#     # Specialty Aliases
#     alias ldir='eza -D --icons'              # List ONLY directories
#     alias lnew='eza -lh --sort=modified'     # Sort by newest first
    
#     # Global Settings
#     export EZA_ICONS_AUTO=1
# else
#     alias ls='ls --color=auto'
#     echo "eza not found, falling back to ls"
# fi

# ~/.bashrc.d/30-eza.sh
# Eza configuration - modern replacement for ls
# Requires: eza (brew install eza) and Nerd Fonts for icons

# ============================================================================
# CHECK IF EZA IS INSTALLED
# ============================================================================

if ! command -v eza >/dev/null 2>&1; then
    # Fallback to standard ls with colors if eza not found
    alias ls='ls --color=auto'
    alias ll='ls -lh'
    alias la='ls -A'
    echo "⚠️  eza not found, falling back to standard ls. Install with: brew install eza"
    return
fi

# ============================================================================
# GLOBAL EZA SETTINGS
# ============================================================================

# Enable icons automatically (requires Nerd Fonts)
export EZA_ICONS_AUTO=1

# Customize colors (optional - uncomment to use)
# export EZA_COLORS="da=1;34:gm=1;33"  # directories=blue, git modified=yellow

# ============================================================================
# BASIC ALIASES - Replacements for standard ls commands
# ============================================================================

# Standard ls replacement
alias ls='eza --icons --group-directories-first'

# Long format with human-readable sizes
alias ll='eza -lh --icons --git --group-directories-first --time-style=long-iso'

# Show all files (including hidden)
alias la='eza -lah --icons --git --group-directories-first --time-style=long-iso'

# List only (no details)
alias l='eza --icons --group-directories-first'

# ============================================================================
# DIRECTORY-SPECIFIC ALIASES
# ============================================================================

# List ONLY directories
alias ldir='eza -D --icons'

# List ONLY directories with details
alias ldirl='eza -lhD --icons --time-style=long-iso'

# ============================================================================
# SORTING ALIASES
# ============================================================================

# Sort by modification time (newest first)
alias lnew='eza -lh --icons --sort=modified --reverse'

# Sort by size (largest first)
alias lsize='eza -lh --icons --sort=size --reverse'

# Sort by extension
alias lext='eza -lh --icons --sort=extension'

# Sort by file type
alias ltype='eza -lh --icons --sort=type'

# ============================================================================
# TREE VIEW ALIASES
# ============================================================================

# Tree view - 2 levels
alias lt='eza --tree --level=2 --icons'

# Tree view - 3 levels
alias lt3='eza --tree --level=3 --icons'

# Tree view - all levels (use with caution in large directories)
alias ltall='eza --tree --icons'

# Tree view with details
alias ltl='eza --tree --level=2 --icons -lh --time-style=long-iso'

# Tree view - directories only
alias ltdir='eza --tree --level=2 --icons -D'

# ============================================================================
# GIT-AWARE ALIASES
# ============================================================================

# Show git status in listing
alias lg='eza -lh --icons --git --git-ignore --group-directories-first'

# Show ONLY git-modified files
alias lgm='eza -lh --icons --git --git-ignore | grep -E "^.M|^M"'

# Long format with git status details
alias lgg='eza -lh --icons --git --group-directories-first --time-style=long-iso'

# ============================================================================
# SPECIALTY ALIASES - Useful for specific tasks
# ============================================================================

# Show only files (no directories)
alias lf='eza -lh --icons -f --group-directories-first'

# Show inode numbers (useful for hard link debugging)
alias li='eza -lh --icons --inode'

# Show file permissions in octal
alias lperm='eza -lh --icons --octal-permissions'

# Show extended attributes (macOS)
alias lattr='eza -lh@ --icons'

# One file per line (useful for scripting)
alias l1='eza -1 --icons'

# ============================================================================
# SCIENCE/ASTRONOMY SPECIFIC ALIASES (Optional)
# Uncomment if useful for your JWST/NIRISS work
# ============================================================================

# List FITS files
alias lfits='eza -lh --icons | grep -i ".fits"'

# List Python files
alias lpy='eza -lh --icons | grep -i ".py$"'

# List Jupyter notebooks
alias lnb='eza -lh --icons | grep -i ".ipynb"'

# List data files (common astronomy formats)
alias ldata='eza -lh --icons | grep -iE "\.(fits|csv|hdf5|h5|dat|txt)$"'

# ============================================================================
# FUNCTION: Interactive tree with depth control
# ============================================================================

# Usage: ltt [depth]
# Example: ltt 4  (shows tree 4 levels deep)
ltt() {
    local depth=${1:-2}  # Default to 2 levels if not specified
    eza --tree --level="$depth" --icons
}

# Usage: lttl [depth]
# Tree with details
lttl() {
    local depth=${1:-2}
    eza --tree --level="$depth" --icons -lh --time-style=long-iso
}

# ============================================================================
# FUNCTION: List files modified in last N days
# ============================================================================

# Usage: lrecent [days]
# Example: lrecent 7  (files modified in last 7 days)
lrecent() {
    local days=${1:-1}  # Default to 1 day if not specified
    find . -maxdepth 1 -mtime -"$days" -exec eza -lh --icons --time-style=long-iso {} \;
}

# ============================================================================
# NOTES
# ============================================================================
# 
# Eza color customization:
# You can customize colors by setting EZA_COLORS environment variable
# Format: EZA_COLORS="key=value:key=value"
# 
# Common keys:
# - da (directory)
# - di (directory icon)
# - ex (executable)
# - fi (file)
# - ln (symlink)
# - gm (git modified)
# - ga (git added)
# - gd (git deleted)
# 
# Example:
# export EZA_COLORS="da=1;34:gm=1;33:ga=1;32:gd=1;31"
# 
# For full documentation: https://github.com/eza-community/eza
# ============================================================================