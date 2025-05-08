return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    ".git/",
                    "^node_modules/",
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
            },
        })
        vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
        vim.keymap.set("n", "<space>fg", require("telescope.builtin").live_grep)
        vim.keymap.set("n", "<space>en", function()
            require('telescope.builtin').find_files {
                cmd = vim.fn.stdpath('config')
            }
        end)
    end
}
