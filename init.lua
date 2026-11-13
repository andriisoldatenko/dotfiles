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

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Markdown
vim.g.markdown_folding = 1

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

    -- file explorer
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup {
          sort_by = "case_sensitive",
          filters = {
            dotfiles = true,
            -- migrated from g:NERDTreeIgnore
            custom = {
              "\\.rbc$",
              "\\~$",
              "\\.pyc$",
              "\\.db$",
              "\\.sqlite$",
              "^__pycache__$",
              "^htmlcov$",
              "^node_modules$",
              "^\\.idea$",
              "^\\.git$",
            },
          },
          on_attach = function(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
              return {
                desc = "nvim-tree: " .. desc,
                buffer = bufnr,
                noremap = true,
                silent = true,
                nowait = true,
              }
            end

            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.set("n", "s", api.node.open.vertical, opts "Open: Vertical Split")
            vim.keymap.set("n", "i", api.node.open.horizontal, opts "Open: Horizontal Split")
            vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts "Up")
          end,
        }
      end,
    },

    -- tpope
    "tpope/vim-abolish",
    "tpope/vim-commentary",
    "tpope/vim-dispatch",
    "tpope/vim-eunuch",
    "tpope/vim-fugitive",
    "tpope/vim-jdaddy",
    "tpope/vim-repeat",
    "tpope/vim-rhubarb",
    "tpope/vim-scriptease",
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    "tpope/vim-speeddating",

    -- git
    { "junegunn/gv.vim", dependencies = { "tpope/vim-fugitive" } },
    "ruanyl/vim-gh-line",
    {
      "airblade/vim-gitgutter",
      init = function()
        vim.g.gitgutter_max_signs = 500
        vim.g.gitgutter_map_keys = 0 -- no default mappings
        vim.g.gitgutter_highlight_linenrs = 1
        vim.g.gitgutter_use_colorscheme = 1
      end,
      config = function()
        local map = function(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { remap = true, desc = desc })
        end
        -- Jump between hunks
        map("<Leader>gn", "<Plug>(GitGutterNextHunk)", "git next hunk")
        map("<Leader>gp", "<Plug>(GitGutterPrevHunk)", "git previous hunk")
        -- Hunk-add and hunk-revert for chunk staging
        map("<Leader>ga", "<Plug>(GitGutterStageHunk)", "git add (hunk)")
        map("<Leader>gu", "<Plug>(GitGutterUndoHunk)", "git undo (hunk)")
        map("<Leader>gP", "<Plug>(GitGutterPreviewHunk)", "git preview hunk")
      end,
    },

    -- editing / text objects
    "junegunn/vim-peekaboo",
    "jeffkreeftmeijer/vim-numbertoggle",
    "vim-scripts/argtextobj.vim",
    "michaeljsmith/vim-indent-object",
    { "beloglazov/vim-textobj-quotes", dependencies = { "kana/vim-textobj-user" } },
    "AndrewRadev/deleft.vim",
    "AndrewRadev/whitespaste.vim",
    "AndrewRadev/sideways.vim",
    "AndrewRadev/splitjoin.vim",
    "sickill/vim-pasta",
    "mbbill/undotree",
    "honza/vim-snippets",

    -- languages / tools
    "dense-analysis/ale",
    "b4b4r07/vim-sqlfmt",
    "tmhedberg/SimpylFold",
    "towolf/vim-helm",
    "tell-k/vim-autoflake",
    {
      "shime/vim-livedown",
      keys = { { "gm", "<cmd>LivedownToggle<CR>", desc = "Livedown toggle" } },
    },

    -- files / windows
    "lervag/file-line",
    "simeji/winresizer",
    "szw/vim-maximizer",
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}


-- autocmd {event} {pattern} {cmd}
vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd BufReadPost * echo 'Reading: ' . expand('<afile>')
    autocmd BufWritePost * echo 'Writing: ' . expand('<afile>')
  augroup end

  "augroup _git
  "  autocmd!
  "  autocmd FileType gitcommit setlocal wrap
  "  autocmd FileType gitcommit setlocal spell
  "augroup end
  "
  "augroup _markdown
  "  autocmd!
  "  autocmd FileType markdown setlocal wrap
  "  autocmd FileType markdown setlocal spell
  "augroup end
  "
  "augroup _auto_resize
  "  autocmd!
  "  autocmd VimResized * tabdo wincmd =
  "augroup end
  "
  "augroup _alpha
  "  autocmd!
  "  autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  "augroup end
]]

local augroup = vim.api.nvim_create_augroup("_migrated_vimrc", { clear = true })

-- Highlight yanked text (replaces vim-highlightedyank)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- Close nvim if nvim-tree is the last window (was the NERDTree autocmd)
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  nested = true,
  callback = function()
    if vim.fn.winnr "$" == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd "quit"
    end
  end,
})


-- Settings ---
--
-- optionally enable 24-bit colour
vim.opt.termguicolors = true


local options = {
  clipboard = "unnamed,unnamedplus",       -- allows neovim to access the system clipboard
  undofile = true,                         -- enable persistent undo
  inccommand = "split",                    -- live preview of :s in a split
  mouse = "a",
  number = true,                           -- show line numbers
  showcmd = true,                          -- show me what I'm typing
  errorbells = false,                      -- no beeps
  swapfile = false,                        -- don't use swapfile
  backup = false,                          -- don't create annoying backup files
  splitright = true,                       -- vertical windows split to the right
  splitbelow = true,                       -- horizontal windows split to the bottom
  autowrite = true,                        -- save before :next, :make etc.
  hidden = true,                           -- buffer still exists if window is closed
  fileformats = "unix,dos,mac",            -- prefer Unix over Windows over OS 9 formats
  showmatch = false,                       -- do not flicker matching brackets
  showmode = false,                        -- mode is shown in the statusline
  ignorecase = true,                       -- search case insensitive...
  smartcase = true,                        -- ...unless it contains upper case
  completeopt = "menu,menuone",            -- show popup menu even with one entry
  pumheight = 10,                          -- completion window max size
  cursorcolumn = false,
  lazyredraw = true,                       -- wait to redraw
  scrolloff = 5,
  laststatus = 2,                          -- always show status line
  updatetime = 250,                        -- faster gitgutter updates
  background = "dark",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


-- Highlights ---
-- (vimrc used cterm colors; termguicolors is on, so gui hex equivalents are used)
local function apply_highlights()
  local hl = function(name, val) vim.api.nvim_set_hl(0, name, val) end

  hl("StatusLine", { fg = "#303030" })
  hl("myModeNormal", { bold = true, bg = "#afd700", fg = "#005f00" })
  hl("myModeInsert", { bold = true, bg = "#005f5f", fg = "#ffffff" })
  hl("myModeVisual", { bold = true, bg = "#ff8700", fg = "#870000" })
  hl("myInfoColor", { bg = "#585858", fg = "#d0d0d0" })

  vim.cmd "highlight clear SignColumn"
  hl("GitGutterAdd", { fg = "#859900", ctermfg = 2 })
  hl("GitGutterChange", { fg = "#b58900", ctermfg = 3 })
  hl("GitGutterDelete", { fg = "#dc322f", ctermfg = 1 })
  hl("GitGutterChangeDelete", { fg = "#268bd2", ctermfg = 4 })
  hl("GitGutterAddLineNr", { fg = "#eee8d5", bg = "#859900", ctermfg = 7, ctermbg = 2 })
end

apply_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { group = augroup, callback = apply_highlights })


-- Statusline ---
local modes = {
  n = "NORMAL",
  i = "INSERT",
  R = "REPLACE",
  v = "VISUAL",
  V = "V-LINE",
  ["\22"] = "V-BLOCK", -- <C-v>
  c = "COMMAND",
  s = "SELECT",
  S = "S-LINE",
  ["\19"] = "S-BLOCK", -- <C-s>
  t = "TERMINAL",
}

local mode_hl = {
  INSERT = "myModeInsert",
  VISUAL = "myModeVisual",
  ["V-LINE"] = "myModeVisual",
  ["V-BLOCK"] = "myModeVisual",
}

local function esc(s)
  return (s:gsub("%%", "%%%%"))
end

function _G.StatusLine()
  local cur_mode = modes[vim.api.nvim_get_mode().mode] or ""
  local mode_group = mode_hl[cur_mode] or "myModeNormal"

  -- left info: git branch | filename
  local filename = vim.fn.expand "%:t"
  if filename == "" then
    filename = "[No Name]"
  end
  local left = filename
  if vim.fn.exists "*FugitiveHead" == 1 then
    local branch = vim.fn.FugitiveHead()
    if branch ~= "" then
      left = branch .. " | " .. filename
    end
  end

  -- filetype (only on wide windows)
  local ft = ""
  if vim.fn.winwidth(0) > 70 then
    ft = vim.bo.filetype ~= "" and vim.bo.filetype or "no ft"
  end

  local percent = math.floor(100 * vim.fn.line "." / vim.fn.line "$") .. "%%"

  local git = ""
  if vim.fn.exists "*GitGutterGetHunkSummary" == 1 then
    local s = vim.fn.GitGutterGetHunkSummary()
    git = string.format(" +%d ~%d -%d", s[1], s[2], s[3])
  end

  return table.concat {
    "%#", mode_group, "#", cur_mode, "%*",
    "%#myInfoColor# ", esc(left), " %*",
    "%=",
    "%#myInfoColor# ", esc(ft), " ", percent, " %l:%v", git, " %*",
  }
end

vim.opt.statusline = "%{%v:lua.StatusLine()%}"


-- Mappings ---
local map = vim.keymap.set

-- Disable arrow keys in insert, normal, visual, operator-pending mode
for _, key in ipairs { "<Up>", "<Down>", "<Left>", "<Right>" } do
  map({ "i", "n", "v", "o" }, key, "<Nop>")
end

-- Better split switching
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-h>", "<C-w>h")
map("", "<C-l>", "<C-w>l")

-- Quickfix
map("", "<C-n>", "<cmd>cnext<CR>")
map("", "<C-m>", "<cmd>cprevious<CR>")
map("n", "<leader>a", "<cmd>cclose<CR>")

-- File-tree mappings
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFileToggle!<CR>', { noremap = true })
