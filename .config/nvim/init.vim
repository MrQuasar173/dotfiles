  " __________  _   _   _    ____    _    ____  ________
 "/ / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \ \
"/ / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \ \
"\ \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / / /
 "\_\_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/_/

" MrQuasar 173's VIM config
" the only dependancies needed to run this config are vim-plug and Neovim.
" (this won't work with vanilla vim)
" NerdFonts are recommended; If you do not wish to install them please disable
" items in this config that require them. 
" You will get a lot of errors the first time you run this Dont Worry! Just
" run :PlugInstall and restart neovim
" enjoy!

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim' " Cool statusline
Plug 'ryanoasis/vim-devicons' " Nerdfont icons suport
Plug 'glepnir/dashboard-nvim' " Cool login screen when no file is specified
Plug 'vimwiki/vimwiki' "Plugin for notetaking
Plug 'kaicataldo/material.vim', { 'branch': 'main' } " Material, home of Palenight (The greatest color scheme)
Plug 'preservim/nerdtree' " Better file search tree
Plug 'preservim/nerdcommenter' " Toggle comments on one or more lines
Plug 'junegunn/rainbow_parentheses.vim' " BracketPairColorizer from VS code for vim, run :RainbowParentheses to activate
Plug 'PhilRunninger/nerdtree-buffer-ops' " nerdtree improvements
Plug 'Nopik/vim-nerdtree-direnter' " Fix issue in which opening a directory in NERDTree opens a new tab
Plug 'szw/vim-g' " Search google in vim
Plug 'hienvd/vim-stackoverflow' " Search stackoverflow in vim
Plug 'liuchengxu/vim-clap' " fuzzy file/history search
Plug 'sheerun/vim-polyglot' " Advanced syntax highlighting for a TON of filetypes and languages
Plug 'liuchengxu/vim-which-key' " Shows suggestions when leader key pressed
Plug 'tpope/vim-fugitive' " Git plugin
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " COC code completeion and git statuses
Plug 'jiangmiao/auto-pairs' " Auto close bracket pairs 
Plug 'wakatime/vim-wakatime' " Interesting coding stats

call plug#end()

" Colors
" The amazing, beautiful palenight theme :)
let g:material_theme_style = 'palenight'
colorscheme material
syntax on " Somewhat usless as most syntax highlighting is handled by polygot, but keep enabled just in case

" Basic Settings
set nu " Line numbers
" Make tabs 4 spaces
set tabstop=4 
set shiftwidth=4 
set expandtab 
" Get rid of strange and confusing messages about useless things
set noswapfile 
set nobackup
set nowritebackup
set hidden " not setting hidden can cause several other settings and pluggins to break
set smartcase " Make code look nice (upercase and lowercase letters)
set smartindent " Make code look nice (IDE-style auto indenting)
set cmdheight=2 " More room for messages and commandsm
set timeoutlen=500 " shorten timeout lengt
" Let's save undo info! (not my code)
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" Keymaps and custom commands
let g:mapleader = "\<Space>" " Make leader key space
" Make double semicolons function as escape key
imap ;; <Esc>
" Activate WhichKey on leader
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Open vim config 
nmap <silent> <leader>cg :e $MYVIMRC<CR> 
" Open nerdtree 
nmap <silent> <leader>nt :NERDTree<CR>
" Colse nerdtree
nmap <silent> <leader>nc :NERDTree<CR>:q<CR>
" Open Dashboard (Home screen)
nmap <silent> <leader>dh :Dashboard<CR>
" Save, load current session
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
" Git commands
nmap <leader>gh :Git
nmap <leader>ga :Git add .<CR>
nmap <leader>go :Git pull origin main<CR>
nmap <leader>gu :Git pull upstream main<CR>
nmap <leader>gd :Git pull
nmap <leader>gp :Git push origin main<CR>
nmap <leader>gc :Git commit -m "
nmap <leader>gl :Git colne 
nmap <leader>gi :Git init<CR>

" WhichKey descriptions
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
let g:which_key_map =  {}
let g:which_key_map.c = { 'name' : 'comments and configuration' }
let g:which_key_map.n = { 'name' : 'NERDtree commands' }
let g:which_key_map.d = { 'name' : 'dashboard commands' }
let g:which_key_map.s = { 'name' : 'session commands' }
let g:which_key_map.g = { 'name' : 'Git commands' }
let g:which_key_map.w = { 'name' : 'Notes and Journal' }
let g:which_key_map.a = { 'name' : 'CoC action from selected' }
let g:which_key_map.f = { 'name' : 'CoC format selected' }
let g:which_key_map.q = { 'name' : 'CoC fixes' }
let g:which_key_map.r = { 'name' : 'CoC rename' }
let g:which_key_map.w.SPC = { 'name' : 'Quick journal entry' }
let g:which_key_map.r.n = 'CoC rename'
let g:which_key_map.q.f = 'CoC apply quick fix'
let g:which_key_map.c.g = 'open init.vim (config file)'
let g:which_key_map.n.t = 'open NERDTree'
let g:which_key_map.n.c = 'colse NERDTree'
let g:which_key_map.d.h = 'open Dashboard'
let g:which_key_map.s.s = 'save session'
let g:which_key_map.s.l = 'load session'
let g:which_key_map.g.h = 'open Git command'
let g:which_key_map.g.a = 'Git add .'
let g:which_key_map.g.o = 'Pull from origin'
let g:which_key_map.g.u = 'Pull from upstream'
let g:which_key_map.g.d = 'Pull from custom'
let g:which_key_map.g.p = 'Push to origin main'
let g:which_key_map.g.l = 'Git clone from custom'
let g:which_key_map.g.c = 'Git commit'
let g:which_key_map.g.i = 'init new git repo'
let g:which_key_map.c.c = 'comment current line or selection'
let g:which_key_map.c.u = 'uncomment current line or selection'
let g:which_key_map.c.SPC = 'togle comment on current selection'
let g:which_key_map.c.m = 'Minimal comment'
let g:which_key_map.c.i = 'Inverted comment'
let g:which_key_map.c.s = 'comment multiple lines with pretty block formatting'
let g:which_key_map.c.y = 'yank lines and comment'
" let g:which_key_map.c.$ = 'Comments from curser to EOL'
let g:which_key_map.c.A = 'Adds comment delimiters at EOL, activates insert mode between' 
let g:which_key_map.c.a = 'Switch to alternative set of NERDcommenter delimiters'
let g:which_key_map.c.l = 'align NERD comments left'
let g:which_key_map.c.b = 'align NERD comments both sides'
let g:which_key_map.w.w = 'Open vimwiki notes index'
let g:which_key_map.w.i = 'Open vimwiki journal index'
let g:which_key_map.w.t = 'Open vimwiki tab index'
let g:which_key_map.w.s = 'Activate vimwiki UI selection'
let g:which_key_map.w.SPC.i = 'Generate journal links'
let g:which_key_map.w.SPC.m = 'Make entry for tomorrow'
let g:which_key_map.w.SPC.t = 'tab make journal entry'
let g:which_key_map.w.SPC.w = 'make journal entry'
let g:which_key_map.w.SPC.y = 'Make journal entry for yesterday'


" Dashboard (Home screen) Settings
let g:dashboard_footer_icon = ' ' "  neovim loaded x plugins
" Add custom neovim logo at top of dashboard
let g:dashboard_preview_command = 'cat'
let g:dashboard_preview_pipeline = 'lolcat'
let g:dashboard_preview_file = '~/.config/nvim/ascii/planetDash.txt'
" Size of area where dashboard logo goes
let g:dashboard_preview_file_height = 9 
let g:dashboard_preview_file_width = 80

" Lightline configurtion
let g:lightline = {
  \   'colorscheme': 'material_vim',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'realativepath', 'modified', 'charvaluehex',]
  \     ],
  \     'right':[ [ 'lineinfo' ],
  \               [ 'percent' ],
  \               [ 'filepath', 'fileencoding', 'filetype' ]]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v%<',
    \     'charvaluehex': ' 0x%B',
    \     'realativepath': '  %f',
    \     'gitbranch': ' %{FugitiveStatusline()}'
	\   },
  \ 'mode_map': {
        \ 'n' : ' NORMAL',
        \ 'i' : ' INSERT',
        \ 'R' : ' REPLACE',
        \ 'v' : ' VISUAL',
        \ 'c' : ' COMMAND',
        \ }
\  }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}

" Hide statusline when whichkey menu is open (not my code)
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Use markdown for vimwiki notes
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" NOT MY CODE: COC
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
" set encoding=utf-8

" TextEdit might fail if hidden is not set.
" set hidden

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

