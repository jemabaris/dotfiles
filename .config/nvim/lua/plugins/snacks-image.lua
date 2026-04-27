return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        math = {
          enabled = false,
        },
        enabled = true,
        resolve = function(path, src)
          local ok, api = pcall(require, "obsidian.api")
          if ok and api.path_is_note(path) then
            return api.resolve_attachment_path(src)
          end
          return src -- fallback for non-obsidian files
        end,
      },
    },
  },
}
