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

function! s:format(name, value) "{{{
  exe 'runtime autoload/operator/assign/ft/'.s:filetype().'.vim'
  let formatter = 'operator#assign#ft#'.s:filetype().'#format'
  if exists('*'.formatter)
    return call(formatter, [a:name, a:value])
  else
    return a:name .' = '.a:value
  endif
endfunction "}}}

function! operator#assign#do(motion_wise) abort "{{{
  let value = s:selection(a:motion_wise)
  let name = input('variable name: ')
  let save_register = @a
  let @a = name
  normal! gv"ap
  let @a = save_register
  let assignment = s:format(name, value)
  -
  put =assignment
  normal! ==
endfunction "}}}
