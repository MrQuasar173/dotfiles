--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/

-- Config for dashboard (opens when no file or directory is specified). Writing this was WAY easier in lua

-- ASCII art at the top of the dashboard
vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_pipeline = 'lolcat' --make it rainbow
vim.g.dashboard_preview_file = "~/.config/nvim/ascii/planetDash.txt" --source file
vim.g.dashboard_preview_file_height = 9
vim.g.dashboard_preview_file_width = 80

vim.g.dashboard_custom_section = {     -- Buttons on the home screen
    a = {
        description = { "  Find File          " },
        command = "Telescope find_files",
    },
    b = {
        description = { "  New File           " },
        command = ":ene!",
    },
    c = {
        description = { "  Recently Used Files" },
        command = "Telescope oldfiles",
    },
    d = {
        description = { "  Find Word          " },
        command = "Telescope live_grep",
    },
    e = {
        description = { "  Configuration      " },
        command = ":e $MYVIMRC"
    },
}

local plugins = #vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1) -- Get # of startup-loaded plugins.
local total_plugins = #vim.fn.globpath("~/.local/share/nvim/site/pack/packer/opt", "*", 0, 1) --Get # of lazyloaded plugins

vim.g.dashboard_custom_footer = { " Packer loaded " .. plugins - 1 .. " out of " .. plugins + total_plugins .. " plugins [Lazy loading active]" } -- Show plugins loaded message

