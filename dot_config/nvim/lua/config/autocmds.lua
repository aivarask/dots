-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("_mkview", {clear = true}),
  pattern = "*",
  callback = function(event)
    if vim.api.nvim_buf_get_name(0) == "" then
      return
    end
    if event.event == "BufWinLeave" then
      -- vim.cmd("mkview")
      pcall(vim.cmd, "mkview")
    else
      --  pcall(vim.cmd.loadview())
      -- vim.cmd("loadview")
      pcall(vim.cmd, "loadview")
    end
  end,
})

vim.api.nvim_create_autocmd({
  "InsertLeave",
  "BufLeave",
  -- "TextChangedP",
  "TextChanged",

  "TextYankPost",
}, {
  group = vim.api.nvim_create_augroup("_write", {clear = true}),
  pattern = "*",
  callback = function()
    if vim.bo.modifiable and not vim.bo.readonly and vim.bo.buftype == "" then
      -- vim.cmd("silent! write")
      vim.cmd("write")
    end
  end,
})
