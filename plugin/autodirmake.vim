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

augroup autodirmake
    autocmd!
    autocmd BufWritePre * call autodirmake#make_dir(expand('<afile>:p:h'))
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
