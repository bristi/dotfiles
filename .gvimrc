" DONT EVER SOURCE VIMRC FROM HERE!
" I do not know where I saw it but it messed up quite a lot
" before I figured out this was it!
" Sourcing all options from vim
"source ~/.vimrc <- DON'T DO THIS

set cursorline " currently not set in .vimrc

" Function for setting width to 78 columns + columns needed for linenumbers
" Until I find a way to see if the sign column is displayed I am simply making
" it 2 wider.
function! ResetColumns()
    let width = winwidth(winnr())
    if &tw
        let delta = &tw + 2 - width
    else
        let delta = 80 - width
    endif
    if &number
        let &numberwidth = float2nr(log10(line("$"))) + 2
        let delta = delta + &numberwidth
    endif
    if delta < 0
        let delta = -delta
        execute delta." wincmd <"
    elseif delta > 0
        execute delta." wincmd >"
    endif
    "let &columns = &numberwidth + 80
    "let l:newwidth = &numberwidth + 80
    "echo newwidth
    "execute newwidth." wincmd >"
    "vertical resize newwidth
    "set columns=(&numberwidth + 80)
endfunction

nmap <F6> :call ResetColumns()<CR>

" Automatically set width to 80 columns + columns needed for linenumbers when
" opening a file
" au BufRead * let &numberwidth = float2nr(log10(line("$"))) + 2
"           \| let &columns = &numberwidth + 80

" Gui options
"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Toggle gui options
"nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
"nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
"nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>


" Nice colorscheme
" http://code.google.com/p/vimcolorschemetest/
" 'Me' versions are small customizations I made..
" Solarized (both dark and light)
colorscheme solarized
"   Dark backgrounds
" Mine
"colorscheme desertMe      " current
"colorscheme BusyBeeMe
"colorscheme jellybeansMe
" Other
"colorscheme 256-jungle
"colorscheme af
"colorscheme anotherdark
"colorscheme ansi_blows
"colorscheme blackdust
"colorscheme blugrine
"colorscheme BusyBee
"colorscheme darkburn
"colorscheme darkspectrum
"colorscheme Dark
"colorscheme desert
"colorscheme industrial
"colorscheme jellybeans
"colorscheme kib_darktango
"colorscheme nature
"colorscheme rootwater
"colorscheme wombat
"colorscheme Mustang
"colorscheme Mustang2
"   Light backgrounds
"colorscheme ashen
"colorscheme automation
"colorscheme biogoo
"colorscheme buttercream
"colorscheme colorful
"colorscheme colorzone
"colorscheme google
"colorscheme nedit


" Setting other font. First available picked.
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 8,\ Andale\ Mono\ 9
"set guifont=DejaVu\ Sans\ Mono\ 8,Liberation\ Mono\ 8,Monaco\ 8,Bitstream\ Vera\ Sans\ Mono\ 8,\ Andale\ Mono\ 8
"set guifont=Inconsolata-g\ g\ 9,DejaVu\ Sans\ Mono\ 8,Liberation\ Mono\ 8,Monaco\ 8,Bitstream\ Vera\ Sans\ Mono\ 8
"set guifont=Inconsolata\ 11
"set guifont=Terminus\ 11
"set guifont=Droid\ Sans\ Mono\ 10
"set guifont=Droid\ Sans\ Mono\ Dotted\ 10
"set guifont=Droid\ Sans\ Mono\ Dotted\ 9
"
" Powerline fonts
"set guifont=Droid\ Sans\ Mono\ for\ Powerline:h10
"set guifont=Inconsolata-g\ for\ Powerline:h10
set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h10
