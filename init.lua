require("config.lazy")

-- Load all plugins from lua/plugins/
require("lazy").setup("plugins")
vim.g.python3_host_prog = "/home/zaur/miniconda3/envs/data/bin/python"
