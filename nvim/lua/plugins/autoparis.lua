return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- ใช้ Treesitter เพื่อให้ฉลาดขึ้น
            fast_wrap = {},
        })
    end
}
