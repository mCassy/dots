local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- vim.cmd([[
--   autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
--   autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
-- ]])

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
	print("Autorformat-on-save disabled for current buffer")
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
	print("Autorformat-on-save enabled")
end, {
	desc = "Re-enable autoformat-on-save",
})
