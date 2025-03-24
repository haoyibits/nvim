-- Auto-pair plugin
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,  -- 如果你用 Treesitter，推荐打开
      })
    end
  }