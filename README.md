# 🛠️ Zaur’s Neovim Configuration (with Lazy.nvim)

This repository contains my personal Neovim configuration built for productivity, learning, and a clean modular structure.
The config uses **Lazy.nvim** for plugin management and loads all plugins from `lua/plugins/`.

---

## 🚀 Features

* Clean modular structure (`init.lua`, `config/`, `plugins/`)
* Modern plugin manager (**Lazy.nvim**)
* Treesitter-powered highlighting and textobjects
* Fuzzy finding with **fzf-lua**
* Auto formatting via **conform.nvim**
* LSP support with **nvim-lspconfig**
* Smooth UX improvements (notifications, key suggestions, indentation autodetection)
* Beautiful Kanagawa color scheme
* Simple to install, easy to extend

---

## 📦 Plugins Included (with Descriptions + Links)

### 🔧 Core / LSP / Completion

* **nvim-lspconfig** — Neovim’s official LSP configuration
  [https://github.com/neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

* **nvim-cmp** — Completion engine for LSP, snippets, buffer, path
  [https://github.com/hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

* **conform.nvim** — Code formatter integration
  [https://github.com/stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

### 🌲 Treesitter

* **nvim-treesitter** — Syntax-aware highlighting and code parsing
  [https://github.com/nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

* **nvim-treesitter-textobjects** — Select functions, classes, blocks
  [https://github.com/nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

### 🔍 Navigation & Search

* **fzf-lua** — Fuzzy finder powered by fzf
  [https://github.com/ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)

* **project.nvim** — Project root detection and switching
  [https://github.com/ahmedkhalf/project.nvim](https://github.com/ahmedkhalf/project.nvim)

### 🎨 UI / Aesthetic

* **kanagawa.nvim** — Japanese-inspired color scheme
  [https://github.com/rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)

* **nvim-notify** — Beautiful notification popups
  [https://github.com/rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)

* **statusline.lua** — Custom minimal statusline (in `lua/plugins/statusline.lua`)

### 🧠 UX Enhancements

* **which-key.nvim** — Show available keybinds in popup
  [https://github.com/folke/which-key.nvim](https://github.com/folke/which-key.nvim)

* **guess-indent.nvim** — Automatically set indentation style
  [https://github.com/NMAC427/guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim)

* **oil.nvim** — Modern Neovim file explorer
  [https://github.com/stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)

---

## 📁 Folder Structure

```
~/.config/nvim
├── init.lua
├── lua
│   ├── config
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── *.lua
└── README.md
```

Each plugin has its own file, making this config easy to extend and customize.

---

## 🔧 Installation (Fresh Machine)

```bash
dcd ~/.config
git clone https://github.com/zaurb77/nvim.git
cd nvim
nvim
```

Lazy.nvim will automatically:

* install plugins
* compile configs
* set up paths

No manual steps required.

---

## 🤖 Mason (Auto-Install LSP/Tools)

This setup supports **Mason**, which allows easy installation of:

* LSP servers
* Formatters
* Linters

Tools are *not* stored in the repo — Mason installs them dynamically when needed.
This keeps the repository clean and makes the config portable.

---

## 🧪 Git Workflow (Short Overview)

Two branches:

* `main` → stable configuration
* `experiment` → testing new plugins/config changes

Switching:

```
git checkout main
git checkout experiment
```

Merging back to main:

```
git checkout main
git merge experiment
git push
```

---

## 📝 Notes

This configuration will continue evolving as I learn Neovim and deepen my Linux and Lua knowledge.
Feel free to explore and adapt!

