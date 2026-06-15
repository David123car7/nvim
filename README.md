# My Neovim Configuration

## Core Plugins Used

* **`nvim-treesitter`** - Syntax highlighting and code parsing.
* **`nvim-lspconfig`** - Connects Neovim to language servers (like `clangd`) for real-time error checking.
* **`nvim-cmp`** - The core engine that runs autocomplete dropdown menus.
* **`dashboard-nvim`** - A start-screen greeter with vertical shortcut actions.
* **`telescope.nvim`** - A fuzzy finder to search files and text instantly.
* **`toggleterm.nvim`** - Adds an integrated terminal panel.
* **`nvim-tree.lua`** - A sidebar file explorer window.
* **`which-key.nvim`** - A visual pop-up menu that shows you available keyboard shortcuts as you type.

---

## Keybindings Reference

### Global & Navigation Mappings

| Shortcut Keychord | Target Context | Command Action / Behavior | Description |
| :--- | :--- | :--- | :--- |
| `Space` | Global | **Leader Key** | The foundational prefix keychord initializing modern custom macros. |
| `Space` + `p` + `v` | Normal Mode | Native Directory Browser | Launches Neovim's standard full-screen `Netrw` project folder path explorer. |
| `Space` + `e` | Normal Mode | Toggle Sidebar | Fires up or hides the sleek `NvimTree` directory hierarchy window on the left side. |
| `Space` + `f` + `f` | Normal Mode | Find Project Files | Triggers a floating prompt modal to filter and load files by name instantly. |
| `Space` + `f` + `g` | Normal Mode | Live Grep Text Search | Crawls through all codebase paths to find matching textual string rows live. |
| `Ctrl` + `t` | Global | Toggle Shell Panel | Slides out or masks an interactive persistent operating terminal dock line. |
| `Ctrl` + `s` | Normal Mode | Save File | Writes your active modifications to the disk instantly. |
| `Ctrl` + `s` | Insert Mode | Save File | Writes modifications to the disk silently while keeping you in typing mode. |
| `j` + `k` | Insert Mode | Escape Mode | Exits text composition safely to Normal navigation context immediately. |

### Active Terminal Window Mappings

| Shortcut Keychord | Target Context | Command Action / Behavior | Description |
| :--- | :--- | :--- | :--- |
| `Esc` | Terminal Mode | Escape Shell Focus | Switches from active execution insertion back into regular structural Normal mode. |
| `j` + `k` | Terminal Mode | Quick Normal Mode | Ergonomic muscle-memory alternative to release text focus quickly. |
| `Ctrl` + `h` | Terminal Mode | Window Shift Left | Focuses your cursor context directly to a window pane positioned on the **left**. |
| `Ctrl` + `j` | Terminal Mode | Window Shift Down | Forces cursor tracking immediately downwards into an active layout split. |
| `Ctrl` + `k` | Terminal Mode | Window Shift Up | Moves focus back to the code files arranged above the current split window. |
| `Ctrl` + `l` | Terminal Mode | Window Shift Right | Steps editing focus laterally to code blocks resting on the **right**. |
| `Ctrl` + `w` | Terminal Mode | Window Control | Releases default hooks to allow structural splits or window adjustments. |

### Autocomplete Dropdown Menu Mappings

| Shortcut Keychord | Target Context | Command Action / Behavior | Description |
| :--- | :--- | :--- | :--- |
| `Ctrl` + `b` | Completion Pop | Scroll Doc Panel Up | Shifts text inside secondary documentation summary panels **upwards** by 4 rows. |
| `Ctrl` + `f` | Completion Pop | Scroll Doc Panel Down | Scrolls secondary descriptive tooltips **downwards** by 4 lines. |
| `Ctrl` + `Space` | Insert Mode | Manual Completion | Forcefully pops open completion option lists at any point without waiting. |
| `Ctrl` + `e` | Completion Pop | Abort Selection | Snaps completion panels shut instantly without applying code adjustments. |
| `Enter` (`<CR>`) | Completion Pop | Confirm Choice | Validates highlighted target choices and injects code blueprints cleanly. |
