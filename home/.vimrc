" Vundle
set nocompatible " Disable vi-compatibility
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" run :BundleInstall (or vim +BundleInstall +qall for CLI lovers)
Bundle 'airblade/vim-gitgutter'
Bundle 'digitaltoad/vim-jade'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'pangloss/vim-javascript'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wavded/vim-stylus'
Bundle 'nono/vim-handlebars'
Bundle 'nvie/vim-flake8'

" vim-scripts repos
Bundle 'vim-scripts/desert256.vim'

" basics
filetype plugin indent on
set encoding=utf-8
set history=1000
set ignorecase
set so=10 " Buffer 10 lines around the cursor when moving vertically
set wrap
set nosol " turn off startofline so ctrl+u and ctrl+d behave better
set backspace=indent,eol,start

" visual
colorscheme desert
color desert
set background=dark

set lazyredraw
set number
set ruler
syntax on
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl " glsl syntax
autocmd BufNewFile,BufRead *.json,Gruntfile set filetype=javascript

" RSpec
autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

" tabbin'
set ai "Auto indent
set expandtab
set shiftround
set shiftwidth=2
set tabstop=2
set si "Smart indent
set smarttab

set lbr
set tw=500

set wrap "Wrap lines

set wildmenu " Gives feedback when completing on the vim command line
set wildignore=*.o,*.obj,*~,.lo,*.swp,*.pyc,*.class " File extensions to ignore in the wildmenu

" status
set laststatus=2   " Always show the statusline

" ,c enables cursor column
let mapleader = ","
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
map <Leader>c :set cursorline! cursorcolumn!<CR>

" List chars
set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " show tab as "  "
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

" See https://github.com/gorakhargosh/watchdog/issues/56
set nobackup
set nowritebackup

""""""""""""""""
" From vimbits "
""""""""""""""""

" Join lines with cursor staying in place
nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" select all
map <Leader>a ggVG

" Use tab for auto completion
function! SuperTab()
  if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>

" Map Q to repeat the last recorded macro
map Q @q
" Used to be: map Q @@

"""""""""""
" From me "
"""""""""""

" Do a fancy comment header
map <Leader>f A #<Esc>VyppVr#kkVr#jj

" Add a highly visible log for Rails
map <Leader>l YPIRails.logger.error("<Esc>A: #{<Esc>JA.inspect }")<Esc>oRails.logger.error("#################################")<Esc>Ypppkkkkkppppj
map <Leader>L YPIputs("<Esc>A: #{<Esc>JA.inspect }")<Esc>oputs("#################################")<Esc>Ypppkkkkkppppj

" Insert Lorem Ipsum
map <Leader>o iLorem ipsum dolor sit amet, consectetur adipiscing elit. In ut quam dui, ac accumsan leo. Suspendisse felis eros, consectetur vel elementum nec, tristique vitae augue. Etiam bibendum pulvinar enim, ac volutpat diam sagittis vitae. Morbi egestas nisl ac lacus aliquet viverra. Proin condimentum, est feugiat ullamcorper vulputate, urna massa ultrices dui, rutrum condimentum arcu justo in nisl. Vestibulum sed tellus sed justo tincidunt ornare eu a nisi. Duis enim ligula, pellentesque ac sollicitudin ac, viverra eget massa. Duis ac pulvinar diam.<Esc>

" Clear trailing whitespace
map <Leader>w :%s/\s\+$//<CR>:noh<CR>

vmap <leader>t :Tabularize /:\zs/l0l1<cr>
vmap <leader>T :Tabularize /=<cr>
