return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {},
    keys = {
        {
            "<leader>ff", 
            function() require('fzf-lua').files() end,
            desc="Find files in project directory"
        },
        {
            "<leader>fg", 
            function() require('fzf-lua').live_grep() end,
            desc="Find by grepping in project directory"
        },
        {
            "<leader>fs", 
            function() require('fzf-lua').colorschemes() end,
            desc="Change color scheme"
        },
        {
            "<leader>fb", 
            function() require('fzf-lua').builtin() end,
            desc="Display all builtin fzf-lua functions"
        },
        {
            "<leader>fc", 
            function() require('fzf-lua').files({cwd=vim.fn.stdpath("config")}) end,
            desc="Find in neovim configuration"
        },
        {
            "<leader>fh", 
            function() require('fzf-lua').helptags() end,
            desc="[F]ind [H]elp"
        },
        {
            "<leader>fk", 
            function() require('fzf-lua').keymaps() end,
            desc="[F]ind [K]eymaps"
        },
        {
            "<leader>fw", 
            function() require('fzf-lua').grep_cword() end,
            desc="[F]ind current [W]ord"
        },
        {
            "<leader>fW", 
            function() require('fzf-lua').grep_cWORD() end,
            desc="[F]ind current [W]ORD"
        },
        {
            "<leader>fo", 
            function() require('fzf-lua').oldfiles() end,
            desc="[F]ind [O]ld Files"
        },
        {
            "<leader><leader>", 
            function() require('fzf-lua').buffers() end,
            desc="[ ] Find existing buffers"
        },
        {
            "<leader>/", 
            function() require('fzf-lua').lgrep_curbuf() end,
            desc="[/] Live grep the current buffer"
        },
    }
}
