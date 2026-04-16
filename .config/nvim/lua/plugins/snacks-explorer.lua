return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          actions = {
            toggle_preview_cycle = function(picker)
              local layout = vim.deepcopy(picker.resolved_layout)
              local hidden = layout.hidden or {}
              local is_hidden = vim.tbl_contains(hidden, "preview")
              local is_main = layout.preview == "main"

              if is_hidden then
                -- no preview → small
                layout.hidden = {}
                layout.preview = false
              elseif not is_main then
                -- small → fullscreen
                layout.hidden = {}
                layout.preview = "main"
              else
                -- fullscreen → no preview
                layout.hidden = { "preview" }
                layout.preview = false
              end
              picker:set_layout(layout)
            end,
          },
          win = {
            list = {
              keys = {
                ["P"] = "toggle_preview_cycle",
              },
            },
          },
        },
      },
    },
  },
}
