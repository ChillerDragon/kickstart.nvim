return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'ruby', 'php' },
        },
        indent = { enable = true, disable = { 'ruby', 'php' } },
    }
  }
}
