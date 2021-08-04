"
"       config located in ~/.config/nvim/init.vim
"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
" Reauiv glif patch - nerd-fonts https://www.nerdfonts.com/
" Install full package via yay
" nerd-fonts-complete
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' } 

Plug 'morhetz/gruvbox'

"       Default multi-mode start with C-n, so disable 
"       Use V-bloc : C-v and insert via S-i
"       "   Plug 'mg979/vim-visual-multi'


" Python
Plug 'davidhalter/jedi-vim'
"   Plug 'klen/python-mode'


" Требуется компиляция
" Для компиляции установил python-neovim
"       Plug 'valloric/youcompleteme'


Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
" Requiv ctags. Install ctags via pacman 
Plug 'majutsushi/tagbar'

"
"Plug 'tpope/vim-capslock'
"Plug 'lambdalisue/battery.vim'
"


"       Работает только с vim
"Plug 'powerline/powerline'


call plug#end()
"
"
"
" set TERM=xterm-256color
set encoding=utf-8

syntax on
set number
" включить подсветку синтаксиса Python
let python_highlight_all = 1


colorscheme gruvbox

set hlsearch
set incsearch
	
"set encoding=UTF-8

set expandtab
set tabstop=4

" Выделение текущей строки
set cursorline

" показывать парную скобку для [] {} и ()
set showmatch

"
"       Проверка орфографии
"       https://eax.me/vim-commands/
"       скачны словари в ~/.local/share/nvim/spell
"
"   set spell spelllang=ru,en
"   let g:airline_detect_spell=1
"   let g:airline_detect_spelllang=1





"       airline
"
"
let g:airline_theme='tomorrow'   
"   let g:airline_theme='dark'
"   let g:airline_section_z = '%t'

let g:airline_powerline_fonts = 1 
set guifont=Liberation\ Mono\ for\ Powerline\ 10 

" let g:airline_powerline_fonts = 1

" Enable powerline via
"           https://www.tecmint.com/powerline-adds-powerful-statuslines-and-prompts-to-vim-and-bash/
" УДАЛИЛ:   Установил пакет powerline-show via pip --> поправил путь на соответвующий
"           python
"           set  rtp+=/usr/local/lib/python3.9/dist-packages/powerline/bindings/vim/
"           set laststatus=2
"           set t_Co=256
"
set laststatus=2

let g:airline#extensions#clock#format = '%H:%M:%S'

"       Capslock hightlight - via   tpope/vim-capslock
"       let g:airline#extensions#capslock#enabled = 1
"       let g:airline#extensions#capslock#symbol = 'CAPS'

"       Battary status -  lambdalisue/battery.vim 
"       Work, but need rewrite. Bad fonts.
"       let g:airline#extensions#battery#enabled = 1
"
"           Тестовая полоса vim airline

"               Via https://tuckerchapman.com/2020/09/15/getting-started-vim-airline/
"
" Note: You must define the dictionary first before setting values.
" Also, it's a good idea to check whether it exists as to avoid 
" accidentally overwriting its contents.

"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

"       " powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.dirty='⚡'

" If you only see boxes here it may be because your system doesn't have
" the correct fonts. Try it in vim first and if that fails see the help 
" pages for vim-airline :help airline-troubleshooting
"
"

"
"  Trailing whitespaces
"
"   set list
"   set listchars=tab:»·
"   set listchars+=trail:·
"   set endofline


"Via Arch Wiki: https://wiki.archlinux.org/title/Powerline#Vim
"   Install powerline powerline-fonts powerline-vim via pacman 
"let g:powerline_pycmd="py3"
"set laststatus=2
"set rtp+=/usr/share/powerline/bindings/vim
"
"   Also was fixed zsh and bash configs for enable powerline

" 
"       Отображение статуса файлов в репозитории при запуск NERDTree
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }





" mappings

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Nerd tree --  Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>
