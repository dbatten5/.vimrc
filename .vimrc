" remove all existing autocmds
autocmd!

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'

" all plugins must go before here
call vundle#end()

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOUR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme base16-ocean
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set backspace=2    " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=100
set ruler         " show the cursor position all the time
let mapleader = "," " map the leader
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set clipboard=unnamed
set relativenumber
set viminfo='20,\"90,h,%    " read/write a .viminfo file
set pastetoggle=<leader>p
set showmode
set autoread
filetype plugin indent on
set textwidth=80
set colorcolumn=+1
set number
set numberwidth=5
set wildmode=list:longest,list:full
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add
" Autocomplete with dictionary words when spell check is on
set complete+=kspell
" Always use vertical diffs
set diffopt+=vertical
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" This allows buffers to be hidden if you've modified a buffer.
set hidden
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Display extra whitespace
set list listchars=tab:··,trail:·,nbsp:·
" Make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open = 1
set visualbell
set noerrorbells
set shell=/bin/zsh
" Don't pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/public/**

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
" Current <leader> maps:
"  bl, bq, ct, f h, l, la, n, ne, p, q", q', qd, r, t, T, w, zz
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle centered cursor
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
" Quote mark mappings
:nnoremap <Leader>q" ciw""<Esc>P
:nnoremap <Leader>q' ciw''<Esc>P
:nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P
:nnoremap n nzz
:nnoremap } }zz
vnoremap // y/\V<C-R>"<CR>
nnoremap <leader>p :set invpaste paste?<CR>
" Index ctags from any project, including those outside Rails
noremap <Leader>ct :!ctags -R .<CR>
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Insert a hash rocket with <c-l>
inoremap <c-l> <space>=><space>
" Male <c-c> be the same as ESC in insert mode
inoremap <c-c> <esc>
nnoremap <leader>ne :NERDTreeToggle<cr>
" To open a new empty buffer
nnoremap <space>T :enew<cr>
" Move to the next buffer
nnoremap <space>l :bnext<CR>
" Move to the previous buffer
nnoremap <space>h :bprevious<CR>
" Close the current buffer and move to the previous one
nnoremap <space>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <space>bl :ls<CR>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>
" Map the enter key to write the file and run the last command
nnoremap <CR> :wa<CR>:!!<CR>  
" Fast saves
nnoremap <leader>w :w!<cr>
" Center the cursor while in insert mode
:inoremap <c-z> <esc>zza
" Capitalize a word in insert mode
:inoremap <c-u> <esc>viwUea
" Open up .vimrc in a vertical split
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source .vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>
" Force syntax highlighting on the off chance it breaks
:nnoremap <leader>sx <esc>:syntax sync fromstart<cr>
" Remap the hash key cos its awkward on a mac
:nnoremap & #
" Center the cursor with double space
:nnoremap <space><space> zz
xnoremap <space>dp :diffput<cr>
xnoremap <space>do :diffget<cr>
" Motion for entire function definition
:onoremap af :<c-u>visual! i{2jok

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ABBREVIATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:cnoreabbrev art !php artisan
:cnoreabbrev mm !php artisan make:model
:cnoreabbrev mc !php artisan make:controller
:cnoreabbrev mt !php artisan make:test
:cnoreabbrev mmig !php artisan make:migration
:cnoreabbrev mig !php artisan migrate
:cnoreabbrev migt !php artisan migrate --database mysql_testing

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Auto-remove trailing spaces
  autocmd BufWritePre *.php :%s/\s\+$//e
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if wer're at the beginning of a line. ELse, do a completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MATCHIT.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" THE SILVER SEARCHER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto cache clearing
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RELATIVE NUMBER LINES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-N><C-T> :call NumberToggle()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP AUTOCOMPLETION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP " set up omnicomplete
set completeopt=longest,menuone " 
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SNIPPETS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1 " enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
noremap <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunPHPUnitTest(filter)
  exec ":w"
  cd %:p:h
  if a:filter
    normal! T yw
    let result = system("../../vendor/bin/phpunit --filter " . @" . " " . bufname("%"))
  else
    let result = system("../../vendor/bin/phpunit " . bufname("%"))
  endif
  split __PHPUnit_Result__
  normal! ggdG
  setlocal buftype=nofile
  call append(0, split(result, '\v\n'))
  cd -
endfunction
nnoremap <leader>t :call RunPHPUnitTest(0)<cr>
nnoremap <leader>f :call RunPHPUnitTest(1)<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM FUGITIVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <space>ga :Git add %:p<cr><cr>
:nnoremap <space>gst :Gstatus<cr>
:nnoremap <space>gc :Gcommit -v -q<cr>
:nnoremap <space>gt :Gcommit -v -q %:p<cr>
:nnoremap <space>gd :Gdiff<cr>
:nnoremap <space>ge :Gedit<cr>
:nnoremap <space>gr :Gread<cr>
:nnoremap <space>gw :Gwrite<cr>
:nnoremap <space>gb :Git branch<space>
:nnoremap <space>gco :Git checkout<space>
:nnoremap <space>gm :Gmerge<space>
:nnoremap <space>gp :Git push origin HEAD<cr>
:nnoremap <space>gl :Git pull<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LARAVEL COMMONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <leader>va :e routes/api.php<cr>
