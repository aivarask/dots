-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWinEnter" }, {
  pattern = "*",
  callback = function(event)
      if vim.api.nvim_buf_get_name(0) == "" then
      return
    end
    if event.event == "BufWinLeave" then
      vim.cmd("mkview")
    else
      pcall(vim.cmd, "loadview")
      -- vim.cmd("loadview")
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modifiable and not vim.bo.readonly and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end,
})
