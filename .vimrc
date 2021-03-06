" Modeline and Notes {
" vim:tw=78:shiftwidth=2:sts=2:ft=vim:foldmarker={,}:foldlevel=0:foldmethod=marker:

"" Inspiration
" In trying to clean up methods from this one came in handy
" Also great for inspiration + newer popular plugins
" http://spf13.com
" https://github.com/skwp/dotfiles
" https://realpython

"" Look into
" http://code.kawi.me/zeekay/dot-vim/src/e8679321ea83/vimrc
"  For vim digraphs (displaying math and so on)
" http://stackoverflow.com/questions/688265/math-symbols-in-vim
" http://www.alecjacobson.com/weblog/?p=443
" http://www.farseer.cn/config/2013/08/02/replace-deprecated-vim-plugins-with-modern-alternatives/
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" http://oli.me.uk/2015/06/17/wrangling-javascript-with-vim/
" Plugins:
" * Lokaltog/vim-easymotion – The way to navigate a file quickly, regardless
"   of language.
" * PeterRincker/vim-argumentative – Allows you to change the order of
"   arguments with ease.
" * Raimondi/delimitMate – Automatically match pairs intelligently.
" * ctrlpvim/ctrlp.vim – The way to jump around your code base by rough file
"   names.
" * junegunn/vim-easy-align – Makes those funny alignment issues trivial.
" * mhinz/vim-signify – Git info in the gutter.
" * rking/ag.vim – We have to search for a lot of stuff across a lot of files,
"   Ag does it best.
" * tpope/vim-surround

" help {

"" Resizing split windows
" * Ctrl-w + and Ctrl-w - to resize the height of the current window by a
"   single row.
" * For a vsplit window: Ctrl-w > and Ctrl-w < to resize the width of the
"   current window by a single column.
" * These key combinations accept a count prefix so that you can change the
"   window size in larger steps. E.g. 10 Ctrl-w + increases the window size by
"   10 lines.
" * To resize all windows to equal dimensions based on their splits, you can
"   use Ctrl-w =.
" * To increase a window to its maximum height, use Ctrl-w _. Or 50 Ctrl-w _
"   for explicit height of 50.
" * To increase a window to its maximum width, use Ctrl-w |. Or 50 Ctrl-w |
"   for explicit width of 50.
" * Example resize mappings
"   nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
"   nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" }

" develop { 

"" VIM variable namespaces
"             (nothing):  In a function: local to a function; otherwise: global
"|buffer-variable|    b:  Local to the current buffer.
"|window-variable|    w:  Local to the current window.
"|tabpage-variable|   t:  Local to the current tab page.
"|global-variable|    g:  Global.
"|local-variable|     l:  Local to a function.
"|script-variable|    s:  Local to a |:source|'ed Vim script.
"|function-argument|  a:  Function argument (only inside a function).
"|vim-variable|       v:  Global, predefined by Vim.

"" About signs/sign column
" Vim will automatically use sign column if signs present
" No way to hide that I know of short of clearing signs
" :sign list
" :sign place
" eclim uses signs that may annoy. disable with
" :let g:EclimSignLevel = 0

"" DEBUGGING VIM/VIM-SCRIPTS/VIM-SETTINGS
" Set verbose level to something high (max 15) and use verbosefile
" See help 'verbose' for meaning of levels:
"  >= 1  When the viminfo file is read or written.
"  >= 2  When a file is ":source"'ed.
"  >= 5  Every searched tags file and include file.
"  >= 8  Files for which a group of autocommands is executed.
"  >= 9  Every executed autocommand.
"  >= 12  Every executed function.
"  >= 13  When an exception is thrown, caught, finished, or discarded.
"  >= 14  Anything pending in a ":finally" clause.
"  >= 15  Every executed Ex command (truncated at 200 characters).
" 15 is _a_lot_ of info. Preferrably do per buffer for few commands.
"set verbose=10
"set verbose=15
"set verbosefile=~/.vim/verbose_messages.txt
" Also see
" help debug
" http://vimdoc.sourceforge.net/htmldoc/debug.html
" http://vimdoc.sourceforge.net/htmldoc/repeat.html#debug-scripts
" http://vim.sourceforge.net/scripts/script.php?script_id=491
" http://www.troubleshootingwiki.org/Debugging_Vim_Scripts

" }

" }

" Environment {
  " Basics {
    " Now using vim-sensible plugin but keeping below for posterity :)
    """ For true vi-compatibility comment out following statements
    "set nocompatible    " Use Vim defaults instead of 100% vi compatibility
    "set backspace=indent,eol,start  " more powerful backspacing
  " }
" }

" Plugins {

  " vim-plug start {
    """
    """ REPLACING VUNDLE WITH VIM-PLUG FOR NOW
    """ REPLACING PATHOGEN WITH VUNDLE FOR NOW
    """
    " Needed on some linux distros.
    " see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
    "filetype off 
    "call pathogen#runtime_append_all_bundles()
    "call pathogen#helptags()
    
    """
    """ vim-plug addon manager
    """
    
    " Download plugin and put in autoload directory
    " curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    "     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    " Start plugin manager
    call plug#begin('~/.vim/plugged')

    " Plug usage - Make sure you use single quotes
    "
    " " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    " Plug 'junegunn/vim-easy-align'
    "
    " " Any valid git URL is allowed
    " Plug 'https://github.com/junegunn/vim-github-dashboard.git'
    "
    " " Group dependencies, vim-snippets depends on ultisnips
    " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    "
    " " On-demand loading
    " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    " Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
    "
    " " Using a non-master branch
    " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    "
    " " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
    " Plug 'fatih/vim-go', { 'tag': '*' }
    "
    " " Plugin options
    " Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
    "
    " " Plugin outside ~/.vim/plugged with post-update hook
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    "
    " " Unmanaged plugin (manually installed and updated)
    " Plug '~/my-prototype-plugin'

    """
    """ vundle vim addon manager
    """
    "filetype off
    "set rtp+=~/.vim/bundle/vundle/
    "call vundle#rc()

    "" let Vundle manage Vundle
    "" required!
    "" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    "Bundle 'gmarik/vundle'
  " }

  " General {
    Plug 'tpope/vim-sensible'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/syntastic'

    " Fuzzy matching
    Plug 'vim-scripts/FuzzyFinder' | Plug 'vim-scripts/L9'
    "Plug 'ctrlpvim/ctrlp.vim'

    Plug 'majutsushi/tagbar'
    Plug 'sjl/gundo.vim'
    " Grep replacement
    Plug 'mileszs/ack.vim'

    " Simple todo support
    " TODO: test this
    "Plug 'vitalk/vim-simple-todo'

    " Lining up text and creating tables
    " Also dependency for gabrielelana/vim-markdown
    Plug 'godlygeek/tabular'
  " }

  " Snippets {
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  " }

  " Completion {

    " YouCompleteMe language support options:
    " * --clang-completer
    " * --omnisharp-completer (requires mono)
    " * --gocode-completer (requires go)
    " * --tern-completer (requires npm)
    " * --all
    "Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
  " }

  " tmux {
  " Note: slimux is apparently broken for tmux <2.0 after commit 0ff0e9b ?
  " https://github.com/epeli/slimux/issues/56
    "Plug 'epeli/slimux', { 'commit': '0ff0e9b' }
    "Plug 'epeli/slimux'
  " }
  "
  " VCS systems {
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
  " }

  " Ordered text files {
    Plug 'vim-scripts/csv.vim', { 'for': 'csv' }
    Plug 'elzr/vim-json'
  " }

  " Perl {
    "Plug 'vim-scripts/perl-support.vim'
  " }

  " c/c++ {
    "Plug 'vim-scripts/c.vim'
  " }

  " LaTeX {
    "Plug 'vim-scripts/LaTeX-Box'
    "Plug 'vim-scripts/TeX-9'
    "Plug 'vim-scripts/AutomaticTexPlugin'
  " }

  " Python {
    " Plug 'klen/python-mode', { 'for': 'python' }
    " Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
    Plug 'nvie/vim-flake8', { 'for': 'python' }
    Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
  " }

  " JavaScript {
    
    " Syntax support
    "Plug 'pangloss/vim-javascript'
    Plug 'othree/yajs', { 'for': 'javascript' }
    
    " JSDoc syntax highlighting
    Plug 'othree/jsdoc-syntax.vim', { 'for': 'javascript' }
    
    " Support for JavaScript libraries jQuery, lodash, React, Handlebars,
    " Chai, etc.
    Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
    
    " JavaScript indentation
    Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
    
    " JSX syntax highlighting
    Plug 'mxw/vim-jsx', { 'for': 'javascript' }
    
    " Insert JSDoc comments
    Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }

    " Completion
    Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
    " Completion of common function parameters
    Plug 'othree/jspc.vim'

  " }

  " NodeJS {
    " Syntax support
    Plug 'moll/vim-node'
  " }

  " Ruby {
    Plug 'vim-scripts/rails.vim'
  " }
  " R {
    "Plug 'vim-scripts/vim-R-plugin.git', {'for': 'r'}
    Plug 'jalvesaq/Nvim-R', {'for': 'r'}
  " }
  " Markdown {
  " http://vimawesome.com/plugin/vim-markdown-sad-beautiful-tragic
    Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}
  " }
  " Color scheme {
    Plug 'altercation/vim-colors-solarized'
    Plug 'jnurmine/Zenburn'
  " }

  " Powerline {
    Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
    "Plug 'powerline/powerline'
  " }

  " vim-plug end {
  "
    " Add plugins to &runtimepath
    call plug#end()
  " }
" }

" { General settings

""" NOTE: Using vim-sensible plugin to do most of my general settings but
"""       left some of old setup commented out.

"syntax on
"set hlsearch

" Soft wrapping
" Not using linebreak to try to break at words as soft wrapping should not be
" an excuse for properly hard wrapping code.
" Eg set linebreak ; set breakat = "  !@*-+;:,./?" (defaults for breakat)
" Note: linebreak does not work with list (so set nolist)
set wrap

" Using , instead of \ as leader.
" Motivation: , is always followed by a space or a letter, thus no annoyance
" vim-r-plugin when using sweave is incredible annoying with \ as localleader..
" (note that vim-r-plugin uses localleader and not leader)
" Problems: Yet to see if there are conflicts with other shortcuts/plugins.
let mapleader = ','
let maplocalleader = ','

" Automatically reload buffer if file changes on disk and buffer unchanged,
" setting also used by checktime.
set autoread
" Check file changes on disk one time after 'updatetime' (default: 4s) of
" inactivity in normal mode.
au CursorHold * checktime

"" Below needs clean up after I started using vim-sensible

"if has("autocmd")
"    " Enable file type detection and language dependent indenting
"    filetype plugin indent on
"endif " has ("autocmd")

" Some indent settings
" This is also handled as autocommands under Filetype specifics sections! Fix
set shiftwidth=4
set tabstop=4
set softtabstop=4       " not really necessary with smarttab set
set smarttab
set expandtab
set autoindent          " always set autoindenting on
"au FileType coffee,javascript,xml,xhtml,html,htmldjango,haml,tex set shiftwidth=2

" Some nice defaults 
"" set linebreak         " Don't wrap words by default. Soft wrapping - no EOL
""set textwidth=0         " Don't wrap lines by default
"set textwidth=78        " Lines max 78 characters wide
"set nobackup            " Don't keep a backup file
"set viminfo='20,\"50    " read/write a .viminfo file, don't store more than
"                        " 50 lines of registers
"set history=50          " keep 50 lines of command line history
""set ruler              " show the cursor position all the time.
"                        " manually setting statusline instead.
"set showcmd             " Show (partial) command in status line.
"set showmatch           " Show matching brackets.
"set ignorecase          " Do case insensitive matching. Override :set noic
"set smartcase           " case-sensitive if search contain upper case
"set incsearch           " Incremental search
"set autowrite           " Automatically save before commands like :next and :make
"set wildmenu            " Possible matches shown just above commandline
""set nolazyredraw        " Don't redraw while executing macros. :redraw to force
""set hidden              " Allows changing buffer without saving
"set scrolloff=3         " Begin scrolling when 3 lines from edge
"                        " Use zz to center on cursor

" }

" Functions {

" Indicating long lines
" http://vim.wikia.com/wiki/Highlight_long_lines
" comma separated list of columns. Absolute numbers or relative to tw
function! ColorLongLinesToggle()
    " colorcolumn is vim >= 7.3 only
    if exists('+colorcolumn')
        if !empty(&colorcolumn)
            set colorcolumn=
        else
            set colorcolumn=+1
            " Normal is red, setting according to my colortheme
            " Since colortheme clears highlights this should be put in
            " color theme file..
            "hi ColorColumn guibg=grey30 ctermbg=grey
        endif
    endif
    "elseif
    " Mark long part of lines
    if exists('w:m1')
        call matchdelete(w:m1)
        unlet w:m1
    elseif &tw
        " Mark as ErrorMsg
        "au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)
        " Mark with custom OverLength match
        " Cannot make &tw work instead of 80 here..
        "match OverLength /\%>80v.\+/
        " So using matchadd instead
        " the -1 means any search highlighting will override the match
        " highlighting
        let w:m1=matchadd('OverLength', '\%>'.&tw.'v.\+', -1)
        " this would also work but not saved in variable
        "call matchadd('OverLength', '\%>'.&tw.'v.\+', -1)
    endif
    "endif
endfunction

"" Function for setting textwidth based on whether in comment or code
"" http://stackoverflow.com/questions/4027222/vim-use-shorter-textwidth-in-comments-and-docstrings
"function! GetPythonTextWidth()
    "if !exists('g:python_normal_text_width')
        "let normal_text_width = 79
    "else
        "let normal_text_width = g:python_normal_text_width
    "endif

    "if !exists('g:python_comment_text_width')
        "let comment_text_width = 72
    "else
        "let comment_text_width = g:python_comment_text_width
    "endif

    "let cur_syntax = synIDattr(synIDtrans(synID(line("."), col("."), 0)), "name")
    "if cur_syntax == "Comment"
        "return comment_text_width
        "elseif cur_syntax == "String"
        "" Check to see if we're in a docstring
        "let lnum = line(".")
        "while lnum >= 1 && (synIDattr(synIDtrans(synID(lnum, col([lnum, "$"]) - 1, 0)), "name") == "String" || match(getline(lnum), '\v^\s*$') > -1)
            "if match(getline(lnum), "\\('''\\|\"\"\"\\)") > -1
                "" Assume that any longstring is a docstring
                "return comment_text_width
            "endif
            "let lnum -= 1
        "endwhile
    "endif

    "return normal_text_width
"endfunction

"" http://vim.wikia.com/wiki/VimTip97
" Insert timestamps automatically
" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores position using s mark.
function! LastModified()
  if &modified
      let save_cursor = getpos(".")
      let n = min([20, line("$")])
      exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
          \ strftime('%F %T %Z') . '#e'
          "\ strftime('%F %T %z%p') . '#e'
          "\ strftime('%a %b %d, %Y  %H:%M%p') . '#e'
      call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()

"""
""" Moving windows around
""" From Scott S. McCoy's comment here:
"""   http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/

function! MoveBuf(direction)
    let bufno = bufnr("%")
    hide
    exec "wincmd " . a:direction
    new
    exec "buffer " . bufno
endfunction

" }

" Visuals {

" Enable 256 colors in terminal
set t_Co=256
" ^[ must be literal escape character, but how??
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm 

" Increase readability if using terminal with dark background
set background=dark
"set background=light

"""
" Enable some theme (remember .gvimrc)

"colorscheme desert

" solarized
"option name default optional ———————————————— g:solarized_termcolors= 16 | 256 g:solarized_termtrans = 0 | 1 g:solarized_degrade = 0 | 1 g:solarized_bold = 1 | 0 g:solarized_underline = 1 | 0 g:solarized_italic = 1 | 0 g:solarized_contrast = “normal”| “high” or “low” g:solarized_visibility= “normal”| “high” or “low” ————————————————
"colorscheme solarized

" zenburn
colorscheme zenburn

" Need this line here for match to work but also put in
" color theme as it clears highlights..
" Placed it outside of function so it would not be called
" possibly overwriting a different colorscheme
hi OverLength ctermbg=red ctermfg=white guibg=#592929
"hi OverLength ctermbg=grey ctermfg=white guibg=grey30
call ColorLongLinesToggle()

" Line and/or column following cursor
"set cursorline " currently set in .gvimrc
"set cursorcolumn
" Line numbers
set number
" Number of columns to use for line numbers
"set numberwidth=3

" Indicate special characters
set list
" Indicate problematic whitespace
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
" Modifications for specific filetypes
"au FileType tex set listchars-=trail:.
"au FileType html,xml set listchars-=tab:>.


" }

" { Status line
"" Fancy status line
"set statusline=%<%f\ %m%r%h%w\ \ \ [%{&ff}/%Y,%{(&fenc==\"\"?&enc:&fenc)}]\ [%b,0x%B]%=\ %-14(%l,%c%V%)\ %p%%\ [%Ll]
" Added fugitive flag
"set statusline=%<%f\ %m%r%h%w\ \ \ [%{&ff}/%Y,%{(&fenc==\"\"?&enc:&fenc)}]\ [%b,0x%B]%=\ %{fugitive#statusline()}\ %-14(%l,%c%V%)\ %p%%\ [%Ll]
" Added syntastic flag
set statusline=%<%f\ %m%r%h%w
set statusline+=\ \ \ [%{&ff}/%Y,%{(&fenc==\"\"?&enc:&fenc)}]
set statusline+=\ [%b,0x%B]
set statusline+=%=
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %-14(%l,%c%V%)\ %p%%\ [%Ll]
" Make status line second last - may be removed by setting to 0
set laststatus=2

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.fdb_latexmk,.lof,.lot,.lox,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.ps,.eps,.jpg,.gif,.bmp,.svg,.png,.gz,.bz2,.zip,.rar

" }

" Mappings {

"" General mappings

" Remap ' to ` in normal mode (goes to marked line AND column)
nnoremap ' `
nnoremap ` '

" Remapping esc (may also use <C-c> or <C-[>)
" See also :help timeout
inoremap ½ <Esc>
inoremap ii <Esc>
inoremap <S-CR> <ESC>


" select the text just last pasted or edited :)
nnoremap gp `[v`]
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

" search for declaration of subroutine/function under cursor
"http://www.rayninfo.co.uk/vimtips.html
"nmap gx yiw/^\(sub\<bar>def\<bar>function\)\s\+<C-R>"<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" Insert timestamp
" Prefer no am/pm
inoremap <Leader>tt <C-R>=strftime("%a %b %d, %Y  %H:%M")<CR>
nnoremap <Leader>tt "=strftime("%a %b %d, %Y  %H:%M")<CR>P
"inoremap <Leader>tt <C-R>=strftime("%a %b %d, %Y  %H:%M%p")<CR>
"nnoremap <Leader>tt "=strftime("%a %b %d, %Y  %H:%M%p")<CR>P

""" Command to see differences from buffer and saved file
""" ("What did I just change?")
""" From vimrc_example.vim
" :DiffOrig
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
nnoremap <Leader>dd :DiffOrig<CR>

""" Command to generate todo list
" Using vimgrep
"command Todo noautocmd vimgrep /TODO\|FIXME\|BUG\|TBD/j ** | cw
" Requires ack-vim
command Todo Ack! '(TODO)|(FIXME)|(BUG)|(TBD)'
nnoremap <Leader>td :Todo<CR>

" Edit a file in the same directory as the current buffer.
" This leaves the prompt open, allowing Tab expansion or manual completion.
"map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nmap ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" Following are mappings I might use later.. :)
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" Enter directory listing for the directory of the current buffer
"map <leader>. :e %:p:h<CR>

" Create a new window with directory listing of current buffer
"map <leader>wn :new %:p:h<CR>

" Change global directory to the current directory of the current buffer
"map <leader>cd :cd %:p:h<CR>

" Change working directory to location of current file
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" To do this automatically best to use:
" autocmd BufEnter * lcd %:p:h
nmap ,cd :cd %:p:h<CR>:pwd<CR>


" Toggle line numbers
" http://vim.wikia.com/wiki/Display_line_numbers
nmap ,ln :set invnumber<CR>

" cnext,cprev - forward,backward in quickfix/error list
"   vimwiki search uses error list
nmap <C-Right> :cnext<CR>
nmap <C-Left> :cprev<CR>

"" Next/previous item and open/close quickfix
" cn   Next item
" cp   Previous item
" copen/cope  Open quickfix list
" cclose/ccl  Close quickfix list
"
"" Create custom quickfix list
" cex {expr}    Create quickfix list from expr and jump to first item
" cgete {expr}  Create quickfix list from expr (and don't jump)
" expr examples: 
"   :cexpr system('grep -n xyz *')
"   :cexpr getline(1, '$')
"
" Location lists are local to windows and are independent of quickfix lists.
" Shortcuts are similar but 'c' prefix is replaced with 'l' prefix

" }

" Filetype specifics {

" Consider grouping autocommands
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
" Or perhaps collecting in functions

" Python {
au BufNewFile,BufRead *.py
    \ set tabstop=4          |
    \ set softtabstop=4      |
    \ set shiftwidth=4       |
    \ set textwidth=79       |
    \ set expandtab          |
    \ set autoindent         |
    \ set fileformat=unix

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" }

" Web {
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2          |
    \ set softtabstop=2      |
    \ set shiftwidth=2
" }

" notes {
" Note that I am using a plugin for markdown so not including *.md here
au BufNewFile,BufRead *.rst, *.txt
    \ set tabstop=4          |
    \ set softtabstop=4      |
    \ set shiftwidth=4       |
    \ set textwidth=79       |
    \ set expandtab          |
    \ set autoindent         |
    \ set fileformat=unix

" }

" }

" Clean up this {

"augroup pep8
    "au!
    "autocmd CursorMoved,CursorMovedI * :if &ft == 'python' | :exe 'setlocal textwidth='.GetPythonTextWidth() | :endif
"augroup END

" Setting backspace key
"exec "set <BS>=\<C-H>"

"" THE FOLLOWING ALSO SOLVES A PERFORMANCE PROBLEM FOR COMPLETION INTRODUCED BY
"" VIM 7.3! THE 'FIX' IS MANUAL FOLDING WHILE IN INSERT MODE..
"" Don't screw up folds when inserting text that might affect them, until
"" leaving insert mode. Foldmethod is local to the window. Protect against
"" screwing up folding when switching between windows.
"autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
"autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

"" Spell checking. z= suggest different spellings.
"if v:version > 700
"    setlocal spelllang=en_gb
"    "setlocal spelllang=da
"    "setlocal spelllang=da,en_us
"    "setlocal spelllang=en_us
"    "setlocal spelllang=us
"    autocmd FileType tex set spell
"    " Following cannot be defined as autocommands as they will
"    " then not work on first open.
"    " The tex_comment_nospell does following in syntax file:
"    " syn cluster texCommentGroup contains=texTodo,@NoSpell
"    let g:tex_comment_nospell=1
"    let g:tex_verbspell=0
"    "autocmd FileType tex let g:tex_comment_nospell=1
"    "autocmd FileType tex let g:tex_verbspell=0
"endif

" Changing language settings. Avoids danish letters when using timestamps.
" Make sure the locale works on the system.
" language en_DK.UTF-8


" Toggle paste mode
" set pastetoggle=<S-F2>

""" Code folding options
"" Now using SimpylFold for folding python code
"au FileType python set foldmethod=indent
"au FileType python set foldnestmax=2


" META key doesn't seem optimal here..
"map <C-W><M-h> :call MoveBuf("h")<CR>
"map <C-W><M-l> :call MoveBuf("l")<CR>
"map <C-W><M-j> :call MoveBuf("j")<CR>
"map <C-W><M-k> :call MoveBuf("k")<CR>
" I make mistakes with the double ctrl bindings too often.
" Just using standard shift bindings instead, ie. <C-W><S-h>
"map <C-W><C-h> :call MoveBuf("h")<CR>
"map <C-W><C-l> :call MoveBuf("l")<CR>
"map <C-W><C-j> :call MoveBuf("j")<CR>
"map <C-W><C-k> :call MoveBuf("k")<CR>


"""
""" Send lines to screen window
"""

" The following commands may also be global (g:) but local takes preference
" b:sendToProgramName  send2screen.py command
" b:sendToProgramMode  ipython or blank
" b:sendSkipBlankLines Do not send blank lines if this is 1

"" Send to screen
" Something is not working here anymore..
" Trying to use screen plugin instead (that plugin may be culprit)
" Nah.. Using slimux and tmux instead
"nnoremap <F9> : . python send()<CR>
"vnoremap <F9> : python send()<CR>
"" Python
"autocmd FileType python let b:sendToProgramMode="ipython"
""autocmd FileType python let b:sendToProgramName="send2screen.py -p ipython"
""autocmd FileType python let b:sendToProgramName="send2screen.py -S work -p ipython"
"" R
"autocmd FileType python let b:sendToProgramMode=''
""autocmd Filetype r let b:sendToProgramName="send2screen.py -p R"
"autocmd Filetype r let b:sendToProgramName="send2screen.py -S work -p R"
""autocmd Filetype r let b:sendSkipBlankLines=0

"""
""" Tags and autocompletion
"""

" NEWLY COMMENTED OUT
"" Autocompletion
"" Not sure about perl and ruby
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType perl setlocal omnifunc=perlcomplete#CompletePERL
"autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteRUBY
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"" Using clang_complete instead of OmniCppComplete for now
""autocmd FileType c set omnifunc=ccomplete#Complete

" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

"" pydiction stuff (only 6.0?)
"if has("autocmd")
  "autocmd FileType python set complete+=k/home/brian/data/pydiction isk+=.,(
"endif " has("autocmd")

"""""""""""""""""""""""""""""
""" GENERAL MAPPINGS
"""""""""""""""""""""""""""""



"}

" Plugin configuration {

" NERDTree { 
  map <F2> :NERDTreeToggle<CR>
  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" }

" Tagbar {

" Needs package exuberant-ctags
" Install package jsctags for better javascript ctags? Can't find.

" Support for additional filetypes:
" https://github.com/majutsushi/tagbar/wiki

" Installed exuberant ctags from here: ctags.sourceforge.net
" Put the ctags binary in bin, which is in my path
"let g:tagbar_ctags_bin = /home/brian/opt/bin/ctags

" NOTE: Loads of other interesting options besides what is listed here

" default:0
" let g:tagbar_left = 1

" If this is set to a positive value then the Tagbar window will be opened at
" the top or bottom of the Vim window instead of at the side. This can be
" useful for monitors that have been rotated into a vertical position. The
" value of this variable will determine the number of lines to use for the
" Tagbar window.  See g:tagbar_left for configuring the position of the
" window.
" default:0
" let g:tagbar_vertical = 30

" default:40
" let g:tagbar_width = 30

" default:0
" let g:tagbar_autoclose = 1

" default:0
" let g:tagbar_autofocus = 1

" default:0
let g:tagbar_show_linenumbers = 1

"""
""" Mappings
"""

" <CR>/<Enter>  Jump to the tag under the cursor
" p             Jump to the tag, but stay in the Tagbar window
" P             Open the tag in a preview-window
" <Space>       Display the prototype of the current tag
" v             Hide tags that are declared non-public

" Toggle tagbar, but don't jump there unless above option is set
nnoremap <silent> <F3> :TagbarToggle<CR>

" Open tagbar (if not already open) and jump there.
" Used for jumping to tagbar. To get back either jump to tag or close tagbar.
nnoremap ,to :TagbarOpen fj<CR>


" }

" gundo {

  nnoremap <silent> <F4> :GundoToggle<CR>

  "let g:gundo_width = 45
  "let g:gundo_preview_height = 15
  "let g:gundo_right = 1

  " Put preview window below current windows instead of in sidebar
  "let g:gundo_preview_bottom=1

" }

" Syntastic {
" Use python3 for python checker
 "let g:syntastic_python_python_exec = '/usr/bin/python3'
" }

" FuzzyFinder {

  nmap ,ff :FufFile<CR>
  nmap ,fc :FufCoverageFile<CR>
  " nmap ,fr :FufMruFile<CR>  " Does not exist??
  nmap ,ft :FufTag<CR>
  nmap ,fb :FufBuffer<CR>
  nmap ,fj :FufJumpList<CR>
  nmap ,fq :FufQuickfix<CR>

  " Following could also be remapped?
  "<CR> - opens in a previous window.
  "*<C-j> - opens in a split window.
  "*<C-k> - opens in a vertical-split window.
  "<C-l> - opens in a new tab page.
  " Can't make them work anyway..
  "let g:fuf_keyOpenSplit="<C-s>"
  "let g:fuf_keyOpenVsplit="<C-v>"
  "let g:fuf_keyPrevPattern="<C-p>"
  "let g:fuf_keyNextPattern="<C-n>"

" }

" ack {

"" Provides following quickfix/error list shortcuts
" ?    a quick summary of these keys, repeat to close
" o    to open (same as Enter)
" O    to open and close the quickfix window
" go   to preview file, open but maintain focus on ack.vim results
" t    to open in new tab
" T    to open in new tab without moving to it
" h    to open in horizontal split
" H    to open in horizontal split, keeping focus on the results
" v    to open in vertical split
" gv   to open in vertical split, keeping focus on the results
" q    to close the quickfix window

" Use ag (the silver searcher) if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Highlight search term
let g:ackhighlight = 1

" Fold results in quickfix by file name
" Note: Enabling this seems to influence (annoyingly!) how ALL folds work??!
let g:ack_autofold_results = 0



" }

" Powerline {
  "set rtp+=plugged/powerline/bindings/vim
  "python from powerline.vim import setup as powerline_setup
  "python powerline_setup()
  "python del powerline_setup

" }

" YouCompleteMe {

"" Configuration

" YCM will by default search for an appropriate Python interpreter on your
" system. You can use this option to override that behavior and force the use
" of a specific interpreter of your choosing. Default: ''
" NOTE: This interpreter is only used for the ycmd server. The YCM client
" running inside Vim always uses the Python interpreter that's embedded inside
" Vim.
" NOTE: Dependent on how core YCM library was compiled and may result in
" errors such as:
"   The ycmd server SHUT DOWN (restart with ':YcmRestartServer'). YCM core
"   library compiled for Python 2 but loaded in Python 3. Set the
"   'g:ycm_server_python_interpreter' option to a Python│
"    2 interpreter path.
" let g:ycm_server_python_interpreter = 'python3'

" This option specifies the Python interpreter to use to run the jedi [6]
" completion library. Specify the Python interpreter to use to get
" completions.  By default the Python under which ycmd [34] runs is used (ycmd
" [34] runs on Python 2.6, 2.7 or 3.3+).
" I do however use python virtual environments and would prefer that python
" binary to be used
let g:ycm_python_binary_path = 'python'

" Close preview after completion (default:0)
let g:ycm_autoclose_preview_window_after_completion=1

" Close preview when leaving insert mode (default:0)
" let g:ycm_autoclose_preview_window_after_insertion = 0

" Show preview when completing (default: 0)
let g:ycm_add_preview_to_completeopt = 0

" Turn off YCM's identifier completer (the as-you-type popup) _and_ the
" semantic triggers (the popup you'd get after typing '.' or '->' in say C++).
" You can still force semantic completion with the '<C-Space>' shortcut.
let g:ycm_auto_trigger = 1

" Minimum number of characters for identifier completer (default: 2)
"let g:ycm_min_num_of_chars_for_completion = 3
" Effectively turn off identifier completer (but keep semantic trigger)
"let g:ycm_min_num_of_chars_for_completion = 99

" Minimum number of characters for identifier completion candidate to be shown
" in popup menu. 0 is default and mean no limit.
"let g:ycm_min_num_identifier_candidate_chars = 0

" Complete even in comments (default: 0)
" let g:ycm_complete_in_comments = 0

" Complete in strings (default: 1)
" let g:ycm_complete_in_strings = 1

" Collect identifiers from strings/comments (default: 0)
" let g:ycm_collect_identifiers_from_comments_and_strings = 0

" Complete file path from vim working instead of file in current
" buffer (default:0)
let g:ycm_filepath_completion_use_working_dir = 1

" Complete ultisnips snippet triggers (default:1)
" let g:ycm_use_ultisnips_completer = 1

" YCM want to change 'updatetime' to 2 seconds (instead of 4)
" let g:ycm_allow_changing_updatetime = 1

" Defines where 'GoTo*' commands result should be opened. Can take one of the
" following values: "[ 'same-buffer', 'horizontal-split', 'vertical-split',
"                      'new-tab', 'new-or-existing-tab' ]"
" If this option is set to the "'same-buffer'" but current buffer can not be
" switched (when buffer is modified and 'nohidden' option is set), then result
" will be opened in horizontal split.
" Default: "'same-buffer'"
"let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_goto_buffer_command = 'horizontal-split'

"" Mappings
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gr  :YcmCompleter GoToReferences<CR>
map <leader>gd  :YcmCompleter GetDoc<CR>

" }

" ultisnips {

" I can't make ultisnips expansion work.. Check
" http://stackoverflow.com/questions/27390285/vim-ultisnips-not-working-with-ycm

" YCM conflicts with snip completion. See options with :h UltiSnips-triggers
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" }

" python-mode {

" Syntastic does my syntax checking for me
let g:pymode_lint_on_write = 0

" }

" SimpylFold {

" Enable previewing of your folded classes' and functions' docstrings in the
" fold text (default: 0)
let g:SimpylFold_docstring_preview = 1

" Fold docstrings (default: 1)
"let g:SimpylFold_fold_docstring = 0

" Fold imports (default: 1)
let g:SimpylFold_fold_import = 0

" Sometimes needed
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" }

" Nvim-R {
  
" }

" simple-todo {

" Disable default key bindings
"let g:simple_todo_map_keys = 0

" Map your keys
"nmap <leader>i <Plug>(simple-todo-new)
"nmap <leader>x <Plug>(simple-todo-complete)
"nmap <leader>X <Plug>(simple-todo-uncomplete)

" Define tick symbol (default is 'x')
"let g:simple_todo_tick_symbol = 'X'

" Define list symbol (default is '*')
"let g:simple_todo_list_symbol = '*'

" }

" }


