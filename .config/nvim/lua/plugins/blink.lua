return {
  "saghen/blink.cmp",
  opts = {
    -- VSCode-style Tab to accept comletion
    keymap = {
      preset = "super-tab",
    },
    -- fuzzy uses Rust instead of Lua
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
}

-- return {
--   "saghen/blink.cmp",
--   keymap = {
--     preset = "super-tab",
--     ["<Tab>"] = {
--       function(cmp)
--         if vim.b[vim.api.nvim_get_current_buf()].nes_state then
--           cmp.hide()
--           return (require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit())
--         end
--         if cmp.snippet_active() then
--           return cmp.accept()
--         else
--           return cmp.select_and_accept()
--         end
--       end,
--       "snippet_forward",
--       "fallback",
--     },
--     fuzzy = {
--       implementation = "prefer_rust_with_warning",
--     },
--   },
--   vim.keymap.set("i", "<M-CR>", function()
--     local cmp = require("blink.cmp")
--
--     if cmp.is_visible() then
--       cmp.cancel() -- dismiss suggestions
--     end
--
--     -- insert a real newline for tmux compatability
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", true)
--   end, {
--     silent = true,
--   }),
-- }
