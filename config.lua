-- general
lvim.log.level = "warn"
lvim.format_on_save = {
  timeout = 2000
}
lvim.colorscheme = "gruvbox"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" }
}

lvim.builtin.alpha.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.open_on_setup = true

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    extra_args = { "--print-with", "100" },
  }
}

-- Additional Plugins
lvim.plugins = {
  { "morhetz/gruvbox" },
  -- Git integration
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  -- Autotag
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  -- Trouble
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- Rainbow parentheses
  {
    "p00f/nvim-ts-rainbow",
  },
}

-- Enable rainbow parentheses
lvim.builtin.treesitter.rainbow.enable = true

-- Disable bufferline
lvim.builtin.bufferline.active = false
vim.cmd([[ set showtabline=0 ]])

-- Custom diagnostics preview
lvim.keys.normal_mode["H"] = "<cmd>lua vim.diagnostic.open_float()<cr>"
lvim.keys.normal_mode["ga"] = "<cmd>lua vim.lsp.buf.code_action()<cr>"

lvim.lsp.buffer_mappings.insert_mode['<Esc>'] = lvim.lsp.buffer_mappings.insert_mode['jk']
