return {
	"nvim-lualine/lualine.nvim",
	event = "ColorScheme",
	config = function()
		require("lualine").setup({
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
			options = {
				theme = "rose-pine",
				disabled_filetypes = {
					statusline = {
						"dashboard",
					},
				},
			},
		})
	end,
}
