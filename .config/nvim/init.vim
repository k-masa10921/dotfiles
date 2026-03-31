" Plugin
call plug#begin('~/.config/nvim/plugged')
" insert
Plug 'tpope/vim-surround'
Plug 'brglng/vim-im-select'
" operation target
Plug 'wellle/targets.vim'
" move
Plug 'easymotion/vim-easymotion'
" comment
Plug 'tpope/vim-commentary'
" tab
" Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" visual
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
" yank
Plug 'machakann/vim-highlightedyank'
" search
Plug 'thinca/vim-visualstar'
" help
Plug 'vim-jp/vimdoc-ja'
" theme
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'navarasu/onedark.nvim'
" fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
" filer
Plug 'lambdalisue/fern.vim'
" git
Plug 'kdheepak/lazygit.nvim'
" language
" Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jwalton512/vim-blade'
call plug#end()

"set options
set number
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard+=unnamed
set hls
set nowrap
" termguicolorsはTerminal.appでは問題があるのでコメントアウト
" set termguicolors
set t_Co=256

" 非推奨API警告を非表示
lua vim.deprecate = function() end

" set map
nnoremap x "_x
nnoremap c "_c
nnoremap <silent> <C-c> :nohls<CR>
let g:mapleader = "\<Space>"

nnoremap <C-w>s :split<CR>
nnoremap <C-w>v :vsplit<CR>

let g:im_select_default = 'com.apple.keylayout.ABC'

"plugin setting
"eary motion
let g:EasyMotion_keys = "fjdklsa;io"
nmap s <Plug>(easymotion-overwin-f2)

"highlight
let g:highlightedyank_highlight_duration = 150

" カラースキーム設定
" onedark.nvimはTerminal.appと互換性がないため、組み込みカラースキームを使用
" tmux内では正常に動作するため、tmux環境かどうかで分岐
if exists('$TMUX')
  " tmux内ではonedarkを使用
  lua << EOF
require('onedark').setup {
  style = 'cool',
  toggle_style_key = '<leader>ts',
  ending_tildes = true,
  diagnostics = {
    darker = false,
    background = false,
  },
}
require('onedark').load()
EOF
else
  " tmux外（Terminal.app）では256色対応のカラースキームを使用
  colorscheme desert
  " または他のお好みのカラースキーム:
  " colorscheme pablo
  " colorscheme slate
  " colorscheme torte
endif

"" fern
nnoremap <silent> <Leader>E :<C-u>Fern . -drawer<CR>
nnoremap <silent> <Leader>e :<C-u>Fern . -drawer -reveal=%<CR>

"" telescope
nnoremap <C-p>     <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true, 
    disable = {   
    }
  }
}
EOF

""lazyGit
nnoremap <silent> <leader>g :LazyGitCurrentFile<CR>

let g:airline#extensions#tabline#enabled = 1
nmap <Leader>n <Plug>AirlineSelectPrevTab
nmap <Leader>p <Plug>AirlineSelectNextTab
"" coc.nvim
" let g:coc_global_extensions = ['coc-fzf-preview']

