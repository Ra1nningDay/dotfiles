return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            shell = "powershell.exe",
            size = 10,
            open_mapping = [[<C-\>]],
            direction = "horizontal"
        })
    end
}
