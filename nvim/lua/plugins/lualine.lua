return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Empty out all sections except the filename in section c
      opts.sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 1, -- 0: Just filename, 1: Relative path, 2: Absolute path
            file_status = true, -- Displays file status (readonly, modified)
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
      -- Do the same for inactive windows
      opts.inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
    end,
  },
}
