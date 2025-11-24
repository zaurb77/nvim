return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        vim.notify = require("notify")

        require("notify").setup({
            stages = "fade_in_slide_out",
            timeout = 2000,
            top_down = true,
            background_colour = "#1f2335",
            render = "default",
        })
    end,
}
