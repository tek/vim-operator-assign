if exists('g:loaded_operator_assign')
  finish
endif

runtime autoload/operator/user.vim

if exists('*operator#user#define')
  call operator#user#define('assign', 'operator#assign#do')
endif

let g:loaded_operator_assign = 1
