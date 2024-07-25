vim.api.nvim_create_autocmd('FileType', {
  -- This handler will fire when the buffer's 'filetype' is "python"
  pattern = 'asm',
  callback = function()
    vim.lsp.start({
      name = 'chiller_lsp',
      cmd = {
        "npx", "ts-node",
        "/home/chiller/Desktop/git/chiller_ls/src/server.ts",
        "--stdio",
      },
      -- Set the "root directory" to the parent directory of the file in the
      -- current buffer (`args.buf`) that contains either a "setup.py" or a
      -- "pyproject.toml" file. Files that share a root directory will reuse
      -- the connection to the same LSP server.
      -- root_dir = vim.fs.root(args.buf, {'setup.py', 'pyproject.toml'}),
      -- root_dir = vim.fs.root(args.buf, {'.git', 'LICENSE', 'README.md'}),
      root_dir = vim.fn.getcwd(),
    })
  end,
})

-- local lsp = require 'lspconfig'
-- 
-- vim.tbl_deep_extend('keep', lsp, {
--     chiller_lsp = {
--         name = 'chiller_lsp',
--         cmd = {
--             "npx", "ts-node",
--             "/home/chiller/Desktop/git/minimum-viable-vscode-language-server-extension/server/src/server.ts",
--             "--stdio"
--         },
--         filetypes = 'text',
--     }
-- })

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 
-- vim.lsp.start {
--     name = "chiller-ls",
--     cmd = {
--         "npx", "ts-node",
--         "/home/chiller/Desktop/git/minimum-viable-vscode-language-server-extension/server/src/server.ts",
--         "--stdio"
--     },
--     capabilities = capabilities
-- }

