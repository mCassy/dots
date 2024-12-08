vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Tmux left", remap = true })
keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Tmux down", remap = true })
keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Tmux right", remap = true })
keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Tmux up", remap = true })

keymap.set("n", "<leader>cm", "<cmd> Mason<CR>", { desc = "Open Mason", remap = true })

keymap.set("n", "<S-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<S-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

keymap.set("n", "d", '"_d', { noremap = true })
keymap.set("v", "d", '"_d', { noremap = true })

keymap.set("v", "p", "pgvy", { noremap = true })
keymap.set("n", "p", "pgvy", { noremap = true })

keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })

keymap.set("n", "<leader>tc", "<cmd>Trouble todo<CR>", { desc = "Open todo list" })

keymap.set("n", "<leader>bd", "<cmd> Sayonara!<cr>", { desc = "Delete Buffer" })
keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

keymap.set("n", "<leader>cd", "<cmd> FormatDisable!<cr>", { desc = "Disable formatting for current buffer" })
keymap.set("n", "<leader>ce", "<cmd> FormatEnable<cr>", { desc = "Enable formatting for current buffer" })

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
keymap.set(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / Clear hlsearch / Diff Update" }
)
keymap.set("n", "<leader>mt", "<cmd> RenderMarkdown toggle<CR>", { desc = "Toggle Mardown render" })

keymap.set("n", "<leader>eg", ":Neotree source=git_status<CR>", { silent = true, desc = "Git Explorer" })
keymap.set("n", "<leader>ee", ":Neotree source=filesystem<CR>", { silent = true, desc = "Git Explorer" })
