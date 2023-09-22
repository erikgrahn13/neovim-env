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

vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
-- Check if you're in neovim-qt
  -- Map Ctrl + V to paste from system clipboard in insert mode
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', opts) 

-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrowa
vim.api.nvim_set_keymap("n", "<C-Up>", ":horizontal resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":horizontal resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate Buffers --
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", opts)

vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-r>", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("t","<Leader><ESC>"  ,"<C-\\><C-n>"  ,opts)
