if ! exists('*deoplete#disable')
    echomsg "No deoplete"
    finish
endif

" Disable autocompletion
" let g:deoplete#disable_auto_complete = 1

" Delay autocompletion just a bit
let g:deoplete#auto_complete_delay = 100

" Close window with completion signature after completion
" is complete
augroup myaug-deoplete
    au!
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup end

" Show maximally this many completion candidates (default: 500)
call deoplete#custom#option('max_list', 42)

" Open preview window at bottom instead of top
set splitbelow

" Tab autocompletion (also for neosnippets)
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
imap <silent><expr><TAB>
     \ neosnippet#expandable_or_jumpable() ?
     \   "\<Plug>(neosnippet_expand_or_jump)" :
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ deoplete#mappings#manual_complete()
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ deoplete#manual_complete()
