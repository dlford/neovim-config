function! _blockcomment()

  INSTRUCTIONS
  ------------

  1.) Place this file here: >>> ~/.config/nvim/init.vim <<<
	2.) Give this file a once-over, change the path to NodeJS under Configure Plugins below for example
  3.) Install the dependencies listed blow
  4.) Open NeoVIM, run :PlugInstall, then install Coc plugins as below
  5.) Create the Coc settings file as below

  DEPS
  ----

  neovim >= 0.5 (Ubuntu - sudo add-apt-repository ppa:neovim-ppa/unstable)
	nerd font (https://www.nerdfonts.com/font-downloads)
  NodeJS >= 16
    npm i -g yarn eslint@5 prettier eslint-plugin-prettier eslint-config-prettier
		(eslint 6 currently has trouble resolving plugins from global node_modules)
  fzf requires silversearcher-ag and ripgrep
  OS clipboard functions require handler (e.g. xclip on linux, or win32yank on Windows)
  rnvimr file manager requires Ranger, pynvim, python3.6, and optionally ueberzug
    yay -S ranger python-pynvim ueberzug OR pip3 install ranger-fm pynvim ueberzug
    run `nvim +'chekhealth rnvimr'` from command line to validate
  Neovide GUI (Optional)
  
  Notes
  -----

	1.) For Neovide, set the font below to a valid Nerd Font on your system, the `h` value is font size, excape spaces with `\`
  2.) For Neovide on Windows, download win32yank (https://github.com/equalsraf/win32yank) and put the exe in WSL at `/usr/local/bin` (and `chmod +x` it)
	3.) For Neovide on Windows, set the correct path to Ranger below

  Coc Plugins
  -----------
  :CocInstall coc-tsserver coc-eslint coc-html coc-css coc-prettier coc-json coc-markdownlint coc-highlight coc-jest coc-marketplace
  :CocInstall coc-yaml coc-toml coc-xml coc-tailwindcss coc-svg coc-styled-components coc-docker coc-snippets coc-git

  Coc Config: >>> ~/.config/nvim/coc-settings.json <<<
  ----------

  {
    "eslint.autoFixOnSave": true,
    "coc.preferences.formatOnSaveFiletypes": [
      "css",
      "markdown",
      "html",
      "json"
    ],
    "prettier.useTabs": false,
    "prettier.tabWidth": 2,
    "prettier.semi": true,
    "prettier.singleQuote": false,
    "prettier.trailingComma": "all",
    "prettier.printWidth": 70,
    "prettier.arrowParens": "always",
    "prettier.bracketSpacing": true,
    "prettier.endOfLine": "lf",
    "prettier.htmlWhitespaceSensitivity": "strict",
    "prettier.jsxBracketSameLine": false,
    "prettier.jsxSingleQuote": true,
    "prettier.proseWrap": "preserve",
    "eslint.onIgnoredFiles": "warn",
    "eslint.options": {
      "envs": ["es6", "browser", "node"],
      "plugins": ["prettier"],
      "baseConfig": {
        "extends": [
          "eslint:recommended",
          "plugin:prettier/recommended",
          "prettier/prettier"
        ]
      },
      "rules": {
        "prettier/prettier": "error"
      }
    },
    "diagnostic.enable": true,
    "diagnostic.checkCurrentLine": true,
    "diagnostic.errorSign": "",
    "diagnostic.warningSign": "",
    "diagnostic.infoSign": "",
    "diagnostic.showUnused": true,
    "diagnostic.enableMessage": "jump",
    "diagnostic.enableSign": true,
    "diagnostic.virtualText": true,
    "diagnostic.showDeprecated": true,
    "diagnostic.enableHighlightLineNumber": true,
    "diagnostic.virtualTextCurrentLineOnly": true,
    "coc.preferences.enableMessageDialog": true,
    "suggest.enablePreview": true,
    "suggest.detailField": "preview",
    "git.realtimeGutters": true
  }

endfunction

" Install Plugged on start
" ------------------------

"--LINUX ONLY--

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"--WIN ONLY--
"md ~\AppData\Local\nvim\autoload
"$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"(New-Object Net.WebClient).DownloadFile(
"  $uri,
"  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
"    "~\AppData\Local\nvim\autoload\plug.vim"
"  )
")

" Install Plugins
" ---------------

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'kevinhwang91/rnvimr'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
  Plug 'alvan/vim-closetag'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/vim-fz'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'yazgoo/yank-history'
  Plug 'rakr/vim-one'
  Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'folke/todo-comments.nvim'
  Plug 'TimUntersberger/neogit'
  Plug 'wellle/context.vim'
  Plug 'stephpy/vim-yaml' "Slimmed down YAML syntax for better performance
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } "Read More - https://github.com/glacambre/firenvim
call plug#end()

" Configure Plugins
" -----------------

" Path to NodeJS for Coc
" (only needed if using nvm, comment out if using system NodeJS)
let g:coc_node_path = '~/.nvm/versions/node/v16.8.0/bin/node'

" Path to Ranger (only needed for Neovide GUI on Windows)
"let g:rnvimr_ranger_cmd = '~/.local/bin/ranger'

" Clipboard (y/p read/write from OS clipboard)
set clipboard=unnamedplus

" Context (breadcrumbs) disable by default (performance hog)
let g:context_enabled = 0
let g:context_add_autocmds = 0

" Close file tree when opening a file
let NERDTreeQuitOnOpen = 1

" Close Rnvimr when opening a file
let g:rnvimr_enable_picker = 1
" Clear buffers of files deleted by Rnvimr
let g:rnvimr_enable_bw = 1

" Highlight open file in file tree
let g:NERDTreeHighlightCursorline = 1

" Auto close tag filetypes
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,javascript,*.ts,*.tsx,typescript'

" Lualine
lua << EOF
  require('lualine').setup({
    options = { theme = 'onedark' }
  })
EOF

" Comment tags
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      },
      merge_keywords = false, -- when true, custom keywords will be merged with the defaults
  }
EOF

" Theme
" -----

syntax on
colorscheme one
set background=dark
highlight ScrollView ctermbg=159 guibg=LightCyan " Scrollbar color
" Used by Neovide GUI
set guifont=Cascadia\ Code:h7

" Hotkeys
" -------

" Shift+Alt+b: Show/Hide context (breadcrumbs)
map <S-A-b> :ContextActivate<CR>:ContextUpdate<CR>:ContextToggle<CR>

" F2: Toggle Paste Mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Ctrl+n: Toggle File Tree
map <C-n> :NERDTreeToggle<CR>

" Ctrl+Shift+n: Toggle File Tree at current file
map <C-S-n> :NERDTreeToggle %:p:h<CR>

" Ctrl+o: Open Rnvimr file manager
nnoremap <C-o> :RnvimrToggle<CR>
tnoremap <M-o> <C-\><C-n>:RnvimrToggle<CR>

" Ctrl+f: Find text in files
map <C-f> :Telescope live_grep<CR>

" Ctrl+b: Buffer list
map <C-b> :Telescope buffers<CR>

" Ctrl+p: Find Files
map <C-p> :Telescope find_files<CR>

" Crtl+t: Show all TODOs
map <C-t> :TodoTelescope<CR>

" Ctrl+Shift+f: Fuzzy find text in files
map <C-S-f> :Ag<CR>

" Open Git tab (? for help)
map <C-g> :Neogit<CR>

" Alt+Shift+f: ESLint/Prettier on current file
map <A-S-f> :CocCommand eslint.executeAutofix<CR>:CocCommand prettier.formatFile<CR>

" Alt+Shift+t: Run Jest Tests
map <A-S-t> :CocCommand jest.projectTest<CR>

" Alt+e: Jump to next error
map <A-e> <Plug>(coc-diagnostic-next)

" Alt+Shift+e: Jump to previous error
map <A-S-e> <Plug>(coc-diagnostic-prev)

" Ctrl+Alt+e: Show list of warnings/errors
map <C-A-e> :CocList diagnostics<CR>

" Ctrl+s: Edit snippets for filetype
map <C-s> :CocCommand snippets.editSnippets<CR>

" Ctrl+l: Show snippets for filetype
map <C-l> :CocList snippets<CR>

" Tab to expand snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Alt+Shift+p: Show history of yanks (vim copy/paste)
nmap <A-S-p> :YankHistoryRgPaste<CR>

" fl: Set current file to unix line endings
nnoremap fl :set ff=unix<CR>

" tn: New tab
nnoremap tn :tabnew<CR>

" tj: Jump to first tab
nnoremap tj :tabfirst<CR>

" tl: Jump to next tab
nnoremap tl :tabnext<CR>

" th: Jump to previous tab
nnoremap th :tabprev<CR>

" tk: Jump to last tab
nnoremap tk :tablast<CR>

" td: Close current tab
nnoremap td :tabclose<CR>

" to: Close all but current tab
nnoremap to :tabonly<CR>

" tm: Move tab (0-9) or (+/-0-9)
nnoremap tm :tabm<Space>

" Editor Config
" -------------

" Always show status line
set laststatus=2

" Mode is shown in status line, don't show twice
set noshowmode

" Show line numbers
set number

" Convert tab to spaces
set expandtab

" Do NOT convert tab to spaces (uncomment to enable)
"set noexpandtab

" Do NOT fix or force ending newline (uncomment to enable)
"set nofixeol
"set noeol

" Auto-indent
set smartindent
set smarttab
filetype indent on

" Tab width in spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Filetype overrides
" These change the way certain filetypes are
" handled by Prettier/ESLint/etc
au BufNewFile,BufFilePre,BufRead *.mdx set filetype=markdown

" Theme color handlers
" --------------------

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
