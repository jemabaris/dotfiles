return {
  {
    "tadaa/vimade",
    opts = {
      recipe = { "default", { animate = true } }, -- { 'default', 'minimalist', 'duo' }
      fadelevel = 0.75,
      basebg = "#222436",
      --       ncmode = "windows", -- { 'buffers', 'windows', 'focus' }
      blocklist = {
        default = {
          highlights = {
            laststatus_3 = function(win, active)
              if vim.go.laststatus == 3 then
                return "StatusLine"
              end
            end,
            "TabLineSel",
            "Pmenu",
            "PmenuSel",
            "PmenuKind",
            "PmenuKindSel",
            "PmenuExtra",
            "PmenuExtraSel",
            "PmenuSbar",
            "PmenuThumb",
          },
          buf_opts = { buftype = { "prompt", "nofile", "quickfix", "terminal" } },
        },
        default_block_floats = function(win, active)
          return win.win_config.relative ~= "" and (win ~= active or win.buf_opts.buftype == "terminal") and true
            or false
        end,
      },
    },
  },
}
