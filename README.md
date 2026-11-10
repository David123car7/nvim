# My Neovim Configuration

Neovim setup for C / C++ and C# (ASP.NET Core Web API) with Docker, managed with `lazy.nvim`.

## Plugins Used

### Core and UI
* **`nvim-treesitter`** - Syntax highlighting and code parsing.
* **`moonfly`** - Color scheme.
* **`dashboard-nvim`** - Start-screen greeter with shortcut actions.
* **`bufferline.nvim`** - Tab bar across the top for open files, with modified markers and diagnostics.
* **`dropbar.nvim`** - Breadcrumbs above the code (`file > class > method`).
* **`indent-blankline.nvim`** - Indent guides along nested blocks.
* **`lualine.nvim`** - Status bar (mode, branch, diagnostics, attached LSP servers).
* **`which-key.nvim`** - Pop-up that shows available keyboard shortcuts as you type.
* **`nvim-tree.lua`** - Sidebar file explorer.
* **`toggleterm.nvim`** - Integrated terminal panel.

### LSP, completion and formatting
* **`nvim-lspconfig`** + **`mason.nvim`** + **`mason-lspconfig.nvim`** - Language servers installed and managed through Mason (`clangd`, `dockerls`, `docker_compose_language_service`, `yamlls`).
* **`roslyn.nvim`** - C# / ASP.NET Core language server (Roslyn), including Razor and `.cshtml`.
* **`nvim-cmp`** (+ `LuaSnip`, `cmp-*` sources) - Autocomplete menu.
* **`conform.nvim`** - Format on save (`csharpier` for C#, LSP formatting as fallback).
* **`nvim-autopairs`** - Closes brackets and quotes as you type.
* **`neogen`** - Generates documentation comments.

### Debugging and testing
* **`nvim-dap`** (+ `nvim-dap-ui`, `nvim-dap-virtual-text`) - Debugger using `netcoredbg`.
* **`neotest`** + **`neotest-dotnet`** - Run and debug .NET tests.

### Navigation and git
* **`telescope.nvim`** - Fuzzy finder for files and text (ignores `bin/` and `obj/`).
* **`project.nvim`** - Detects project roots (`.git`, `*.sln`, `*.csproj`) and remembers projects.
* **`persistence.nvim`** - Per-project sessions (buffers, splits, cursor positions).
* **`gitsigns.nvim`** - Git change markers, hunk actions and blame.
* **`diffview.nvim`** - Side-by-side diffs, file history and merge-conflict view.
* **`lazygit`** (via `toggleterm`) - Full git UI in a floating terminal. Requires the `lazygit` program installed on the system.
* **`trouble.nvim`** - Problems panel for diagnostics, references and symbols.
* **`aerial.nvim`** - Outline sidebar with the classes and methods of the current file.

---

## Keybindings Reference

`Space` is the **leader** key. Buffer-local LSP and git mappings only exist while a server or git repo is attached.

### General and Navigation

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `Space` + `p` + `v` | Normal | Open Netrw | Opens Neovim's built-in `Netrw` file browser. |
| `Space` + `e` | Normal | Toggle Explorer | Shows or hides the `NvimTree` sidebar. |
| `Space` + `f` + `f` | Normal | Find Files | Telescope file search. |
| `Space` + `f` + `g` | Normal | Live Grep | Telescope text search across the project. |
| `Space` + `f` + `p` | Normal | Projects | Telescope list of remembered projects; picking one switches to it. |
| `Ctrl` + `t` | Normal | Toggle Terminal | Opens or hides the integrated terminal. |
| `Ctrl` + `s` | Normal | Save File | Writes the file to disk. |
| `Ctrl` + `s` | Insert | Save File | Saves and returns to Normal mode. |
| `j` + `k` | Insert | Escape | Leaves Insert mode. |
| `Space` + `?` | Normal | Buffer Keymaps | which-key popup with the buffer-local mappings. |
| `Space` + `n` + `f` | Normal | Generate Documentation | Neogen inserts a doc-comment template. |

### Start Screen (dashboard)

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `f` | Dashboard | Find Files | Telescope file search. |
| `g` | Dashboard | Find Text | Telescope live grep. |
| `p` | Dashboard | Projects | Lists your remembered projects; picking one opens it. |
| `n` | Dashboard | New File | Opens an empty buffer in Insert mode. |
| `c` | Dashboard | Open Config | Browse the Neovim config files. |
| `l` | Dashboard | Lazy Packages | Opens the plugin manager. |
| `q` | Dashboard | Quit | Closes Neovim. |

### Tabs (bufferline)

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `Shift` + `h` / `Shift` + `l` | Normal | Previous / Next Tab | Cycles through open files. |
| `Space` + `b` + `d` | Normal | Close Tab | Closes the current buffer. |
| `Space` + `b` + `o` | Normal | Close Other Tabs | Closes every tab except the current one. |
| `Space` + `b` + `p` | Normal | Pick Tab | Shows a letter on each tab; press it to jump there. |
| `Space` + `;` | Normal | Pick Breadcrumb | Selects a symbol in the breadcrumb bar (dropbar) to jump to. |
| `Space` + `o` | Normal | Outline | Toggles the symbol outline sidebar (aerial). |

### Problems Panel (trouble)

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `Space` + `x` + `x` | Normal | Project Problems | Errors and warnings of the whole project. |
| `Space` + `x` + `X` | Normal | File Problems | Errors and warnings of the current file only. |
| `Space` + `x` + `r` | Normal | References Panel | LSP references of the symbol under the cursor. |
| `Space` + `x` + `s` | Normal | Symbols Panel | Symbols of the current file. |
| `Space` + `x` + `q` | Normal | Quickfix List | Toggles the quickfix list. |

### Sessions

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `Space` + `q` + `s` | Normal | Restore Session | Restores the saved session for the current folder. |
| `Space` + `q` + `l` | Normal | Restore Last Session | Restores the most recent session. |
| `Space` + `q` + `S` | Normal | Select Session | Pick a saved session from a list. |
| `Space` + `q` + `d` | Normal | Don't Save Session | Stops saving the current session. |

### Terminal Mode

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `Esc` `Esc` | Terminal | Leave Terminal Mode | Returns to Normal mode (a single `Esc` still goes to the program inside). |
| `j` + `k` | Terminal | Leave Terminal Mode | Quick alternative to release text focus. |
| `Ctrl` + `w` | Terminal | Window Commands | Leaves terminal mode and starts a window command (e.g. `Ctrl+w` then `v` to split). |
| `Ctrl` + `h` / `j` / `k` / `l` | Terminal | Move Between Windows | Focus the window left / down / up / right. |

### LSP (when a server is attached)

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `K` | Normal | Hover | Documentation for the symbol under the cursor. |
| `g` + `d` | Normal | Go to Definition | Jumps to where the symbol is defined. |
| `g` + `D` | Normal | Go to Declaration | Jumps to the declaration. |
| `g` + `r` | Normal | References | Lists all references. |
| `g` + `i` | Normal | Go to Implementation | Jumps to the implementation. |
| `g` + `y` | Normal | Go to Type Definition | Jumps to the symbol's type. |
| `Space` + `r` + `n` | Normal | Rename Symbol | Renames across the project. |
| `Space` + `c` + `a` | Normal | Code Action | Quick fixes and refactorings. |
| `Space` + `c` + `d` | Normal | Line Diagnostics | Floating window with the line's diagnostics. |
| `[` + `d` / `]` + `d` | Normal | Previous / Next Diagnostic | Jumps between diagnostics. |

### Git (gitsigns, inside a git repo)

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `]` + `h` / `[` + `h` | Normal | Next / Previous Hunk | Jumps between changed blocks. |
| `Space` + `h` + `p` | Normal | Preview Hunk | Shows the diff of the hunk under the cursor. |
| `Space` + `h` + `s` | Normal | Stage Hunk | Stages just that hunk. |
| `Space` + `h` + `r` | Normal | Reset Hunk | Discards the hunk's changes. |
| `Space` + `h` + `b` | Normal | Blame Line | Shows who last changed the line. |

### Source Control (lazygit, diffview)

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `Space` + `g` + `g` | Normal | Lazygit | Opens or hides lazygit in a floating window. |
| `Space` + `g` + `d` | Normal | Diff View | Side-by-side diff of all changed files. |
| `Space` + `g` + `h` | Normal | File History | Git history of the current file. |
| `Space` + `g` + `H` | Normal | Project History | Git history of the whole project. |
| `Space` + `g` + `q` | Normal | Close Diff View | Closes the diff or history view. |

### Debugging (nvim-dap)

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `F5` | Normal | Start / Continue | Starts a debug session or continues. |
| `F9` or `Space` + `d` + `b` | Normal | Toggle Breakpoint | Sets or removes a breakpoint. |
| `F10` | Normal | Step Over | Runs the current line. |
| `F11` | Normal | Step Into | Steps into the call. |
| `F12` | Normal | Step Out | Runs until the current function returns. |
| `Space` + `d` + `u` | Normal | Toggle Debug UI | Shows or hides the debugger panels. |
| `Space` + `d` + `x` | Normal | Stop Debugging | Terminates the session. |

### Tests (neotest)

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `Space` + `t` + `t` | Normal | Run Nearest Test | Runs the test under the cursor. |
| `Space` + `t` + `f` | Normal | Run File Tests | Runs every test in the file. |
| `Space` + `t` + `a` | Normal | Run All Tests | Runs the whole test suite. |
| `Space` + `t` + `d` | Normal | Debug Nearest Test | Runs the nearest test under the debugger. |
| `Space` + `t` + `s` | Normal | Test Summary | Toggles the test tree panel. |
| `Space` + `t` + `o` | Normal | Test Output | Opens the output of the last test. |

### Autocomplete Menu (nvim-cmp)

| Shortcut | Mode | Action | Description |
| :--- | :--- | :--- | :--- |
| `Ctrl` + `Space` | Insert | Manual Completion | Opens the completion list on demand. |
| `Ctrl` + `b` / `Ctrl` + `f` | Completion | Scroll Docs Up / Down | Scrolls the documentation panel by 4 lines. |
| `Ctrl` + `e` | Completion | Abort | Closes the menu without applying anything. |
| `Enter` | Completion | Confirm | Accepts the highlighted item. |
