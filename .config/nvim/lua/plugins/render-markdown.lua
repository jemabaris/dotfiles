return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    opts = {
      render_modes = { "n", "c", "t" },

      image = {
        backend = "snacks",
      },

      custom_handlers = {
        image = function(bufnr, _, text)
          local api = require("obsidian.api")

          -- Obsidian style: ![[image.png]]
          local obsidian_match = text:match("^!%[%[(.-)%]%]$")
          if obsidian_match then
            return {
              src = api.resolve_attachment_path(obsidian_match),
            }
          end

          -- Standard markdown: ![alt](path)
          local md_match = text:match("^!%[.-%]%((.-)%)$")
          if md_match then
            return {
              src = api.resolve_attachment_path(md_match),
            }
          end
        end,
      },
    },
  },
}
