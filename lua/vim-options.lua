vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set relativenumber")
vim.cmd("set ignorecase smartcase")
vim.g.mapleader = " "

vim.keymap.set('n', "j", "gj", {remap = true})
vim.keymap.set('n', "k", "gk", {remap= true})
vim.keymap.set("n", "<esc>", ":nohlsearch<CR>", {
	remap = true,
})
vim.keymap.set("n", "<leader>\\", ":vsplit<CR>")
vim.keymap.set("n", "<leader>-", ":split<CR>")
