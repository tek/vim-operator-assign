function! operator#assign#ft#scala#format_assignment(name, value) "{{{
  return 'val '.a:name .' = '.a:value
endfunction "}}}
