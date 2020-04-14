" Modeline and Notes {
" vim:tw=78:shiftwidth=2:sts=2:ft=vim:foldmarker={,}:foldlevel=0:foldmethod=marker:

"" Inspiration
" In trying to clean up methods from this one came in handy
" Also great for inspiration + newer popular plugins
" http://spf13.com
" https://github.com/skwp/dotfiles
" https://realpython

" Look into {

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

" }

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

" configuring vim {
"
"" Using vim/neovim?
"
" Set options/run commands depending on whether we are using neovim or not
"
" " No neovim
" if !has('nvim')
"   set ttymouse=xterm2
" endif
"
" " Using neovim
" if has('nvim')
"   tnoremap <Esc> <C-\><C-n>
" endif
"
"" If command exist or not
"
" if exists(':tnoremap')
"   tnoremap <Esc> <C-\><C-n>
" endif
"
"
" debugging / finding faulty plugins {
"
" * https://vimways.org/2018/debugging-your-vim-config/
"
" }
"
" }

" vim/vim-script develop {

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

"" Investigating vim environment
" https://vim.fandom.com/wiki/Displaying_the_current_Vim_environment
" Eg:
" :abbreviate   - list abbreviations
" :autocmd      - list auto-commands
" :augroup      - augroups
" :command      - list commands
" :imap         - list insert mode maps
" :let          - all variables
" :let g:       - global variables
" :let v:       - Vim variables
" :map!         - Insert and Command-line mode maps (imap, cmap)
" :map          - Normal and Visual mode maps (nmap, vmap, xmap, smap, omap)
" :messages     - message history
" :set all      - all options, including defaults
" :setglobal    - global option values
" :setlocal     - local option values
" :set          - options with non-default value
" :verbose      - show info about where a map or autocmd or function is
"                 defined
" :vmap         - Visual and Select mode mappings only

"" About signs/sign column
" Vim will automatically use sign column if signs present
" No way to hide that I know of short of clearing signs
" :sign list
" :sign place
" eclim uses signs that may annoy. disable with
" :let g:EclimSignLevel = 0

" echo/print to user
" :echo         - echoes messages
" :echomsg      - echoes message and saves in message-history

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

"" Use scriptease
" tpope wrote a script to write scripts :)
" It is installed as plugin, check github for usage/options

" }

" }

" Environment {
  " Basics {
    " Now using vim-sensible plugin but keeping below for posterity :)
    """ For true vi-compatibility comment out following statements
    "set nocompatible    " Use Vim defaults instead of 100% vi compatibility
    "set backspace=indent,eol,start  " more powerful backspacing

    " Python versions for neovim
    " TODO: also vim?
    " https://neovim.io/doc/user/provider.html#provider-python
    if has('nvim')
      "let g:python_host_prog = '/usr/local/bin/python'
      "let g:python3_host_prog = '/usr/local/bin/python3'
      " TODO: make this system independent..
      let g:python_host_prog = '/Users/brian/.pyenv/versions/neovim2/bin/python'
      let g:python3_host_prog = '/Users/brian/.pyenv/versions/neovim3/bin/python'
    endif
  " }
" }

" Packages and Plugins {

" Using minpac plugin/package manager, utilizing package system
" in vim 8 and neovim (look up exact versions..)

  " prerequisites {

  " Clone/download into opt
  " git clone https://github.com/k-takata/minpac.git \
  "     ~/.vim/pack/minpac/opt/minpac
  " curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  "     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  "}

" Since minpac doesn't need to be loaded unless updating , installaing or
" cleaning plugins, we define a function to perform those tasks
function! PackInit() abort

  packadd minpac

  " Initialize minpac and add itself as package
  " init with verbosity 3 to see minpac work
  call minpac#init({'verbose': 3})
  "call minpac#init()
  " minpac must have {'type': 'opt'} so that it can be loaded with `packadd`
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Plugins {

  " General {
    "call minpac#add('tpope/vim-sensible')

    " Manage vim sessions
    call minpac#add('tpope/vim-obsession')

    " File tree
    call minpac#add('scrooloose/nerdtree', { 'on':  'NERDTreeToggle' })

    " Linting/fixing
    " call minpac#add('scrooloose/syntastic')
    " TODO: Configure ale
    call minpac#add('w0rp/ale')

    " CTags
    call minpac#add('majutsushi/tagbar')

    " Undo tree
    call minpac#add('sjl/gundo.vim')

    " Rainbow colors for parantheses, brackets, elipses
    " Note that this is a fork of 'oblitum/rainbow'
    call minpac#add('frazrepo/vim-rainbow')

    " Directory specific vim settings
    " Settings in file '.vimdir'. Always use setlocal.
    " See https://www.vim.org/scripts/script.php?script_id=1860
    " OR
    " Project folders
    "D call minpac#add('dbakker/vim-projectroot')

    " Lining up text and creating tables
    " Dependency for
    " * gabrielelana/vim-markdown
    "D call minpac#add('godlygeek/tabular')

    " Increment/decrement dates, times and more with CTRL-A/CTRL-X
    call minpac#add('tpope/vim-speeddating')

    " Calendar
    "D call minpac#add('mattn/calendar-vim')

    " Open UIR in browser
    " Dependency for
    " * weirongxu/plantuml-previewer
    call minpac#add('tyru/open-browser.vim')

    " A plugin to help write plugins (or just vim development)
    call minpac#add('tpope/vim-scriptease')
  " }

  " Generic code manipulation {

    " Comment / comment out
    "call minpac#add('scrooloose/nerdcommenter')
    call minpac#add('tpope/vim-commentary')

    " Parantheses, structural elements, ..
    call minpac#add('tpope/vim-surround')
    "call minpac#add(Raimondi/delimitMate)

    " Work with an isolated segment of code
    call minpac#add('chrisbra/NrrwRgn')

    " Allow repeating of maps
    " Also helpful/necessary for some plugins;
    " * vim-surround
    call minpac#add('tpope/vim-repeat')
  " }

  " Moving / finding {

    " Fuzzy matching
    "call minpac#add('vim-scripts/FuzzyFinder' | call minpac#add('vim-scripts/L9'))
    "call minpac#add('ctrlpvim/ctrlp.vim')
    " Note that we could also use fzf if already installed, see github
    call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
    call minpac#add('junegunn/fzf.vim')
    " This allows us to use Ag while defining own escapes
    " https://jesseleite.com/posts/4/project-search-your-feelings
    " https://vimawesome.com/plugin/vim-agriculture
    "D call minpac#add('jesseleite/vim-agriculture')

    " Grep replacement
    call minpac#add('mileszs/ack.vim')

    " Comfortable "physics-based" motion
    call minpac#add('yuttie/comfortable-motion.vim')

    " Faster folding
    call minpac#add('konfekt/fastfold')
  " }

  " Snippets {
    "call minpac#add('SirVer/ultisnips' | call minpac#add('honza/vim-snippets'))

    call minpac#add('Shougo/neosnippet.vim')
    call minpac#add('Shougo/neosnippet-snippets')
  " }

  " Completion {

    " YouCompleteMe language support options:
    " * --clang-completer
    " * --omnisharp-completer (requires mono)
    " * --gocode-completer (requires go)
    " * --tern-completer (requires npm)
    " * --all
    "call minpac#add('Valloric/YouCompleteMe', { 'do': './install.py --all' })
    "call minpac#add('Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' })

    " Supertab
    "call minpac#add('ervandew/supertab')

    " ncm2
    " Currently using a forked version that doesn't bother with eg type and
    " description (jedi with python code) because it is faster for big
    " libraries
    "D if has('nvim')
    "D   call minpac#add('roxma/nvim-yarp'  " dependency of ncm2)
    "D   call minpac#add('ncm2/ncm2'  " awesome autocomplete plugin)
    "D   " call minpac#add('HansPinckaers/ncm2-jedi'  " fast python completion (use ncm2 if you want type info or snippet support))
    "D   call minpac#add('ncm2/ncm2-bufword'  " buffer keyword completion)
    "D   call minpac#add('ncm2/ncm2-path'  " filepath completion)
    "D endif

    " deoplete
    if has('nvim')
      call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
    else
      call minpac#add('Shougo/deoplete.nvim')
      call minpac#add('roxma/nvim-yarp')
      call minpac#add('roxma/vim-hug-neovim-rpc')
    endif
    " deoplete show signature
    call minpac#add('Shougo/echodoc.vim')
  " }

  " tmux {
  " Note: slimux is apparently broken for tmux <2.0 after commit 0ff0e9b ?
  " https://github.com/epeli/slimux/issues/56
    "call minpac#add('epeli/slimux', { 'commit': '0ff0e9b' })
    "call minpac#add('epeli/slimux')
  " }

  " VCS systems {
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('mhinz/vim-signify')
  " }

  " Testing {
    " Run code test framework, on specific code parts, from within vim
    call minpac#add('janko/vim-test')
  " }

  " File type specific {
  "
  " Note that most of these are optional and thus only loaded when relevant
  " filetype is in buffer

  " Ordered text files {
    "call minpac#add('vim-scripts/csv.vim', {'type': 'opt'})
    call minpac#add('mechatroner/rainbow_csv', {'type': 'opt'})
    call minpac#add('elzr/vim-json', {'type': 'opt'})
  " }

  " Perl {
    "call minpac#add('perl-support.vim', {'type': 'opt'})
  " }

  " c/c++ {
    "call minpac#add('vim-scripts/c.vim', {'type': 'opt'})
  " }

  " LaTeX {
    "call minpac#add('vim-scripts/LaTeX-Box', {'type': 'opt'})
    "call minpac#add('vim-scripts/TeX-9', {'type': 'opt'})
    "call minpac#add('vim-scripts/AutomaticTexPlugin', {'type': 'opt'})
  " }

  " Python {
    " call minpac#add('klen/python-mode', {'type': 'opt'})
    call minpac#add('vim-scripts/indentpython.vim', {'type': 'opt'})
    call minpac#add('nvie/vim-flake8', {'type': 'opt'})
    call minpac#add('tmhedberg/SimpylFold', {'type': 'opt'})
    " jedi-vim - remember to `pip install jedi` in relevant python env
    call minpac#add('davidhalter/jedi-vim', {'type': 'opt', 'do': 'pip install jedi' })
    call minpac#add('zchee/deoplete-jedi', {'type': 'opt'})
  " }

  " JavaScript {

    "D " Syntax support
    "D "call minpac#add('pangloss/vim-javascript', {'type': 'opt'})
    "D call minpac#add('othree/yajs', {'type': 'opt'})

    "D " JSDoc syntax highlighting
    "D call minpac#add('othree/jsdoc-syntax.vim', {'type': 'opt'})

    "D " Support for JavaScript libraries jQuery, lodash, React, Handlebars,
    "D " Chai, etc.
    "D call minpac#add('othree/javascript-libraries-syntax.vim', {'type': 'opt'})

    "D " JavaScript indentation
    "D call minpac#add('gavocanov/vim-js-indent', {'type': 'opt'})

    "D " JSX syntax highlighting
    "D call minpac#add('mxw/vim-jsx', {'type': 'opt'})

    "D " Insert JSDoc comments
    "D call minpac#add('heavenshell/vim-jsdoc', {'type': 'opt'})

    "D " Completion
    "D call minpac#add('marijnh/tern_for_vim', {'type': 'opt', 'do': 'npm install'})
    "D " Completion of common function parameters
    "D call minpac#add('othree/jspc.vim', {'type': 'opt'})

  " }

  " NodeJS {
    " Syntax support
    "call minpac#add('moll/vim-node', {'type': 'opt'})
  " }

  " Ruby {
    "call minpac#add('vim-scripts/rails.vim', {'type': 'opt'})
  " }

  " R {
    "call minpac#add('vim-scripts/vim-R-plugin.git', {'type': 'opt'})
    call minpac#add('jalvesaq/Nvim-R', {'type': 'opt'})
  " }

  " Text, wiki, markup, diagram, notes, diary {

    " Wiki, todo, markdown
    "call minpac#add('vimwiki/vimwiki', {'type': 'opt'})

    " Simple todo support
    " Alternative is vimwiki for todo support (in wiki/markdown)
    "call minpac#add('vitalk/vim-simple-todo', {'type': 'opt'})

    " Markdown
    " Currently using vimwiki to format markdown. Other powerful plugins:
    " http://vimawesome.com/plugin/vim-markdown-sad-beautiful-tragic
    "call minpac#add('gabrielelana/vim-markdown', {'type': 'opt'})
    "call minpac#add('plasticboy/vim-markdown', {'type': 'opt'})

    " RestructuredText
    " See also:
    " * https://github.com/gu-fan/riv.vim/blob/master/doc/riv_instruction.rst
    " * https://github.com/gu-fan/InstantRst
    "call minpac#add('Rykka/riv.vim', {'type': 'opt'})
    "call minpac#add('gu-fan/riv.vim', {'type': 'opt'})

    " Plantuml
    " Previewing
    call minpac#add('weirongxu/plantuml-previewer.vim', {'type': 'opt'})
    " Syntax - and setting correct filetype based on filename extension or
    " first line of file contain @startuml, hence plugin not optional
    call minpac#add('aklt/plantuml-syntax')

  " }

  " } No more file type specifics

  " Color scheme, status line, .. {

    " Color scheme
    " call minpac#add('altercation/vim-colors-solarized')
    " call minpac#add('jnurmine/Zenburn')
    call minpac#add('morhetz/gruvbox')


    " Highlight current line, depending on colors from theme
    " Not usable (except for line number column) when using colorscheme?
    "call minpac#add('miyakogi/conoline.vim')

    " Status line
    " Currently using own custom statusline
    "call minpac#add('powerline/powerline', {'rtp': 'powerline/bindings/vim/', 'do': 'pip install powerline-status'})
    "call minpac#add('powerline/powerline', {'do': 'pip install powerline-status', 'branch': 'develop'})
    "call minpac#add('itchyny/lightline.vim')

  " }

  " } No more plugins :)

endfunction

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()


" }

" { General settings

" Encoding should be utf-8 ..
set encoding=utf-8

"syntax on
set hlsearch

" Soft wrapping
" Not using linebreak to try to break at words as soft wrapping should not be
" an excuse for properly hard wrapping code.
" Eg set linebreak ; set breakat = "  !@*-+;:,./?" (defaults for breakat)
" Note: linebreak does not work with list (so set nolist)
set wrap

" Use vertical column to indicate max width
set colorcolumn=80

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
set expandtab           " Spaces instead of tabs
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
"set nofoldenable         " Do not automatically fold. Toggle with zi in normal mode
set relativenumber       " Use relative line numbering by default (toggle mapping: F6)
set maxmempattern=10000   " Default 1000, max 2000000. Note: this is to
"                         " overcome a current issue and should be looked into


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

" Automatically change working directory to project root
function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

" TODO: Move this to relevant location (uses above function)
autocmd BufEnter * call <SID>AutoProjectRootCD()

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
" I do not use solarized theme in my terminals
"let g:solarized_termcolors=256
"colorscheme solarized

" zenburn
" colorscheme zenburn

"
" gruvbox
"
" Is termguicolors / italics necessary?
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox

" Need this line here for match to work but also put in
" color theme as it clears highlights..
" Placed it outside of function so it would not be called
" possibly overwriting a different colorscheme
"hi OverLength ctermbg=red ctermfg=white guibg=#592929
"hi OverLength ctermbg=grey ctermfg=white guibg=grey30
"call ColorLongLinesToggle()

" Line and/or column following cursor
set cursorline
"set cursorcolumn
" Line numbers
set number
" Number of columns to use for line numbers
"set numberwidth=3

" Indicate special characters
set list
" Indicate problematic whitespace, see also :help listchars
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" This is also set with plugin vim-sensible?
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
" Modifications for specific filetypes
"au FileType tex set listchars-=trail:.
"au FileType html,xml set listchars-=tab:>.

" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.fdb_latexmk,.lof,.lot,.lox,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.ps,.eps,.jpg,.gif,.bmp,.svg,.png,.gz,.bz2,.zip,.rar

" }

" { Status line

" TODO: This requires ale. Provide alternative in relevant plugin config
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction


"" Fancy status line
"set statusline=%<%f\ %m%r%h%w\ \ \ [%{&ff}/%Y,%{(&fenc==\"\"?&enc:&fenc)}]\ [%b,0x%B]%=\ %-14(%l,%c%V%)\ %p%%\ [%Ll]
" Added fugitive flag
"set statusline=%<%f\ %m%r%h%w\ \ \ [%{&ff}/%Y,%{(&fenc==\"\"?&enc:&fenc)}]\ [%b,0x%B]%=\ %{fugitive#statusline()}\ %-14(%l,%c%V%)\ %p%%\ [%Ll]
" Added syntastic flag
set statusline=%<%f\ %m%r%h%w
" line ending type/file type, file encoding
"set statusline+=\ \ \ [%{&ff}/%Y,%{(&fenc==\"\"?&enc:&fenc)}]
" file type
set statusline+=\ \ %Y
" decimal,hex value of character under cursor
"set statusline+=\ [%b,0x%B]
" Flush right
set statusline+=%=
" TODO: Should I set an ale statusline flag?
"set statusline+=\ %{SyntasticStatuslineFlag()}
" Git branch
"set statusline+=\ %{fugitive#statusline()}
"set statusline+=\ [%{fugitive#head(5)}]
set statusline+=\ %{fugitive#head(5)}
" Linter errors / warnings
set statusline+=\ %{LinterStatus()}
" line number, column number AND virtual column number
"set statusline+=\ %-14(%l,%c%V%)
" column number AND virtual column number
set statusline+=\ %c%V
" Percent of file
set statusline+=\ %p%%
" Number of lines in file
set statusline+=\ %Ll
" Current vim session
" TODO: This requires vim-obsession. Create proper default.
set statusline+=\ %{ObsessionStatus()}

" Make status line second last - may be removed by setting to 0
" Also necessary for fancy status lines
set laststatus=2

" }

" Mappings {

"" General mappings

" Remap ' to ` in normal mode (goes to marked line AND column)
nnoremap ' `
nnoremap ` '

" Remapping esc (may also use <C-c> or <C-[>)
" See also :help timeout
inoremap ½ <Esc>
"inoremap ii <Esc>
" Apparently having issues remapping CR and backspace on OSX
" This is great since it's where I need it the most (touch bar)
"inoremap <S-CR> <ESC>

" Make sure we can still easily write tabs, even with expandtab on
inoremap <S-Tab> <C-V><Tab>

" select the text just last pasted or edited :)
nnoremap gp `[v`]
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

function! PastePrep()
    :set syntax=off
    :set noswapfile
    :set paste
    :let b:paste_prepped=1
    :echo "Prepped for pasting!"
endfunction

function! PasteUnPrep()
    :set syntax=on
    :set swapfile
    :set nopaste
    :let b:paste_prepped=0
    :echo "Pasting unprepped.."
endfunction

function! TogglePastePrep()
    if b:paste_prepped
      :call PasteUnPrep()
    else
      :call PastePrep()
    endif
endfunction

" Default prepped
let b:paste_prepped=0
" Toggle paste prepping
nnoremap <leader>pt :call TogglePastePrep()<CR>
" Paste from clipboard
" Note that we turn off syntax highlighting and swap in case lots of text
" is being pasted
"nnoremap <leader>pc :set syntax=off<CR>:set noswapfile<CR>:set paste<CR>"+p<CR>:set swapfile<CR>:set syntax=on<CR>:set nopaste<CR>:echo "Pasted from clipboard"<CR>
nnoremap <leader>pc :call PastePrep()<CR>"+p<CR>:call PasteUnPrep()<CR>:echo "Pasted from clipboard"<CR>

" Toggle textwidth (automatically wrap / break line at given character count
function! ToggleTextwidth()
    if &textwidth
      :set textwidth=0
      :echo "Option textwidth toggled off"
    else
      :set textwidth=79
      :echo "Option textwidth set to 79"
    endif
endfunction
nnoremap <leader>tw :call ToggleTextwidth()<CR>


" search for declaration of subroutine/function under cursor
"http://www.rayninfo.co.uk/vimtips.html
"nmap gx yiw/^\(sub\<bar>def\<bar>function\)\s\+<C-R>"<CR>

" Quickly edit/reload the vimrc file
"nmap <silent> <leader>ev :e ~/.vimrc<CR>
"nmap <silent> <leader>sv :so ~/.vimrc<CR>
" More crossplatform compatible
" Note that there is also the $MYGVIMRC env var
" See eg
" https://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Toggle relative line numbers
nnoremap <F6> :set relativenumber!<CR>

" Insert timestamp
" Prefer no am/pm
inoremap <Leader>tt <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
nnoremap <Leader>tt "=strftime("%Y-%m-%d %H:%M")<CR>P
" This will write weekday using current locale, so set locale as desired
inoremap <Leader>tpt <C-R>=strftime("%a %b %d, %Y  %H:%M")<CR>
nnoremap <Leader>tpt "=strftime("%a %b %d, %Y  %H:%M")<CR>P
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
" Note that it is not function keys..
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

" List current buffers and wait for input on which buffer to go to
nnoremap <leader>ls :ls<cr>:b<space>
" List current buffers and wait for input to :bd (delete buffer(s))
" To delete a range, do eg for buffers 2-7 :2,7bd
nnoremap <leader>lsd :ls<cr>:bd<space>

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
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>
" Change working directory to current project
" Requires plugin vim-projectroot
nmap <leader>cp :ProjectRootCD<cr>

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

" NOTE: Most of this is done in scripts under .vim/ftplugin

" Setting filetypes based on filename extension {
"augroup filetypedetect
"  au!
"  " We use plantuml-syntax plugin for this
"  au BufRead,BufNewFile *.puml, *.uml, *.plantuml setlocal ft=plantuml
"augroup END
" }

" Web {
au BufNewFile,BufRead *.js, *.html, *.css
    \ setlocal tabstop=2          |
    \ setlocal softtabstop=2      |
    \ setlocal shiftwidth=2
" }

" notes {
" Note that I am using plugins for markdown and restructuredtext so not
" including *.md or *.rst here
"au BufNewFile,BufRead *.txt
"    \ setlocal tabstop=4          |
"    \ setlocal softtabstop=4      |
"    \ setlocal shiftwidth=4       |
"    \ setlocal textwidth=79       |
"    \ setlocal expandtab          |
"    \ setlocal autoindent         |
"    \ setlocal fileformat=unix

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
""" Tags and autocompletion
"""

" NEWLY COMMENTED OUT
"" Autocompletion
"" Not sure about perl and ruby
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


"""""""""""""""""""""""""""""
""" GENERAL MAPPINGS
"""""""""""""""""""""""""""""

"}

" Plugin configuration {

" Plugin configuration is now largely done in separate scripts under
" .vim/after/plugin or .vim/plugin

" Tagbar {

" Needs package exuberant-ctags
" Install package jsctags for better javascript ctags? Can't find.

" Support for additional filetypes:
" https://github.com/majutsushi/tagbar/wiki

" Installed exuberant ctags from here: ctags.sourceforge.net
" Put the ctags binary in bin, which is in my path
"let g:tagbar_ctags_bin = /home/brian/opt/bin/ctags

" Some default bindings
" p             Jump to the tag under the cursor, but stay in the Tagbar window.
"                 Map option: tagbar_map_preview
" P             Open the tag in a |preview-window|.
"                 Map option: tagbar_map_previewwin
" <C-N>         Go to the next top-level tag.
"                 Map option: tagbar_map_nexttag
" <C-P>         Go to the previous top-level tag.
"                 Map option: tagbar_map_prevtag
" <Space>       Display the prototype of the current tag (i.e. the line defining
"               it) in the command line.
"                 Map option: tagbar_map_showproto
" v             Hide tags that are declared non-public. Tags without any
"               visibility information will still be shown.
"                 Map option: tagbar_map_hidenonpublic
" o/za          Toggle the fold under the cursor or the current one if there is
"               no fold under the cursor.
"                 Map option: tagbar_map_togglefold
" s             Toggle sort order between name and file order.
"                 Map option: tagbar_map_togglesort
" c             Toggle the |g:tagbar_autoclose| option.
"                 Map option: tagbar_map_toggleautoclose
" x             Toggle zooming the window.
"                 Map option: tagbar_map_zoomwin
" q             Close the Tagbar window.
"                 Map option: tagbar_map_close

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

" Automatically focus the tag bar when opening
" Alternative is to change to window (beware intermediate windows) or using
" :TagbarOpen f
let g:tagbar_autofocus=1

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

  " nmap ,ff :FufFile<CR>
  " nmap ,fc :FufCoverageFile<CR>
  " " nmap ,fr :FufMruFile<CR>  " Does not exist??
  " nmap ,ft :FufTag<CR>
  " nmap ,fb :FufBuffer<CR>
  " nmap ,fj :FufJumpList<CR>
  " nmap ,fq :FufQuickfix<CR>

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

" fzf {

" https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf

" This is the default extra key bindings
"  'ctrl-t': 'tab split'
"  'ctrl-x': 'split'
"  'ctrl-v': 'vsplit'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Files
nmap <Leader>ff :Files<CR>
" Git tracked files
nmap <Leader>FF :Gfiles<CR>
" Buffers
nmap <Leader>fb :Buffers<CR>
" Buffer history
nmap <Leader>fh :History<CR>
" Tags in current buffer
nmap ,<Leader>ft :BTags<CR>
" Tags across project
nmap <Leader>fT :Tags<CR>
" Lines in buffer
nmap <Leader>fl :BLines<CR>
" Lines in all loaded buffers
nmap <Leader>FL :Lines<CR>
" Marked lines
nmap <Leader>fm :Marks<CR>
" Search using ag across project
nmap <Leader>fa :Ag<Space>

" }

" vim-agriculture {
" Note that this depends on fzf plugin
nmap <Leader>f/ <Plug>AgRawSearch
vmap <Leader>f/ <Plug>AgRawVisualSelection
nmap <Leader>f* <Plug>AgRawWordUnderCursor
" }

" ack {

" :Ack [options] {pattern} [{directories}]
" Just like where you use :grep, :grepadd, :lgrep, and :lgrepadd, you can use
" :Ack, :AckAdd, :LAck, and :LAckAdd respectively

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

" Lightline {
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'fugitive#head'
"      \ },
"      \ }
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
"let g:ycm_python_binary_path = 'python'

" Close preview after completion (default:0)
"let g:ycm_autoclose_preview_window_after_completion=1

" Close preview when leaving insert mode (default:0)
" let g:ycm_autoclose_preview_window_after_insertion = 0

" Show preview when completing (default: 0)
"let g:ycm_add_preview_to_completeopt = 0

" Turn off YCM's identifier completer (the as-you-type popup) _and_ the
" semantic triggers (the popup you'd get after typing '.' or '->' in say C++).
" You can still force semantic completion with the '<C-Space>' shortcut.
"let g:ycm_auto_trigger = 1

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
"let g:ycm_filepath_completion_use_working_dir = 1

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
"let g:ycm_goto_buffer_command = 'horizontal-split'

"" Mappings
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"map <leader>gr  :YcmCompleter GoToReferences<CR>
"map <leader>gd  :YcmCompleter GetDoc<CR>

" }

" ultisnips {

" I can't make ultisnips expansion work.. Check
" http://stackoverflow.com/questions/27390285/vim-ultisnips-not-working-with-ycm

" YCM conflicts with snip completion. See options with :h UltiSnips-triggers
"let g:UltiSnipsExpandTrigger="<c-space>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" }

" slimux {

    " Recommended
    " "nnoremap <Leader>s :SlimuxREPLSendLine<CR>
    " "vnoremap <Leader>s :SlimuxREPLSendSelection<CR>
    " "nnoremap <Leader>a :SlimuxShellLast<CR>

    " " Send text from vim
    " nnoremap <silent> <F9> :SlimuxREPLSendLine<CR>
    " vnoremap <silent> <F9> :SlimuxREPLSendSelection<CR>
    " nnoremap <silent> <S-F9> :SlimuxREPLConfigure<CR>

    " Send shell commands
    " nnoremap <silent> <Leader>sp :SlimuxShellPrompt<CR>
    " nnoremap <silent> <Leader>sl :SlimuxShellLast<CR>
    " nnoremap <silent> <Leader>sc :SlimuxShellConfigure<CR>
" }

" vim-test {
    " Recommended
    nmap <silent> t<C-n> :TestNearest<CR>
    nmap <silent> t<C-f> :TestFile<CR>
    nmap <silent> t<C-s> :TestSuite<CR>
    nmap <silent> t<C-l> :TestLast<CR>
    nmap <silent> t<C-g> :TestVisit<CR>
" }

" python-mode {

" Syntastic does my syntax checking for me
"let g:pymode_lint_on_write = 0

" }

" vimwiki {

let wiki_1 = {}
let wiki_1.path = '~/vimwiki_work_rga_md/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.path = '~/vimwiki_personal_md/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown'}

" Highlight checked [X] check box with |group-name| "Comment".
let g:vimwiki_hl_cb_checked = 1
" If a file with a registered extension (see |vimwiki-register-extension|),
" make temporary wiki and append it to |g:vimwiki_list|.
" If I don't want to use vimwiki when not in wiki folders..
"let g:vimwiki_global_ext = 0

" Folding ('expr' is fastest: sections and code blocks)
let g:vimwiki_folding = 'expr'

" Header numbering in html conversion
let g:vimwiki_html_header_numbering = 2

" }

" simple-todo {

" Disable default key bindings
let g:simple_todo_map_keys = 0

" Map your keys
nmap <leader>i <Plug>(simple-todo-new-list-item)
nmap <leader>I <Plug>(simple-todo-new-list-item-start-of-line)
"nmap <leader>x <Plug>(simple-todo-complete)
"nmap <leader>X <Plug>(simple-todo-uncomplete)
nmap <leader>s <Plug>(simple-todo-mark-switch)

" Define tick symbol (default is 'x')
let g:simple_todo_tick_symbol = 'X'

" Define list symbol (default is '*') IS THIS DEPRECATED?
let g:simple_todo_list_symbol = '*'

" }

" comfortable-motion {

" Not sure if these are even working..?
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
" }

" vim-projectroot {
let g:rootmarkers = ['.projectroot', '.git', '.hg', '.svn', '.bzr', '_darcs', 'build.xml']
" }

"D " ncm2 {
"D 
"D autocmd BufEnter * call ncm2#enable_for_buffer()
"D set completeopt=menuone,noselect,noinsert
"D 
"D " supress the annoying 'match x of y', 'The only match' and 'Patter not found'
"D " messages
"D set shortmess+=c
"D 
"D " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"D inoremap <c-c> <ESC>
"D 
"D " When the <Enter> key is pressed while the popup menu is visible, it only
"D " hides the menu. Use this mapping to close the menu and also start a new line
"D inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"D 
"D " use <TAB> to select the popup menu:
"D inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"D inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"D 
"D " make it FAST
"D let ncm2#popup_delay = 5
"D let ncm2#complete_length = [[1,1]]
"D 
"D " Use fuzzy matcher
"D let g:ncm2#matcher = 'substrfuzzy'
"D " }

" conoline {
"
" Enable
" :ConoLineEnable
" Disable
" :ConoLineDisable
" Toggle on/off
" :ConoLineToggle
"
" " Enable by default
" let g:conoline_auto_enable = 1
" 
" " Note that there are options for customizing colors
" 
" " Use normal colors in noemr/insert mode (ignore conoline if =1)
" let g:conoline_use_colorscheme_default_normal=0
" let g:conoline_use_colorscheme_default_insert=0
" 
" "" Defaults (_nr_ is for line number column)
" " For dark colorschemes
" " let g:conoline_color_normal_dark = 'guibg=#181818'
" " let g:conoline_color_normal_nr_dark = 'guibg=#181818'
" " let g:conoline_color_insert_dark = 'guibg=#000000'
" " let g:conoline_color_insert_nr_dark = 'guibg=#000000'
" "
" " " For light colorschemes
" " let g:conoline_color_normal_light = 'guibg=#eaeaea'
" " let g:conoline_color_normal_nr_light = 'guibg=#eaeaea'
" " let g:conoline_color_insert_light = 'guibg=#ffffff'
" " let g:conoline_color_insert_nr_light = 'guibg=#ffffff'
" 
" " Dark colorschemes
" let g:conoline_color_normal_dark = 'guibg=grey40'
" let g:conoline_color_normal_nr_dark = 'guibg=darkgrey guifg=darkgrey ctermbg=darkgrey ctermbg=darkgrey'
" " "let g:conoline_color_normal_nr_dark = 'gui=underline cterm=underline'
" let g:conoline_color_insert_dark = 'guibg=grey40'
" let g:conoline_color_insert_nr_dark = 'guibg=darkgrey guifg=darkgrey ctermbg=darkgrey ctermbg=darkgrey'

" }

" vim-rainbow {

" :RainbowToggle  --you can use it to toggle this plugin.
" :RainbowLoad    --you can use it to load/reload this plugin.

" Enable for filetypes (put in filetype files ...)
" au FileType c,cpp,objc,objcpp call rainbow#load()
" Enable globally
let g:rainbow_active = 1

" It is possible to select which parantheses to color and how, see
" plugin page

  " }

" }

