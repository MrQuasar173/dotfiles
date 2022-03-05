  --  __________  _   _   _    ____    _    ____  ________
 -- / / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \ \
-- / / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \ \
-- \ \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / / /
 -- \_\_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/_/

-- Super fast and customizable tabline. lightline/lualine's intagrated tabline was fine or whatever
-- but this is so much better. See keymaps.lua or whichkey for tabline control shortcuts.

require('bufferline').setup {
    options = {
        numbers = function(opts) -- format ordinal number and buffer ID like 2(number)|²(id)
            return string.format('%s|%s', opts.ordinal, opts.raise(opts.id))
        end,
        close_command = "bdelete! %d",       -- command to run when closing a buffer
        right_mouse_command = "bdelete! %d", -- close buffer on right click
        left_mouse_command = "buffer %d",    -- go to buffer on double click
        indicator_icon = '▎', --indicate active buffer
        buffer_close_icon = '',
        modified_icon = ' ',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '', -- ^ "show more" icons
        name_formatter = function(buf)
        -- remove extension from markdown files
        if buf.name:match('%.md') then
            return vim.fn.fnamemodify(buf.name, ':t:r')
        end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp", --integrate with LSP
        diagnostics_indicator = function(count) -- use # of diagnostics in diagnostic segment
            return "("..count..")"
        end,
        offsets = {{filetype = "NvimTree", text = "פּ File Explorer"}, {filetype = "Dashboard", text = ""}}, -- offset or don't show the bufferline for nvim tree and dashboard
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "thick", -- use thick seperators while slant is broken
        always_show_bufferline = true,
    }
}
