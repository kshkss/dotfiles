set hidden

" settings for languages
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['/usr/bin/clangd'],
            \ 'rust': ['/usr/bin/rustup', 'run', 'stable', 'rls'],
            \ 'python': ['/usr/bin/pyls'],
            \ 'ocaml': ['ocamllsp'],
            \ }

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1
nnoremap <silent> <Space>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <Space>lf :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent> <Space>l/ :call LanguageClient_textDocument_documentSymbol()<CR>

