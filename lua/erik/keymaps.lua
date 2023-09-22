local opts = { noremap = true, silent = true }

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Startup fullscreen if Neovim-qt
vim.cmd([[
  augroup MyGuiGroup
    autocmd!
    autocmd VimEnter * if exists(':Gui') | call GuiWindowFullScreen(1) | endif
  augroup END
]])

-- Toggle fullscreen for Neovim-qt
local fullscreen = false

_G.toggleFullScreen = function()
    if fullscreen then
        vim.cmd('call GuiWindowFullScreen(0)')
    else
        vim.cmd('call GuiWindowFullScreen(1)')
    end
    fullscreen = not fullscreen
end

vim.api.nvim_set_keymap('n', '<F11>', ':lua _G.toggleFullScreen()<CR>',opts) 

vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle 30<CR>", opts)
-- Check if you're in neovim-qt
  -- Map Ctrl + V to paste from system clipboard in insert mode
    vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', opts) 
