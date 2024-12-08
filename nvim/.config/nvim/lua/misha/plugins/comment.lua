return {
	{
		"numToStr/Comment.nvim",
		event = { "BufEnter" },
		opts = {
			toggler = {
				line = "<leader>/",
				-- [[ block = "<leader>/", ]]
			},
			opleader = {
				--[[ line = "<leader>/", ]]
				block = "<leader>/",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
