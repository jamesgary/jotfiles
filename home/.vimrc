if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'elmcast/elm-vim'
"Plug 'godlygeek/tabular'
call plug#end()

let g:elm_format_autosave = 1
"
"" basics
"set encoding=utf-8
"set history=1000
"set ignorecase
"set so=10 " Buffer 10 lines around the cursor when moving vertically
"set wrap
"set nosol " turn off startofline so ctrl+u and ctrl+d behave better
"set backspace=indent,eol,start
"set tabpagemax=100 " use `vim -p` to open up to 100 files
"
"" visual
color desert
colorscheme desert
set background=dark
"
"set lazyredraw
"set number
"set ruler
"syntax on
"
"" search
"set hlsearch
"set ignorecase
"set incsearch
"set smartcase
"
"" tabbin'
"set ai "Auto indent
"set expandtab
"set shiftround
"set shiftwidth=2
"set tabstop=2
"set si "Smart indent
"set smarttab
"
"set lbr
"set tw=500
"
"set wrap "Wrap lines
"
"set wildmenu " Gives feedback when completing on the vim command line
"set wildignore=*.o,*.obj,*~,.lo,*.swp,*.pyc,*.class " File extensions to ignore in the wildmenu
"
"" status
"set laststatus=2   " Always show the statusline
"
"" ,c enables cursor column
let mapleader = ","
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"map <Leader>c :set cursorline! cursorcolumn!<CR>
"
"" List chars
"set list
"set listchars=""                  " Reset the listchars
"set listchars=tab:\ \             " show tab as "  "
"set listchars+=trail:.            " show trailing spaces as dots
"set listchars+=extends:>          " The character to show in the last column when wrap is
"                                  " off and the line continues beyond the right of the screen
"set listchars+=precedes:<         " The character to show in the last column when wrap is
"                                  " off and the line continues beyond the right of the screen
"
"" See https://github.com/gorakhargosh/watchdog/issues/56
"set nobackup
"set nowritebackup
"
"" Language specific
"au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl " glsl syntax
"au BufNewFile,BufRead *.go set filetype=go | set tabstop=2 | set noexpandtab
"autocmd BufNewFile,BufRead *.json,Gruntfile set filetype=javascript
"
"" Join lines with cursor staying in place
"nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>
"
"" Resize splits when the window is resized
"au VimResized * exe "normal! \<c-w>="
"
"" Improve up/down movement on wrapped lines
"nnoremap j gj
"nnoremap k gk
"
"" select all
"map <Leader>a ggVG
"" Map Q to repeat the last recorded macro
"map Q @q
"" Clear trailing whitespace
"map <Leader>w :%s/\s\+$//<CR>:noh<CR>
"" vmap <leader>t :Tabularize /:\zs/l0l1<cr>
"" vmap <leader>T :Tabularize /=<cr>
"
"" Use tab for auto completion
"function! SuperTab()
"  if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
"    return "\<Tab>"
"  else
"    return "\<C-n>"
"  endif
"endfunction
"imap <Tab> <C-R>=SuperTab()<CR>
