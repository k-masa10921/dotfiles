if system("uname")=="Darwin\n"
  call plug#begin('~/.config/nvim/plugged')
endif
if system("uname")=="Linux\n"
  call plug#begin()
endif
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-jp/vimdoc-ja'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'raphamorim/lucario'
Plug 'jdkanani/vim-material-theme'
Plug 'tomasr/molokai'
Plug 'michaeljsmith/vim-indent-object'
Plug 'brglng/vim-im-select'
Plug 'thinca/vim-visualstar'
if system("uname")=="Darwin\n"
  Plug 'joshdick/onedark.vim'
endif
if system("uname")=="Linux\n"
  Plug 'raphamorim/lucario'
  Plug 'jdkanani/vim-material-theme'
  Plug 'tomasr/molokai'
endif
if exists('g:vscode')
  Plug 'asvetliakov/vim-easymotion'
  nmap s <Plug>(easymotion-s2)
else
  Plug 'easymotion/vim-easymotion'
  nmap s <Plug>(easymotion-overwin-f2)
endif
call plug#end()

"plugin setting
let mapleader = "\<Space>"

syntax enable
colorscheme lucario
set t_Co=16

let g:highlightedyank_highlight_duration = 150
let g:EasyMotion_keys = "fjdklsa;io"
"share setting
set number
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard+=unnamed
set hls
nnoremap x "_x
nnoremap c "_c
nnoremap <silent> <C-c> :nohls<CR>

autocmd BufEnter * silent! set autoindent smartindent

if system("uname")=="Linux\n"
  syntax on
  colorscheme lucario
  set t_Co=16
endif 
if system("uname")=="Darwin\n"
  let g:im_select_default = 'com.apple.keylayout.ABC'
  colorscheme onedark
endif

" if exists('g:vscode')
"   finish
" endif
