set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Plugin for using git inside vim
"TODO test it
"Plugin 'tpope/vim-fugitive'

"Plugin for making YouComplete and UltiSnips compatible
Plugin 'ervandew/supertab'

"GitHub repo for easy commenting plugin
Plugin 'scrooloose/nerdcommenter'

"GitHub repo for Auto completion plugin
Plugin 'Valloric/YouCompleteMe'

"Plugin for solarized color theme
Plugin 'altercation/vim-colors-solarized'

"GitHub repo for automatically generating a file for semantic autocompletion plugin
"Plugin 'rdnetto/YCM-Generator'

"GitHub repo for working with filesystem plugin
Plugin 'scrooloose/nerdtree'

"GitHub repo for having git flags in nerdtree
"TODO get it to work
"Plugin 'scrooloose/nerdtree-git-plugin'

"Git repo for latex support
"Plugin 'lervag/vimtex'

"plugin for a cool headerline, now using powerline instead
"Plugin 'bling/vim-airline'

"plugin for using multiple cursors
"Plugin 'terryma/vim-multiple-cursors'

"plugin to automatic close braces and similar things
Plugin 'Raimondi/delimitMate'

"plugin for completing small code parts
Plugin 'SirVer/ultisnips'

"plugin for seeing difference with version control system file
"activate it again, if really needed, but has some problems at every vundle
"update
"Plugin 'vim-scripts/svndiff'

"Plugin for syntax checking inside vim
Plugin 'scrooloose/syntastic'

"Plugin to have the standard Ultisnips snippets
Plugin 'honza/vim-snippets'

"Plugin for vim support for julia
Plugin 'JuliaLang/julia-vim'

"Plugin for easy switch between source and header file(C++)
Plugin 'vim-scripts/a.vim'

"Plugin for javascript indentation & highlighting
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

"Plugin to show indentation level
"TODO make it work
"Plugin 'https://github.com/nathanaelkane/vim-indent-guides.git'

"Plugin to edit elements, which surround current position
Plugin 'tpope/vim-surround'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"for support 256 colors
syntax enable
set t_Co=256
set background=dark
if !has('gui_running')
        let g:solarized_termcolors=&t_Co
	let g:solarized_termtrans=1
endif
colorscheme solarized

"setup powerline for vim
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
"so that vim-powerline appears all the time
set laststatus=2

" If using a dark background within the editing area and syntax highlighting                                  
" turn on this option as well                                                                                 
hi Visual term=reverse cterm=reverse guibg=Grey

" Uncomment the following to have Vim jump to the last position when                                          
" reopening a file                                                                                            
if has("autocmd")                                                                                            
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif               
endif                                                                                                        

" The following are commented out as they cause vim to behave a lot                                           
" differently from regular Vi. They are highly recommended though.                                            
"set showcmd            " Show (partial) command in status line.                                              
"set showmatch          " Show matching brackets.                                                             
"set ignorecase         " Do case insensitive matching                                                        
"set smartcase          " Do smart case matching                                                              
"set incsearch          " Incremental search                                                                  
"set autowrite          " Automatically save before commands like :next and :make                             
"set hidden             " Hide buffers when they are abandoned                                                
"set mouse=a            " Enable mouse usage (all modes) 


"for moving cursor by lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

"for other right behavior for cursor movement
onoremap <silent> j gj
onoremap <silent> k gk

"Autoformat Indent
nnoremap <silent> F gg=G''

"replace with content of clipboard
"noremap <buffer> <silent> <M-r> "_d

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
	silent exe "normal! `[v`]\"_c"
	silent exe "normal! p"
endfunction

"define variable for end column
if !has('gui_running')
	let myEndColumn=80
	let myColorColumn=myEndColumn+1
	"set color for particular column
	execute "set colorcolumn=".myColorColumn
	highlight ColorColumn ctermbg=black
	"set end of columns to 80
	execute "set tw=".myEndColumn
endif

"""presentation settings
"change color of linenumbers to grey
"highlight LineNr ctermfg=darkgray
"to search for visually selected text
vnoremap // y/<C-R>"<CR>
"show relative line numbers and line number for current line
set relativenumber
set number
" do not use visualbell, because it interrupts too much via ssh
" set visualbell

"delete to black hole
nnoremap <silent> <C-A> "_d

"leaves preview scratch mode
autocmd CompleteDone * pclose

"Disable arrow keys, force myself to use hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


"Disable error line length with pylin python checker
let g:syntastic_python_pylint_post_args="--max-line-length=120"

"find word under cursor and replace it something
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

""""""""""""SETTINGS FOR PLUGINS""""""""""""""""""""""""""""""

"set default .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"


"Currently not needed, because svndiff is deactivated
""""mappings for svndiff
""mapping for previous diff
"noremap <F3> :call Svndiff("prev")<CR>
""mapping for next diff
"noremap <F4> :call Svndiff("next")<CR>
""mapping to clear the diffs
"noremap <F5> :call Svndiff("clear")<CR> 
""for autoupdate of difference to version control system 
"let g:svndiff_autoupdate = 1 


"toogle between syntastic enabled and disabled
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

"beginner settings for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"""settings for nerdtree
"set shortcut to toggle display of nerdtree
map <C-e> :NERDTreeToggle<CR>
"display nerdtree, if vim is started without file argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""General indentation rules
" set the tabsize to 4 as a variable
let tabsize = 4
" these 3 settings convert a tab into the number of whitespaces defined by the
" variable tabsize
set expandtab
execute "set softtabstop=".tabsize
execute "set shiftwidth=".tabsize
" to do multiple shiftwidths when using < or > for indentation, not sure what
" that means :D
set shiftround

"set tab settings for julia
autocmd FileType julia set tabstop=2 shiftwidth=2 expandtab

"set tab settings for python
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

"set tab settings for php,html
autocmd FileType php set tabstop=2 shiftwidth=2 expandtab
autocmd FileType html set tabstop=2 shiftwidth=2 expandtab

"set tab settings for javascript
autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab

"""settings for latex
"tab settings
autocmd FileType tex set tabstop=2 shiftwidth=2 expandtab
let g:tex_flavor='latex'
"to not check spelling in comments
let g:tex_comment_nospell=1

"activate matchit plugin, is included in normal vim distribution
"the plugin is for matching, f.x. if or function blocks with %
runtime macros/matchit.vim

"""search settings
"highlight search matches 
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" ignore these files when completing names and in explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp
			\,*.jpg,*.png,*.xpm,*.gif,*.h5,*.pdf,*.aux,*.ods,*.bbl
                        \,*.pdf


"""behavior settings

"automatically read file that has been changed on disk and doesn't have changes in vim
set autoread

""spell settings
" highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black
"" toggle spell check with <F8>, cycle through all languages
let b:myLang=0
let g:myLangList=["nospell","de_de","en_us"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <F8> :call ToggleSpell()<CR>

"set timestamp with F6
nnoremap <F6> "=strftime("%T")<CR>P
inoremap <F6> <C-R>=strftime("%T")<CR>"

"shortcut to go into braces while editing
imap <C-c> <CR><Esc>O

" specific gvim settings
if has('gui_running')
	set lines=30 columns=100
endif

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
