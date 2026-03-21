return {
  {
    "Vigemus/iron.nvim",
    enabled = false,
    ft = "python", -- only load for python files
    config = function()
      local iron = require("iron.core")

      iron.setup({
        config = {
          repl_definition = {
            python = {
              command = { "ipython" },
            },
          },
          repl_open_cmd = "belowright 15split",
        },
      })

      local keymap = vim.keymap

      keymap.set("n", "<localleader>rr", "<cmd>IronRepl<CR>")
      keymap.set("n", "<localleader>rl", function()
        require("iron.core").send_line()
      end)
      keymap.set("v", "<localleader>rv", function()
        require("iron.core").visual_send()
      end)
      keymap.set("n", "<localleader>rf", function()
        require("iron.core").send_file()
      end)
    end,
  },
}
