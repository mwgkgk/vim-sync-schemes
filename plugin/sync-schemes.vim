function! SyncSchemes(...)
    if a:0 == 0
        let l:scheme = g:colors_name
    elseif a:0 == 1
        if strlen(a:1) == 0
            let l:scheme = g:colors_name
        else
            let l:scheme = a:1
        endif
    endif
    let l:servers = split(serverlist(), '\n')
    for serv in l:servers
        let result = remote_send(serv, 
            ":silent! colorscheme " . l:scheme . "<CR>")
    endfor
endfunc

command! -nargs=? -complete=color SyncSchemes call SyncSchemes(<q-args>)