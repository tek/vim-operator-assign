function! operator#assign#ft#vim#format_assignment(name, value) "{{{
  return 'let '.a:name .' = '.a:value
endfunction "}}}
