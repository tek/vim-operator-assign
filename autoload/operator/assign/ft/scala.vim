function! operator#assign#ft#scala#format_assignment(name, value) "{{{
  let keyword = get(g:, 'assign_scala_keyword', 'val')
  return keyword . ' '.a:name .' = '.a:value
endfunction "}}}
