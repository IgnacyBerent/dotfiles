-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.swapfile = false

vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.opt.showmode = false

-- 2. A safer, "Quiet" hide function
local function clean_ui()
  -- Use pcall (protected call) so if an option fails, it doesn't show errors
  pcall(function()
    vim.opt.laststatus = 0
    -- This ensures the statusline logic exists for tmux but stays blank in nvim
    vim.opt.statusline = "%{g:tpipeline_statusline}"
  end)
end

-- 3. Trigger only on the most important events to prevent "flicker"
local hide_group = vim.api.nvim_create_augroup("HideStatusline", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "LspAttach", "WinEnter" }, {
  group = hide_group,
  callback = function()
    vim.schedule(clean_ui)
  end,
})
