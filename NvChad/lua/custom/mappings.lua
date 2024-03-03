local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle BreakPoint"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["<leader>dc"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgc"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

-- Lazy
M.lazy = {
  n = {
    ["<leader>lz"] = {
      "<cmd> Lazy <CR>",
      "Open lazy UI"
    },
  }
}

--Mappings for splits
M.splits = {
  n = {
    ["<leader>sv"] = {
      "<C-w>v",
      "Split window vertically"
    },
      ["<leader>sh"] = {
      "<C-w>s",
      "Split window horizontally"
    },
      ["<leader>se"] = {
      "<C-w>=",
      "make splits equal size"
    },
      ["<leader>sx"] = {
      "<cmd> close <CR>",
      "Close split"
    },
    ["<leader><left>"] = {
      "<C-w>>",
      "Increase split size",
    },
    ["<leader><right>"] = {
      "<C-w><",
      "Decrease split size"
    },
  },
}

-- others
M.others = {
  n = {
    ["<leader>nh"] = {
      "<cmd> nohl <CR>",
      "Clear search highlights"
    },
    ["<leader>a"] = {
      "gg<S-v>G",
      "Select all"
    },
  }
}

-- Keymaps for deleting words
M.deleting_words = {
  n = {
    ["x"] = {
      '"_x',
      "Delete single character"
    },
    ["<leader>dw"] = {
      "vb_d",
      "Delete word backwards"
    }
  }
}

-- Increament/decreament
M.creament = {
  n = {
    ["<leader>+"] = {
      "<C-a>",
      "Increament number"
    },
    ["<leader>-"] = {
      "<C-x>",
      "Decreament number"
    }
  }
}

-- Lsp related stuff
M.lsp = {
  n = {
    ["<leader>li"] = {
      "<cmd> LspInfo<CR>",
       "Check the Lsp info"
    },
    ["<leader>ms"] = {
      "<cmd> Mason<CR>",
      "Open the Mason UI"
    },
    ["<leader>mu"] = {
      "<cmd> MasonUpdate<CR>",
      "Update LSP servers"
    }
  }
}

-- Telescope Keymaps
M.telescope = {
  n = {
    ["<leader>fB"] = {
      "<cmd> Telescope file_browser path%:p:h=%:p:h:<CR>",
      "Telescope File Browser"
    }
  }
}
return M
