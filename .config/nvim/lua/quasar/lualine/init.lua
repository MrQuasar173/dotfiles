--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/
--  Cool statusline at the bottom of vim. This is configured with different modules that you can set up yourself
--  in addition to the default ones and then you can put these modules into sections A>B>C><X<Y<Z.
--  This is basically lightline but in lua and waaaaaay better. This config is similar to my old lighline config
--  but (also) waaaaaay better :)



local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end



local diagnostics = { -- show error and warning count
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = true,
	always_visible = true,
}

local diff = { -- show added and removed count (diff)
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

local mode = { -- custom mode indicator
	"mode",
    icons_enabled = true,
    fmt = function(str)
        if str == "NORMAL" then
            return " NORMAL"
        elseif str == "INSERT" then
            return " INSERT"
        elseif str == "REPLACE" then
            return " REPLACE"
        elseif str == "VISUAL" then
            return " VISUAL"
        elseif str == "COMMAND" then
            return " COMMAND"
        end
    end
}

local filetype = { --filetype with icon
	"filetype",
	icons_enabled = true,
	icon = nil, --don't let the nil fool you, this just makes it check the filetype for the coresponding icon
}

local filename = { --show filename and modified status
    "filename",
    icons_enabled = true,
    icon = " ",
    path = 1,
    symbols = {
        modified = '  ',      -- Text to show when the file is modified.
        readonly = '  ',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
    }
}

local branch = { --git branch. We don't need fugitive anymore!
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = { -- line and column
	"location",
	padding = 0,
    icons_enabled = true,
    icon = ""
}


local spaces = function() -- # of spaces in a tab
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local custom_palenight = require('quasar.lualine.palenight') -- use a better based version of palenight, the one bundled with lualine by default is cringe
lualine.setup({
    options = {
	    icons_enabled = true, --you'd better have nerd fonts or things are about to get ugly...
		theme = custom_palenight,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" }, --seperators
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" }, --ignore in these types of buffers
		always_divide_middle = true,
	},
	sections = { --which pre-defined modules to put in each section, in what order
		lualine_a = { mode },
		lualine_b = { branch, diagnostics },
		lualine_c = { filename },
		lualine_x = { diff, spaces, "encoding" },
		lualine_y = { filetype, "progress" },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
})
