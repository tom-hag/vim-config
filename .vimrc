set nocompatible
set noro

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ---- THEMES ---- 
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'atelierbram/vim-colors_atelier-schemes.git'

" ---- UI ----
Plugin 'vim-airline/vim-airline'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'plasticboy/vim-markdown'

" ---- COMPLETION/HIGHLIGHTING/LINTING ----
Plugin 'vim-syntastic/syntastic'
Plugin 'cespare/vim-toml'
Plugin 'ncm2/ncm2'


" ---- FORMATTING ----
Plugin 'alvan/vim-closetag'
Plugin 'Raimondi/delimitMate'

" ---- LANGUAGE SPECIFIC ----

" --- js

Plugin 'styled-components/vim-styled-components'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" --- rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

" --- scala

Plugin 'derekwyatt/vim-scala'

" ---- MISC ----
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/a.vim'

Plugin 'skywind3000/asyncrun.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()

filetype plugin indent on
set rtp+=~/dev/others/base16/builder/templates/vim/

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax enable

set mouse=a

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- Plugin-Specific Settings --------------------------------------
set background=dark
"-- colorscheme gruvbox
colorscheme Atelier_DuneDark

hi Normal ctermbg=NONE
" Get syntax
" syntax on

let g:airline_theme='Atelier_DuneDark'
let g:gruvbox_italicize_comments='1'

" Set the colorscheme
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" ----- jistr/vim-nerdtree-tabs -----
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- airblade/vim-gitgutter settings -----
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --- Autorun prettier
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" --- Closetags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*jsx,*js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
" Highlights the close tag the same as the open tag
highlight link xmlEndTag xmlTag

