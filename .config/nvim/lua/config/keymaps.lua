-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- leave insert mode by pressing jk quickly
vim.keymap.set("i", "jk", "<ESC>", { noremap = false })
-- leave insert mode by pressing jj quickly
vim.keymap.set("i", "jj", "<ESC>", { noremap = false })
-- keymapping for accessing the Snacks Dashboard
vim.keymap.set("n", "<leader>;", Snacks.dashboard.open, { desc = "Open Snacks Dashboard" })
require("which-key").add({
  { "<leader>;", icon = { icon = "󱥰 ", color = "purple" } },
})
-- vim.g.maplocalleader = ","
-- # Janis Custom Setup to quickly run current Python file in a terminal
vim.keymap.set("n", "<localleader>rp", function()
  vim.cmd("write")
  vim.cmd("belowright split")
  vim.cmd("terminal python " .. vim.fn.expand("%"))
end, { desc = "Run Python File" })
-- # Janis Custom Setup to quickly run current file in a terminal
vim.keymap.set("n", "<localleader>rl", function()
  vim.cmd("write")
  vim.cmd("belowright 20split")
  vim.cmd("terminal lua " .. vim.fn.expand("%"))
end, { desc = "Run Lua File" })

-- # Clear copilot suggestion with Esc if visible, otherwise preserve default Esc behavior
-- vim.keymap.set("n", "<esc>", function()
--     if not require("copilot-lsp.nes").clear() then
--         -- fallback to other functionality
--     end
-- end, { desc = "Clear Copilot suggestion or fallback" })

vim.keymap.set("n", "gm", function()
  local line = vim.api.nvim_get_current_line()
  local col = math.floor(#line / 2)
  vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), col })
end, { desc = "Jump to middle of line" })

-- # Open oil.nvim in a floating window with <leader>fo
vim.keymap.set("n", "<leader>fo", require("oil").open_float, { desc = "Open Oil File Explorer" })

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

-- Accept Copilot suggestion (works even when Blink suggestions are visible)
vim.keymap.set("i", "<M-CR>", function()
  vim.lsp.inline_completion.get()
end, { desc = "Accep Copilot suggestion" })

-- Keymap to mark all lines in visual mode
vim.keymap.set("n", "<leader>v", "ggVG", { desc = "Select all" })

-- Keymap to copy all lines to system clipboard
vim.keymap.set("n", "yc", ":%y+<CR>", { desc = "Yank all to clipboard" })
