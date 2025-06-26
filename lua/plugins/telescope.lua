-- Fuzzy search (safe + lazy load compatible)
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable("make") == 1, -- only if `make` is available
    },
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        path_display = { 'smart' },
      },
    })

    -- safely load fzf extension
    pcall(function() telescope.load_extension('fzf') end)

    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap
    local builtin = require('telescope.builtin')

    keymap.set('n', '<leader>ff', builtin.find_files, opts)
    keymap.set('n', '<leader>fs', builtin.live_grep, opts)
    keymap.set('n', '<leader>fh', builtin.oldfiles, opts)
  end,
}