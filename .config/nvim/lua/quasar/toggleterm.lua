--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/

-- Quick in-edditor terminal. I have set up a couple different ways it can be deployed; use Ctrl \
-- to activate the normal pop up one and see which-key and/or keymaps.lua to see how to activate more.

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    size = 20,
	open_mapping = [[<C-\>]], --open with ctrl \
	hide_numbers = true, -- hide line mums in terminal
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true, --use insert mode and it's mappings
	persist_size = true, -- maintain a consistent size
	direction = "float", -- make it a floating window
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved", --curved windows
		winblend = 0, -- transparency (winblend) looks super bad with this plugin
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal -- set standard for custom options
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true }) --Git info popup window. WARNING: Lazygit must be installed on system
local simpleterm = Terminal:new({ cmd = "/bin/fish", direction = "horizontal", hidden = true}) -- Mini terminal on the bottom vs code style. WARNING: This uses the fish shell so make sure to install this
local luaterm = Terminal:new({ cmd = "lua", hidden = true}) -- spawn lua terminal
local python = Terminal:new({ cmd = "python", hidden = true }) -- spawn python terminal
local htop = Terminal:new({ cmd = "htop", hidden = true }) -- system resources. You probably have htop so im not worried here
local ncdu = Terminal:new({ cmd = "ncdu", hidden = true }) -- file sizes un current directory. WARNING: NCDU must be installed.

-- all of the following allows the above custom terminals to be called
function _TOGGLE_LAZYGIT()
    lazygit:toggle()
end

function _TOGGLE_SIMPLE()
    simpleterm:toggle()
end

function _TOGGLE_LUATERM()
    luaterm:toggle()
end

function _TOGGLE_PYTHON()
    python:toggle()
end

function _TOGGLE_HTOP()
    htop:toggle()
end

function _TOGGLE_NCDU()
    ncdu:toggle()
end
