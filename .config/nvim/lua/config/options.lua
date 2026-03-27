-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- -- Diagnostic Config & Keymaps
-- vim.diagnostic.config({
--   update_in_insert = false,
--   severity_sort = true,
--   float = { border = "rounded", source = "if_many" },
--   underline = { severity = { min = vim.diagnostic.severity.WARN } },
--
--   -- Can switch between these as you prefer
--   virtual_text = true, -- Text shows up at the end of the line
--   virtual_lines = false, -- Text shows up underneath the line, with virtual lines
--
--   -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
--   jump = { float = true },
-- })
