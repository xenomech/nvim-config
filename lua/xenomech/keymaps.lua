--[[ keymap.lua ]] 

vim.g.mapleader = " " 

vim.keymap.set("n","<leader>ex",vim.cmd.Ex)
-- move blocks of code up down and in and out of scope
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>pm","<CMD>PackerSync<CR>")
vim.keymap.set("n","<leader><leader>","<CMD>so<CR>")
vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>o", "<CMD>Neotree focus<CR>")


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<A-p>', builtin.find_files, {})
vim.keymap.set('n', '<A-S-p>', builtin.git_files,{})
vim.keymap.set('n', '<A-b>', builtin.buffers, {})
vim.keymap.set('n', '<A-f>', function()
	builtin.grep_string({
		search=vim.fn.input("Grep text =>")
	})
end)

-- Use ctrl-[hjkl] to select the active split!
vim.keymap.set( 'n', '<C-k>', '<CMD>:wincmd k<CR>')
vim.keymap.set( 'n', '<C-j>', '<CMD>:wincmd j<CR>')
vim.keymap.set( 'n', '<C-h>', '<CMD>:wincmd h<CR>')
vim.keymap.set( 'n', '<C-l>', '<CMD>:wincmd l<CR>')

