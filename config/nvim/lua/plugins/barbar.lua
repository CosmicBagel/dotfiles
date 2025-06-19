return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			animation = false,
			-- insert_at_start = true,
			-- …etc.
			auto_hide = 1,
			icons = {
				buffer_index = true,
				buffer_number = false,
				diagnostics = { { enabled = true }, { enabled = true } },
				modified = { button = "●" },
				pinned = { button = "", filename = true },
			},
		})

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { noremap = true, silent = true, desc = desc })
		end

		-- Move to previous/next
		map("<S-Tab>", "<Cmd>BufferPrevious<CR>", "Previous Buffer")
		map("<Tab>", "<Cmd>BufferNext<CR>", "Next Buffer")
		map("<C-i>", "<C-i>", "Jumplist Forward") -- needed, otherwise tab mapping overrides ctrl-i
		map("<C-o>", "<C-o>", "Jumplist Backward") -- including this for uniformity
		map("<D-,>", "<Cmd>BufferPrevious<CR>", "Previous Buffer")
		map("<D-.>", "<Cmd>BufferNext<CR>", "Next Buffer")
		-- Re-order to previous/next
		map("<DC-,>", "<Cmd>BufferMovePrevious<CR>", "Move Buffer Left")
		map("<DC-.>", "<Cmd>BufferMoveNext<CR>", "Move Buffer Right")
		-- Goto buffer in position...
		map("<D-1>", "<Cmd>BufferGoto 1<CR>", "Goto Buffer 1")
		map("<D-2>", "<Cmd>BufferGoto 2<CR>", "Goto Buffer 2")
		map("<D-3>", "<Cmd>BufferGoto 3<CR>", "Goto Buffer 3")
		map("<D-4>", "<Cmd>BufferGoto 4<CR>", "Goto Buffer 5")
		map("<D-5>", "<Cmd>BufferGoto 5<CR>", "Goto Buffer 5")
		map("<D-6>", "<Cmd>BufferGoto 6<CR>", "Goto Buffer 6")
		map("<D-7>", "<Cmd>BufferGoto 7<CR>", "Goto Buffer 7")
		map("<D-8>", "<Cmd>BufferGoto 8<CR>", "Goto Buffer 8")
		map("<D-9>", "<Cmd>BufferGoto 9<CR>", "Goto Buffer 9")
		map("<D-0>", "<Cmd>BufferLast<CR>", "Goto Last Buffer")

		-- Buffer keys behind leader key
		map("<Leader>pp", "<Cmd>BufferPin<CR>", "Pin/Unpin Buffer")
		map("<Leader>pd", "<Cmd>BufferCloseAllButPinned<CR>", "Close all but pinned buffers")
		map("<Leader>pa", "<Cmd>BufferCloseAllButCurrent<CR>", "Close all but current buffer")
		map("<Leader>px", "<Cmd>BufferClose<CR>", "Close current buffer (leave window open)")
	end,
}
