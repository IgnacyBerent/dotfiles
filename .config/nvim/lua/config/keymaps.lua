-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local function get_repo_relative_path()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    return vim.fn.getcwd()
  end

  local root_dir = vim.fs.root(path, { ".git" })

  if root_dir then
    return vim.fs.relpath(root_dir, path)
  end

  return path
end

map("n", "<Space>yn", function()
  local name = vim.fn.expand("%:t")
  name = (name == "") and "[No Name]" or name
  vim.fn.setreg("+", name)
  vim.fn.setreg('"', name)
  vim.notify("Copied filename: " .. name)
end, { desc = "Copy filename" })

map("n", "<Space>yp", function()
  local path = get_repo_relative_path()
  vim.fn.setreg("+", path)
  vim.fn.setreg('"', path)
  vim.notify("Copied repo path: " .. path)
end, { desc = "Copy repo relative path" })

map("n", "<Space>yP", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.fn.setreg('"', path)
  vim.notify("Copied absolute path: " .. path)
end, { desc = "Copy absolute path" })
