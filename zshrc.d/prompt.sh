# Load the hook function module
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST

# --- Catppuccin Mocha Hex Palette ---
C_GREY="%F{#6c7086}"       
C_SAPPHIRE="%F{#74c7ec}"   
# C_SKY="%F{#89dceb}"        
C_SKY="%F{#cba6f7}"        
# C_MAROON="%F{#eba0ac}"     
C_MAROON="%F{#a6e3a1}"     
C_LAVENDER="%F{#b4befe}"   
C_WHITE="%F{#cdd6f4}"      
C_RESET="%f"

# --- Icons ---
ICON_PYTHON=""
ICON_DIR=""
ICON_GIT=""
ICON_TIME=""

# --- Git Status ---
get_git_info() {
    local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ -n "$branch" ]; then
        local status_symbol="±"
        [[ -n $(git status -s 2> /dev/null) ]] && status_symbol="●"
        echo -n "${status_symbol}${ICON_GIT} ${branch}"
    fi
}

# --- Prompt Construction ---
set_prompt_parts() {
    # Left Side Top (Conda + Path)
    # %B = Bold, %~ = Home-abbreviated path
    local left_top="%B${C_SAPPHIRE}${ICON_PYTHON} (${CONDA_DEFAULT_ENV:-base})${C_RESET}  ${C_SKY}${ICON_DIR} %~%b${C_RESET}"
    
    # Right Side Top (Git + Time)
    local git_raw=$(get_git_info)
    local right_top="${C_MAROON}${git_raw}${C_RESET}  ${C_GREY}${ICON_TIME} %*%{${C_RESET}%}"
    
    # Calculate Padding
    # We strip formatting to calculate visible width
    local raw_left="${ICON_PYTHON} (${CONDA_DEFAULT_ENV:-base})  ${ICON_DIR} ${(%):-%~}"
    local raw_right="${git_raw}  ${ICON_TIME} 00:00:00"
    
    # Determine how many spaces we need to push the right side to the edge
    local terwidth=$COLUMNS
    local left_len=${#raw_left}
    local right_len=${#raw_right}
    local padding=$(( terwidth - left_len - right_len ))
    
    local spacer=""
    if (( padding > 0 )); then
        spacer=$(printf '%*s' $padding)
    fi

    # Final Assembly
    # The first empty line \n keeps your history readable
    PROMPT="
${left_top}${spacer}${right_top}
${C_LAVENDER}╰─${C_RESET} ${C_SKY}→${C_RESET} "
}

# Apply the hook
add-zsh-hook precmd set_prompt_parts

# Ensure RPROMPT is empty to avoid the second-line clutter
RPROMPT=''