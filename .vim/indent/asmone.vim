if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal nolisp
setlocal autoindent
setlocal indentexpr=AsmOneIndent(v:lnum)
setlocal indentkeys+=<:>,0=},0=)

if exists("*AsmOneIndent")
    finish
endif

function! AsmOneIndent(lnum)
    let prevlnum = prevnonblank(a:lnum-1)
    if prevlnum == 0
        " top of file
        return 0
    endif

    if prevlnum =~ '^[a-zA-Z0-9]+\:'
        " previous line opened a block
        let ind = 5
    endif
    return ind
endfunction
