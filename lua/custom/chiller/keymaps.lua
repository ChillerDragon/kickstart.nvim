-- chiller
vim.keymap.set('n', '<leader>ft', function()
  vim.cmd 'Neotree toggle'
end, { desc = '[F]ile [T]tree' })


vim.keymap.set('n', '<C-k><C-t>', function()
  -- TODO: use telescope to pick themes
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end, { desc = 'switch theme (same keybind as vscode)' })

vim.keymap.set('n', 'c', function()
  -- TODO: in vanilla vim i used shellescape('%')
  --       instead of plain %
  --       that seems more robust and should probably also be done here
  --       if the current file path is funny it should not break
  --       or do anything unexpected
  local run_cmd = nil
  local filename = vim.fn.expand('%')
  local filename_full_path = vim.fn.expand('%:p')
  if vim.bo.filetype == 'lua' then
    run_cmd = 'lua %'
  elseif vim.bo.filetype == 'ruby' then
    run_cmd = 'ruby %'
  elseif vim.bo.filetype == 'javascript' then
    run_cmd = 'node %'
  elseif vim.bo.filetype == 'typescript' then
    run_cmd = 'npx ts-node %'
  elseif vim.bo.filetype == 'python' then
    run_cmd = 'PYTHONPATH=. python %'
    if string.match(filename, "tests/(.*)_test%.py$") then
      run_cmd = 'python -m pytest %'
    end
  elseif vim.bo.filetype == 'sh' then
    run_cmd = 'bash %'
  elseif vim.bo.filetype == 'c' then
    run_cmd = 'gcc -ggdb % -o %:r && ./%:r'
  elseif vim.bo.filetype == 'cpp' then
    run_cmd = 'g++ -ggdb % -o %:r && ./%:r'
    if string.match(filename_full_path, "Desktop/git/ddnet/src") then
      run_cmd = "cd ~/Desktop/git/ddnet/build/ && make -j$(nproc) && ./DDNet-Server"
    elseif string.match(filename_full_path, "Desktop/git/teeworlds/src") then
      run_cmd = "cd ~/Desktop/git/teeworlds/build/ && make -j$(nproc) && ./teeworlds_srv"
    end
  elseif vim.bo.filetype == 'haskell' then
    run_cmd = 'ghc % && ./%:r'
  end
  if run_cmd ~= nil then
    run_cmd = '!printf "\\n\\n" && ' .. run_cmd
    vim.cmd(run_cmd)
  end
end, { desc = '[C]ompile and run current buffer' })
