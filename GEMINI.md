# Project Overview

This directory contains a Neovim configuration based on `kickstart.nvim`. It's designed as a starting point for a personalized Neovim setup. The configuration is written in Lua and managed through the `lazy.nvim` plugin manager.

The main configuration file is `init.lua`, which sets up basic Neovim options, defines keymaps, and manages plugins. The configuration is designed to be modular, with custom plugins and settings located in the `lua/custom/plugins` directory.

## Building and Running

This is a Neovim configuration, not a standalone application. To "run" it, you need to:

1.  **Install Neovim:** Make sure you have the latest stable or nightly version of Neovim installed.
2.  **Install Dependencies:** The `README.md` lists several external dependencies that are required, such as `git`, `make`, a C compiler, `ripgrep`, and `fd`.
3.  **Clone the Configuration:** Clone this repository to the appropriate Neovim configuration directory (e.g., `~/.config/nvim`).
4.  **Start Neovim:** Launch Neovim by running `nvim` in your terminal. The `lazy.nvim` plugin manager will automatically install the configured plugins.

There are no explicit "build" or "test" commands in the traditional sense. The configuration is loaded and validated when Neovim starts.

## Development Conventions

*   **Language:** The configuration is written in Lua.
*   **Plugin Management:** Plugins are managed using `lazy.nvim`. The main plugin list is in `init.lua`, and custom plugins can be added in the `lua/custom/plugins` directory.
*   **Code Style:** The code style is enforced by `stylua`, with the configuration defined in `.stylua.toml`. The style uses 2-space indentation and prefers single quotes.
*   **Keymaps:** Keymaps are defined in `init.lua` and in individual plugin configuration files. The leader key is set to `<space>`.
*   **Modularity:** The configuration is designed to be modular. The `init.lua` file provides the base configuration, and users can add their own plugins and settings in the `lua/custom/plugins` directory. The `kickstart` directory contains pre-configured plugins that can be enabled by uncommenting them in `init.lua`.
