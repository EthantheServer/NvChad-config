local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.formatter"
  --   end
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function()
  --     require "custom.configs.lint"
  --   end
  -- },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require("custom.configs.null-ls")
    end
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html",
        "cssls",
        "quick-lint-js",
        "js-debug-adapter",
        "eslint-lsp",
        "prettier",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "pyright",
        "black",
        "mypy",
        "debugpy",
        "gopls",
        "clangd",
        "clang-format",
        "codelldb",
        "rubyfmt",
        "jdtls",
        "sqls",
        "sql-formatter",
        "gci",
        "stimulus_ls",
        "volar",
      }
    }
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "html", "astro", "glimmer", "handlebars", "markdown", "php", "rescript", "vue", "xml"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },{
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      opts = require("plugins.configs.treesitter")
      opts.ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "html",
        "css",
        "python",
        "c",
        "cpp",
        "c_sharp",
        "sql",
        "go",
        "ruby"
      }
    end
  },
  {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for folder in tree to light orange
    vim.cmd([[ highlight NvimTreeFolderIcon guifg=#E78A4E ]])

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 35,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })
  end,
  },
  {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
  },
  {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
  },
  {
  "szw/vim-maximizer",
  keys = {
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/Minimize a split" },
  },
  },
  {
  "echasnovski/mini.animate",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.scroll = {
      enable = false,
    }
  end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
        user_default_options = {
        tailwind = true,
      },
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  {
  "ellisonleao/carbon-now.nvim",
  lazy = true,
  cmd = "CarbonNow",
  opts = {
      options = {
        bg = "#1E2122",
        font_family = "MesloLGS Nerd Font",
        font_size = "18px",
        theme = "base-16(Dark)",
        titlebar = "Ethan's code",
        watermark = false,
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}
return plugins
