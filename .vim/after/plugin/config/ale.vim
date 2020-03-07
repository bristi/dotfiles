if ! exists(':ALEFix')
    finish
endif

" Modify echoed error message
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" Default: g:ale_echo_msg_format  %code: %%s
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_format = '[%linter%]%code: %%s [%severity%]'

" Navigate through ale errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
