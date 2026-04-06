return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
      require("nvim-treesitter").setup(opts)
    end,
  }
}
