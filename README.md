vim-operator-assign
===============

[![Build Status](https://travis-ci.org/tek/vim-operator-assign.png)]
(https://travis-ci.org/tek/vim-operator-assign)

## Usage

`map {lhs} <Plug>(operator-assign)`

This operator replaces the selected text by a variable name, for which the user
is queried using `input()`. In the line above, the replaced code is assigned to
that variable.

## Example

Given the following code:

`call func(str . 'foo')`

When invoking `{lhs}ib` with the cursor inside the parentheses and entering
`bar` at the prompt, the result is:

```
let bar = str . 'foo'
call func(bar)
```

## Customization

Define `operator#assign#ft#{&filetype}#format_assignment` to override the
assignment's formatting,
`operator#assign#ft#{&filetype}#format_variable_insert` for the variable
replacing the selection and
`operator#assign#ft#{&filetype}#indent_assignment` to control the new line's
indent.

`b:operator_assign_filetype` Use a different filetype for the current buffer.
