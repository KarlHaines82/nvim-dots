--[[ lsp and coq setup ]]
local lsp = require('lspconfig')
local coq = require('coq')

local kmap = vim.keymap
-- Mappings.                                                                               
-- See `:help vim.diagnostic.*` for documentation on any of the below functions            
local opts = { noremap=true, silent=true }
kmap.set('n', '<space>e', vim.diagnostic.open_float, opts)
kmap.set('n', '[d', vim.diagnostic.goto_prev, opts)
kmap.set('n', ']d', vim.diagnostic.goto_next, opts)
kmap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys                                
-- after the language server attaches to the current buffer                                
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>                                             
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.                                                                             
  -- See `:help vim.lsp.*` for documentation on any of the below functions                
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  kmap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  kmap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  kmap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  kmap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  kmap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  kmap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  kmap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  kmap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  kmap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  kmap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  kmap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  kmap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  kmap.set('n', '<space>f', function()
    vim.lsp.buf.format{async = true}
  end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lsp.pyright.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.sumneko_lua.setup{coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.gopls.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.bashls.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.ccls.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.html.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.jsonls.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.rls.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.ruby_ls.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.tailwindcss.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.tsserver.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.vimls.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
lsp.yamlls.setup{ coq.lsp_ensure_capabilities(), on_attach = on_attach, flags = lsp_flags }
