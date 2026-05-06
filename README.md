# 🚀 janis's dotfiles

> A curated collection of configuration files for my personal Arch Linux workstation.
> Feel free to browse, borrow, and adapt whatever you find useful!

## Contents

### 🐚 Shell & CLI
| File | App |
|---|---|
| `~/.zshrc` | [Zsh](https://www.zsh.dev/) — main shell config |
| `~/.p10k.zsh` | [Powerlevel10k](https://github.com/romkatv/powerlevel10k) — prompt style (p10k) |
| `~/.config/fzf/` | [fzf](https://github.com/junegunn/fzf) — fuzzy finder defaults |
| `~/.config/eza/` | [eza](https://github.com/eza-community/eza) — modern `ls` replacement |
| `~/.config/starship/` | [Starship](https://starship.rs/) — cross-shell prompt |
| `~/.config/gh-dash/` | [gh-dash](https://github.com/dlvhdr/gh-dash) — PR/dash display |
| `~/.config/clipboard/` | [Clipboard](https://github.com/bugga/clipse) — clipboard management |
| `~/.config/espanso/` | [espanso](https://espanso.org/) — text expander |
| `~/.config/kanata/` | [Kanata](https://github.com/jtroo/kanata) — key remapper / macro tool |
| `~/.config/fastfetch/` | [fastfetch](https://github.com/fastfetch-cli/fastfetch) — system info display |
| `~/.config/mise/` | [mise](https://mise.jdx.dev/) — dev runtime manager |
| `~/.config/yay/` | [yay](https://github.com/Jguer/yay) — AUR helper config |
| `~/.local/bin/` | Custom helper scripts |

### 🖥 Terminal Emulators
| File / Dir | App |
|---|---|
| `~/.wezterm.lua` | [WezTerm](https://wezfurlong.org/wezterm/) — GPU-accelerated terminal |
| `~/.config/ghostty/` | [Ghostty](https://ghostty.org/) — Apple-designed terminal |
| `~/.config/kitty/` | [kitty](https://sw.kovidgoyal.net/kitty/) — GPU terminal |

### 🪟 Window Manager (Hyprland)
| File / Dir | App |
|---|---|
| `~/.config/hypr/` | [Hyprland](https://hyprland.org/) — wayland compositor & window manager |
| `~/.config/hyprshell/` | Custom Hyprland helper scripts |
| `~/.config/waybar/` | [Waybar](https://github.com/Alexays/Waybar) — status bar |
| `~/.config/gtk-3.0/` / `~/.config/gtk-4.0/` | GTK 3 & GTK 4 theme & icon config |
| `~/.config/themes/` | Shared color themes |

### 📝 Editors
| File / Dir | App |
|---|---|
| `~/.config/nvim/` | [Neovim](https://neovim.io/) — editor (LazyVim distro) |
| `~/.config/zed/` | [Zed](https://zed.dev/) — high-performance code editor |
| `~/.config/zellij/` | [Zellij](https://zellij.dev/) — terminal workspace / pane manager |

### 🎨 Picker & Menu
| File / Dir | App |
|---|---|
| `~/.config/rofi/` | [Rofi](https://github.com/DavYd-rofi/rofi) launcher |
| `~/rofi-collection/` | Expanded Rofi theme library & themes |

### 🎵 Media
| File / Dir | App |
|---|---|
| `~/.config/mpd/` | [MPD](https://www.musicpd.org/) — music player daemon |
| `~/.config/cava/` | [cava](https://github.com/karlstav/cava) — console audio visualizer |
| `~/.config/rmpc/` | [rmpc](https://github.com/mimsy/rmpc) — ncurses MPD client |

### 📂 File Manager
| File / Dir | App |
|---|---|
| `~/.config/yazi/` | [yazi](https://yazi.dev/) — terminal file manager |
| `~/.config/superfile/` | [superfile](https://github.com/yorukot/superfile) — another terminal file manager |

### 📦 Other
| File / Dir | App |
|---|---|
| `~/.tmux.conf` | [tmux](https://github.com/tmux/tmux) — terminal multiplexer config |
| `~/.tmux/` | tmux plugins & bundled themes |
| `~/.config/nushell/` | [Nushell](https://nushell.sh/) — modern shell alternative |
| `~/.config/bak/` | Backup configs |
| `secrets/` | Private keys (gitignored) |
| `lazyvim.json` | LazyVim session state |
| `.gitignore` | Global gitignore entries |
| `.gitmodules` | Submodule entries |

---

## Getting Started

To try these dotfiles on your machine:

```bash
# Clone the repo
git clone https://github.com/jemabaris/dotfiles.git ~/.dotfiles

# Symlink whatever you need
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.config ~/.config
# ... and so on
```

> ⚠️ Your `secrets/` folder contains private keys and must stay local — it is excluded via `.gitignore`.

## Notes

- Primarily developed on **Arch Linux** with the **Hyprland** tiling WM.
- Editor setup uses [LazyVim](https://github.com/LazyVim/LazyVim) (Neovim).
- Most configs are opinionated but designed to be forkable and adjustable.
- If something doesn't work on your setup out of the box, that's completely fine — tweak it! 💡

## Stargazers ⭐

If this saves you some time, a star would be nice. Pull requests for improvements are welcome!

## License

MIT — use it, modify it, break it, learn from it.
