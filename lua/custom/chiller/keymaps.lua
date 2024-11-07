-- chiller
vim.keymap.set('n', '<leader>ft', function()
  vim.cmd 'Neotree toggle'
end, { desc = '[F]ile [T]tree' })

vim.keymap.set("n", "<C-w>z", function()
  if vim.fn.tabpagenr() == 1 then
    vim.cmd(":tab split")
  else
    vim.cmd(":tab close")
  end
end, {})

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

vim.keymap.set('n', ',rt', function()
  local run_cmd = nil
  local filename = vim.fn.expand('%')
  if vim.bo.filetype == 'lua' then
    run_cmd = 'luacheck %'
  elseif vim.bo.filetype == 'ruby' then
    run_cmd = 'rubocop %'
  elseif vim.bo.filetype == 'javascript' then
    run_cmd = 'standard %'
  elseif vim.bo.filetype == 'typescript' then
    run_cmd = 'npx ts-standard %'
  elseif vim.bo.filetype == 'python' then
    local py_linter = 'pylint'
    -- if vim.fn.executable 'ruff' == 1 then
    --   py_linter = 'ruff'
    -- end
    run_cmd = 'PYTHONPATH=. ' .. py_linter .. ' %'
  elseif vim.bo.filetype == 'sh' then
    run_cmd = 'shellcheck %'
  elseif vim.bo.filetype == 'c' then
    run_cmd = 'clang-tidy %'
  elseif vim.bo.filetype == 'cpp' then
    run_cmd = 'clang-tidy %'
  end
  if run_cmd ~= nil then
    run_cmd = '!printf "\\n\\n" && ' .. run_cmd
    vim.cmd(run_cmd)
  end
end, { desc = '[R]un [T]ests' })

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

  local cmd_if_make_test = function (current_cmd)
    local makefile_path = vim.fn.getcwd() .. "/Makefile"
    if file_exists(makefile_path) then
      return 'make && make test'
    end
    return current_cmd
  end

  local cmd_if_known_java_project = function (current_cmd)
    local filename_full_path = vim.fn.expand('%:p')

    local run_cmd = current_cmd

    if string.match(filename_full_path, "Desktop/git/coffeeworlds") then
      run_cmd = "cd ~/Desktop/git/coffeeworlds && ./gradlew test "
    end

    return run_cmd
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
    elseif string.match(filename_full_path, "Desktop/git/chillerbot%-zx/src/external/chillerbot%-twbl/src") then
      run_cmd = "cd ~/Desktop/git/chillerbot-zx/build/ && make -j$(nproc) "
    elseif string.match(filename_full_path, "Desktop/git/DDNetPP/src/external/DDNetPP%-bots/src") then
      run_cmd = "cd ~/Desktop/git/DDNetPP/build/ && make -j$(nproc) "
    elseif string.match(filename_full_path, "Desktop/git/TeeworldsBotLib/src") then
      -- this is not a tw code base but yolo it kinda belongs here
      run_cmd = "cd ~/Desktop/git/TeeworldsBotLib/build/ && make -j$(nproc) && make test"
    end

    return run_cmd
  end

  local run_cmd = nil
  local filename = vim.fn.expand('%')
  if vim.bo.filetype == 'lua' then
    run_cmd = 'lua %'
  elseif vim.bo.filetype == 'ruby' then
    run_cmd = 'ruby %'
    if string.match(filename, "(.*)_test%.rb$") then
      run_cmd = 'rspec %'
    end
    if string.match(filename, "(.*)_spec%.rb$") then
      run_cmd = 'rspec %'
    end
  elseif vim.bo.filetype == 'go' then
    run_cmd = 'go run %'
    -- run_cmd = 'go build ./...'
    if string.match(filename, "_test%.go$") then
      run_cmd = 'go test ./...'
    end
  elseif vim.bo.filetype == 'rust' then
    run_cmd = 'rustc % && ./%:r'
    if string.match(filename, "src/(.*)%.rs$") then
      run_cmd = 'cargo build'
    end
    if string.match(filename, "lib/(.*)%.rs$") then
      run_cmd = 'cargo build'
    end
  elseif vim.bo.filetype == 'javascript' then
    run_cmd = 'node %'
  elseif vim.bo.filetype == 'typescript' then
    run_cmd = 'npx ts-node %'
  elseif vim.bo.filetype == 'python' then
    run_cmd = 'PYTHONPATH=. python3 %'
    if string.match(filename, "tests/(.*)_test%.py$") then
      run_cmd = 'python3 -m pytest %'
    end
  elseif vim.bo.filetype == 'sh' then
    run_cmd = 'bash %'
  elseif vim.bo.filetype == 'swift' then
    run_cmd = 'swift build'
  elseif vim.bo.filetype == 'make' then
    run_cmd = 'make'
  elseif vim.bo.filetype == 'asm' then
    run_cmd = 'nasm -f elf64 % -o %:r.o && ld -s -o %:r %:r.o && ./%:r'
    run_cmd = cmd_if_make_test(run_cmd)
  elseif vim.bo.filetype == 'c' then
    run_cmd = 'gcc -ggdb % -o %:r && ./%:r'
    run_cmd = cmd_if_make(run_cmd)
  elseif vim.bo.filetype == 'cpp' then
    run_cmd = 'g++ -ggdb % -o %:r && ./%:r'
    run_cmd = cmd_if_make(run_cmd)
    run_cmd = cmd_if_tw_codebase(run_cmd)
  elseif vim.bo.filetype == 'java' then
    run_cmd = 'echo there is no java support yet'
    run_cmd = cmd_if_known_java_project(run_cmd)
  elseif vim.bo.filetype == 'haskell' then
    run_cmd = 'ghc % && ./%:r'
  end
  if run_cmd ~= nil then
    run_cmd = '!printf "\\n\\n" && ' .. run_cmd
    vim.cmd(run_cmd)
  end
end, { desc = '[C]ompile and run current buffer' })
