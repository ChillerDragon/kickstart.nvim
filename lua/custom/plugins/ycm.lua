local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

-- vim.g["g:ycm_filetype_whitelist"] = "{'asm': 1}"
-- vim.g["ycm_filetype_blacklist"] = "{'*': 1}"

vim.cmd [[
let g:ycm_filetype_whitelist = {'asm': 1}
let g:ycm_filetype_blacklist = {'*': 1}
]]

return {
  'ycm-core/YouCompleteMe',
  config = function()
    -- omg i had to bump the 313 number
    for _, so_version in ipairs({"311", "313"}) do
      local ycmd_so = os.getenv("HOME") .. "/.local/share/nvim/lazy/YouCompleteMe/third_party/ycmd/ycm_core.cpython-" .. so_version .. "-x86_64-linux-gnu.so"
      if file_exists(ycmd_so) then
        return
      end
    end
    vim.cmd("!python3 ~/.local/share/nvim/lazy/YouCompleteMe/install.py")
  end
}
