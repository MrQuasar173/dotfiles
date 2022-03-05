--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/
-- Keymaps to make common actions quick and easy to remember.
-- Add new ones with "km(mode, keys, command, opts)"
-- Most keymaps are prefaced with the <leader> key, which I have set to mean the space bar.
-- Typing the first key in a keymap usually brings up a menu to show possible keymaps to run
-- and what they do. See whichkey.lua for more.

--Setup
local opts = { noremap = true, silent = true } --Settings to apply to all keymaps
local km = vim.api.nvim_set_keymap --Shorthand for setting keymaps so this doesn't need to be typed each time

-- Keymaps ------------------------------------------------------------------------------------------------------
-- Make space the leader key

km("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Different keymaps are designed to be used in different modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

-- Normal Mode --

km("n", "<leader>sp", ":split<CR>", opts) --Create Horrizontal split
km("n", "<leader>sv", ":vsplit<CR>", opts) --Create Vertical split
km("n", "<C-h>", "<C-w>h", opts)
km("n", "<C-j>", "<C-w>j", opts)
km("n", "<C-k>", "<C-w>k", opts)
km("n", "<C-l>", "<C-w>l", opts) --^4 move between splits without ctrl-W
km("n", "<C-Up>", ":resize +2<CR>", opts)
km("n", "<C-Down>", ":resize -2<CR>", opts)
km("n", "<C-Right>", ":vertical resize -2<CR>", opts)
km("n", "<C-Left>", ":vertical resize +2<CR>", opts) --^4 move between splits w/ctrl+arrows
km("n", "<leader>cg", ":e $MYVIMRC<CR>", opts) --Open root config (init.lua)
km("n", "<S-T>", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_SIMPLE()<CR>", opts) --Opens the terminal in a smaller window below the main one and runs the fish shell which I have set to use a more minimal propmt
km("n", "<leader>ex", ":NvimTreeToggle<CR>", opts) --Opens nvim tree interactive file explorer
km("n", "<C-[>", ":BufferLineCyclePrev<CR>", opts)
km("n", "<C-]>", ":BufferLineCycleNext<CR>", opts)
km("n", "<C-S-[>", ":BufferLineMovePrev<CR>", opts)
km("n", "<C-S-]>", ":BufferLineMoveNetx<CR>", opts)
km("n", "<leader>te", ":BufferLineSortByExtension<CR>", opts)
km("n", "<leader>td", ":BufferLineSortByDirectory<CR>", opts)
km("n", "<leader>tb", ":BufferLinePick<CR>", opts)
km("n", "<leader>tc", ":BufferLinePickClose<CR>", opts)
km("n", "<leader>lg", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_LAZYGIT()<CR>", opts) -- see visualized git info in popup with Lazygit
km("n", "<leader>ht", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_HTOP()<CR>", opts) -- see system resource usage with HTOP in pop-up
km("n", "<leader>py", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_PYTHON()<CR>", opts) -- open pop up with python interactive terminal
km("n", "<leader>fg", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_NCDU()<CR>", opts) -- See file sizes in current dir
km("n", "<leader>lt", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_LUATERM()<CR>", opts) -- open pop-up with lua interactive terminal
km("n", "<leader>tp", ":Telescope planets<CR>", opts) -- Ameteur astronomy in vim!
km("n", "<leader>sw", ":Telescope live_grep<CR>", opts) -- Fuzzy search for strings of characters in vurrent directory with Telescope
km("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- Fuzzy search for files in current directory with preview via telescope
km("n", "<leader>tt", ":PackerLoad telescope.nvim<CR>", opts) -- load telescope
km("n", "<leader>pu", ":PackerUpdate<CR>", opts) -- Update all packer plugins
km("n", "<leader>ps", ":PackerSync<CR>", opts) -- Update and compile packer
km("n", "<leader>pc", ":PackerCompile<CR>", opts) -- Compile packer to apply all set packages and settings in plugins.lua
km("n", "<leader>tm", ":Telescope man_pages<CR>", opts) -- Look through man pages
km("n", "<leader>hd", ":Dashboard<CR>",opts) -- go to Dashboard
km("n", "<leader>ll", ":LspInstallInfo<CR>", opts) -- list language servers, find info, insttall and update
km("n", "<leader>li", ":LspInstall<CR>", opts) -- Install language server for current file format
km("n", "<leader>lr", ":LspRestart<CR>", opts) -- Restart LSP if it's not working
km("n", "<leader>ai", ":PackerLoad cmp-tabnine<CR>", opts) -- ACTIVATE THE POWER OF TABNINE (and start using more resources)


-- Insert Mode --
km("i", ";;", "<ESC>", opts) -- Remap escape to ;;


-- Visual Mode --
km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts) --^ Easily move indents with < and >
km("v", "<A-j>", ":m .+1<CR>==", opts)
km("v", "<A-k>", ":m .-2<CR>==", opts) --^ Move text up and down with Alt-J(amazing band btw) and Alt-K
km("v", "p", '"_dP', opts) --Make pasting work better, use p to paste in visual mode


-- Terminal Mode --
km("t", ";;", "<C-\\><C-N>", opts) -- make ;; go to normal mode in terminal
