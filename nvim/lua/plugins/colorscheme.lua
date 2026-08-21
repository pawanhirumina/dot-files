return {
  -- 1. Load the Material theme (or your preferred theme)
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = "deep ocean"
      require("material").setup({
        disable = { background = true },
      })
    end,
  },

  -- 2. Set the default colorscheme for LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },

  -- 3. Force total transparency across all LazyVim components
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      -- Extend the default list of transparent components
      extra_groups = {
        "NormalFloat", -- Floating windows
        "NeoTreeNormal", -- Neo-tree file tree sidebar
        "NeoTreeNormalNC", -- Inactive Neo-tree sidebar
        "BlinkCmpMenu", -- Autocomplete popups
        "BlinkCmpDoc", -- Autocomplete documentation popups
        "StatusLine", -- Bottom status line panels
        "SignColumn", -- Left side Git signs column
      },
    },
  },
}
