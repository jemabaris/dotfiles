return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    --     preset = "obsidian",
    opts = {
      render_modes = { "n", "c", "t" },
      latex = {
        converter = "latex2text",
      },
      heading = {
        enabled = true,
        render_modes = false,
        atx = true,
        setext = true,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        position = "overlay",
        signs = { "󰫎 " },
        width = "full",
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        border = false,
        border_virtual = false,
        border_prefix = false,
        above = "▄",
        below = "▀",
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
        custom = {},
      },
      checkbox = {
        enabled = true,
        render_modes = false,
        bullet = false,
        left_pad = 0,
        right_pad = 1,
        unchecked = {
          icon = "󰄱 ",
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = nil,
        },
        checked = {
          icon = "󰱒 ",
          highlight = "RenderMarkdownChecked",
          scope_highlight = nil,
        },
        custom = {
          todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
        },
        scope_priority = nil,
      },
    },
  },
}

--       custom_handlers = {
--         image = function(bufnr, _, text)
--           local api = require("obsidian.api")
--
--           -- Obsidian style: ![[image.png]]
--           local obsidian_match = text:match("^!%[%[(.-)%]%]$")
--           if obsidian_match then
--             return {
--               src = api.resolve_attachment_path(obsidian_match),
--             }
--           end
--
--           -- Standard markdown: ![alt](path)
--           local md_match = text:match("^!%[.-%]%((.-)%)$")
--           if md_match then
--             return {
--               src = api.resolve_attachment_path(md_match),
--             }
--           end
--         end,
--       },
--     },
--   },
-- }
