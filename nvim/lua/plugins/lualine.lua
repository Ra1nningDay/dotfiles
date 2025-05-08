return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- สำหรับไอคอน
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto", -- ใช้ธีมตาม colorscheme ของคุณ
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },                          -- โหมด (NORMAL, INSERT, ฯลฯ)
                lualine_b = { "branch", "diff", "diagnostics" }, -- Git branch และ diff
                lualine_c = { "filename" },                      -- ชื่อไฟล์
                lualine_x = { function() return os.date('%H:%M') end, 'filetype' },
                lualine_y = { "progress" },                      -- เปอร์เซ็นต์ของไฟล์
                lualine_z = { "location" },                      -- บรรทัด:คอลัมน์
            },
        })
    end,
}
