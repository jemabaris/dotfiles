return {
  {
    "mrjones2014/smart-splits.nvim",
    build = " ./kitty/install-kittens.bash",
    enabled = true,
    lazy = false,
    opts = {
      ignored_buftypes = {
        "nofile",
        "quickfix",
        "prompt",
      },
      ignored_filetypes = {
        "NvimTree",
        "snacks_picker_list",
        "snacks_picker_input",
      },
    },
  },
}
