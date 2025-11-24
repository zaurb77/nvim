vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end,
    { desc = "Open Diagnostics in Float" }
)
vim.keymap.set("n", "<leader>n", function()
    vim.notify("Notification test 🚀", "Info")
end, { desc = "Test Notify Popup" })
