return {
  "obsidian-nvim/obsidian.nvim",
  enabled = true,
  --   version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "Janis' Vault",
        path = "~/Documents/Obsidian_Vault/",
      },
    },
  },
}
