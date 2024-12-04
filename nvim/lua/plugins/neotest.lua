return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "haydenmeade/neotest-jest",
        "nvim-treesitter/nvim-treesitter",
        commit = "c2118446d770fedb360a91b1d91a7025db86d4f1",
      },
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
  },
}
