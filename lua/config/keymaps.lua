vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })
vim.keymap.set("n", "<leader>n", function()
    vim.notify("Notification test 🚀", "Info")
end, { desc = "Test Notify Popup" })
-- Run current Python file in a terminal split
vim.keymap.set("n", "<leader>r", function()
    -- Save the file first
    vim.cmd("w")

    -- Get the full path to the current file
    local file = vim.fn.expand("%:p")

    -- Simple check: only run if it's a Python file
    if vim.bo.filetype ~= "python" then
        vim.notify("Not a Python file", vim.log.levels.WARN)
        return
    end

    -- Open a horizontal split with a terminal running `python <file>`
    vim.cmd("split")
    vim.cmd("terminal python " .. vim.fn.fnameescape(file))

    -- Enter insert mode in terminal so output scrolls naturally
    vim.cmd("startinsert")
end, { desc = "Run current Python file" })
