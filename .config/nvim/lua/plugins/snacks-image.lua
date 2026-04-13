return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        enabled = true,
        resolve = function(path, src)
          local api = require("obsidian.api")
          if api.path_is_note(path) then
            return api.resolve_attachment_path(src)
          end
          return src -- fallback for non-obsidian files
        end,
      },
    },
  },
}
