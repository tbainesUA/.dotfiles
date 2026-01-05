# .dotfiles

Personal dotfiles repository for customizable shell settings and configurations.

System Config Settings for various things for productivity and styling

iterm2
tmux

stsci

WORK IN PROGRESS

## Overview

This repository contains my personal shell configuration files, organized in a modular structure for easy maintenance and portability across machines.

**Current Shell:** Bash (with plans to explore zsh in the future)  
**Terminal:** iTerm2 with Catppuccin Mocha theme  
**Font:** Hack Nerd Font (with icon support)

## Repository Structure (draft)

```
.dotfiles/
├── bash_profile          # Login shell initialization (sources bashrc + conda)
├── bashrc                # Interactive shell config (oh-my-bash + modular loading)
├── bashrc.d/             # Modular bash configurations
│   ├── 00-environment.sh # Core environment variables (EDITOR, CLICOLOR, etc.)
│   ├── 10-paths.sh       # PATH modifications (DS9, XPA, etc.)
│   ├── 20-aliases.sh     # Personal aliases
│   ├── 30-eza.sh         # Eza (better ls) configuration
│   ├── 90-prompt.sh      # Custom two-line prompt with git info
│   └── 99-work-loader.sh # Loads work-specific dotfiles if present
├── zshrc                 # (Future) zsh configuration
├── zshrc.d/              # (Future) Modular zsh configurations
│   └── prompt.sh
├── install.sh            # (Future) Installation script for symlinking
├── README.md             # This file
└── TODO.md               # Project task list
```

## Features

### Custom Prompt (`bashrc.d/90-prompt.sh`)

A beautiful two-line prompt with:
- **Conda environment display** - Shows active conda environment (including base)
- **Current directory** - With `~` substitution for home directory
- **Git integration** - Shows branch name and status:
  - `✓  branch` - Clean repository (green)
  - `●  branch` - Dirty repository (maroon/red)
- **Current time** - HH:MM:SS format
- **Exit status indicator** - Red `✗` appears on line 2 when last command fails
- **Terminal title** - Sets window and tab titles with `user@host:path`
  - Window title: `tbaines@vamrax2022:~/.dotfiles` (full path)
  - Tab title: `vamrax2022:.dotfiles` (short, scannable)
- **Dynamic spacing** - Fills space between left and right info with `─` separator
- **Catppuccin Mocha colors** - Matches iTerm2 theme


```bash
 (base)   ~/.dotfiles --------------------------------------------------------- ✓  main   00:25:38
╰─ →
```

### Oh-My-Bash Integration

Using oh-my-bash framework with:
- **Theme:** `font` (currently, may be overridden by custom prompt)
- **Completions:** git, composer, ssh
- **Aliases:** general
- **Plugins:** git, bashmarks

### Modular Configuration System

Configurations are split into logical modules in `~/.bashrc.d/`:
- **Numbered prefixes** (00-, 10-, etc.) control load order
- **Easily enable/disable** by renaming or removing files
- **Clean separation** of concerns (environment, paths, aliases, prompt)

### Work-Specific Configuration Support

The system can load work-specific configurations from a separate repository:
- Work configs stored in `~/.dotfiles-work/` (separate private repo)
- Automatically loaded if present via `99-work-loader.sh`
- Keeps sensitive/proprietary configs separate from public dotfiles

## Installation

**⚠️ Not yet implemented - manual setup required for now**

### Current Manual Setup Process

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Backup existing configurations:**
   ```bash
   mkdir -p ~/dotfiles-backup
   cp ~/.bash_profile ~/dotfiles-backup/bash_profile.bak
   cp ~/.bashrc ~/dotfiles-backup/bashrc.bak
   ```

3. **Create symbolic links:**
   ```bash
   ln -s ~/.dotfiles/bash_profile ~/.bash_profile
   ln -s ~/.dotfiles/bashrc ~/.bashrc
   ln -s ~/.dotfiles/bashrc.d ~/.bashrc.d
   ```

4. **Reload your shell:**
   ```bash
   source ~/.bash_profile
   ```

### Future Install Script

The `install.sh` script will automate:
- Backing up existing dotfiles to `~/dotfiles-backup/`
- Creating symlinks from home directory to repository
- Detecting and preserving machine-specific configurations
- Optional work-specific dotfiles setup

## Configuration Guidelines

### Personal vs Work Configs

**Personal dotfiles (this repo):**
- General shell configuration
- Personal aliases and functions
- Tool configurations (eza, etc.)
- Portable settings that work across machines

**Work dotfiles (separate private repo):**
- Company/institution-specific paths (e.g., STScI paths like `/grp/hst/cdbs/`)
- Work project configurations (JWST, NIRISS, SOSS, etc.)
- Internal network paths
- API tokens and credentials (git-ignored)

### Adding New Configurations

1. Create a new file in `~/.bashrc.d/` with appropriate prefix:
   - `00-` for core environment variables
   - `10-` for PATH modifications
   - `20-` for aliases
   - `30-50` for tool-specific configs
   - `90-` for prompt/display settings
   - `99-` for loaders/final hooks

2. Make it executable (optional but recommended):
   ```bash
   chmod +x ~/.bashrc.d/your-config.sh
   ```

3. Source your bashrc to test:
   ```bash
   source ~/.bashrc
   ```

## Tools & Dependencies

### Required
- **Bash** - Version 4.0+ recommended
- **Git** - For version control and git prompt features
- **oh-my-bash** - Framework for bash configuration

### Optional
- **Conda/Miniconda** - For Python environment management (prompt shows active env)
- **Eza** - Modern replacement for `ls` with better colors/icons
- **Hack Nerd Font** - For icon support in prompt and eza
- **iTerm2** - Recommended terminal emulator (macOS)

### Installing Dependencies

**oh-my-bash:**
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
```

**Eza (macOS):**
```bash
brew install eza
```

**Hack Nerd Font:**
Download from [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

## Customization

### Changing Prompt Colors

Edit `~/.bashrc.d/90-prompt.sh` and modify the Catppuccin color variables:
```bash
C_SAPPHIRE="\[\033[1;38;5;153m\]"  # Conda env color
C_SKY="\[\033[1;38;5;116m\]"       # Path color
C_MAROON="\[\033[0;38;5;210m\]"    # Git dirty status
# ... etc
```

### Changing Separator Style

In `90-prompt.sh`, modify:
```bash
SEPARATOR_CHAR="─"   # Options: ─, ·, ╌, ▶
SEPARATOR_COLOR="$C_DIM"
```

### Disabling oh-my-bash Theme

To use only the custom prompt, set in `~/.bashrc`:
```bash
OSH_THEME=""
```

## Future Plans

- [ ] Explore and migrate to **zsh** (separate branch)
- [ ] Create comprehensive **install.sh** script
- [ ] Add more tool configurations (vim, tmux, etc.)
- [ ] Document work-specific dotfiles structure
- [ ] Create uninstall script
- [ ] Add machine-specific configuration detection

## Notes

- **Knowledge cutoff:** Building these configs while learning bash/zsh
- **Machine:** macOS (paths and tools may need adjustment for Linux)
- **Approach:** Starting simple, adding complexity as needed
- **Philosophy:** Modular, maintainable, documented

## Resources

- [oh-my-bash documentation](https://github.com/ohmybash/oh-my-bash)
- [Catppuccin theme](https://github.com/catppuccin/catppuccin)
- [Eza documentation](https://github.com/eza-community/eza)
- [Nerd Fonts](https://www.nerdfonts.com/)

## License

Personal use only. Feel free to fork and adapt for your own needs.