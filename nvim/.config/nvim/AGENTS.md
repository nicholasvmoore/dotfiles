# Agent Guidelines for Neovim Configuration

## Build/Test/Lint Commands
- No build commands - this is a Neovim configuration
- Format Lua code: `stylua .` (uses `.stylua.toml` config)
- No test suite - configuration only

## Code Style & Conventions
- **Language**: Lua for all configuration files
- **Formatting**: Use `stylua` with 2-space indentation, Unix line endings
- **Imports**: Use `require('module')` syntax, prefer local assignments
- **Comments**: Use `--` for single-line, `--[[]]` for multi-line blocks
- **Naming**: snake_case for variables/functions, prefer descriptive names
- **Plugin loading**: Use lazy.nvim format with proper dependencies
- **Settings**: Use `vim.opt` for options, `vim.keymap.set` for keymaps

## Project Structure
- `init.lua`: Main configuration entry point (single-file approach)
- `lua/custom/plugins/`: Custom plugin configurations
- `lua/kickstart/plugins/`: Kickstart-provided plugin configs
- `.stylua.toml`: Lua formatting configuration

## Key Patterns
- Leader key is `<space>` (vim.g.mapleader)
- Plugin specs in table format with dependencies/opts/config
- LSP configuration via mason + lspconfig pattern
- Autocommands use `nvim_create_autocmd` with proper groups