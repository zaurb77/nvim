return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- LSP completion source
        "hrsh7th/cmp-nvim-lsp",

        -- Snippet engine + snippet source
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- Extra completion sources
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",

        -- A big collection of ready-to-use snippets
        "rafamadriz/friendly-snippets",
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- Load VSCode-style snippets from friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Better experience with snippet history
        luasnip.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"]     = cmp.mapping.abort(),
                ["<CR>"]      = cmp.mapping.confirm({ select = true }),

                ["<Tab>"]     = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"]   = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
        })

        -- Use buffer source for `/` search
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use path + cmdline source for `:`
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end,
}
