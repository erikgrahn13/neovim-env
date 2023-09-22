vim.api.nvim_exec ('language en_US', true)
require "erik.keymaps"
require "erik.options"
require "erik.plugins"
require "erik.lualine"
require "erik.colorscheme"
require "erik.nvim-tree"
require "erik.telescope"
vim.cmd[[colorscheme tokyonight]]

-- Check if :GuiFont command exists (indicating Neovim-Qt)
if vim.fn.exists(":GuiFont") == 2 then
    vim.cmd("GuiFont MesloLGS NF:h10")
end
