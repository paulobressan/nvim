return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- Lsp manager
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "rust-analyzer",
        "typescript-language-server",
      },
    },
  },

  -- Treesitter to identity and set language color
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      -- ensure_installed = {
      --   "vim", "lua", "vimdoc",
      --   "html", "css"
      -- },
    },
  },

  -- Tree custom config
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
        ignore = false,
      },
    },
  },

  -- Rust tools
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
  },

  -- File navigation to look at functions and variables
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialNext", "AerialPrev" },
    lazy = false,
    config = function()
      require("aerial").setup {
        open_automatic = true,
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      }
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end,
  },

  -- Treesitter context will show a title of the function
  {
    "nvim-treesitter/nvim-treesitter-context",
    cmd = { "TSContextEnable" },
    lazy = false,
    config = function()
      require("treesitter-context").setup {
        max_lines = 1,
      }
    end,
  },

  -- Flash to navigate really fast!
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    lazy = false,
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    lazy = false
  },
}
