local opt = vim.opt

opt.wrap = false
opt.undofile = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.spelllang = "en_us"
opt.spell = false
opt.guicursor = ""
opt.termguicolors = true
opt.shell = "/usr/local/bin/bash"
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
-- opt.background = "dark"
