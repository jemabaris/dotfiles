# ❄️ Arch Linux Dotfiles

Welcome to my dotfiles repository! This is a collection of configuration files for my Arch Linux environment.

## 🚀 Overview

This setup is designed for a modern, tiling window manager experience on Wayland, focusing on efficiency, aesthetics, and productivity.

## 🛠️ Core Components

### 🖥️ Window Management & UI
- **Hyprland**: Dynamic tiling Wayland compositor.
- **Waybar**: Highly customizable status bar.
- **Rofi**: Window switcher and application launcher (includes custom collection).
- **GTK 3.0/4.0**: Specialized GTK theme and settings for visual consistency.

### 🐚 Shell & Terminal
- **Zsh**: Primary shell featuring:
  - **Starship**: Fast, customizable shell prompt.
  - **Powerlevel10k**: Advanced prompt configuration (`.p10k.zsh`).
  - **Fzf**: General-purpose command-line fuzzy finder.
- **Nushell**: A modern shell with a structured data approach.
- **Terminals**:
  - **Kitty**: Feature-rich, GPU-accelerated terminal.
  - **Ghostty**: High-performance terminal emulator.
  - **WezTerm**: Multiplexing terminal emulator (`.wezterm.lua`).

### ✍️ Editors & IDEs
- **Neovim**: Configured with **LazyVim** for a full IDE-like experience.
- **Zed**: High-performance multi-player code editor.

### 📦 Multiplexers & File Managers
- **Tmux**: Terminal multiplexer (`.tmux.conf`).
- **Zellij**: Rust-based terminal workspace manager.
- **Yazi**: Blazing fast terminal file manager.
- **Superfile**: Intuitive terminal file manager.

### ⚙️ Utilities & Tools
- **Mise**: Tool version manager.
- **Eza**: A modern replacement for `ls`.
- **Fastfetch**: System information tool.
- **Gh-dash**: GitHub dashboard for the terminal.
- **Espanso**: Text expander for automation.
- **Kanata**: Keyboard remapper for ergonomic layouts.
- **Yay**: AUR helper configuration.

### 🎵 Audio & Multimedia
- **MPD**: Music Player Daemon.
- **RMPC**: A terminal-based MPD client.
- **Cava**: Console-based audio spectrum visualizer.

## 📂 Structure

```text
~/dotfiles/
├── .config/          # Application configurations
├── .local/           # Local binaries and share files
├── .zshrc            # Zsh configuration
├── .tmux.conf        # Tmux configuration
└── ...               # Other config files
```

---
*Feel free to explore and adapt these configs to your own setup!*
