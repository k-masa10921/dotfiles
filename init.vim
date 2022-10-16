" Plugin
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
Plug 'michaeljsmith/vim-indent-object'
Plug 'brglng/vim-im-select'
Plug 'thinca/vim-visualstar'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jwalton512/vim-blade'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/gina.vim'
if system("uname")=="Darwin\n"
  Plug 'navarasu/onedark.nvim'
endif
if system("uname")=="Linux\n"
  Plug 'raphamorim/lucario'
  Plug 'jdkanani/vim-material-theme'
  Plug 'tomasr/molokai'
endif
call plug#end()

"set options
set number
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard+=unnamed
set hls

" set map
nnoremap x "_x
nnoremap c "_c
nnoremap <silent> <C-c> :nohls<CR>
let g:mapleader = "\<Space>"

nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
nmap     m        [dev]
xmap     m        [dev]
nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     z        [ff]
xmap     z        [ff]

if system("uname")=="Linux\n"
  syntax on
  colorscheme lucario
  set t_Co=16
endif 
if system("uname")=="Darwin\n"
  let g:im_select_default = 'com.apple.keylayout.ABC'
endif

"plugin setting
"eary motion
let g:EasyMotion_keys = "fjdklsa;io"
nmap s <Plug>(easymotion-overwin-f2)

"highlight
let g:highlightedyank_highlight_duration = 150

" onedark
let g:onedark_config = {
\ 'style': 'cool',
\ 'toggle_style_key': '<leader>ts',
\ 'ending_tildes': v:true,
\ 'diagnostics': {
  \ 'darker': v:false,
  \ 'background': v:false,
\ },
\ }
colorscheme onedark

"" coc.nvim
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint8', 'coc-prettier', 'coc-git', 'coc-fzf-preview', 'coc-lists', 'coc-html', 'coc-blade']

inoremap <silent> <expr> <C-Space> coc#refresh()
nnoremap <silent> K       :<C-u>call <SID>show_documentation()<CR>
nmap     <silent> [dev]rn <Plug>(coc-rename)
nmap     <silent> [dev]a  <Plug>(coc-codeaction-selected)iw

" function! s:coc_typescript_settings() abort
"   nnoremap <silent> <buffer> [dev]f :<C-u>CocCommand eslint.executeAutofix<CR>:CocCommand prettier.formatFile<CR>
" endfunction

" augroup coc_ts
"   autocmd!
"   autocmd FileType typescript,typescriptreact call <SID>coc_typescript_settings()
" augroup END

function! s:show_documentation() abort
  if index(['vim','help'], &filetype) >= 0
    execute 'h ' . expand('<cword>')
  elseif coc#rpc#ready()
    call CocActionAsync('doHover')
  endif
endfunction

"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true, 
    disable = {   
      'lua',
      'ruby',
      'toml',
      'c_sharp',
      'vue',
    }
  }
}
EOF

"" fzf-preview
let $BAT_THEME                     = 'gruvbox-dark'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'gruvbox-dark'

nnoremap <silent> <C-p>  :<C-u>CocCommand fzf-preview.FromResources buffer project_mru project<CR>
nnoremap <silent> [ff]s  :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [ff]gg :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [ff]b  :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap          [ff]f  :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>
xnoremap          [ff]f  "sy:CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

nnoremap <silent> [ff]q  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> [ff]rf :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> [ff]d  :<C-u>CocCommand fzf-preview.CocDefinition<CR>
nnoremap <silent> [ff]t  :<C-u>CocCommand fzf-preview.CocTypeDefinition<CR>
nnoremap <silent> [ff]o  :<C-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>

"" fern
nnoremap <silent> <Leader>e :<C-u>Fern . -drawer<CR>
nnoremap <silent> <Leader>E :<C-u>Fern . -drawer -reveal=%<CR>
