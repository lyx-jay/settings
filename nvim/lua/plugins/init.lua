return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript", "tsx",
        "json", "yaml", "markdown", "markdown_inline",
        "vue",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
        "vue-language-server",
        "eslint-lsp",
        "prettier",
        "stylua",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "https://codeberg.org/FelipeLema/cmp-async-path.git",
    },
    opts = {
      mapping = {
        ["<C-k>"] = require("cmp").mapping.select_prev_item(),
        ["<C-j>"] = require("cmp").mapping.select_next_item(),
        ["<CR>"] = require("cmp").mapping.confirm({
          behavior = require("cmp").ConfirmBehavior.Insert,
          select = true,
        }),
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      view = {
        width = 30,
        mappings = {
          list = {
            { key = "l", action = "edit" },
            { key = "o", action = "edit" },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require("configs.conform"),
  },

  {
    "mrcjkb/rustaceanvim",
    lazy = true,
    ft = { "rust" },
  },

  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "eol",
      },
    },
  },

  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      input = { enabled = true },
      terminal = { enabled = true },
      picker = {
        enabled = true,
        layout = {
          preset = "default",
          layout = {
            width = 0.7,
            height = 0.6,
          },
        },
      },
    },
  },

  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    lazy = false,
    config = function()
      vim.o.autoread = true

      local opencode_cmd = "opencode --port"
      local snacks_terminal_opts = {
        win = {
          position = "right",
          enter = false,
        },
      }

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
          end,
        },
      }

      -- 快捷键设置
      local map = vim.keymap.set

      -- Toggle OpenCode 侧边栏
      map({ "n", "t" }, "<C-.>", function()
        require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
      end, { desc = "Toggle OpenCode" })

      -- Ask OpenCode
      map({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ")
      end, { desc = "Ask OpenCode" })

      -- Select OpenCode
      map({ "n", "x" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Select OpenCode" })

      -- Operator: 追加范围到 OpenCode
      map({ "n", "x" }, "go", function()
        return require("opencode").operator("@this ")
      end, { desc = "Append range to OpenCode", expr = true })

      -- 追加整行到 OpenCode
      map("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "Append line to OpenCode", expr = true })

      -- 向上滚动 OpenCode
      map("n", "<S-C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "Scroll OpenCode up" })

      -- 向下滚动 OpenCode
      map("n", "<S-C-d>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "Scroll OpenCode down" })
    end,
  },
}