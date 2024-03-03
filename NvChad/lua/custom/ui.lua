local M = {}

M.theme = "gruvchad"

-- dashboard
M.nvdash = {
  load_on_startup = true,

  header = {
     "███╗   ██╗██╗   ██╗ ██████╗██╗  ██╗ █████╗ ██████╗ ",
     "████╗  ██║██║   ██║██╔════╝██║  ██║██╔══██╗██╔══██╗",
     "██╔██╗ ██║██║   ██║██║     ███████║███████║██║  ██║",
     "██║╚██╗██║╚██╗ ██╔╝██║     ██╔══██║██╔══██║██║  ██║",
     "██║ ╚████║ ╚████╔╝ ╚██████╗██║  ██║██║  ██║██████╔╝",
     "╚═╝  ╚═══╝  ╚═══╝   ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ",
  },

  buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
      { "  Mason", "Spc m s", "Mason" },
      { "󰒲  Lazy", "Spc l z", "Lazy" },
    },

}

-- statusline
M.statusline = {
  theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
  -- default/round/block/arrow (separators work only for "default" statusline theme;
  -- round and block will work for the minimal theme only)
  separator_style = "arrow",
  overriden_modules = nil,
}
return M
