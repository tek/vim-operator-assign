function! s:selection(motion_wise) "{{{
  let save_register = @a
	let v = operator#user#visual_command_from_wise_name(a:motion_wise)
  execute 'normal!' '`[' . v . '`]"ay' 
  let selection = @a
  let @a = save_register
  return selection
endfunction "}}}

function! s:filetype() "{{{
  return exists('b:operator_assign_filetype') ? b:operator_assign_filetype : &filetype
endfunction "}}}

function! s:format_assignment(name, value) "{{{
  let formatter = 'operator#assign#ft#'.s:filetype().'#format_assignment'
  if exists('*'.formatter)
    return call(formatter, [a:name, a:value])
  else
    return a:name .' = '.a:value
  endif
endfunction "}}}

function! s:format_variable_insert(name) "{{{
  let formatter = 'operator#assign#ft#'.s:filetype().'#format_variable_insert'
  if exists('*'.formatter)
    return call(formatter, [a:name])
  else
    return a:name
  endif
endfunction "}}}

function! operator#assign#do(motion_wise) abort "{{{
  exe 'runtime autoload/operator/assign/ft/'.s:filetype().'.vim'
  let value = s:selection(a:motion_wise)
  let name = input('variable name: ')
  let replacement = s:format_variable_insert(name)
  let assignment = s:format_assignment(name, value)
  normal! gv"=replacementp
  put! =assignment
  - normal! ==
endfunction "}}}
