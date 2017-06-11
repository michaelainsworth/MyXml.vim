if exists('b:did_ftplugin') && 1 == b:did_ftplugin
    finish
endif

function! DoElement()
    let l:old_register = @"

    normal y?[^a-zA-Z0-9_-]

    echom @"

    let @" = l:old_register
endfunction

" Note that this is meant to be used with an XML plugin.

" End a self-closing element
inoremap // Bi<Ea/>

" End a self-closing element, then insert attributes.
inoremap //a Bi<Ea/>hi name="value"B

" End an inline element.
" TODO This should search backwards to find the current element.
inoremap >/ vByBi<Ea><>hP

" Type een to end an element and space it out.
inoremap een Bi<Ea>> jj

function! XmlUnenclosedElementSelect()
    ?^\||[^a-zA-Z0-9]
    let l:begin = getpos('.')
    normal 
    /[a-zA-Z0-9]\+/e
    let l:end = getpos('.')
    nohlsearch

    let l:command = 'normal ' . l:begin[1] . 'G'
    echom l:command

    "let l:command = l:begin.col . '|'
    "execute 'normal ' . l:command

    "normal v

    "let l:command = l:end.lnum . 'G'
    "execute 'normal ' . l:command

    "let l:command = l:end.col . '|'
    "execute 'normal ' . l:command

    " noh

    " normal ?^
    "[^a-zA-Z0-9]
               " \\|^<cr>
    " let l:begin = getpos('.')
    " normal /[a-zA-Z0-9]\+/e<cr>
    " let l:end = getpos('.')
    " noh

    " call setpos('.', l:begin)
    " normal v
    " call setpos('.', l:end)
endfunction!


"vnoremap ue :<c-u><esc>?[^a-zA-Z0-9]\\|^<cr>v/[a-zA-Z0-9]\+/e<cr>:<c-u>noh<cr>
vnoremap ue :<c-u>call XmlUnenclosedElementSelect()<cr>
