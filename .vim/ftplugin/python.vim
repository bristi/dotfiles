" Modify generic settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
let python_highlight_all=1

" Code folding options
" Now using SimpylFold for folding python code
"au FileType python set foldmethod=indent
"au FileType python set foldnestmax=2

" Load packages (that were installed under opt)
"packadd python-mode
packadd indentpython
packadd vim-flake8
packadd SimpylFold
packadd jedi-vim
packadd deoplete-jedi

" TODO: NOT sure this is needed anymore?
"" Python with virtualenv support
"" Note that we need to discern between whether vim is built with python 2 or 3
"let PYBUILD=system("vim --version | grep -oP '\+python3?\'")
"
"if (PYBUILD == "+python")
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
"endif
"
"if (PYBUILD == "+python3")
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
"endif

"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

"" pydiction stuff (only 6.0?)
"if has("autocmd")
  "autocmd FileType python set complete+=k/home/brian/data/pydiction isk+=.,(
"endif " has("autocmd")

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