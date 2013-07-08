function! operator#assign#ft#zsh#format_variable_insert(name) "{{{
  return '${'.a:name.'}'
endfunction "}}}

function! operator#assign#ft#zsh#format_assignment(name, value) "{{{
  return a:name .'='.a:value
endfunction "}}}
