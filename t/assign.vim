runtime! plugin/operator/*.vim

describe 'operator assign'

  before
    new
  end

  after
    close
  end

  it 'should extract motioned text, default style'
    put! ='foo(bar.baz)'
    call cursor(1, 7)
    execute 'normal' "\<Plug>(operator-assign)ib"."moo\<cr>"
    echo ' '
    Expect getline('.') == 'moo = bar.baz'
    Expect getline(line('.') + 1) == 'foo(moo)'
  end

  it 'should extract motioned text, zsh style'
    set filetype=zsh
    put! ='foo (bar baz qux)'
    call cursor(1, 7)
    execute 'normal' "\<Plug>(operator-assign)ab"."moo\<cr>"
    echo ' '
    Expect getline('.') == 'moo=(bar baz qux)'
    Expect getline(line('.') + 1) == 'foo ${moo}'
  end

  it 'should extract motioned text, vim style'
    set filetype=vim
    put! ='foo(bar.baz)'
    call cursor(1, 7)
    execute 'normal' "\<Plug>(operator-assign)ib"."moo\<cr>"
    echo ' '
    Expect getline('.') == 'let moo = bar.baz'
    Expect getline(line('.') + 1) == 'foo(moo)'
  end
end
