-- :Neotree to open it
-- docs for additional config:
-- https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file#quickstart

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {}
  end,
}
