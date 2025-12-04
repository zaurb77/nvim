vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })
vim.keymap.set("n", "<leader>n", function()
    vim.notify("Notification test 🚀", "Info")
end, { desc = "Test Notify Popup" })
-- Run current Python file in a terminal split
-- Small helper to choose the right python command per OS
local function get_python_cmd()
    local sysname = vim.loop.os_uname().sysname

    if sysname == "Windows_NT" then
        -- On Windows your 'python' is 3.10 and works in WT
        return "python"
    else
        -- On Linux prefer python3, fallback to python
        local py3 = vim.fn.exepath("python3")
        if py3 ~= "" then
            return "python3"
        end
        return "python"
    end
end

-- Run current Python file in a terminal split
vim.keymap.set("n", "<leader>r", function()
    vim.cmd("w") -- save file

    if vim.bo.filetype ~= "python" then
        vim.notify("Not a Python file", vim.log.levels.WARN)
        return
    end

    local file = vim.fn.expand("%:p")
    local python_cmd = get_python_cmd()

    vim.cmd("split")
    vim.cmd("terminal " .. python_cmd .. " " .. vim.fn.fnameescape(file))
    vim.cmd("startinsert")
end, { desc = "Run current Python file" })
