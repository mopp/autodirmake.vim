"=============================================================================
" File:autoload/autodirmake.vim
" Author: mopp
" Created: 2013-12-11
"=============================================================================

scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let g:autodirmake#is_confirm = get(g:, 'autodirmake#is_confirm', 1)
let g:autodirmake#msg_highlight = get(g:, 'autodirmake#msg_highlight', 'None')


function! autodirmake#make_dir(dir)
    if !isdirectory(a:dir)
        if s:confirm(a:dir)
            call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
        endif
    endif
endfunction

function! s:confirm(dir)
    if !g:autodirmake#is_confirm
        return 1
    endif
    let hl = g:autodirmake#msg_highlight
    if hl !=# '' && hl !=# 'None'
        execute 'echohl' hl
    endif
    try
        let prompt = printf('"%s" does not exist. Create? [y/N]', a:dir)
        return input(prompt) =~? '^y\%[es]$'
    finally
        if hl !=# '' && hl !=# 'None'
            echohl None
        endif
    endtry
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

