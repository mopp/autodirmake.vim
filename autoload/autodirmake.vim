"=============================================================================
" File:autoload/autodirmake.vim
" Author: mopp
" Created: 2013-12-11
"=============================================================================

scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let g:autodirmake#is_confirm = get(g:, 'autodirmake#is_confirm', 1)


function! autodirmake#make_dir(dir)
    if !isdirectory(a:dir)
        if (g:autodirmake#is_confirm == 1 && input(printf('"%s" does not exist. Create? [y/N]', a:dir)) !~? '^y\%[es]$')
            return
        endif

        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

