# Eza Configuration
if command -v eza >/dev/null 2>&1; then
    # General aliases
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -lh --icons --git --group-directories-first'
    alias la='eza -a --icons --group-directories-first'
    alias lt='eza --tree --level=2 --icons'
    
    # Environment variable to always use icons/colors if supported
    export EZA_ICONS_AUTO=1
else
    echo "Warning: eza is not installed. Falling back to native ls."
fi