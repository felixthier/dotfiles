local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local py_path = "/home/felix/miniconda3/bin/python"
-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      configurationSources = { "flake8" },
      plugins = {
        -- formatting options
        black = {
          enabled = true,
        },
        autopep8 = {
          enabled = false,
        },
        yapf = {
          enabled = false,
        },
        -- linter options
        pylint = {
          enabled = true,
          executable = "pylint",
        },
        ruff = {
          enabled = false,
        },
        pyflakes = {
          enabled = false,
        },
        pycodestyle = {
          enabled = false,
        },
        -- type checker options
        mypy = {
          enabled = true,
          live_mode = false,
          report_progress = true,
          overrides = {
            "--python-executable",
            py_path,
            true,
          },
        },
        -- auto completion options
        jedi_completion = {
          fuzzy = true,
        },
        -- import sorting
        isort = {
          enabled = true,
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
  },
}
--
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "python" },
--   settings = {
--     pyright = {
--       autoImportCompletions = true,
--     },
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--         diagnosticMode = "openFilesOnly",
--         typeCheckingMode = "off",
--       },
--     },
--   },
-- }
