return {
  'vim-test/vim-test',
  dependencies = { 'preservim/vimux' },
  config = function()
    vim.keymap.set('n', '<leader>tf', ':TestFile<cr>', { silent = true })
    vim.keymap.set('n', '<leader>ts', ':TestSuite<cr>', { silent = true })
    vim.keymap.set('n', '<leader>tl', ':TestLast<cr>', { silent = true })
    vim.keymap.set('n', '<leader>tg', ':TestVisit<cr>', { silent = true })
    vim.cmd "let test#strategy = 'vimux'"
  end,
}
