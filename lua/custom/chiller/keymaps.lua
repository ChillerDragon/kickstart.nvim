-- chiller
vim.keymap.set('n', '<leader>ft', function()
  vim.cmd 'Neotree toggle'
end, { desc = '[F]ile [T]tree' })


vim.keymap.set('n', '<C-k><C-t>', function()
  -- TODO: use telescope to pick themes
  --       can be done with
  --
  -- vim.cmd('Telescope colorscheme')
  --
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
  -- if vim.cmd.colorscheme() == 'tokyonight' then
  --   vim.cmd.colorscheme 'tokyonight-day'
  -- else
  --   vim.cmd.colorscheme 'tokyonight'
  -- end
end, { desc = 'switch theme (same keybind as vscode)' })

vim.keymap.set('n', 'c', function()
  -- TODO: in vanilla vim i used shellescape('%')
  --       instead of plain %
  --       that seems more robust and should probably also be done here
  --       if the current file path is funny it should not break
  --       or do anything unexpected

  local file_exists = function (name)
    local f = io.open(name, "r")
    return f ~= nil and io.close(f)
  end

  local cmd_if_make = function (current_cmd)
    local makefile_path = vim.fn.getcwd() .. "/Makefile"
    if file_exists(makefile_path) then
      return 'make'
    end
    return current_cmd
  end

  local cmd_if_tw_codebase = function (current_cmd)
    local filename_full_path = vim.fn.expand('%:p')

    local run_cmd = current_cmd

    if string.match(filename_full_path, "Desktop/git/ddnet/src") then
      run_cmd = "cd ~/Desktop/git/ddnet/build/ && make -j$(nproc) "
      -- run_cmd = run_cmd .. " && ./DDNet-Server"
    elseif string.match(filename_full_path, "Desktop/git/teeworlds/src") then
      run_cmd = "cd ~/Desktop/git/teeworlds/build/ && make -j$(nproc) "
      -- run_cmd = run_cmd .. " && ./teeworlds_srv"
    end

    return run_cmd
  end

  local run_cmd = nil
  local filename = vim.fn.expand('%')
  if vim.bo.filetype == 'lua' then
    run_cmd = 'lua %'
  elseif vim.bo.filetype == 'ruby' then
    run_cmd = 'ruby %'
  elseif vim.bo.filetype == 'javascript' then
    run_cmd = 'node %'
  elseif vim.bo.filetype == 'typescript' then
    run_cmd = 'npx ts-node %'
  elseif vim.bo.filetype == 'python' then
    run_cmd = 'PYTHONPATH=. python3 %'
    if string.match(filename, "tests/(.*)_test%.py$") then
      run_cmd = 'python -m pytest %'
    end
  elseif vim.bo.filetype == 'sh' then
    run_cmd = 'bash %'
  elseif vim.bo.filetype == 'c' then
    run_cmd = 'gcc -ggdb % -o %:r && ./%:r'
    run_cmd = cmd_if_make(run_cmd)
  elseif vim.bo.filetype == 'cpp' then
    run_cmd = 'g++ -ggdb % -o %:r && ./%:r'
    run_cmd = cmd_if_make(run_cmd)
    run_cmd = cmd_if_tw_codebase(run_cmd)
  elseif vim.bo.filetype == 'haskell' then
    run_cmd = 'ghc % && ./%:r'
  end
  if run_cmd ~= nil then
    run_cmd = '!printf "\\n\\n" && ' .. run_cmd
    vim.cmd(run_cmd)
  end
end, { desc = '[C]ompile and run current buffer' })
