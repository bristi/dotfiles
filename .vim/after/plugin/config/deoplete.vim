if ! exists('*deoplete#disable')
    echomsg "No deoplete"
    finish
endif

" Disable autocompletion
" let g:deoplete#disable_auto_complete = 1

" Close window with completion signature after completion
" is complete
augroup myaug-deoplete
    au!
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup end

" Show maximally this many completion candidates (default: 500)
"call deoplete#custom#option('max_list', 13)

" Open preview window at bottom instead of top
set splitbelow

