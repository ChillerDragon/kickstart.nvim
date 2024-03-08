-- https://github.com/neovim/nvim-lspconfig/blob/e172dd599cff2ae5267871b5e33fb42934c4df43/doc/server_configurations.md#bashls
-- lspconfig is installed by default by kickstart
-- but we need to activate bashls
-- to get shellcheck
-- i manually installed the bash language server via npm
--
--  npm i -g bash-language-server
--
-- Not sure if that was needed. If that is the case there has to be a way to automate it
-- this neovim config should auto install all its dependencies ideally
--
-- Ok trololol I was too lazy to figure out the config to show the shellcheck ids
-- So I edited the code -.-
-- In the auto setup I should include the following
--
--  git clone https://github.com/ChillerDragon/bash-language-server
--  cd bash-language-server
--  npm i -g pnpm
--  pnpm install
--  npm run reinstall-server
--

require'lspconfig'.bashls.setup{}

