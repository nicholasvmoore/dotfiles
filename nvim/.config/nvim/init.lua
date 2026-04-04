-- Plugins with vim.pack (Neovim 0.11+ built-in package manager)
-- Dependencies must be loaded before the plugins that need them
--
-- IMPORTANT: On first run, use :PackInstall to install all plugins
-- Other useful commands: :PackUpdate, :PackClean, :PackCheck
vim.pack.add({
  -- Core dependencies
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },

  -- Theme
  { src = 'https://github.com/NTBBloodbath/doom-one.nvim' },

  -- Status line (using lualine from old config)
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },

  -- File tree
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },

  -- Git
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },

  -- Fuzzy finder
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },

  -- LSP and Mason
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/williamboman/mason.nvim' },
  { src = 'https://github.com/williamboman/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/j-hui/fidget.nvim' },

  -- Lua LSP configuration
  { src = 'https://github.com/folke/lazydev.nvim' },

  -- Completion
  { src = 'https://github.com/saghen/blink.cmp' },
  { src = 'https://github.com/L3MON4D3/LuaSnip', build = 'make install_jsregexp' },

  -- Formatting
  { src = 'https://github.com/stevearc/conform.nvim' },

  -- Linting
  { src = 'https://github.com/mfussenegger/nvim-lint' },

  -- Treesitter
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- AI Completion
  { src = 'https://github.com/supermaven-inc/supermaven-nvim' },

  -- Note taking
  { src = 'https://github.com/nvim-neorg/neorg' },
  { src = 'https://github.com/nvim-neorg/lua-utils.nvim' },
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
  { src = 'https://github.com/pysan3/pathlib.nvim' },

  -- Navigation
  { src = 'https://github.com/folke/flash.nvim' },
  { src = 'https://github.com/ThePrimeagen/harpoon', branch = 'harpoon2' },

  -- Terminal
  { src = 'https://github.com/akinsho/toggleterm.nvim' },

  -- Utilities
  { src = 'https://github.com/echasnovski/mini.nvim' },
  { src = 'https://github.com/folke/todo-comments.nvim' },
  { src = 'https://github.com/lukas-reineke/headlines.nvim' },
  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/tpope/vim-sleuth' },

  -- Games / Fun
  { src = 'https://github.com/ThePrimeagen/vim-be-good' },
})

-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.o.winborder = 'rounded'
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 30
vim.opt.confirm = true
vim.opt.colorcolumn = '120'

-- ============================================================================
-- THEME (Doom One)
-- ============================================================================
-- Add color to cursor
vim.g.doom_one_cursor_coloring = true
-- Set :terminal colors
vim.g.doom_one_terminal_colors = true
-- Enable italic comments
vim.g.doom_one_italic_comments = false
-- Enable TS support
vim.g.doom_one_enable_treesitter = true
-- Color whole diagnostic text or only underline
vim.g.doom_one_diagnostics_text_color = false
-- Enable transparent background
vim.g.doom_one_transparent_background = true

-- Pumblend transparency
vim.g.doom_one_pumblend_enable = false
vim.g.doom_one_pumblend_transparency = 20

-- Plugins integration
vim.g.doom_one_plugin_neorg = true
vim.g.doom_one_plugin_barbar = false
vim.g.doom_one_plugin_telescope = false
vim.g.doom_one_plugin_neogit = true
vim.g.doom_one_plugin_nvim_tree = true
vim.g.doom_one_plugin_dashboard = true
vim.g.doom_one_plugin_startify = true
vim.g.doom_one_plugin_whichkey = true
vim.g.doom_one_plugin_indent_blankline = true
vim.g.doom_one_plugin_vim_illuminate = true
vim.g.doom_one_plugin_lspsaga = false

-- Load the colorscheme
vim.cmd.colorscheme 'doom-one'

-- Transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

-- ============================================================================
-- KEYMAPS (General)
-- ============================================================================

-- Clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymap
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- ============================================================================
-- AUTOCOMMANDS
-- ============================================================================

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- ============================================================================
-- PLUGIN: Lualine (Status line)
-- ============================================================================
pcall(function()
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'moonfly',
    },
  }
end)

-- ============================================================================
-- PLUGIN: Neo-tree (File tree)
-- ============================================================================
pcall(function()
  require('neo-tree').setup {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  }
  vim.keymap.set('n', '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
end)

-- ============================================================================
-- PLUGIN: Gitsigns
-- ============================================================================
pcall(function()
  require('gitsigns').setup {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  }
end)

-- ============================================================================
-- PLUGIN: Telescope
-- ============================================================================
pcall(function()
  require('telescope').setup {
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
      },
    },
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(),
      },
    },
  }

  -- Load Telescope extensions
  pcall(require('telescope').load_extension, 'fzf')
  pcall(require('telescope').load_extension, 'ui-select')

  -- Telescope keymaps
  local builtin = require 'telescope.builtin'
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  vim.keymap.set('n', '<leader>sf', function() builtin.find_files { hidden = true } end, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
  vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })
  vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep {
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    }
  end, { desc = '[S]earch [/] in Open Files' })
  vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
  end, { desc = '[S]earch [N]eovim files' })
end)

-- ============================================================================
-- PLUGIN: Mason (LSP installer)
-- ============================================================================
require('mason').setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

-- Mason-tool-installer is for formatters, linters, debuggers (not LSP servers)
-- LSP servers are installed via mason-lspconfig below
require('mason-tool-installer').setup {
  ensure_installed = {
    'stylua',        -- Lua formatter
    'markdownlint',  -- Markdown linter
    'ruff',          -- Python linter
  },
  auto_update = false,
  run_on_start = true,
}

-- ============================================================================
-- PLUGIN: Fidget (LSP status)
-- ============================================================================
pcall(function()
  require('fidget').setup {}
end)

-- ============================================================================
-- PLUGIN: Lazydev (Lua LSP configuration)
-- ============================================================================
pcall(function()
  require('lazydev').setup {
    library = {
      -- Load luvit types when the `vim.uv` word is found
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  }
end)

-- ============================================================================
-- PLUGIN: LSP Configuration
-- ============================================================================

-- Try to load telescope for LSP pickers, fallback to native LSP if not available
local telescope_builtin_ok, telescope_builtin = pcall(require, 'telescope.builtin')
local lsp_picker = {
  references = telescope_builtin_ok and telescope_builtin.lsp_references or vim.lsp.buf.references,
  implementations = telescope_builtin_ok and telescope_builtin.lsp_implementations or vim.lsp.buf.implementation,
  definitions = telescope_builtin_ok and telescope_builtin.lsp_definitions or vim.lsp.buf.definition,
  document_symbols = telescope_builtin_ok and telescope_builtin.lsp_document_symbols or vim.lsp.buf.document_symbol,
  workspace_symbols = telescope_builtin_ok and telescope_builtin.lsp_dynamic_workspace_symbols or vim.lsp.buf.workspace_symbol,
  type_definitions = telescope_builtin_ok and telescope_builtin.lsp_type_definitions or vim.lsp.buf.type_definition,
}

-- Diagnostic configuration
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

-- LSP attach autocmd
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Rename the variable under your cursor
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    -- Find references
    map('grr', lsp_picker.references, '[G]oto [R]eferences')

    -- Jump to implementation
    map('gri', lsp_picker.implementations, '[G]oto [I]mplementation')

    -- Jump to definition
    map('grd', lsp_picker.definitions, '[G]oto [D]efinition')

    -- WARN: This is not Goto Definition, this is Goto Declaration
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Fuzzy find all the symbols in your current document
    map('gO', lsp_picker.document_symbols, 'Open Document Symbols')

    -- Fuzzy find all the symbols in your current workspace
    map('gW', lsp_picker.workspace_symbols, 'Open Workspace Symbols')

    -- Jump to the type of the word under your cursor
    map('grt', lsp_picker.type_definitions, '[G]oto [T]ype Definition')

    -- Toggle inlay hints
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end

    -- Highlight references when cursor rests
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end
  end,
})

-- LSP servers configuration (Neovim 0.11+ / 0.13+ style)
-- Only use blink.cmp capabilities if it's installed, otherwise use native
local blink_ok, blink = pcall(require, 'blink.cmp')
local capabilities = blink_ok and blink.get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities()

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
      },
    },
  },
  jinja_lsp = {},
  pylsp = {},
  bashls = {},
  ansiblels = {},
  terraformls = {},
  clangd = {},
  yamlls = {},
}

-- Combine server names for mason-lspconfig to install
local lsp_servers_to_install = vim.tbl_keys(servers)

-- Register per-server configs via vim.lsp.config()
for server_name, server in pairs(servers) do
  local merged = vim.tbl_deep_extend('force', {
    capabilities = capabilities,
  }, server)
  vim.lsp.config(server_name, merged)
end

-- Let mason install servers, then explicitly enable them with vim.lsp.enable()
require('mason-lspconfig').setup {
  ensure_installed = lsp_servers_to_install,
  automatic_enable = false,
}

for _, server_name in ipairs(lsp_servers_to_install) do
  vim.lsp.enable(server_name)
end

-- ============================================================================
-- PLUGIN: Blink.cmp (Completion)
-- ============================================================================
pcall(function()
  require('blink.cmp').setup {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      ghost_text = { enabled = true },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        window = {
          border = 'rounded',
          min_width = 20,
          max_height = 30,
          max_width = 80,
        },
      },
      menu = {
        auto_show = true,
        min_width = 15,
        max_height = 15,
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  }
end)

-- ============================================================================
-- PLUGIN: Conform (Formatting)
-- ============================================================================
pcall(function()
  require('conform').setup {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      end
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Let Jinja use LSP formatting fallback (no built-in conform formatter)
      -- jinja = { ... },
    },
  }
  vim.keymap.set('n', '<leader>f', function()
    require('conform').format { async = true, lsp_format = 'fallback' }
  end, { desc = '[F]ormat buffer' })
end)

-- ============================================================================
-- PLUGIN: nvim-lint
-- ============================================================================
pcall(function()
  local lint = require 'lint'
  -- Only enable linters that are commonly available
  -- Install with mason-tool-installer or manually:
  --   npm install -g markdownlint-cli
  --   pip install ruff
  lint.linters_by_ft = {
    markdown = { 'markdownlint' },
    python = { 'ruff' },
    -- json = { 'jsonlint' }, -- Uncomment if jsonlint is installed
    -- text = { 'vale' }, -- Uncomment if vale is installed
  }

  local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = lint_augroup,
    callback = function()
      if vim.opt_local.modifiable:get() then
        -- Only lint if a linter is configured for this filetype
        local ft = vim.bo.filetype
        if lint.linters_by_ft[ft] then
          lint.try_lint()
        end
      end
    end,
  })
end)

-- ============================================================================
-- PLUGIN: Treesitter
-- ============================================================================
local ts_ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
if ts_ok then
  ts_configs.setup {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'terraform',
      'vim',
      'vimdoc',
      'python',
      'go',
      'norg',
      'norg_meta',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  }
end

-- ============================================================================
-- PLUGIN: Supermaven (AI Completion)
-- ============================================================================
pcall(function()
  require('supermaven-nvim').setup {}
end)

-- ============================================================================
-- PLUGIN: Neorg (Note taking)
-- ============================================================================
pcall(function()
  require('neorg').setup {
    load = {
      ['core.defaults'] = {},
      ['core.concealer'] = {},
      ['core.integrations.treesitter'] = {},
      ['core.dirman'] = {
        config = {
          workspaces = {
            notes = '~/notes',
            work = '~/work',
          },
          default_workspace = 'notes',
        },
      },
    },
  }
end)

-- ============================================================================
-- PLUGIN: Flash (Navigation)
-- ============================================================================
pcall(function()
  require('flash').setup {}
  vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
  vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
  vim.keymap.set('o', 'r', function() require('flash').remote() end, { desc = 'Remote Flash' })
  vim.keymap.set({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
  vim.keymap.set('c', '<c-s>', function() require('flash').toggle() end, { desc = 'Toggle Flash Search' })
end)

-- ============================================================================
-- PLUGIN: Harpoon (File marking)
-- ============================================================================
pcall(function()
  local harpoon = require 'harpoon'

  -- Harpoon2
  harpoon:setup {}

  vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = 'Harpoon: Add file' })
  vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: Toggle menu' })
  vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Harpoon: File 1' })
  vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Harpoon: File 2' })
  vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Harpoon: File 3' })
  vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Harpoon: File 4' })
  vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end, { desc = 'Harpoon: Prev file' })
  vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end, { desc = 'Harpoon: Next file' })
end)

-- ============================================================================
-- PLUGIN: Toggleterm (Terminal)
-- ============================================================================
pcall(function()
  require('toggleterm').setup {
    start_in_insert = true,
    persistent_mode = false,
    shell = vim.o.shell,
    auto_scroll = true,
    float_opts = {
      border = 'single',
      title_pos = 'center',
    },
  }
  vim.keymap.set('n', '<leader>`', ':ToggleTerm direction=float<cr>', { desc = 'Open a floating terminal' })
end)

-- ============================================================================
-- PLUGIN: Mini.nvim
-- ============================================================================
pcall(function()
  require('mini.ai').setup { n_lines = 500 }
  require('mini.surround').setup()
  require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }
end)

-- ============================================================================
-- PLUGIN: Todo-comments
-- ============================================================================
pcall(function()
  require('todo-comments').setup { signs = false }
end)

-- ============================================================================
-- PLUGIN: Headlines (Markdown highlighting)
-- ============================================================================
pcall(function()
  require('headlines').setup {
    norg = {
      headline_highlights = { 'Headline1', 'Headline2', 'Headline3', 'Headline4', 'Headline5', 'Headline6' },
      codeblock_highlight = { 'NeorgCodeBlock' },
    },
  }
end)

-- ============================================================================
-- PLUGIN: Which-key (Keybinding hints)
-- ============================================================================
pcall(function()
  require('which-key').setup {
    delay = 0,
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  }
end)

-- ============================================================================
-- FILETYPE ADDITIONS
-- ============================================================================
vim.filetype.add {
  extension = {
    yml = 'yaml.ansible',
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}
