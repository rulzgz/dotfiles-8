"
"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
"
"  KingKobra87's Neovim config
"  https://www.github.com/kingkobra87/dotfiles
"

" ############################
" ###### BASIC SETTINGS ######
" ############################

" UTF-8 Encoding (required for glyphs)
set encoding=utf8

" Silence!
set noerrorbells

" Show status line
set laststatus=2

" Enable true 24-bit colour
set termguicolors

" Enable modeline
set modeline

" Show current mode
set noshowmode

" Line numbers
set number

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc
" Toggle shortcut below under keyboard shortcuts

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" Lines visible when scrolling
set scrolloff=15

" Fix ugly vertical splits
set fillchars+=vert:\

" Natural splits
set splitbelow
set splitright

" Syntax highlighting
syntax enable

" Filetype detection and their indents
filetype indent on

" Visual autocomplete for command menu
set wildmenu

" Highlight matching parenthesis (like Sublime)
set showmatch

" Display whitespace
set list
set listchars=tab:»·,extends:>,precedes:<,trail:·

" Enable auto-indent
set autoindent
filetype plugin indent on

" Set indentation to be four spaces
set tabstop=4 softtabstop=4 expandtab shiftwidth=4

" Soft word wrap
set linebreak

" Continue comment marker in new lines
set formatoptions+=o

" Only redraw when needed
set lazyredraw

" Treat all *.md files as Markdown, rather than Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Backup settings
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" ################################
" ###### KEYBOARD SHORTCUTS ######
" ################################

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Use ; for : commands
nnoremap ; :

" Close current buffer
nmap <Leader>q :bd!<CR>

" Switch between buffers
map <C-Left> <Esc>:bp!<CR>
map <C-Right> <Esc>:bn!<CR>

" Toggle between normal and relative numbering.
nnoremap <Leader>r :call NumberToggle()<cr>

" #######################
" ###### SEARCHING ######
" #######################

" Move cursor while searching
set incsearch

" Make searching case insensitive
set ignorecase

" ... unless the query has capital letters.
set smartcase

" Use 'magic' patterns (extended regular expressions).
set magic

" Highlight search results
set hlsearch

" Use Ctrl+L to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace (with confirmation)
nmap <Leader>s :%s///c<Left><Left><Left>
" Syntax :%s/search/replace/c (c to ask for confirmation)

" #####################
" ###### PLUGINS ######
" #####################

" :PlugInstall      Install new plugins
" :PlugUpdate       Update existing plugins
" :PlugUpgrade      Upgrade vim-plug itself
" :PlugClean        Remove unused directories
" :PlugStatus       Check the status of plugins

call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'raimondi/delimitmate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lilydjwg/colorizer'

" Colourschemes
"Plug 'morhetz/gruvbox'
"Plug 'dracula/vim'
"Plug 'arcticicestudio/nord-vim'
Plug 'icymind/NeoSolarized'

call plug#end()

" #############################
" ###### PLUGIN SETTINGS ######
" #############################

" NerdTree options
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=2
let NERDTreeAutoDeleteBuffer=1
" Ctrl+n to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>
" Automatically exit vim if NerdTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline options
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '▓▒░'
let g:airline_right_sep = '░▒▓'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_skip_empty_sections = 1

" Gitgutter options
let g:gitgutter_override_sign_column_highlight = 0

" Deoplete options
let g:deoplete#enable_at_startup = 1

" Colorizer options
let g:colorizer_maxlines = 1500

" gruvbox options
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_italic = 0
"let g:gruvbox_italicize_comments = 0

" NeoSolarized options
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
let g:neosolarized_vertSplitBgTrans = 0
let g:neosolarized_visibility = "low"
let g:neosolarized_contrast = "normal"

" Vim colorscheme
colorscheme NeoSolarized
set background=dark
"let g:nord_uniform_status_lines = 1
"let g:nord_uniform_diff_background = 1

" ######################
" ###### STARTIFY ######
" ######################

nmap <Leader>z :Startify<CR>
highlight StartifyHeader    guifg=#DC322F
highlight StartifyNumber    guifg=#268BD2
highlight StartifyBracket   guifg=#6C71C4
highlight StartifySlash     guifg=#B58900
highlight StartifyPath      guifg=#859900
highlight StartifyFile      guifg=#859900
highlight StartifySection   guifg=#2AA198
let g:startify_custom_header = [
        \ '                                                           ',
        \ '     ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓    ',
        \ '     ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒    ',
        \ '    ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░    ',
        \ '    ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██     ',
        \ '    ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒    ',
        \ '    ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░    ',
        \ '    ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░    ',
        \ '       ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░       ',
        \ '             ░    ░  ░    ░ ░        ░   ░         ░       ',
        \ '                                    ░                      ',
        \ '                                                           ',
        \ ]
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_list_order = [
        \ ['   Dotfiles:'],
        \ 'bookmarks',
        \ ['   Projects:'],
        \ 'sessions',
        \ ['   Recent files:'],
        \ 'files',
        \ ['   Commands:'],
        \ 'commands',
        \ ]
let g:startify_bookmarks = [
        \ {'d1': '~/.config/nvim/init.vim'},
        \ {'d2': '~/.config/polybar/config'},
        \ {'d3': '~/.config/rofi/config'},
        \ {'d4': '~/.config/twmn/twmn.conf'},
        \ {'d5': '~/.config/xfce4/terminal/terminalrc'},
        \ {'d6': '~/.mozilla/firefox/s7qfu57a.default/chrome/userChrome.css'},
        \ {'d7': '~/.i3/config'},
        \ {'d8': '~/.xbindkeysrc'},
        \ {'d9': '~/.Xresources'},
        \ {'d0': '~/.zshrc'},
        \ ]
let g:startify_commands = [
        \ {'p1': ['Update All Plugins', ':PlugUpdate']},
        \ {'p2': ['Install New Plugins', ':PlugInstall']},
        \ {'p3': ['Clean Old Plugins', ':PlugClean']},
        \ {'p4': ['Upgrade vim-plug', ':PlugUpgrade']},
        \ {'p5': ['Plugin Status', ':PlugStatus']},
        \ {'ch': ['Check Health', ':checkhealth']}
        \ ]
let g:startify_files_number = 5
let g:startify_update_oldfiles = 1
let g:startify_padding_left = 6

