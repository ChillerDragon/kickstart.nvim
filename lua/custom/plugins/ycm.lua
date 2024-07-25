local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

return {
  'ycm-core/YouCompleteMe',
  config = function()
    if file_exists(os.getenv("HOME") .. "/.local/share/nvim/lazy/YouCompleteMe/third_party/ycmd/ycm_core.cpython-311-x86_64-linux-gnu.so") then
      return
    end
    vim.cmd("!python3 ~/.local/share/nvim/lazy/YouCompleteMe/install.py")
  end
}
