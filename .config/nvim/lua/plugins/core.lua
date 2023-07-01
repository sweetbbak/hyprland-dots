return {

  {
    "mthbernardes/codeexplain.nvim",
    lazy = true,
    cmd = "CodeExplain",
    build = function()
      vim.cmd([[silent UpdateRemotePlugins]])
    end,
  },

  { "ellisonleao/gruvbox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },
  -- colorizer toggle for Hex
  { "norcalli/nvim-colorizer.lua" },

  -- advanced find and replace
  {
    "windwp/nvim-spectre",
  },

  { "kosayoda/nvim-lightbulb" },

  { "antoinemadec/FixCursorHold.nvim" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- Lsp support
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  -- set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
},
-- highlighting - set to markdown headings
{
  "folke/paint.nvim",
  config = function()
    local hlmap = {
      ["^#%s+(.-)%s*$"] = "Operator",
      ["^##%s+(.-)%s*$"] = "Type",
      ["^###%s+(.-)%s*$"] = "String",
      ["^####%s+(.-)%s*$"] = "Constant",
      ["^#####%s+(.-)%s*$"] = "Number",
      ["^######%s+(.-)%s*$"] = "Error",
    }

    local highlights = {}
    for pattern, hl in pairs(hlmap) do
      table.insert(highlights, {
        filter = { filetype = "markdown" },
        pattern = pattern,
        hl = hl,
      })
    end

    require("paint").setup({
      ---@type PaintHighlight[]
      highlights = highlights,
    })
  end,
},
{
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
},
{
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
  requires = "nvim-treesitter/nvim-treesitter",
},
{ "nvim-telescope/telescope-media-files.nvim" }
