"=============================================================================
" File: autodirmake.vim
" Author: mopp
" Created: 2013-12-11
"=============================================================================


scriptencoding utf-8
if exists('g:loaded_autodirmake')
    finish
endif
let g:loaded_autodirmake = 1

let s:save_cpo = &cpo
set cpo&vim


let g:autodirmake_is_confirm = get(g:, 'autodirmake_is_confirm', 1)


function! s:make_dir(dir)
    if !isdirectory(a:dir)
        if (g:autodirmake_is_confirm == 1 && input(printf('"%s" does not exist. Create? [y/N]', a:dir)) !~? '^y\%[es]$')
            return
        endif

        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction


augroup autodirmake
    autocmd!
    autocmd BufWritePre * call s:make_dir(expand('<afile>:p:h'))
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
