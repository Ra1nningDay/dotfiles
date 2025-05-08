return {
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'nvim-tree'.setup {
                auto_reload_on_write = true,
                view = {
                    width = 30,
                    side = 'left',
                },
                filters = {
                    dotfiles = false,
                    custom = {
                        "^.git$",
                        "^.DS_Store$",
                    }
                },

            }

            vim.keymap.set("n", "<space>nt", ":NvimTreeToggle<CR>")
            vim.keymap.set("n", "<space>nb", ":NvimTreeFocus<CR>")
            vim.keymap.set("n", "<space>nw", "<C-w>p")
        end
    },
}
