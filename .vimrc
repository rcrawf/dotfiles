" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml 
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

call plug#end()

let g:ale_virtualenv_dir_names = []
let g:ale_python_flake8_options = '--max-line-length=120'

