if ! exists(':Obsession')
    finish
endif

" Restore a session
" TODO: This relies on session file being in current working dir,
"       which would ususally be the case, but perhaps make smarter?
nnoremap <Leader>sr :so *.vim<C-D><BS><BS><BS><BS><BS>

" Create/overwrite a default session "Session.vim"
" If in session, the session will be paused/resumed instead
nnoremap <Leader>ss :Obsession<CR>

" Note: create sessions with custom names:
" :mksession my-session-file-name.vim
