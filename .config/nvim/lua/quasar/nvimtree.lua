  -- " __________  _   _   _    ____    _    ____  ________
 -- "/ / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \ \
-- "/ / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \ \
-- "\ \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / / /
 -- "\_\_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/_/

-- quick file explorer, similar to nerd tree. open with "space ex".
-- hit enter, "o" , or "l" on a file or dir to open it. "d" deletes files, "a" adds files, "r" renames them, "v" opens them
-- in vertical split. for more features refer to nvimtree's help page`:help nvim-tree`

vim.g.nvim_tree_icons = { -- set icons that go next to files/directories
    default = "",
    symlink = "",
    git = {
        unstaged = "",
        staged = " ",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = " ",
        ignored = "◌ ",
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
    },
}

-- setup
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true, -- ^ replace lexplore/netrw
    open_on_setup = false, -- in some backwards way this makes opening nvim tree when opening to a directory to work better.
    ignore_ft_on_setup = {
        "dashboard", --ignore when opening in dashboard
    },
    -- auto_close = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    -- update_to_buf_dir = {
        -- enable = true,
        -- auto_open = true,
    -- },
    diagnostics = { --show diagnostic symbol next to files
        enable = true,
        icons = {
            hint = "",
        info = "",
        warning = "",
        error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = { -- show git info
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  -- quit_on_open = 0,
  -- git_hl = 1,
  -- disable_window_picker = 0,
  -- root_folder_modifier = ":t",
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
}
