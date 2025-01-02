-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "clangd", "clang-format" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },

    capabilities = nvlsp.capabilities,
})

lspconfig.gdscript.setup({
    capabilities = nvlsp.capabilities,
})

lspconfig.clangd.setup({
    capabilities = nvlsp.capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        nvlsp.on_attach(client, bufnr)
    end,
})
