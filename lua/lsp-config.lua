--[[ lsp and coq setup ]]
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

local lsp = require("lspconfig")
local coq = require("coq")
local diagnostic = require("vim.diagnostic")
local keymap = require("vim.keymap")
local vlsp = require("vim.lsp")

--[[ Mappings. ]]
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
keymap.set("n", "<space>e", diagnostic.open_float, opts)
keymap.set("n", "[d", diagnostic.goto_prev, opts)
keymap.set("n", "]d", diagnostic.goto_next, opts)
keymap.set("n", "<space>q", diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vlsp.omnifunc")
	-- Mappings.
	-- See `:help vlsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gD", vlsp.buf.declaration, bufopts)
	keymap.set("n", "gd", vlsp.buf.definition, bufopts)
	keymap.set("n", "K", vlsp.buf.hover, bufopts)
	keymap.set("n", "gi", vlsp.buf.implementation, bufopts)
	keymap.set("n", "<C-k>", vlsp.buf.signature_help, bufopts)
	keymap.set("n", "<space>wa", vlsp.buf.add_workspace_folder, bufopts)
	keymap.set("n", "<space>wr", vlsp.buf.remove_workspace_folder, bufopts)
	keymap.set("n", "<space>wl", function()
		print(vim.inspect(vlsp.buf.list_workspace_folders()))
	end, bufopts)
	keymap.set("n", "<space>D", vlsp.buf.type_definition, bufopts)
	keymap.set("n", "<space>rn", vlsp.buf.rename, bufopts)
	keymap.set("n", "<space>ca", vlsp.buf.code_action, bufopts)
	keymap.set("n", "gr", vlsp.buf.references, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
lsp.pyright.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.sumneko_lua.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.gopls.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.bashls.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.ccls.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.html.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.jsonls.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.rls.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.ruby_ls.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.tailwindcss.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.tsserver.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.vimls.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
lsp.yamlls.setup({ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags })
