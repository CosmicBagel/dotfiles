return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },

		"Hoffs/omnisharp-extended-lsp.nvim",
	},
	config = function()
		-- make diagnostic popup nice (doesn't depend on lsp, but just fits here)
		vim.diagnostic.config({
			float = { border = "rounded" },
		})

		-- nice icons for gutter elements
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = " ",
				},
			},
		})

		-- give LspInfo window nicer border
		local win = require("lspconfig.ui.windows")
		win.default_options.border = "rounded"

		-- keymaps for diagnostics (not dependent on LSP, but fits here)
		vim.keymap.set("n", "<leader>k", function()
			local dap = require("dap")
			if dap ~= nil and dap.session() ~= nil then
				require("dap.ui.widgets").hover()
				return
			end
			-- default to open_float when no active dap session
			vim.diagnostic.open_float()
		end, { desc = "Hover Diagnostic" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true, wrap = false })
		end, { desc = "Next Diagnostic" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true, wrap = false })
		end, { desc = "Prev Diagnostic" })
		vim.keymap.set("n", "<leader>xh", vim.diagnostic.hide, { desc = "Hide Diagnostics" })
		vim.keymap.set("n", "<leader>xs", vim.diagnostic.show, { desc = "Show Diagnostics" })

		-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
		-- and elegantly composed help section, `:help lsp-vs-treesitter`

		--  This function gets run when an LSP attaches to a particular buffer.
		--    That is to say, every time a new file is opened that is associated with
		--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
		--    function will be executed to configure the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("CosmicBagel-LspAttach", { clear = true }),
			callback = function(event)
				-- NOTE: Remember that Lua is a real programming language, and as such it is possible
				-- to define small helper and utility functions so you don't have to repeat yourself.
				--
				-- In this case, we create a function that lets us more easily define mappings specific
				-- for LSP related items. It sets the mode, buffer and description for us each time.
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Decorate floating windows
				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

				vim.lsp.handlers["textDocument/signatureHelp"] =
					vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

				-- Jump to the definition of the word under your cursor.
				--  This is where a variable was first declared, or where a function is defined, etc.
				--  To jump back, press <C-t>.
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				-- Find references for the word under your cursor.
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

				-- Jump to the implementation of the word under your cursor.
				--  Useful when your language has ways of declaring types without an actual implementation.
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

				-- Fuzzy find all the symbols in your current document.
				--  Symbols are things like variables, functions, types, etc.
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

				-- Fuzzy find all the symbols in your current workspace.
				--  Similar to document symbols, except searches over your entire project.
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- Rename the variable under your cursor.
				--  Most Language Servers support renaming across files, etc.
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				-- Opens a popup that displays documentation about the word under your cursor
				--  See `:help K` for why this keymap.
				map("K", function()
					vim.lsp.buf.hover({ border = "rounded" })
				end, "Hover Documentation")

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				--  For example, in C this would take you to the header.
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				-- right-click menu items
				vim.cmd.amenu([[PopUp.Code\ action <Cmd>lua vim.lsp.buf.code_action()<CR>]])
				vim.cmd.amenu([[PopUp.LSP\ Hover <Cmd>lua vim.lsp.buf.hover({ border = "rounded" })<CR>]])

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end

				if client and (client.name == "omnisharp" or client.name == "omnisharp_mono") then
					-- omnisahrp has special stuff, so we want to override the keymaps
					map("gd", require("omnisharp_extended").telescope_lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("omnisharp_extended").telescope_lsp_references, "[G]oto [R]eferences")
					map("gI", require("omnisharp_extended").telescope_lsp_implementation, "[G]oto [I]mplementation")
					map("<leader>D", require("omnisharp_extended").telescope_lsp_type_definition, "Type [D]efinition")
				end
			end,
		})

		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP specification.
		--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- for UFO, some LSPs interfere with UFO in a bad way, this prevents that
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. Available keys are:
		--  - cmd (table): Override the default command used to start the server
		--  - filetypes (table): Override the default list of associated filetypes for the server
		--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--  - settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

		-- godot script / shaders aren't provided by mason
		require("lspconfig").gdscript.setup({})
		require("lspconfig").gdshader_lsp.setup({})

		local servers = {}
		servers.clangd = {
			filetypes = { "c", "h", "hpp", "cpp", "objc", "objcpp", "cuda", "proto" },
			root_dir = require("lspconfig").util.root_pattern(
				".clangd",
				".clang-tidy",
				".clang-format",
				"compile_commands.json",
				"compile_flags.txt",
				"configure.ac",
				".git"
			),
			single_file_support = true,
		}
		servers.gopls = {}
		servers.rust_analyzer = {}

		-- had this set when I was using master versions of zig and zls
		-- vim.g.zig_fmt_autosave = 0
		local home_dir = os.getenv("HOME") or os.getenv("USERPROFILE")
		servers.zls = {
			cmd = { home_dir .. "/bin/zls" },
			filetypes = { "zig", "zir" },
			root_markers = { "zls.json", "build.zig", ".git" },
		}

		-- pyright = {}
		-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
		--
		-- Some languages (like typescript) have entire language plugins that can be useful:
		--    https://github.com/pmizio/typescript-tools.nvim
		--
		-- But for many setups, the LSP (`ts_ls`) will work just fine
		-- ts_ls = {},

		servers.ts_ls = {
			---@diagnostic disable-next-line: missing-fields
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
			},
		}

		local omnisharp_path = vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll"
		servers.omnisharp = {
			root_dir = require("lspconfig").util.root_pattern("*.sln", "*.csproj", "*.fsproj", ".git"),
			cmd = { "dotnet", omnisharp_path },
			settings = {
				RoslynExtensionsOptions = {
					enableImportCompletion = true,
					analyzeOpenDocumentsOnly = false,
					enableAnalyzersSupport = true,
				},
			},
		}

		servers.lua_ls = {
			settings = {
				Lua = {
					filetypes = { "lua" },
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		}

		servers.tailwindcss = {
			-- default tailwindcss is very aggressive and attaches to a shit
			-- load of filetypes, restricting it to just css for now, may add
			-- some html and template files back later
			filetypes = { "css", "less", "postcss", "sass", "scss", "stylus", "sugarss" },
		}

		servers.yamlls = {
			filetypes = { "yaml", "yml" },
			settings = {
				yaml = {
					schemas = {
						kubernetes = {
							"/**.k8s.yaml",
							"/**.k8s.yml",
						},
					},
				},
			},
		}

		servers.helm_ls = {}

		servers.basedpyright = {}

		servers.phpactor = {}

		require("mason-lspconfig").setup({
			autonatic_enable = false,
			ensure_installed = vim.tbl_keys(servers or {}),
		})

		-- You can add other tools here that you want Mason to install
		-- for you, so that they are available from within Neovim.
		local non_lsp_ensure_installed = {
			"stylua", -- Used to format Lua code
			"prettier", -- JS and web shit
			"gofumpt",
			"black",
		}
		require("mason-tool-installer").setup({ ensure_installed = non_lsp_ensure_installed })

		for server_name, server_config in pairs(servers) do
			-- This handles overriding only values explicitly passed
			-- by the server configuration above. Useful when disabling
			-- certain features of an LSP (for example, turning off formatting for tsserver)
			server_config.autostart = true
			server_config.capabilities =
				vim.tbl_deep_extend("force", {}, capabilities, server_config.capabilities or {})
			server_config.inlay_hints = { enabled = true }
			server_config.single_file_support = true

			vim.lsp.config[server_name] = server_config
			vim.lsp.enable(server_name)
		end
	end,
}
