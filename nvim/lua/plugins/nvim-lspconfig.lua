return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            { 'saghen/blink.cmp' },
        },
        config = function()
            -- ดึง capabilities จาก blink.cmp
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- เพิ่ม capabilities เพิ่มเติมถ้าต้องการ
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- สร้าง on_attach function เพื่อกำหนด keybindings หรือการตั้งค่าเพิ่มเติมเมื่อ LSP เริ่มทำงาน
            local on_attach = function(client, bufnr)
                -- ตัวอย่าง keybindings สำหรับ LSP
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)          -- ไปที่ definition
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                -- แสดง hover documentation
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)      -- เปลี่ยนชื่อตัวแปร
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- แสดง code actions
            end

            -- โหลด lspconfig
            local lspconfig = require('lspconfig')

            -- ตั้งค่า Lua LSP (ที่มีอยู่แล้ว)
            lspconfig['lua_ls'].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }, -- รองรับ global variable `vim`
                        },
                    },
                },
            })

            lspconfig.prismals.setup({
                cmd = { "prisma-language-server", "--stdio" },
                filetypes = { "prisma" },
                root_dir = lspconfig.util.root_pattern("package.json", "prisma/schema.prisma"),
                settings = {
                    prisma = {
                        prismaFmtBinPath = "", -- ตั้งค่าว่างไว้หรือกำหนด path ของ prisma format
                    },
                },
            })

            -- ตั้งค่า tsserver สำหรับ JavaScript/TypeScript (React/Next.js)
            -- ตั้งค่า ts_ls สำหรับ JavaScript/TypeScript (React/Next.js)
            lspconfig['ts_ls'].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                },
            })

            -- ตั้งค่า ESLint LSP (สำหรับ linting)
            lspconfig['eslint'].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                settings = {
                    format = true, -- ให้ ESLint จัดรูปแบบโค้ด
                    codeAction = {
                        disableRuleComment = {
                            enable = true,
                            location = "separateLine",
                        },
                        showDocumentation = {
                            enable = true,
                        },
                    },
                },
            })

            -- ตั้งค่า Tailwind CSS LSP (ถ้าใช้ Tailwind)
            lspconfig['tailwindcss'].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
            })
        end,
    }
}
