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
# C_GREY="\[\033[0;38;5;242m\]"    
# C_SAPPHIRE="\[\033[1;38;5;153m\]"
# C_SKY="\[\033[1;38;5;116m\]"     
# C_MAROON="\[\033[0;38;5;210m\]"  
# C_LAVENDER="\[\033[0;38;5;183m\]" 
# C_WHITE="\[\033[0;38;5;253m\]"
# C_RESET="\[\033[0m\]"

# # --- Icons ---
# ICON_PYTHON=""
# ICON_DIR=""
# ICON_GIT=""
# ICON_TIME=""

# get_git_info() {
#     local branch
#     branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
#     if [ -n "$branch" ]; then
#         local status_symbol="±"
#         [[ -n $(git status -s 2> /dev/null) ]] && status_symbol="●"
#         echo -n "${status_symbol}${ICON_GIT} ${branch}"
#     fi
# }

# set_prompt() {
#     # 1. Content for calculation (NO COLORS HERE)
#     local CONDA_RAW="${ICON_PYTHON} (${CONDA_DEFAULT_ENV:-base})"
#     local PATH_RAW="${ICON_DIR} ${PWD/#$HOME/\~}" # Manual ~ expansion for math
#     local GIT_RAW=$(get_git_info)
#     local TIME_RAW="${ICON_TIME} $(date +%H:%M:%S)"
    
#     # 2. Calculate actual visible length
#     local LEFT_LEN=$((${#CONDA_RAW} + ${#PATH_RAW} + 2))
#     local RIGHT_LEN=$((${#GIT_RAW} + ${#TIME_RAW} + 2))
#     local TERMWIDTH=$(tput cols)
    
#     # 3. Calculate Padding (Subtract 1 extra to be safe from line-wrap)
#     local PAD_LEN=$(( TERMWIDTH - LEFT_LEN - RIGHT_LEN - 1 ))
    
#     local FILLING=""
#     if [ $PAD_LEN -gt 0 ]; then
#         FILLING=$(printf '%*s' $PAD_LEN)
#     fi

#     # 4. Construct the Final PS1 with correctly wrapped colors
#     local LINE1="${C_SAPPHIRE}${CONDA_RAW}${C_RESET}  ${C_SKY}${PATH_RAW}${C_RESET}${FILLING}${C_MAROON}${GIT_RAW}${C_RESET}  ${C_GREY}${TIME_RAW}${C_RESET}"
#     local LINE2="${C_LAVENDER}╰─${C_RESET} ${C_SKY}→${C_RESET} "

#     PS1="\n${LINE1}\n${LINE2}"
# }
# PROMPT_COMMAND=set_prompt

# # 1. Wrap the logic in a function that can be called anytime
# update_prompt() {
#     set_prompt
# }

# # 2. "Trap" the window resize signal
# # This forces the prompt to redraw as you drag the window edge
# # Redraw the prompt whenever the terminal window is resized
# trap 'set_prompt; PS1="\n${LINE1}\n${LINE2}"; kill -INT $$ 2>/dev/null' SIGWINCH

#####
# ~/.bashrc.d/90-prompt.sh
# Custom two-line prompt with Catppuccin Mocha colors
# Compatible with iTerm2 catppuccin theme and Nerd Fonts

# ============================================================================
# CATPPUCCIN MOCHA PALETTE
# Colors wrapped in \[ \] for proper line wrapping
# ============================================================================

# C_GREY="\[\033[0;38;5;242m\]"
# C_SAPPHIRE="\[\033[1;38;5;153m\]"
# C_SKY="\[\033[1;38;5;116m\]"
# C_MAROON="\[\033[0;38;5;210m\]"
# C_LAVENDER="\[\033[0;38;5;183m\]"
# C_WHITE="\[\033[0;38;5;253m\]"
# C_RESET="\[\033[0m\]"

# # ============================================================================
# # NERD FONT ICONS
# # Ensure your terminal is using a Nerd Font (Hack Nerd Font in your case)
# # ============================================================================
# ICON_PYTHON=""
# ICON_DIR=""
# ICON_GIT=""
# ICON_TIME=""

# # ============================================================================
# # GIT INFORMATION FUNCTION
# # Shows current branch and status indicator
# # ============================================================================
# get_git_info() {
#     # Early exit if not in a git repo (fast check)
#     git rev-parse --git-dir &>/dev/null || return
    
#     local branch status_symbol
    
#     # Get current branch name
#     branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    
#     # Check if there are uncommitted changes (± for clean, ● for dirty)
#     if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
#         status_symbol="●"
#     else
#         status_symbol="±"
#     fi
    
#     echo -n "${status_symbol}${ICON_GIT} ${branch}"
# }

# # ============================================================================
# # PROMPT BUILDER
# # Constructs a two-line prompt with dynamic spacing
# # ============================================================================

# set_prompt() {
#     # Get terminal width
#     local TERMWIDTH=$(tput cols)
    
#     # === Build raw content (no colors) for length calculation ===
    
#     # Conda environment (always show if conda is active)
#     local CONDA_RAW=""
#     if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
#         CONDA_RAW="${ICON_PYTHON} (${CONDA_DEFAULT_ENV})  "
#     fi
    
#     # Current directory with ~ substitution
#     local PATH_RAW="${ICON_DIR} ${PWD/#$HOME/~}"
    
#     # Git info
#     local GIT_RAW=$(get_git_info)
#     [[ -n "$GIT_RAW" ]] && GIT_RAW="  ${GIT_RAW}"
    
#     # Current time
#     local TIME_RAW="  ${ICON_TIME} $(date +%H:%M:%S)"
    
#     # === Calculate visible lengths ===
    
#     local LEFT_LEN=${#CONDA_RAW}
#     ((LEFT_LEN += ${#PATH_RAW}))
    
#     local RIGHT_LEN=${#GIT_RAW}
#     ((RIGHT_LEN += ${#TIME_RAW}))
    
#     # Calculate padding (leave 1 char buffer to prevent wrapping)
#     local PAD_LEN=$((TERMWIDTH - LEFT_LEN - RIGHT_LEN - 1))
    
#     # Generate padding spaces
#     local FILLING=""
#     if ((PAD_LEN > 0)); then
#         FILLING=$(printf '%*s' "$PAD_LEN" "")
#     fi
    
#     # === Construct colored prompt ===
    
#     local CONDA_COLORED=""
#     [[ -n "$CONDA_RAW" ]] && CONDA_COLORED="${C_SAPPHIRE}${CONDA_RAW}${C_RESET}"
    
#     local LINE1="${CONDA_COLORED}${C_SKY}${PATH_RAW}${C_RESET}${FILLING}${C_MAROON}${GIT_RAW}${C_RESET}${C_GREY}${TIME_RAW}${C_RESET}"
#     local LINE2="${C_LAVENDER}╰─${C_RESET} ${C_SKY}→${C_RESET} "
    
#     PS1="\n${LINE1}\n${LINE2}"
# }

# # ============================================================================
# # PROMPT COMMAND SETUP
# # Updates prompt before each command
# # ============================================================================

# # Only set PROMPT_COMMAND if oh-my-bash isn't managing it
# if [[ "$PROMPT_COMMAND" != *"set_prompt"* ]]; then
#     PROMPT_COMMAND=set_prompt
# fi

# # Handle terminal resize events
# # This ensures the prompt redraws correctly when window is resized
# trap 'COLUMNS=$(tput cols)' WINCH


# Test claude version

# ~/.bashrc.d/90-prompt.sh
# Custom two-line prompt with Catppuccin Mocha colors
# Compatible with iTerm2 catppuccin theme and Nerd Fonts

# ============================================================================
# CATPPUCCIN MOCHA PALETTE
# Colors wrapped in \[ \] for proper line wrapping
# ============================================================================

# C_GREY="\[\033[0;38;5;242m\]"
# C_SAPPHIRE="\[\033[1;38;5;153m\]"
# C_SKY="\[\033[1;38;5;116m\]"
# C_MAROON="\[\033[0;38;5;210m\]"
# C_LAVENDER="\[\033[0;38;5;183m\]"
# C_PEACH="\[\033[0;38;5;217m\]"
# C_YELLOW="\[\033[0;38;5;229m\]"
# C_GREEN="\[\033[0;38;5;151m\]"
# C_WHITE="\[\033[0;38;5;253m\]"
# C_RESET="\[\033[0m\]"

# # Dimmed version for separator
# C_DIM="\[\033[2;38;5;242m\]"

# # ============================================================================
# # NERD FONT ICONS
# # Ensure your terminal is using a Nerd Font (Hack Nerd Font in your case)
# # ============================================================================

# ICON_PYTHON=""
# ICON_DIR=""
# ICON_GIT=""
# ICON_TIME=""
# ICON_SEPARATOR="─"  # Box drawing character for filling space

# # ============================================================================
# # GIT INFORMATION FUNCTION
# # Shows current branch and status indicator
# # ============================================================================

# get_git_info() {
#     # Early exit if not in a git repo (fast check)
#     git rev-parse --git-dir &>/dev/null || return
    
#     local branch status_symbol status_color
    
#     # Get current branch name
#     branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    
#     # Check if there are uncommitted changes
#     if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
#         status_symbol="●"  # Dirty
#         status_color="$C_MAROON"
#     else
#         status_symbol="✓"  # Clean
#         status_color="$C_GREEN"
#     fi
    
#     echo -n "${status_color}${status_symbol} ${ICON_GIT} ${branch}${C_RESET}"
# }

# # ============================================================================
# # PROMPT STYLE OPTIONS
# # Uncomment the style you prefer
# # ============================================================================

# # Style 1: Dots (subtle)
# # SEPARATOR_CHAR="·"
# # SEPARATOR_COLOR="$C_DIM"

# # Style 2: Thin line (clean)
# SEPARATOR_CHAR="─"
# SEPARATOR_COLOR="$C_DIM"

# # Style 3: Dashed line (segmented)
# # SEPARATOR_CHAR="╌"
# # SEPARATOR_COLOR="$C_DIM"

# # Style 4: Powerline-style arrow segments (bold)
# # SEPARATOR_CHAR="▶"
# # SEPARATOR_COLOR="$C_LAVENDER"

# # ============================================================================
# # PROMPT BUILDER
# # Constructs a two-line prompt with dynamic spacing
# # ============================================================================

# set_prompt() {
#     # Get terminal width
#     local TERMWIDTH=$(tput cols)
    
#     # === Build raw content (no colors) for length calculation ===
    
#     # Conda environment (always show if conda is active)
#     local CONDA_RAW=""
#     if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
#         CONDA_RAW="${ICON_PYTHON} (${CONDA_DEFAULT_ENV})"
#     fi
    
#     # Current directory with ~ substitution
#     local PATH_RAW="${ICON_DIR} ${PWD/#$HOME/~}"
    
#     # Git info (raw for length calculation)
#     local GIT_RAW_PLAIN=""
#     if git rev-parse --git-dir &>/dev/null 2>&1; then
#         local branch
#         branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
#         if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
#             GIT_RAW_PLAIN="● ${ICON_GIT} ${branch}"
#         else
#             GIT_RAW_PLAIN="✓ ${ICON_GIT} ${branch}"
#         fi
#     fi
    
#     # Current time
#     local TIME_RAW="${ICON_TIME} $(date +%H:%M:%S)"
    
#     # === Calculate visible lengths ===
    
#     local LEFT_LEN=0
#     [[ -n "$CONDA_RAW" ]] && LEFT_LEN=$((${#CONDA_RAW} + 3))  # +3 for spacing
#     ((LEFT_LEN += ${#PATH_RAW} + 2))  # +2 for spacing after path
    
#     local RIGHT_LEN=0
#     [[ -n "$GIT_RAW_PLAIN" ]] && RIGHT_LEN=$((${#GIT_RAW_PLAIN} + 3))  # +3 for spacing
#     ((RIGHT_LEN += ${#TIME_RAW} + 2))  # +2 for spacing before time
    
#     # Calculate padding (leave 1 char buffer to prevent wrapping)
#     local PAD_LEN=$((TERMWIDTH - LEFT_LEN - RIGHT_LEN - 1))
    
#     # Generate separator filling
#     local FILLING=""
#     if ((PAD_LEN > 0)); then
#         FILLING="${SEPARATOR_COLOR}"
#         for ((i=0; i<PAD_LEN; i++)); do
#             FILLING+="${SEPARATOR_CHAR}"
#         done
#         FILLING+="${C_RESET}"
#     fi
    
#     # === Construct colored prompt ===
    
#     # Left side
#     local LEFT_SIDE=""
#     if [[ -n "$CONDA_RAW" ]]; then
#         LEFT_SIDE="${C_SAPPHIRE}${CONDA_RAW}${C_RESET}  "
#     fi
#     LEFT_SIDE+="${C_SKY}${PATH_RAW}${C_RESET}"
    
#     # Right side
#     local RIGHT_SIDE=""
#     if [[ -n "$GIT_RAW_PLAIN" ]]; then
#         local GIT_COLORED=$(get_git_info)
#         RIGHT_SIDE+=" ${GIT_COLORED}"
#     fi
#     RIGHT_SIDE+="  ${C_GREY}${TIME_RAW}${C_RESET}"
    
#     # Combine with separator
#     local LINE1="${LEFT_SIDE} ${FILLING} ${RIGHT_SIDE}"
#     local LINE2="${C_LAVENDER}╰─${C_RESET} ${C_SKY}→${C_RESET} "
    
#     PS1="\n${LINE1}\n${LINE2}"
# }

# # ============================================================================
# # PROMPT COMMAND SETUP
# # Updates prompt before each command
# # ============================================================================

# # Only set PROMPT_COMMAND if oh-my-bash isn't managing it
# if [[ "$PROMPT_COMMAND" != *"set_prompt"* ]]; then
#     PROMPT_COMMAND=set_prompt
# fi

# # Handle terminal resize events
# trap 'COLUMNS=$(tput cols)' WINCH


# Esssentials addition

# ~/.bashrc.d/90-prompt.sh
# Custom two-line prompt with Catppuccin Mocha colors
# Compatible with iTerm2 catppuccin theme and Nerd Fonts

# ============================================================================
# CATPPUCCIN MOCHA PALETTE
# Colors wrapped in \[ \] for proper line wrapping
# ============================================================================

#rgb(220, 138, 120)

C_GREY="\[\033[0;38;5;242m\]"
C_SAPPHIRE="\[\033[1;38;5;153m\]"
C_SKY="\[\033[1;38;5;116m\]"
C_MAROON="\[\033[0;38;5;210m\]"
C_RED="\[\033[0;38;5;203m\]"
C_LAVENDER="\[\033[0;38;5;183m\]"
C_PEACH="\[\033[0;38;5;217m\]"
C_YELLOW="\[\033[0;38;5;229m\]"
C_GREEN="\[\033[0;38;5;151m\]"
C_WHITE="\[\033[0;38;5;253m\]"
C_RESET="\[\033[0m\]"

# Dimmed version for separator
C_DIM="\[\033[2;38;5;242m\]"

# # Nebula Palette (RGB) 
# C_GREY="\[\033[0;38;2;88;91;112m\]"          # #585b70 - Dark space grey
# C_SAPPHIRE="\[\033[1;38;2;116;199;236m\]"    # #74c7ec - Bright cyan-blue
# C_SKY="\[\033[1;38;2;137;220;235m\]"         # #89dceb - Bright cyan
# C_MAROON="\[\033[0;38;2;235;111;146m\]"      # #eb6f92 - Hot pink/magenta
# C_LAVENDER="\[\033[0;38;2;180;142;173m\]"    # #b48ead - Purple-lavender
# C_PEACH="\[\033[0;38;2;245;169;184m\]"       # #f5a9b8 - Pink-magenta
# C_YELLOW="\[\033[0;38;2;249;226;175m\]"      # #f9e2af - Soft yellow
# C_GREEN="\[\033[0;38;2;166;227;161m\]"       # #a6e3a1 - Teal-green
# C_RED="\[\033[0;38;2;243;139;168m\]"         # #f38ba8 - Bright magenta-red
# C_WHITE="\[\033[0;38;2;205;214;244m\]"       # #cdd6f4 - Bright white
# C_RESET="\[\033[0m\]"
# C_DIM="\[\033[2;38;2;88;91;112m\]"           # #585b70 - Dimmed grey


# # NEBULA PALETTE
# C_GREY="\[\033[0;38;5;240m\]"        # Dark grey (space dust)
# C_SAPPHIRE="\[\033[1;38;5;117m\]"    # Bright cyan-blue (ionized oxygen)
# C_SKY="\[\033[1;38;5;87m\]"          # Bright cyan (hot stars)
# C_MAROON="\[\033[0;38;5;198m\]"      # Hot magenta (hydrogen alpha)
# C_LAVENDER="\[\033[0;38;5;141m\]"    # Purple-lavender (nebula core)
# C_PEACH="\[\033[0;38;5;213m\]"       # Pink-magenta (star formation)
# C_YELLOW="\[\033[0;38;5;229m\]"      # Soft yellow (distant stars)
# C_GREEN="\[\033[0;38;5;120m\]"       # Teal-green (success indicator)
# C_RED="\[\033[0;38;5;197m\]"         # Bright magenta-red (error)
# C_WHITE="\[\033[0;38;5;231m\]"       # Bright white (hot core)
# C_RESET="\[\033[0m\]"
# C_DIM="\[\033[2;38;5;240m\]"         # Dimmed grey (separator)

# JWST PALETTE
# C_GREY="\[\033[0;38;5;237m\]"        # Deep grey-black (deep space)
# C_SAPPHIRE="\[\033[1;38;5;39m\]"     # Deep blue (cool gas)
# C_SKY="\[\033[1;38;5;81m\]"          # Cyan-blue (mid-infrared)
# C_MAROON="\[\033[0;38;5;202m\]"      # Deep orange-red (warm dust)
# C_LAVENDER="\[\033[0;38;5;105m\]"    # Blue-purple (NIRCam filter)
# C_PEACH="\[\033[0;38;5;216m\]"       # Warm peach-orange (stellar light)
# C_YELLOW="\[\033[0;38;5;221m\]"      # Golden amber (hot regions)
# C_GREEN="\[\033[0;38;5;42m\]"        # Teal-cyan (success)
# C_RED="\[\033[0;38;5;196m\]"         # Bright red (error/hot)
# C_WHITE="\[\033[0;38;5;231m\]"       # Bright white (stars)
# C_RESET="\[\033[0m\]"
# C_DIM="\[\033[2;38;5;237m\]"         # Dimmed deep grey (separator)

# HUBBLE HERITAGE PALETTE
# C_GREY="\[\033[0;38;5;239m\]"        # Dark grey (dust lanes)
# C_SAPPHIRE="\[\033[1;38;5;51m\]"     # Bright cyan (oxygen III)
# C_SKY="\[\033[1;38;5;87m\]"          # Cyan-aqua (ionized regions)
# C_MAROON="\[\033[0;38;5;167m\]"      # Deep red-orange (sulfur II)
# C_LAVENDER="\[\033[0;38;5;147m\]"    # Light blue-grey (neutral)
# C_PEACH="\[\033[0;38;5;222m\]"       # Warm gold (hydrogen alpha)
# C_YELLOW="\[\033[0;38;5;228m\]"      # Bright gold-yellow (stars)
# C_GREEN="\[\033[0;38;5;48m\]"        # Bright cyan-green (success)
# C_RED="\[\033[0;38;5;196m\]"         # Bright red (error)
# C_WHITE="\[\033[0;38;5;231m\]"       # Bright white (stars)
# C_RESET="\[\033[0m\]"
# C_DIM="\[\033[2;38;5;239m\]"         # Dimmed grey (separator)

# ============================================================================
# NERD FONT ICONS
# Ensure your terminal is using a Nerd Font (Hack Nerd Font in your case)
# ============================================================================

 ICON_PYTHON="" #""
ICON_DIR=""
ICON_GIT=""
ICON_TIME=""
ICON_USER=""
ICON_HOST=""
ICON_SUCCESS="✓"
ICON_FAILURE="✗"

# Separator character for filling space
SEPARATOR_CHAR="-" #"─"
SEPARATOR_COLOR="$C_DIM"

# ============================================================================
# GIT INFORMATION FUNCTION
# Shows current branch and status indicator
# ============================================================================
get_git_info() {
    # Early exit if not in a git repo (fast check)
    git rev-parse --git-dir &>/dev/null || return
    
    local branch status_symbol status_color
    
    # Get current branch name
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    
    # Check if there are uncommitted changes
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        status_symbol="●"  # Dirty
        status_color="$C_MAROON"
    else
        status_symbol="✓"  # Clean
        status_color="$C_GREEN"
    fi
    
    echo -n "${status_color}${status_symbol} ${ICON_GIT} ${branch}${C_RESET}"
}

# ============================================================================
# PROMPT BUILDER
# Constructs a two-line prompt with dynamic spacing
# ============================================================================

# set_prompt() {
#     # Capture exit status of last command FIRST (before anything else)
#     local EXIT_STATUS=$?
    
#     # Get terminal width
#     local TERMWIDTH=$(tput cols)
    
#     # === Build raw content (no colors) for length calculation ===
    
#     # Conda environment (always show if conda is active)
#     local CONDA_RAW=""
#     if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
#         CONDA_RAW="${ICON_PYTHON} (${CONDA_DEFAULT_ENV})"
#     fi
    
#     # Current directory with ~ substitution
#     local PATH_RAW="${ICON_DIR} ${PWD/#$HOME/\~}"
    
#     # Git info (raw for length calculation)
#     local GIT_RAW_PLAIN=""
#     if git rev-parse --git-dir &>/dev/null 2>&1; then
#         local branch
#         branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
#         if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
#             GIT_RAW_PLAIN="● ${ICON_GIT} ${branch}"
#         else
#             GIT_RAW_PLAIN="✓ ${ICON_GIT} ${branch}"
#         fi
#     fi
    
#     # Current time
#     local TIME_RAW="${ICON_TIME} $(date +%H:%M:%S)"
    
#     # === Calculate visible lengths ===
    
#     local LEFT_LEN=0
#     [[ -n "$CONDA_RAW" ]] && LEFT_LEN=$((LEFT_LEN + ${#CONDA_RAW} + 2))  # +2 for spacing
#     ((LEFT_LEN += ${#PATH_RAW} + 2))  # +2 for spacing after path
    
#     local RIGHT_LEN=0
#     [[ -n "$GIT_RAW_PLAIN" ]] && RIGHT_LEN=$((${#GIT_RAW_PLAIN} + 2))  # +2 for spacing
#     ((RIGHT_LEN += ${#TIME_RAW} + 2))  # +2 for spacing before time
    
#     # Calculate padding (leave 1 char buffer to prevent wrapping)
#     local PAD_LEN=$((TERMWIDTH - LEFT_LEN - RIGHT_LEN - 1))
    
#     # Generate separator filling
#     local FILLING=""
#     if ((PAD_LEN > 0)); then
#         FILLING="${SEPARATOR_COLOR}"
#         for ((i=0; i<PAD_LEN; i++)); do
#             FILLING+="${SEPARATOR_CHAR}"
#         done
#         FILLING+="${C_RESET}"
#     fi
    
#     # === Construct colored prompt ===
    
#     # Line 0: Hostname (always show)
#     local HOSTNAME_SHORT="${HOSTNAME%%.*}"
#     local LINE0="${C_PEACH}${ICON_USER} ${USER}@${HOSTNAME_SHORT}${C_RESET}\n"
    
#     # Left side (Line 1)
#     local LEFT_SIDE=""
#     if [[ -n "$CONDA_RAW" ]]; then
#         LEFT_SIDE="${C_SAPPHIRE}${CONDA_RAW}${C_RESET}  "
#     fi
#     LEFT_SIDE+="${C_SKY}${PATH_RAW}${C_RESET}"
    
#     # Right side
#     local RIGHT_SIDE=""
#     if [[ -n "$GIT_RAW_PLAIN" ]]; then
#         local GIT_COLORED=$(get_git_info)
#         RIGHT_SIDE+="${GIT_COLORED}"
#     fi
#     RIGHT_SIDE+="  ${C_GREY}${TIME_RAW}${C_RESET}"
    
#     # Exit status indicator for line 2
#     local STATUS_INDICATOR=""
#     if [[ $EXIT_STATUS -ne 0 ]]; then
#         STATUS_INDICATOR="${C_RED}${ICON_FAILURE}${C_RESET} "
#     fi
    
#     # Combine everything
#     local LINE1="${LEFT_SIDE} ${FILLING} ${RIGHT_SIDE}"
#     local LINE2="${C_LAVENDER}╰─${C_RESET} ${STATUS_INDICATOR}${C_SKY}→${C_RESET} "
    
#     PS1="\n${LINE0}${LINE1}\n${LINE2}"
# }

# # ============================================================================
# # PROMPT COMMAND SETUP
# # Updates prompt before each command
# # ============================================================================

# # Only set PROMPT_COMMAND if oh-my-bash isn't managing it
# if [[ "$PROMPT_COMMAND" != *"set_prompt"* ]]; then
#     PROMPT_COMMAND=set_prompt
# fi

# # Handle terminal resize events
# trap 'COLUMNS=$(tput cols)' WINCH

set_prompt() {
    # Capture exit status of last command FIRST (before anything else)
    local EXIT_STATUS=$?
    
    # Set terminal window title to user@host:pwd
    local HOSTNAME_SHORT="${HOSTNAME%%.*}"
    # local CURRENT_DIR="${PWD/#$HOME/\~}"
    local CURRENT_DIR=""
    # echo -ne "\033]0;${USER}@${HOSTNAME_SHORT}:${CURRENT_DIR}\007"
    echo -ne "\033]0;${USER}@${HOSTNAME_SHORT}\007"
    
    # Get terminal width
    local TERMWIDTH=$(tput cols)
    
    # === Build raw content (no colors) for length calculation ===
    
    # Conda environment (always show if conda is active)
    local CONDA_RAW=""
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        CONDA_RAW="${ICON_PYTHON} (${CONDA_DEFAULT_ENV})"
    fi
    
    # Current directory with ~ substitution
    local PATH_RAW="${ICON_DIR} ${PWD/#$HOME/~}"
    
    # Git info (raw for length calculation)
    local GIT_RAW_PLAIN=""
    if git rev-parse --git-dir &>/dev/null 2>&1; then
        local branch
        branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
            GIT_RAW_PLAIN="● ${ICON_GIT} ${branch}"
        else
            GIT_RAW_PLAIN="✓ ${ICON_GIT} ${branch}"
        fi
    fi
    
    # Current time
    local TIME_RAW="${ICON_TIME} $(date +%H:%M:%S)"
    
    # === Calculate visible lengths ===
    
    local LEFT_LEN=0
    [[ -n "$CONDA_RAW" ]] && LEFT_LEN=$((LEFT_LEN + ${#CONDA_RAW} + 2))  # +2 for spacing
    ((LEFT_LEN += ${#PATH_RAW} + 2))  # +2 for spacing after path
    
    local RIGHT_LEN=0
    [[ -n "$GIT_RAW_PLAIN" ]] && RIGHT_LEN=$((${#GIT_RAW_PLAIN} + 2))  # +2 for spacing
    ((RIGHT_LEN += ${#TIME_RAW} + 2))  # +2 for spacing before time
    
    # Calculate padding (leave 1 char buffer to prevent wrapping)
    local PAD_LEN=$((TERMWIDTH - LEFT_LEN - RIGHT_LEN - 1))
    
    # Generate separator filling
    local FILLING=""
    if ((PAD_LEN > 0)); then
        FILLING="${SEPARATOR_COLOR}"
        for ((i=0; i<PAD_LEN; i++)); do
            FILLING+="${SEPARATOR_CHAR}"
        done
        FILLING+="${C_RESET}"
    fi
    
    # === Construct colored prompt ===
    
    # Left side (Line 1)
    local LEFT_SIDE=""
    if [[ -n "$CONDA_RAW" ]]; then
        LEFT_SIDE="${C_SAPPHIRE}${CONDA_RAW}${C_RESET}  "
    fi
    LEFT_SIDE+="${C_SKY}${PATH_RAW}${C_RESET}"
    
    # Right side
    local RIGHT_SIDE=""
    if [[ -n "$GIT_RAW_PLAIN" ]]; then
        local GIT_COLORED=$(get_git_info)
        RIGHT_SIDE+="${GIT_COLORED}"
    fi
    RIGHT_SIDE+="  ${C_GREY}${TIME_RAW}${C_RESET}"
    
    # Exit status indicator for line 2
    local STATUS_INDICATOR=""
    if [[ $EXIT_STATUS -ne 0 ]]; then
        STATUS_INDICATOR="${C_RED}${ICON_FAILURE}${C_RESET} "
    fi
    
    # Combine everything
    local LINE1="${LEFT_SIDE} ${FILLING} ${RIGHT_SIDE}"
    local LINE2="${C_LAVENDER}╰─${C_RESET} ${STATUS_INDICATOR}${C_SKY}→${C_RESET} "
    
    PS1="\n${LINE1}\n${LINE2}"
}

# ============================================================================
# PROMPT COMMAND SETUP
# Updates prompt before each command
# ============================================================================

# Only set PROMPT_COMMAND if oh-my-bash isn't managing it
if [[ "$PROMPT_COMMAND" != *"set_prompt"* ]]; then
    PROMPT_COMMAND=set_prompt
fi

# Handle terminal resize events
trap 'COLUMNS=$(tput cols)' WINCH