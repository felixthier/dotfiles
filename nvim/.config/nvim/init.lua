require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- keymaps
local tBuiltin = require "telescope.builtin"

vim.keymap.set("n", "<leader>sh", tBuiltin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", tBuiltin.keymaps, { desc = "[S]earch] [K]eymaps" })
vim.keymap.set("n", "<leader>sf", tBuiltin.find_files, { desc = "[S]earch] [F]iles" })
vim.keymap.set("n", "<leader>ss", tBuiltin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", tBuiltin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", tBuiltin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", tBuiltin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", tBuiltin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", tBuiltin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", tBuiltin.buffers, { desc = "[ ] Find existing buffers" })
