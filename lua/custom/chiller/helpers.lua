function is_teeworlds_like_source()
  local filename_full_path = vim.fn.expand('%:p')
  -- TODO: detect based on file structure
  -- CMakeListst.txt bam.lua other/ src/ data/ datasrc/ .github etc
  if string.match(filename_full_path, "Desktop/git/ddnet/") then
    return true
  elseif string.match(filename_full_path, "Desktop/git/teeworlds/") then
    return true
  elseif string.match(filename_full_path, "Desktop/git/ddnet%-insta/") then
    return true
  elseif string.match(filename_full_path, "Desktop/git/chillerbot%-ux/") then
    return true
  elseif string.match(filename_full_path, "Desktop/git/chillerbot%-zx/") then
    return true
  elseif string.match(filename_full_path, "Desktop/git/DDNetPP/") then
    return true
  end
  return false
end

function teeworlds_src_dirs()
  return {
    "src",
    "datasrc",
    ".gitignore",
    "Dockerfile",
    "scripts",
  }
end

-- merges two flat tables rewriting all keys
-- and returning the merged copy
local merge = function(a, b)
  local both = {}
  local counter = 1
  for _, v in pairs(a) do
    both[counter] = v
    counter = counter + 1
  end
  for _, v in pairs(b) do
    both[counter] = v
    counter = counter + 1
  end
  return both
end

function chiller_telescope_file_ignore_patterns()
  local ignores = {}

  -- -- can not use filename because its empty
  -- -- when i just open vim in the project without
  -- -- providing a file
  -- local filename_full_path = vim.fn.expand('%:p')
  local cwd = vim.fn.getcwd() .. "/"
  if string.match(cwd, "Desktop/git/ddnet%-insta/") then
    ignores = merge(ignores, {
      'src/game/client'
    })
  end

  ignores = merge(ignores, {
    '^node_modules',
    '^dist',
    '^.git',
    '^.cache',
    '^.sass[-]cache', -- jekyll .sass-cache/
    '^tmp/cache',
    '^.mypy_cache',
    '/.mypy_cache/',
    '^.ruff_cache',
    '^.pytest_cache',
    '^venv/share/python.wheels/.*.whl',
    '^venv/lib/.*site.packages',
    '__pycache__',
    '^target/debug',
    '^target/release',
    '^build.*/CMakeFiles/',
    '^build.*/debug/incremental/',
    '^build.*/_deps/',
    '^ddnet[-]libs/',
    -- java stuff for coffeeworlds
    '.class$',
    '^gradle/',
    '/build/reports/',
    '/build/tmp/',
    '/build/test.results/',
    '^.gradle',
    '^buildSrc', -- this one should probably not be ignored but its annoying
  })
  return ignores
end

