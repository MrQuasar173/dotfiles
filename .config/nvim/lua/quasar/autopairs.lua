--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/

-- Make parenthesies, brackets, etc automatically pair up.
-- This is just the default config from their github, it works fine for me :)

local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
  check_ts = true, -- use treesitter
  ts_config = {
    lua = { "string", "source" },
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" }, -- don't autocomplete brackets here
  fast_wrap = { -- Fast wrap settings: use ???? E to put a opening bracket and get promptef for where to close
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" }, -- complete for {}, [], "", and ''
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl", -- keys used to select where end bracket should be placed
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}

-- Connect to CMP
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
