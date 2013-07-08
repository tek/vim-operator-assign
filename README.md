vim-operator-assign
===============

[![Build Status](https://travis-ci.org/tek/vim-operator-assign.png)](https://travis-ci.org/tek/vim-operator-assign)

## Usage

`map {lhs} <Plug>(operator-assign)`

This prompts the user to enter a variable name. The text covered by the motion
is then replaced by that variable. In the line above, the replaced text is
assigned to that variable.

## Customization

Define `operator#assign#ft#{&filetype}#format` to override the assignment's
formatting.

`b:operator_assign_filetype` Use a different filetype for the current buffer.
