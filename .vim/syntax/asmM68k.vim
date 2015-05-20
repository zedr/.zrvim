" Vim syntax file
" Language:	Motorolla 68000 assembler, Pila - Pilot assembler
" By: Oyd E. Leven <oyd11@softhome.net>
" Creation date: 30-Jul-2003
" Version 0.01

" Remove any old syntax stuff hanging around
syn clear
syn case ignore

" registers
syn match asmRegister	"\<a[0-7]\>"
syn match asmRegister	"\<d[0-7]\>"

"m68k opcodes
" I don't match w/o a dot, since forgetting size is 
" a common bug for me, TODO: patch the assembler rather!
"syn match asmOpcode "\<addq\=\.\=[bwl]\=\>"
syn match asmOpcode "\<addq\=\.[bwl]\>"
syn match asmOpcode "\<adda\.[wl]\>"
syn match asmOpcode "\<subq\=\.[bwl]\>"
syn match asmOpcode "\<cmp[qim]\=\.[bwl]\>"
syn match asmOpcode "\<tst\.[bwl]\>"
syn match asmOpcode "\<andi\=\.[bwl]\>"
syn match asmOpcode "\<ori\=\.[bwl]\>"
syn match asmOpcode "\<eori\=\.[bwl]\>"
syn match asmOpcode "\<asri\=\.[bwl]\>"
syn match asmOpcode "\<asli\=\.[bwl]\>"
syn match asmOpcode "\<lsri\=\.[bwl]\>"
syn match asmOpcode "\<lsli\=\.[bwl]\>"
syn match asmOpcode "\<rori\=\.[bwl]\>"
syn match asmOpcode "\<roli\=\.[bwl]\>"
syn match asmOpcode "\<roxri\=\.[bwl]\>"
syn match asmOpcode "\<roxli\=\.[bwl]\>"

" 'Cond' are opcodes that alter flow
" ?? syn match asmCond "b(eq|ne|ge)"
syn match asmCond "\<bra\.\=[sw]\=\>"
syn match asmCond "\<beq\.\=[sw]\=\>"
syn match asmCond "\<bne\.\=[sw]\=\>"
syn match asmCond "\<bcs\.\=[sw]\=\>"
syn match asmCond "\<bcc\.\=[sw]\=\>"
syn match asmCond "\<bge\.\=[sw]\=\>"
syn match asmCond "\<bgt\.\=[sw]\=\>"
syn match asmCond "\<ble\.\=[sw]\=\>"
syn match asmCond "\<blt\.\=[sw]\=\>"
syn match asmCond "\<bhi\.\=[sw]\=\>"
syn match asmCond "\<bls\.\=[sw]\=\>"
syn match asmCond "\<bmi\.\=[sw]\=\>"
syn match asmCond "\<bpl\.\=[sw]\=\>"
syn match asmCond "\<bvc\.\=[sw]\=\>"
syn match asmCond "\<bvs\.\=[sw]\=\>"

syn keyword asmCond dbra dbeq dbne dbge dbgt dble dblt dbhi
syn keyword asmCond dbls dbmi dbpl dbvc dbvs dbcs dbcc

syn keyword asmOpcode sra seq sne sge sgt sle slt shi
syn keyword asmOpcode sls smi spl svc svs scs scc

syn keyword asmCond bsr jsr trap systrap rts rtr jmp

syn keyword asmOpcode swap lea pea exg

syn match asmOpcode "\<clr\.[bwl]\>"
syn match asmOpcode "\<not\.[bwl]\>"
syn match asmOpcode "\<neg\.[bwl]\>"
syn match asmOpcode "\<move[qi]\=\.[bwl]\>"
syn match asmOpcode "\<movem\=\.[bwl]\>"
syn match asmOpcode "\<movea\=\.[wl]\>"
syn match asmOpcode "\<mul[su]\.\=[w]\=\>"

syn match asmLabel		"^[a-z_][a-z0-9_]*:"he=e-1
syn match asmLocalLabel		"^\.[a-z_][a-z0-9_]*:"he=e-1
syn match asmLocalLabel		"^\.[a-z_][a-z0-9_]*"
syn match asmComment		";.*"hs=s+1 contains=asmTodo
syn match asmComment		"^\*.*"

syn region asmString		start=+"+ skip=+\\"+ end=+"+

syn keyword asmTodo	contained todo fixme xxx warning danger note notice bug

"syn keyword asmKeyword db dw ds section equ set rsreset rsset rb rw equs macro endm purge rept endr include incbin if else endc
syn keyword asmKeyword beginproc local global equ set dc.b dc.w dc.l include incbin proc endproc code data res

syn match hexNumber	"\W\$\x\+\>"hs=s+1
syn match decNumber	"\<\d\+\>"
syn match binNumber	"\W%[0-1]\+\>"hs=s+1

syn case match

if !exists("did_m68k_syntax_inits")
    let did_m68k_syntax_inits = 1

    hi link asmOpcode Statement
    hi link asmCond Conditional
    hi link asmRegister  Identifier

    hi link asmLabel	Label
    hi link asmLocalLabel	Label
    hi link asmString	String
    hi link asmComment	Comment
    hi link asmKeyword	PreProc
    hi link asmTodo Debug
    hi link hexNumber	Number
    hi link decNumber	Number
    hi link octNumber	Number
    hi link binNumber	Number

    " My default-color overrides:
    hi asmCond ctermfg=yellow
    hi asmOpcode ctermfg=lightgreen
    hi asmComment ctermfg=darkcyan
    "  hi asmRegister	ctermfg=lightmagenta

endif

let b:current_syntax = "asmM68K"

