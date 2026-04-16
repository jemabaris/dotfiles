return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          actions = {
            cycle_preview = function(picker)
              -- 3 states: no preview, small (sidebar default), fullscreen overlay
              local states = { false, true, "main" }
              -- find current state
              local current = picker.opts.layout and picker.opts.layout.preview
              local next_idx = 1
              for i, s in ipairs(states) do
                if s == current then
                  next_idx = (i % #states) + 1
                  break
                end
              end
              local next = states[next_idx]
              picker:set_layout(vim.tbl_deep_extend("force", vim.deepcopy(picker.resolved_layout), { preview = next }))
            end,
          },
          win = {
            list = {
              keys = {
                ["P"] = "cycle_preview",
              },
            },
          },
        },
      },
    },
  },
}
