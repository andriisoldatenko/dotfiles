-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Setup lazy.nvim
require("lazy").setup {
  spec = {
    {
      "ishan9299/nvim-solarized-lua",
      lazy = false,
      priority = 1000,
      config = function()
        -- load the colorscheme here
        vim.cmd [[colorscheme solarized-flat]]
      end,
    },
    -- I have a separate config.mappings file where I require which-key.
    -- With lazy the plugin will be automatically loaded when it is required somewhere
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show { global = false }
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
      "ibhagwan/fzf-lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("fzf-lua").register_ui_select()
        require("fzf-lua").setup {
          oldfiles = {
            -- include current sessions in old_files mode
            include_current_session = true,
          },
          winopts = {
            -- split = "belowright 10new",
            backdrop = 100,
            border = "single",
            preview = {
              hidden = true,
              default = "bat",
              border = "rounded",
              title = false,
              layout = "vertical",
              horizontal = "right:50%",
            },
          },
          git = {
            files = {
              cwd_header = false,
              prompt = "❯ ",
              cmd = "git ls-files --exclude-standard",
              multiprocess = true, -- run command in a separate process
              git_icons = false, -- show git icons?
              file_icons = false, -- show file icons (true|"devicons"|"mini")?
              color_icons = false, -- colorize file|git icons
            },
          },
          files = {
            git_files = false,
            cwd_header = false,
            cwd_prompt = true,
            file_icons = false,
          },
        }

        vim.keymap.set("n", "<C-p>", require("fzf-lua").git_files, {})
        vim.keymap.set("n", "<C-b>", require("fzf-lua").files, {})
        vim.keymap.set("n", "<C-g>", require("fzf-lua").lsp_document_symbols, {})
      end,
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}
