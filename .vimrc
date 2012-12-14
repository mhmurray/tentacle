set autochdir
set wildignore=*.dll,*.o,*.d,*.bak,*.jpg,*.png,*.gif
set wildmode=list:longest

set formatoptions+=ro

set guifont=Neep\ 18
set tabstop=8
set shiftwidth=2
set expandtab
set softtabstop=2
set smartindent

set pastetoggle=<F2>

" Highlighting of all search matches
set hlsearch

let c_no_comment_fold = 1
set foldmethod=syntax
set foldnestmax=1
" This is like running :syn sync fromstart
" It starts its syntax search from the start of the file
au Syntax * syntax sync fromstart

function SimpleFoldText()
  return getline(v:foldstart).' '
endfunction

highlight Folded ctermfg=1 ctermbg=0

colorscheme elflord
