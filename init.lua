--require("config.lazy")
--
---- Make sure MSVC cl.exe is visible to Neovim on Windows
--if vim.loop.os_uname().sysname == "Windows_NT" then
--    local cl_dir =
--        [[C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Tools\MSVC\14.50.35717\bin\Hostx64\x64]]
--    -- append to PATH if not already there
--    if not string.find(vim.env.PATH or "", cl_dir, 1, true) then
--        vim.env.PATH = (vim.env.PATH or "") .. ";" .. cl_dir
--    end
--end
--
---- Load all plugins from lua/plugins/
--require("lazy").setup("plugins")
--vim.g.python3_host_prog = "/home/zaur/miniconda3/envs/data/bin/python"
--
--- init.lua

-- 1) Windows-only: make sure cl.exe folder is on PATH *before* anything else
if vim.loop.os_uname().sysname == "Windows_NT" then
  -- 🔴 IMPORTANT: use your exact Hostx64\x64 path from `where cl`
  local cl_dir = [[C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Tools\MSVC\14.50.35717\bin\Hostx64\x64]]

  if not string.find(vim.env.PATH or "", cl_dir, 1, true) then
    vim.env.PATH = cl_dir .. ";" .. (vim.env.PATH or "")
  end
end

-- 2) Then load your lazy config (this does lazy.setup inside)
require("config.lazy")

-- 3) (Optional) Python host – this path is for Linux, so for now I'd just comment it on Windows
-- vim.g.python3_host_prog = "/home/zaur/miniconda3/envs/data/bin/python"

