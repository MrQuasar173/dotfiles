--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/

-- CMP handles all autocompletion, snippets, and inline menus for me. New completion sources must
-- be installed as plugins and added as sources in this file. This is how LSP and Tabnine show themselves
-- while you are programming.

--Prepare cmp and luasnip
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

----------------------------------------------------------------------
-- These are the icons that will show up for each different type of completion
local kind_icons = {
    Text = "",
    Method = " ",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = " ",
    Interface = " ",
    Module = "",
    Property = "漣",
    Unit = "",
    Value = "﬍ ",
    Enum = "  ",
    Keyword = " ",
    Snippet = " ",
    Color = "",
    File = "",
    Reference = " ",
    Folder = "",
    EnumMember = "  ",
    Constant = " ",
    Struct = "",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
}

----------------------------------------------------------------------

-- show expanded info/preview, set up keybinds
cmp.setup {
    snippet = {
        expand = function(args)
        luasnip.lsp_expand(args.body) -- For snippets
        end,
    },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
	["<C-j>"] = cmp.mapping.select_next_item(), -- use Ctrl J and K to move through CMP munu instead of arrows
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
    }, -- get rid of CMP munu with Ctrl E if you don't need it
    -- Accept currently selected item. If none selected, select first item.
    ["<CR>"] = cmp.mapping.confirm { select = true },

-- Make tab key move intelegently back and forth throught fields in a snippet
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expandable() then
            luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif check_backspace() then
            fallback()
        else
            fallback()
        end
    end, {
        "i",
        "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, {
        "i",
        "s",
    }),
  },

-- Controls how menu shows up
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- Labels and order for each completion type
        vim_item.menu = ({
            cmp_tabnine = "[AI]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buff]",
            path = "[Path]",
            nvim_lua = "[Nvim]",
            crates = "[Crate]",
            cmdline = "[CMD]",
            cmp_git = "[GIT]"
        })[entry.source.name]
        return vim_item
        end,
    },

-- List of completion sources, add new ones here
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "crates" },
        { name = "path" },
        { name = "cmdline" },
        { name = "cmp_git" },
        { name = "cmp_tabnine" }
    },

    -- confirmation
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    -- show docs next to some CMP options
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- rounded boarders
    },

    -- Experimantal features
    experimental = {
        ghost_text = true, --show grey suggestion text in front of cursor for top CMP option
        native_menu = false,
    },
}
