# # Eza Configuration
if command -v eza >/dev/null 2>&1; then
    # Base Aliases
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -lh --icons --git --group-directories-first --time-style=long-iso'
    alias la='eza -a --icons --git --group-directories-first'
    alias lt='eza --tree --level=2 --icons'
    
    # Specialty Aliases
    alias ldir='eza -D --icons'              # List ONLY directories
    alias lnew='eza -lh --sort=modified'     # Sort by newest first
    
    # Global Settings
    export EZA_ICONS_AUTO=1
else
    alias ls='ls --color=auto'
    echo "eza not found, falling back to ls"
fi