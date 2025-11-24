return {
    -- Modern LSP setup without Mason (manual, offline-friendly)
    "neovim/nvim-lspconfig",
    lazy = false,
    -- dependencies = {
    --     { "williamboman/mason.nvim", opts = {} },
    --     "williamboman/mason-lspconfig.nvim",
    --     "WhoIsSethDaniel/mason-tool-installer.nvim",
    --     { "j-hui/fidget.nvim",       opts = {} },
    -- },
    --
    config = function()
        ---------------------------------------------------------------------
        -- 1. GLOBAL DEFAULT CAPABILITIES (supports completion, folding, etc.)
        ---------------------------------------------------------------------
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            {} -- add cmp_nvim_lsp capabilities here later if you add completion
        )

        ---------------------------------------------------------------------
        -- 2. DEFINE YOUR SERVERS HERE
        ---------------------------------------------------------------------
        local servers = {
            lua_ls = {
                cmd = {
                    "/home/zaur/.local/lua-language-server/bin/lua-language-server",
                },
                root_markers = { ".luarc.json", "init.lua" }, -- project root logic
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            },

            pyright = {
                cmd = { "/home/zaur/.local/bin/pyright-langserver" },
                root_markers = { "pyproject.toml", "setup.py", "requirements.txt" },
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoImportCompletions = true,
                        },
                    },
                },
            },

            -- example future servers:
            -- bashls = { cmd = { "/path/to/bash-language-server" } },
            -- marksman = { cmd = { "/path/to/marksman" } },
        }

        ---------------------------------------------------------------------
        -- 3. AUTO-START LOGIC FOR ANY BUFFER WITH A MATCHING FILETYPE
        ---------------------------------------------------------------------
        local function on_attach(client, bufnr)
            -- Keymaps
            local map = function(keys, func, desc)
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
            end

            map("K", vim.lsp.buf.hover, "Hover")
            map("gd", vim.lsp.buf.definition, "Go to definition")
            map("gr", vim.lsp.buf.references, "Go to references")
            map("<leader>rn", vim.lsp.buf.rename, "Rename")
            map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        end

        ---------------------------------------------------------------------
        -- 4. START A SERVER FOR THE CURRENT BUFFER (MODERN WAY)
        ---------------------------------------------------------------------
        local function start_server(server_name, config)
            local buf = vim.api.nvim_get_current_buf()

            vim.lsp.start({
                name = server_name,
                cmd = config.cmd,
                root_dir = vim.fs.root(0, config.root_markers) or vim.fn.getcwd(),
                settings = config.settings,
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end

        ---------------------------------------------------------------------
        -- 5. AUTO START WHEN OPENING SUPPORTED FILE TYPES
        ---------------------------------------------------------------------
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "lua" }, -- add more when you add more servers
            callback = function()
                start_server("lua_ls", servers.lua_ls)
            end,
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "python" },
            callback = function()
                start_server("pyright", servers.pyright)
            end,
        })
    end,
}
