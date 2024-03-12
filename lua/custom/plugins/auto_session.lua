-- https://github.com/rmagatti/auto-session
-- automatically reopen files in current folder
-- from last session

vim.o.sessionoptions="blank,buffers,curdir"

-- it has quite some impact on startup time
-- it reopens ALL buffers
-- not sure if it is worth it
-- maybe there is some option to slim it down

-- actually the problem does not seem to be autosession
-- because also without it this loads slow in the tw codebase
--
--  nvim src/game/client/gameclient.cpp
--
-- it seems to be treesitter taking up the majority of the startup time
-- auto-session just exposes how slow treesitter is
-- somehow I expected treesitter to lazy load but seems like it does not
-- when using telescope to open a file it feels instant
-- when opening a file with path directly there is a delay
-- not sure how that is done
-- does telescope preload treesitter?

return {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      auto_session_enable_last_session = false,
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Videos", "~/Downloads", "~/Documents"},
      -- auto_session_allowed_dirs = {
      --   "~/Desktop/git/*",
      --   "~/Desktop/git-extern/*",
      --   "~/.config/nvim/"
      -- },
    }
  end
}
