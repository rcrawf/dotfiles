" Setup
" Install nodejs/npm
" :PlugInstall
" Go: install goenv, gpls and run CocInstall coc-go
" Python: install python3-venv, flake8, black and run CoCInstall coc-pyright
" Terraform: install tfenv, terraform-lsp, tflint and run :CocInstall coc-terraform
" Ollama: PlugInstall

" =========================
" Filetypes & indentation
" =========================

augroup yaml_settings
  autocmd!
  autocmd BufNewFile,BufRead *.yml,*.yaml setlocal filetype=yaml
  autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup END


" =========================
" Plugins
" =========================

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gergap/vim-ollama'

call plug#end()


" =========================
" ALE – linting only
" =========================

" Never use ALE for completion
let g:ale_completion_enabled = 0

" Don’t auto-detect virtualenvs
let g:ale_virtualenv_dir_names = []

" Run linters as you type
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" ---- Python: ONE linter ----
let g:ale_linters = {
\   'python': ['flake8'],
\   'go': ['staticcheck'],
\   'terraform': ['tflint'],
\}

let g:ale_python_flake8_options = '--max-line-length=120'

" ---- Fixers ----
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': ['black'],
\   'go': ['gofmt', 'goimports'],
\   'terraform': ['terraform'],
\}

" =========================
" coc.nvim – completion / LSP
" =========================

" Use Tab for completion navigation
function! CheckBackspace() abort
  let col = col('.') - 1
  return col <= 0 || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ "\<C-h>"

inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ "\<CR>"


" =========================
" Go
" =========================

let g:ale_go_golangci_lint_options = '--enable-all'


" =========================
" Ollama
" =========================
