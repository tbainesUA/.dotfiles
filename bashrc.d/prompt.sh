# # # --- Catppuccin Mocha Palette ---
# # C_TIME="\[\033[0;38;5;242m\]"    # Muted Gray
# # C_CONDA="\[\033[1;38;5;153m\]"   # Sapphire (Bold)
# # C_USER="\[\033[0;38;5;212m\]"    # Flamingo
# # C_HOST="\[\033[0;38;5;183m\]"    # Lavender
# # C_DIR="\[\033[1;38;5;116m\]"     # Sky/Teal (Bold)
# # C_GIT="\[\033[0;38;5;210m\]"     # Maroon
# # C_WHITE="\[\033[0;38;5;253m\]"   # Off-white
# # C_RESET="\[\033[0m\]"

# # # --- Git Status Function (TEXT ONLY) ---
# # # We removed all color codes from inside here to prevent rendering errors
# # parse_git_status() {
# #     local branch
# #     branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    
# #     if [ -n "$branch" ]; then
# #         local status_symbol="±"
# #         if [[ -n $(git status -s 2> /dev/null) ]]; then
# #             status_symbol="●" 
# #         fi
# #         # Just return the plain text string
# #         echo -n "${status_symbol}|${branch}|"
# #     fi
# # }

# # # --- Build the Prompt ---
# # set_prompt() {
# #     local CONDA_INFO=""
# #     if [[ -n $CONDA_DEFAULT_ENV ]]; then
# #         CONDA_INFO="${C_CONDA}(${CONDA_DEFAULT_ENV})${C_RESET} "
# #     fi

# #     # We wrap the function call in the Git color codes here in PS1
# #     PS1="${C_TIME}\t ${C_RESET}${CONDA_INFO}${C_USER}\u${C_RESET}@${C_HOST}\h ${C_DIR}\W ${C_RESET}${C_GIT}\$(parse_git_status)${C_RESET} ${C_WHITE}→${C_RESET} "
# # }

# # PROMPT_COMMAND=set_prompt


# # ====================

# # --- Catppuccin Mocha Palette ---
# # C_TIME="\[\033[0;38;5;242m\]"    # Muted Gray
# # C_CONDA="\[\033[1;38;5;153m\]"   # Sapphire (Bold)
# # C_USER="\[\033[0;38;5;212m\]"    # Flamingo
# # C_HOST="\[\033[0;38;5;183m\]"    # Lavender
# # C_DIR="\[\033[1;38;5;116m\]"     # Sky/Teal (Bold)
# # C_GIT="\[\033[0;38;5;210m\]"     # Maroon
# # C_WHITE="\[\033[0;38;5;253m\]"   # Off-white
# # C_RESET="\[\033[0m\]"

# # # --- Git Status Function (Text Only) ---
# # parse_git_status() {
# #     local branch
# #     branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    
# #     if [ -n "$branch" ]; then
# #         local status_symbol="±"
# #         if [[ -n $(git status -s 2> /dev/null) ]]; then
# #             status_symbol="●" 
# #         fi
# #         echo -n "${status_symbol}|${branch}|"
# #     fi
# # }

# # # --- Build the Prompt ---
# # set_prompt() {
# #     local CONDA_INFO=""
# #     if [[ -n $CONDA_DEFAULT_ENV ]]; then
# #         CONDA_INFO="${C_CONDA}(${CONDA_DEFAULT_ENV})${C_RESET} "
# #     fi

# #     # Line 1: Metadata
# #     # Line 2: The connector and the input arrow
# #     local LINE_1="${C_TIME}\t ${C_RESET}${CONDA_INFO}${C_USER}\u${C_RESET}@${C_HOST}\h ${C_DIR}\W ${C_RESET}${C_GIT}\$(parse_git_status)${C_RESET}"
# #     local LINE_2="${C_WHITE}╰─${C_RESET} ${C_WHITE}→${C_RESET} "

# #     PS1="\n${LINE_1}\n${LINE_2}"
# # }

# # PROMPT_COMMAND=set_prompt

# # =============

# # --- Catppuccin Mocha Palette ---
# C_GREY="\[\033[0;38;5;242m\]"    # Muted
# C_SAPPHIRE="\[\033[1;38;5;153m\]" # Conda (Bold)
# C_SKY="\[\033[1;38;5;116m\]"     # Path (Bold)
# C_MAROON="\[\033[0;38;5;210m\]"  # Git
# C_LAVENDER="\[\033[0;38;5;183m\]" # User/Host
# C_RESET="\[\033[0m\]"

# # --- Icons (Nerd Font) ---
# ICON_PYTHON=""
# ICON_DIR=""
# ICON_GIT=""
# ICON_TIME=""

# # --- Helper: Get Git Status ---
# get_git_info() {
#     local branch
#     branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
#     if [ -n "$branch" ]; then
#         local status_symbol="±"
#         [[ -n $(git status -s 2> /dev/null) ]] && status_symbol="●"
#         echo -n "${status_symbol}${ICON_GIT} ${branch}"
#     fi
# }

# # --- Main Prompt Function ---
# set_prompt() {
#     local EXIT_CODE=$?
    
#     # 1. Left Side Content
#     local CONDA_PART="${ICON_PYTHON} (${CONDA_DEFAULT_ENV:-base})"
#     # PRO TIP: \w is full path, \W is folder, 3\w shows last 3 directories
#     local PATH_PART="${ICON_DIR} \w"
#     local LEFT_STR="${CONDA_PART}  ${PATH_PART}"

#     # 2. Right Side Content
#     local GIT_PART=$(get_git_info)
#     local TIME_PART="${ICON_TIME} \t"
#     local RIGHT_STR="${GIT_PART}  ${TIME_PART}"

#     # 3. Calculate Padding
#     # We strip the escape codes to get the "real" character length
#     local TERMWIDTH=$(tput cols)
#     local LEFT_LEN=$(echo -n "${LEFT_STR//\\/}" | wc -c)
#     local RIGHT_LEN=$(echo -n "${RIGHT_STR//\\/}" | wc -c)
#     local PAD_LEN=$(( TERMWIDTH - LEFT_LEN - RIGHT_LEN ))
    
#     # Generate the string of spaces
#     local FILLING=""
#     if [ $PAD_LEN -gt 0 ]; then
#         FILLING=$(printf '%*s' $PAD_LEN)
#     fi

#     # 4. Assemble the final PS1
#     # System info is placed in the padding area as a "watermark" (Opaque)
#     local SYSTEM_INFO="${C_GREY} \u@\h ${C_RESET}"
    
#     PS1="\n${C_SAPPHIRE}${CONDA_PART}${C_RESET}  ${C_SKY}${PATH_PART}${C_RESET}${FILLING}${C_MAROON}${GIT_PART}${C_RESET}  ${C_GREY}${TIME_PART}${C_RESET}\n${C_LAVENDER}╰─${C_RESET} ${C_SKY}→${C_RESET} "
# }

# PROMPT_COMMAND=set_prompt

# --- Catppuccin Mocha Palette (Wrapped for Zero-Width) ---
C_GREY="\[\033[0;38;5;242m\]"    
C_SAPPHIRE="\[\033[1;38;5;153m\]"
C_SKY="\[\033[1;38;5;116m\]"     
C_MAROON="\[\033[0;38;5;210m\]"  
C_LAVENDER="\[\033[0;38;5;183m\]" 
C_WHITE="\[\033[0;38;5;253m\]"
C_RESET="\[\033[0m\]"

# --- Icons ---
ICON_PYTHON=""
ICON_DIR=""
ICON_GIT=""
ICON_TIME=""

get_git_info() {
    local branch
    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ -n "$branch" ]; then
        local status_symbol="±"
        [[ -n $(git status -s 2> /dev/null) ]] && status_symbol="●"
        echo -n "${status_symbol}${ICON_GIT} ${branch}"
    fi
}

set_prompt() {
    # 1. Content for calculation (NO COLORS HERE)
    local CONDA_RAW="${ICON_PYTHON} (${CONDA_DEFAULT_ENV:-base})"
    local PATH_RAW="${ICON_DIR} ${PWD/#$HOME/\~}" # Manual ~ expansion for math
    local GIT_RAW=$(get_git_info)
    local TIME_RAW="${ICON_TIME} $(date +%H:%M:%S)"
    
    # 2. Calculate actual visible length
    local LEFT_LEN=$((${#CONDA_RAW} + ${#PATH_RAW} + 2))
    local RIGHT_LEN=$((${#GIT_RAW} + ${#TIME_RAW} + 2))
    local TERMWIDTH=$(tput cols)
    
    # 3. Calculate Padding (Subtract 1 extra to be safe from line-wrap)
    local PAD_LEN=$(( TERMWIDTH - LEFT_LEN - RIGHT_LEN - 1 ))
    
    local FILLING=""
    if [ $PAD_LEN -gt 0 ]; then
        FILLING=$(printf '%*s' $PAD_LEN)
    fi

    # 4. Construct the Final PS1 with correctly wrapped colors
    local LINE1="${C_SAPPHIRE}${CONDA_RAW}${C_RESET}  ${C_SKY}${PATH_RAW}${C_RESET}${FILLING}${C_MAROON}${GIT_RAW}${C_RESET}  ${C_GREY}${TIME_RAW}${C_RESET}"
    local LINE2="${C_LAVENDER}╰─${C_RESET} ${C_SKY}→${C_RESET} "

    PS1="\n${LINE1}\n${LINE2}"
}
PROMPT_COMMAND=set_prompt

# 1. Wrap the logic in a function that can be called anytime
update_prompt() {
    set_prompt
}

# 2. "Trap" the window resize signal
# This forces the prompt to redraw as you drag the window edge
# Redraw the prompt whenever the terminal window is resized
trap 'set_prompt; PS1="\n${LINE1}\n${LINE2}"; kill -INT $$ 2>/dev/null' SIGWINCH
