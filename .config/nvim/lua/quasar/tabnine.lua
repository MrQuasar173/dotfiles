--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/

-- Ai stuff check out tabnine online


local tabnine = require('cmp_tabnine.config')
tabnine:setup({
	max_lines = 1000;
	max_num_results = 2;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
})
