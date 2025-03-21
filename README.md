# Mischa's Neovim Config

This is a great setup for neovim for easy navigation and LSP integrations.

It's based on AstroNvim.

## 🧐 Features

- Lazy loading with `lazy`
- Automatically `cd` to project root
- Telescope everything
- Copilot and avante for AI completion and cursor-style chat
- All TypeScript support plus tailwind
- Full language support for common languages, easy to add more packs from AstroNvim
- Auto session restore per-project

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

#### Start Neovim

```shell
nvim
```

## ⌥ Keymaps

The leader key is spacebar. Press it to see what you can do.

Press space-f-k to see a list of all key mappings.

Most of the key bindings are configured in `[lua/plugins/astrocore.lua](lua/plugins/astrocore.lua)`.
