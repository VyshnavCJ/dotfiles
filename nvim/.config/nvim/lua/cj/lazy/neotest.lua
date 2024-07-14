return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/nvim-nio",
            "Issafalcon/neotest-dotnet",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-vitest"),
                    require("neotest-dotnet"),
                    require("neotest-plenary").setup({
                    }),
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end)
        end,
    },
}

