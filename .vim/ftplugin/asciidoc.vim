packadd vim-asciidoctor

" What to use for HTML, default `asciidoctor`.
let g:asciidoctor_executable = 'asciidoctor'

" What extensions to use for HTML, default `[]`.
"let g:asciidoctor_extensions = ['asciidoctor-diagram', 'asciidoctor-rouge']

" Path to the custom css
"let g:asciidoctor_css_path = '~/docs/AsciiDocThemes'

" Custom css name to use instead of built-in
"let g:asciidoctor_css = 'haba-asciidoctor.css'

" What to use for PDF, default `asciidoctor-pdf`.
let g:asciidoctor_pdf_executable = 'asciidoctor-pdf'

" What extensions to use for PDF, default `[]`.
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram']

" Path to PDF themes, default `''`.
"let g:asciidoctor_pdf_themes_path = '~/docs/AsciiDocThemes'

" Path to PDF fonts, default `''`.
"let g:asciidoctor_pdf_fonts_path = '~/docs/AsciiDocThemes/fonts'

" What to use for DOCX, default `pandoc`.
" The DOCX 'compilation' process is to generate `docbook` using
" `g:asciidoctor_executable` and then to generate DOCX out of `docbook`
" using `pandoc`.
let g:asciidoctor_pandoc_executable = 'pandoc'

"" --data-dir
let g:asciidoctor_pandoc_data_dir = '~/docs/.pandoc'

" Other parameters you want to feed pandoc
let g:asciidoctor_pandoc_other_params = '--toc'

" Reference document to reuse styles
" If not set up asciidoctor looks for the theme name
" :pdf-style: mytheme
" in the first 30 lines and generate reference-doc filename:
" g:asciidoctor_pandoc_data_dir + mytheme + '-reference.docx'
" for example: ~/docs/.pandoc/mytheme-reference.docx
"let g:asciidoctor_pandoc_reference_doc = 'custom-reference.docx'

" Fold sections, default `0`.
let g:asciidoctor_folding = 1

" Fold options, default `0`.
let g:asciidoctor_fold_options = 1

" Conceal *bold*, _italic_, `code` and urls in lists and paragraphs, default `0`.
" See limitations in end of the README
"let g:asciidoctor_syntax_conceal = 1

" Highlight indented text, default `1`.
"let g:asciidoctor_syntax_indented = 0

" List of filetypes to highlight, default `[]`
"let g:asciidoctor_fenced_languages = ['python', 'c', 'javascript']

" Function to create buffer local mappings and add default compiler
fun! AsciidoctorMappings()
    nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
    nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
    nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
    nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
    nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
    nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
    nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    " :make will build pdfs
    compiler asciidoctor2pdf
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END





