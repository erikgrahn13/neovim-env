vim.api.nvim_exec ('language en_US', true)
require "erik.keymaps"
require "erik.options"
require "erik.plugins"
require "erik.lualine"
require "erik.colorscheme"
require "erik.nvim-tree"
require "erik.telescope"
vim.cmd[[colorscheme tokyonight]]
vim.opt.shell ="bash.exe"
vim.opt.laststatus = 3
vim.opt.showmode = false

-- Check if :GuiFont command exists (indicating Neovim-Qt)
if vim.fn.exists(":GuiFont") == 2 then
    vim.cmd("GuiFont MesloLGS NF:h10")
end

