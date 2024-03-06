-- https://github.com/ecthelionvi/NeoView.nvim
-- load last cursor postion when reopening files

return {
  'ecthelionvi/NeoView.nvim',
  opts = {},
  config = function()
    require('NeoView').setup()
  end,
}
