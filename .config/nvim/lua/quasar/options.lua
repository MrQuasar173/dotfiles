  --  __________  _   _   _    ____    _    ____  ________
 -- / / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \ \
-- / / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \ \
-- \ \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / / /
 -- \_\_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/_/

-- Basic options; same as "set" lines in vimscript config. See config root for more info.

--Simple settings, should be in every vim config imo
vim.opt.number = true		--Line #'s
vim.opt.tabstop = 4		--Tab = 4 spaces
vim.opt.shiftwidth = 4		--Indent = 4 spaces
vim.opt.expandtab = true	--Convert tabs to spaces
vim.opt.mouse = "a" -- Mouse support

-- Get rid of strange and confusing messages about useless things
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.cmd [[set nobackup]] --Vimscript injection

--More specific settings, this is what I like right noew but I change this area often and it's up to preference
vim.cmd [[set hidden]] --Vimscript injection. Not setting hidden can cause several settings and plugins to break
vim.opt.smartcase = true --Make code look nice (uppercase and lowercase letters)
vim.opt.smartindent = true --Make code look nice (IDE-like auto indenting)
vim.opt.cmdheight = 2 --Leave room for messages and commands
vim.opt.timeoutlen = 500 --Shorten timeout length
vim.opt.showtabline = 2 --Enable tabs
vim.opt.updatetime = 300 --Faster update time
vim.opt.shortmess:append "c" --Makes autocomplete run smoother
-- vim.opt.signcolumn = "number" --Megre signcolumn and number column, force them to show
vim.opt.clipboard = "unnamedplus" --Clipboard support
vim.opt.conceallevel = 0 --Don't hide markdown syntax
vim.opt.fileencoding = "utf-8" --Force UTF8 encoding
vim.opt.hlsearch = true --Highlight search results
vim.opt.ignorecase = true --Make searches non-case-sensitive
vim.opt.completeopt = { "menuone", "noselect" } --Minor completion settings, the real stuff is in the LSP config
vim.opt.pumheight = 10 --Sets popup menu height, don't worry you can still scroll internally within popup menus
vim.opt.splitright = true -- Send all vertical splits to the right unless explicitly specified
vim.opt.splitbelow = true --^Both of these make splitting the screen between buffers work right
vim.opt.cursorline = true --Underline currently selected row
vim.opt.wrap = false --Display one long line, no wrap
vim.opt.scrolloff = 10 --Keep 10 lines above and below the cursor unless at the beginning or end of doc to keep context around code
vim.opt.sidescrolloff = 10 --^same but for vertical
vim.opt.termguicolors = true --More colors
vim.opt.background = "dark" -- Makes some colorschemes work better and makes light color schemes run worse (haha get screwed light mode users)
vim.opt.showmode = false -- Dont reduntantly show mode under statusline
vim.opt.guifont = "JetBrainsMono Nerd Font 12pt" --font for GUI clients
-- Undo
vim.cmd [[set undodir=~/.vim/undo-dir]]
vim.opt.undofile = true

--Legacy options that only work in vimscipt.
vim.cmd [[set iskeyword+=-]] --consider words with a - in it as one word
