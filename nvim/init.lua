require("config.lazy")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.wo.number = true
--vim.wo.relativenumber = true

--vim.o.statusline = "[%{getcwd()}] %F"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.keymap.set("n", "<space>st", function()
    require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath('config')
    }
end)

vim.keymap.set("n", "<space>te", ":term powershell.exe<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<space>bp", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>bn", ":bnext<CR>", { noremap = true, silent = true })
