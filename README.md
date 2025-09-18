# Mischa's Neovim Config

This is a great setup for neovim for easy navigation and LSP integrations.

It's based on [AstroNvim](https://astronvim.com/) (see: [features](https://docs.astronvim.com/#-features])).

## 🧐 Features

- Lazy loading with `lazy`
- Automatically `cd` to project root
- Snacks everything
- Copilot and [avante](https://github.com/yetone/avante.nvim) for AI completion and cursor-style chat
- MCP Hub for connecting MCP servers
- Claude code
- Python, uv, auto venv selection
- All TypeScript support plus tailwind
- Full language support for common languages, [easy to add more packs from AstroNvim](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack)
- Auto session restore per-project
- Git UI with neogit

## 🛠️ Installation

#### (Optional) Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/revmischa/nvim-config ~/.config/nvim
```

#### (Optional) Install useful tools

```shell
brew install rg
npm i -g mcp-hub
```

#### Start Neovim

```shell
nvim
```

## ⌥ Keymaps

### Getting Started with Keybindings

The **leader key** is the **spacebar** (`<Space>`). This is your main entry point for most commands. When you press the leader key, a which-key menu will appear showing available commands. For comprehensive documentation on AstroNvim mappings, see the [official mappings guide](https://docs.astronvim.com/mappings/).

**New to Neovim?** Start by learning these essential commands: save files (`Ctrl+S`), find files (`Space+f+f`), and search in files (`Space+/`). The which-key popup will guide you through discovering more commands.

**Pro tip:** Press `Space+f+k` to see a searchable list of all available keybindings.

### Essential Keybindings

| Category | Key | Action | Notes |
|----------|-----|--------|--------|
| **Files & Navigation** |
| `Ctrl+S` | Save file | Works in normal and insert mode |
| `Space+f+f` | Find files | Includes hidden files |
| `Space+f+r` | Recent files | Quick access to recently opened |
| `Space+Space` | Recent files | Alternative shortcut |
| `Space+,` | Switch buffers | See all open buffers |
| `H` / `L` | Previous/Next buffer | Quick buffer navigation |
| **Search & Find** |
| `Space+/` | Search in files (grep) | Search across project |
| `Space+f+d` | Find word under cursor | Search for current word |
| `Space+f+R` | Find & Replace | Global find/replace with GrugFar |
| **Code Navigation** |
| `g+d` | Go to definition | Jump to where symbol is defined |
| `g+r` | Find references | See all uses of symbol |
| `g+I` | Go to implementation | Jump to implementation |
| `F1` | Show references | Alternative references view |
| `F2` | Rename symbol | Rename across project |
| **TypeScript/JavaScript** |
| `Space+i+m` | Add missing imports | Auto-import missing modules |
| `Space+i+o` | Organize imports | Sort and clean imports |
| `Space+i+r` | Remove unused imports | Clean up unused code |
| `Space+i+f` | Fix all issues | Apply all available fixes |
| **Git** |
| `Ctrl+Q` | Git status (Neogit) | Full git interface |
| `Space+g+s` | Git status (picker) | Quick git status |
| `Space+g+b` | Git branches | Switch branches |
| `Space+g+l` | Git log | View commit history |
| **Windows & Layout** |
| `Space+s+v` | Split vertically | Create vertical split |
| `Space+s+a` | Split horizontally | Create horizontal split |
| `Space+s+q` | Maximize pane | Toggle pane maximization |
| `Space+q` | Close window | Close current window |
| **Terminal & Tools** |
| `Ctrl+F` | Toggle terminal | Floating terminal |
| `Alt+/` | Toggle comment | Comment/uncomment line |
| `Space+u+a` | Toggle Avante AI | AI chat sidebar |
| `Alt+L` | Focus Avante AI | Jump to AI chat |
| **Utility** |
| `Space+f+y` | Copy file path | Copy relative path to clipboard |
| `Space+r+s` | Restart LSP | Fix language server issues |
| `Space+r+c` | Reload config | Reload Neovim configuration |

### Command Discovery

- **`Space`** - Opens which-key menu with available commands
- **`Space+f+k`** - Searchable list of all keybindings
- **`Space+s+k`** - Browse keymaps with picker
- **`Space+s+C`** - Browse available commands

Most keybindings are configured in [lua/plugins/astrocore.lua](lua/plugins/astrocore.lua) and [lua/plugins/snacks.lua](lua/plugins/snacks.lua).
