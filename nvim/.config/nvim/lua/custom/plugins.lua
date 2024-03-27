local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust", "rs" },
    -- config = function()
    --   require "custom.configs.rustaceanvim"
    -- end,
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },
  {
    "theprimeagen/harpoon",
  },
  --  {
  --    "Vigemus/iron.nvim",
  --    event = "InsertEnter",
  --    config = function()
  --      require("iron.core").setup({
  --        config = {
  --          -- Whether a repl should be discarded or not
  --          scratch_repl = true,
  --          -- Your repl definitions come here
  --          repl_definition = {
  --            python = {
  --              command = {"ipython"},
  --              format = require("iron.fts.common").bracketed_paste,
  --            },
  --          },
  --          -- How the repl window will be displayed
  --          -- See below for more information
  --          repl_open_cmd = "vertical botright 80 split",
  --        },
  --        -- Iron doesn't set keymaps by default anymore.
  --        -- You can set them here or manually add keymaps to the functions in iron.core
  --        keymaps = {
  --          send_motion = "<space>sc",
  --          visual_send = "<space>sc",
  --          send_file = "<space>sf",
  --          send_line = "<space>sl",
  --          send_until_cursor = "<space>su",
  --          send_mark = "<space>sm",
  --          mark_motion = "<space>mc",
  --          mark_visual = "<space>mc",
  --          remove_mark = "<space>md",
  --          cr = "<space>s<cr>",
  --          interrupt = "<space>s<space>",
  --          exit = "<space>sq",
  --          clear = "<space>cl",
  --        },
  --        -- If the highlight is on, you can change how it looks
  --        -- For the available options, check nvim_set_hl
  --        highlight = {
  --          italic = true
  --        },
  --    ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
  --  })
  --    end,
  --  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
