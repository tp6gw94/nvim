vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set relativenumber")
vim.cmd("set ignorecase smartcase")
vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<esc>", ":nohlsearch<CR>", {
	remap = true,
})
vim.keymap.set("n", "<leader>\\", ":vsplit<CR>")
vim.keymap.set("n", "<leader>-", ":split<CR>")
