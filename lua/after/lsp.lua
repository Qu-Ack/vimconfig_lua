local lsp_zero = require("lsp-zero")
local cmp = require("cmp")

lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = {
		["<cr>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.abort(),
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		["<C-p>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
		["<C-n>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("lspconfig").tsserver.setup({})

require("lspconfig").tailwindcss.setup({})

require("lspconfig").gopls.setup({})

require("lspconfig").lua_ls.setup({})

require("lspconfig").html.setup({})

require("lspconfig").pyright.setup({})

require("lspconfig").ast_grep.setup({})
