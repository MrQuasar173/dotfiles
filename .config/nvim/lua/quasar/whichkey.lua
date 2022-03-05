--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/

-- Popup that shows you possible keymaps when you hit a key that leads a larger keymap. The entire beginning of this file is 100% coppied from chris@machine
local wk = require("which-key")

wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
        enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
        },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
    ["<bs>"] = "BACKAPACE"
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "﮴ ", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 30, 3, 30 }, -- float window
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 20 -- transparent window
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k", ";" },
    v = { "j", "k", ";" }, -- make ;; as escape not weird 
    },
}

-- Keymap descriptions
wk.register( {
    ["<leader>"] = {
        q = "no clue what this does tbh",
        e = {
            x = "Explore tree"
        },
        t = {
            name = "Tabline + telescope",
            p = "Planets!",
            m = "browse man pages",
            t = "load telescope",
            b = "switch tabs",
            c = "close tabs",
            e = "order tabs by extension",
            d = "order tabs by diractory"

        },
        p = {
            name = "plugin management",
            u = "update plugins",
            s = "packer sync",
            c = "compile packer",
            y = "python interactive term"
        },

        s = {
            name = "search + splits",
            w = "search words (live grep)",
            p = "new horizontal split",
            v = "new vertical split"
        },
        f = {
            name = "files",
            g = "see file sizes",
            f = "find files (telescope)"
        },
        h = {
            name = "misc",
            t = "view system resources",
            d = "view the dashboard"
        },
        l = {
            name = "lsp + git",
            g = "show lazygit",
            l = "show language servers",
            i = "install lsp for current file",
            r = "restart language server",
            t = "lua live term"
        },
        c = {
            name = "Config",
            g = "open root init.lua",
    },
        a = {
            name = "tabnine",
            i = "load tabnine"
        }
    },
    ["g"] = {
        d = "goto defs",
        D = "goto declaration",
        l = "show errors on line",
        r = "show refrences",
    }
} )
