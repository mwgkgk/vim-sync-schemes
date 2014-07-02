function! SyncSchemes(...)
    if a:0 == 0
        let scheme = g:colors_name
    elseif a:0 == 1
        if strlen(a:1) == 0
            let scheme = g:colors_name
        else
            let scheme = a:1
        endif
    endif
    let servers = split(serverlist(), '\n')
    for serv in servers
        let result = remote_send(serv, 
            ":silent! colorscheme " . scheme . "<CR>")
    endfor
endfunc

command! -nargs=? -complete=color SyncSchemes call SyncSchemes(<q-args>)
