if exists('g:loaded_operator_assign')
  finish
endif

call operator#user#define('assign', 'operator#assign#do')

let g:loaded_operator_assign = 1
