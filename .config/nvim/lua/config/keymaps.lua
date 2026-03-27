-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<ESC>", { noremap = false })
vim.keymap.set("n", "<leader>;", Snacks.dashboard.open, { desc = "Open Snacks Dashboard" })
-- vim.g.maplocalleader = ","

-- # Janis Custom Setup to quickly run current Python file in a terminal
vim.keymap.set("n", "<localleader>rr", function()
  vim.cmd("write")
  vim.cmd("belowright 20split")
  vim.cmd("terminal python " .. vim.fn.expand("%"))
end, { desc = "Run Python File" })

-- # Clear copilot suggestion with Esc if visible, otherwise preserve default Esc behavior
-- vim.keymap.set("n", "<esc>", function()
--     if not require("copilot-lsp.nes").clear() then
--         -- fallback to other functionality
--     end
-- end, { desc = "Clear Copilot suggestion or fallback" })

-- # Jump to middle of current line JR
vim.keymap.set("n", "gm", function()
  local line = vim.api.nvim_get_current_line()
  local col = math.floor(#line / 2)
  vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), col })
end, { desc = "Jump to middle of line" })
