--     __________  _   _   _    ____    _    ____  ________
--   / / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \ \
--  / / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \ \
--  \ \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / / /
--   \_\_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/_/

-- Plugin management using Packer, which is like vim-plug but better and can still run all of your old vim-plug plugins.
-- Lazy-loading is active. All plugins are added with the use{} keyword and conditions for lazy loading can be put within
-- the curly brackets. Look at packer's github for more info. If something is not loading, run :PackerLoad and the plugin name.
-- saving this file updates and compiles all plugins, you can do it yourself with "space ps" or :PackerSync
-- Packet setup: NOT MY CODE

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Start Packer
return packer.startup(function(use)



  -- Plugins go here
    use "wbthomason/packer.nvim" --Packer-ception (Make Packer manage itself)
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    use "kyazdani42/nvim-web-devicons" -- Nerdfont icons suport
    use "glepnir/dashboard-nvim" -- Cool login screen when no file or directory is specified
    use "kyazdani42/nvim-tree.lua" -- Better file search tree
    use "preservim/nerdcommenter" -- Toggle comments on one or more lines
    use "windwp/nvim-autopairs" -- Auto close bracket pairs
    use "wakatime/vim-wakatime" -- Interesting coding stats
    use "kaicataldo/material.vim" -- the amazing material (containing palenight and ocean) colorschemes!
    use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        require("catppuccin").setup {
            flavour = "mocha" }
    end}
    use {"hrsh7th/nvim-cmp", requires = {"hrsh7th/cmp-path", "petertriho/cmp-git", "hrsh7th/cmp-buffer", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-cmdline"}} --autocomplete
    use {"tzachar/cmp-tabnine", opt = true, run = "./install.sh", config = function() require('quasar.tabnine') end} --tabnine ai, takes up more resources
    use {"L3MON4D3/LuaSnip", requires = {"rafamadriz/friendly-snippets"}} --snippets
    use {"neovim/nvim-lspconfig", requires = "williamboman/nvim-lsp-installer"} --LSP
    use {'saecki/crates.nvim', event = { "BufRead Cargo.toml" }, config = function() require('crates').setup() end, } --rust crate tools and features
    use {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = function () require'quasar.telescope' end} --telescope fuzzy search
    use "nvim-treesitter/nvim-treesitter" -- treesitter advanced syntax highlighting
    use "p00f/nvim-ts-rainbow" --ranbow brackets
    use "lewis6991/gitsigns.nvim" --git info
    use {"akinsho/toggleterm.nvim", cmd = {"ToggleTerm"}, keys = "<C-\\>", config = function() require'quasar.toggleterm' end} -- quick in-edditor terminal
    use {'iamcco/markdown-preview.nvim', ft = {"md", "markdown", "MD"}} -- preview markdown files
    use {'folke/which-key.nvim', keys = "<Space>", config = function() require'quasar.whichkey' end} -- list of possible keybinds a few seconds after hitting a key
    use 'simrat39/rust-tools.nvim' -- super cool rust stuff (currently broken)(sad)
    use "mfussenegger/nvim-dap" -- debugging support for LSP
    use 'nvim-lualine/lualine.nvim' -- cool statusline
    use 'akinsho/bufferline.nvim' -- tabz
    use 'vimsence/vimsence' --discord status in vim lol
  -- Automatically set up your configuration after cloning packer.nvim NOT MY CODE
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
