packadd plantuml-previewer.vim
" We also use the plantuml-syntax plugin to set filetype for relevant
" filename extensions, so it is not an optional plugin (and thus already
" loaded)
" packadd plantuml-syntax.vim

" Binary path
" This may only work when plantuml installed through homebrew?
let g:plantuml_previewer#plantuml_jar_path = get(
    \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
    \  1,
    \  0
    \)

" Open browser with preview
nnoremap <buffer> <F9> :PlantumlOpen<CR>

" Close browser with preview
nnoremap <buffer> <F8> :PlantumlClose<CR>

" Save file (default: png)
" To manually save file with another format/name do
" eg :PlantumlSave myspecialdiagram.svg
nnoremap <buffer> <F10> :PlantumlSave<CR>
