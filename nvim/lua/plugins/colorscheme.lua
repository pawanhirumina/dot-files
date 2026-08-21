return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      --- Override specific highlight groups after the theme loads
      on_highlights = function(hl, c)
        hl.StatusLine = { bg = "none", fg = c.fg_sidebar }
        hl.StatusLineNC = { bg = "none", fg = c.fg_gutter }
        hl.WinSeparator = { bg = "none", fg = c.border }
      end,
    },
  },
}
