colorscheme elflord

filetype plugin indent on

set nowrap
hi Search NONE
set incsearch
syntax enable
set cindent
set nobackup
set laststatus=2
set ignorecase
set hlsearch
set noswapfile

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set expandtab
set textwidth=80
set tabstop=4
set shiftwidth=4
set mouse=a

set number
set autoindent

set enc=latin1
set guifont=system

set statusline=%-f%m\ %r\ %y%=BUFF=%n\ %l,%c

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Highlights bad whitespace red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Phill's custom _vimrc Rev 2 -- first one was blown away :'(

function ToggleComment()
let s:save_y = @y
normal 02"yyl
if @y == "/*"
    normal 02x$xx
else
    execute "normal 0i/*\<Esc>$a*/\<Esc>"
endif
let @y = s:save_y
unlet s:save_y
endfunction

let s:toggle = 0

function PhillComment()
    if s:toggle == 0
        execute "normal \<Esc>O/* EPB EPB EPB */\<Esc>"
        let s:toggle = 1
    else
        execute "normal \<Esc>o/* EPB EPB EPB */\<Esc>"
        let s:toggle = 0
    endif
endfunction

nnoremap <C-Tab> :bn!<Return>
nnoremap <C-S-Tab> :bp!<Return>
nnoremap <C-Z> <C-W><C-W>
nnoremap <F9> :1new<Return><C-W>r
nnoremap <F2> <Esc>:call ToggleComment()<Return>
nnoremap <F3> <Esc>:call PhillComment()<Return>
nnoremap <F4> <Esc>:cd %:h<Return>
vmap // y/<C-R>"<CR>
vmap <C-Z> <Esc><C-W><C-W>

" map right click to command repetition 
map <RightMouse> .

nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode

function Sudsy()
let s:xx = 0
let s:save_a = @a
let s:grid = ""
let s:numidx = 0
let s:blankidx = 0
silent !wget -O sudoku.txt http://show.websudoku.com/?difficulty=3
edit sudoku.txt
" Reduce to one line
execute "normal ggv/class=t>\<Return>djvGddd"
echo "reduced"
normal "ayy
let s:numidx =  stridx(@a, "READONLY", s:numidx + 1)
echo "numidx =" . s:numidx
let s:blankidx =  stridx(@a, "MAXLENGTH", s:blankidx + 1)
echo "blankidx =" . s:blankidx
for xx in range(1,81)
while s:numidx > s:blankidx
    let s:grid = s:grid . ' '
    let s:blankidx =  stridx(@a, "MAXLENGTH", s:blankidx + 1)
    echo "blankidx =" . s:blankidx
    if s:blankidx == -1
        let s:blankidx = 2000
        echo "blankidx =" . s:blankidx
    endif
endwhile
while s:numidx < s:blankidx
    let s:grid = s:grid . strpart(@a, s:numidx+16,1)
    let s:numidx =  stridx(@a, "READONLY", s:numidx + 1)
    echo "numidx =" . s:numidx
    if s:numidx == -1
        let s:numidx = 2000
        echo "numidx =" . s:numidx
    endif
endwhile
endfor

" s:grid should now contain the string we want
echo s:grid
endfunction


