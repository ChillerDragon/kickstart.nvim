function is_teeworlds_like_source()
  local filename_full_path = vim.fn.expand('%:p')
  -- TODO: detect based on file structure
  -- CMakeListst.txt bam.lua other/ src/ data/ datasrc/ .github etc
  if string.match(filename_full_path, "Desktop/git/ddnet/") then
    return true
  elseif string.match(filename_full_path, "Desktop/git/teeworlds/") then
    return true
  elseif string.match(filename_full_path, "Desktop/git/ddnet-insta/") then
    return true
  elseif string.match(filename_full_path, "Desktop/git/chillerbot-ux/") then
    return true
  elseif string.match(filename_full_path, "Desktop/git/chillerbot-zx/") then
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

