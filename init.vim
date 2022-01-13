if has('mac')
  call plug#begin('~/.config/nvim/plugged')
endif
if has('unix')
  call plug#begin()
endif
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-jp/vimdoc-ja'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'michaeljsmith/vim-indent-object'
Plug 'brglng/vim-im-select'
Plug 'thinca/vim-visualstar'
if has('mac')
  Plug 'joshdick/onedark.vim'
endif
if has('unix')
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
autocmd BufEnter * silent! set autoindent smartindent

if has('mac')
  let g:im_select_default = 'com.apple.keylayout.ABC'
  colorscheme onedark
endif
if has('unix')
  syntax on
  colorscheme lucario
  set t_Co=16
endif 
" if exists('g:vscode')
"   finish
" endif
