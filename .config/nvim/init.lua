--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/

-- MrQuasar173's (neo)vim config... now in 100% lua!
-- Things are no so much better, more efficient, and have more features. Thanks lua!
-- You shouldn't need any external dependencies; packer (the plugin manager) will install itself
-- when you open vim with my config. Just make sure you are running a newer version of neovim.
-- Some plugins require external dependancies but they will just
-- fail gracefully until you install them. This is a multi-file config; all files called here
-- and in other files with require() statements will be loaded and used as configuration. You can
-- view a file by pressing gd on top of it's name or look in the lua/quasar diractory to find it.
-- This config is partially an adaptation from my old vimscript config but it also took HUGE instiration from
-- Christian Chiarulli. You can check him out on github(https://github.com/ChristianChiarulli) and
-- youtube chris@machine(https://www.youtube.com/channel/UCS97tchJDq17Qms3cux8wcA)

-- Enjoy!

-- Load config files from the lua/quasar directory. If you want to
-- temporarily try out some other stuff make a new directory under lua/ and replace "quasar" with that name
-- in the following statements

require "quasar.options" -- Basic built-in vim settings
require "quasar.keymaps" -- Keybindings for efficiency
require "quasar.plugins" -- Load and manage plugins with packer
require "quasar.dashboard" -- Enrty screen for when you dont provide a file or directory
require "quasar.complete" -- Autocomplete
require "quasar.lsp" -- Language support
require "quasar.tresitter" -- Syntax highlighting
require "quasar.autopairs" -- autopairs
require "quasar.misc" -- extra settings
require "quasar.gitsigns" -- Git info
require "quasar.nvimtree" -- Quick file tree
require "quasar.lualine" --statusline
require "quasar.bufferline" --tabline
-- More configuration is done than what is called here because files call each other. Read README.MD for a full summary of this configuration
