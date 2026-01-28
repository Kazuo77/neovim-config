return {
  "famiu/bufdelete.nvim",
  config = function()
    vim.keymap.set('n', '<leader>x', ':Bdelete<CR>', { silent = true, desc = "Close buffer" })
    vim.keymap.set('n', '<leader>X', ':Bdelete!<CR>', { silent = true, desc = "Force close buffer" })
  end
}   
