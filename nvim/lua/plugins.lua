return {
    -- colorscheme
    { 
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {
                -- leave this setup function empty for default config
                -- or refer to the configuration section
                -- for configuration options
            }
        end,
        -- optionally set the colorscheme within lazy config
        init = function()
            vim.cmd("colorscheme poimandres")
        end
    },
    -- auto completion
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },
        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',
        -- @module 'blink.cmp'
        -- @type blink.cmp.Config
        opts = {
		    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		    -- 'super-tab' for mappings similar to vscode (tab to accept)
		    -- 'enter' for enter to accept
		    -- 'none' for no mappings
		    --
		    -- All presets have the following mappings:
		    -- C-space: Open menu or open docs if already open
		    -- C-n/C-p or Up/Down: Select next/previous item
		    -- C-e: Hide menu
		    -- C-k: Toggle signature help (if signature.enabled = true)
		    --
		    -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { 
                preset = 'super-tab',
                -- Select completions
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                -- Scroll documentation
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                -- Show/hide signature
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },
            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },
            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

		    -- Default list of enabled providers defined so that you can extend it
		    -- elsewhere in your config, without redefining it, due to `opts_extend`
		    sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
		    },

		    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		    -- See the fuzzy documentation for more information
		    fuzzy = { implementation = "prefer_rust_with_warning" },
            completion = {
                -- The keyword should only match against the text before
                keyword = { range = "prefix" },
                menu = {
                    -- Use treesitter to highlight the label text for the given list of sources
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                -- Show completions after typing a trigger character, defined by the source
                trigger = { show_on_trigger_character = true },
                documentation = {
                    -- Show documentation automatically
                    auto_show = true,
                },
            },

            -- Signature help when tying
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" }
    },
    -- LSP config
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "gopls",
                    "rust_analyzer",
                    -- "zls",
                    "clangd",
                    "ts_ls",
                    "intelephense",
                    -- "sqls",
                    -- "hls",
                    -- "ocamllsp",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local servers = {
                "pyright", 
                "gopls", 
                "rust_analyzer", 
                -- "zls", 
                "clangd",
                "ts_ls", 
                "intelephense", 
                -- "sqls", 
                -- "hls", 
                -- "ocamllsp"
            }

            for _, server in ipairs(servers) do
                lspconfig[server].setup({})
            end
        end
    }
}

