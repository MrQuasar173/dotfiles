--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/
--  Language Servers! They make all language-related futures like errors, highlighting, actions, and more special futures work. This basically makes vim like VS code.
--  Check out the sourced files to learn more!

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("quasar.lsp.lsp-installer")
require("quasar.lsp.handlers").setup()
require('rust-tools').setup({})
