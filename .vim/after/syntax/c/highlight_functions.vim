" https://hamberg.no/erlend/posts/2011-08-25-vim-tip-highlighting-function-names-in-c-code.html
" Highlight all function names
syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
highlight def link cCustomFunc Function
