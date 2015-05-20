" Vim syntax file
" " Language: AsmOne Amiga Assembly
" " Maintainer: Rigel Di Scala
" " Latest Revision: 1
"
if exists("b:current_syntax")
    finish
endif

" label
syn match asmLabel		"^[a-z_][a-z0-9_]*:"he=e-1
syn match asmLocalLabel		"^\.[a-z_][a-z0-9_]*:"he=e-1
syn match asmLocalLabel		"^\.[a-z_][a-z0-9_]*"

" registers
syn match asmAddrRegister	"\<a[0-7]\>"
syn match asmDataRegister	"\<d[0-7]\>"

syn match asmOpcode "\<addq\=\.[bwl]\>"
syn match asmOpcode "\<move\=\.[bwl]\>"
syn match asmOpcode "\<cmp\=\.[bwl]\>"
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
syn match asmOpcode "\<clr\=\.[bwl]\>"
syn match asmOpcode "\<not\=\.[bwl]\>"
syn match asmOpcode "\<neg\=\.[bwl]\>"
syn match asmOpcode "\<move[qi]\=\.[bwl]\>"
syn match asmOpcode "\<movem\=\.[bwl]\>"
syn match asmOpcode "\<movea\=\.[wl]\>"
syn match asmOpcode "\<mul[su]\.\=[w]\=\>"

syn match deClare   "\<dc\=\.[bwl]\>"

syntax region constantStr start=/\v"/ skip=/\v\\./ end=/\v"/

syn keyword asmCond dbra dbeq dbne dbge dbgt dble dblt dbhi
syn keyword asmCond dbls dbmi dbpl dbvc dbvs dbcs dbcc
syn keyword asmCond bsr trap systrap 
syn keyword asmCond cmp btst bne blo beq bhi
syn keyword asmJump jsr rts rtr jmp

syn keyword asmOpcode sra seq sne sge sgt sle slt shi
syn keyword asmOpcode sls smi spl svc svs scs scc
syn keyword asmOpcode swap lea pea exg neg or and
syn keyword asmOpcode move add sub

syn region section start="SECTION" end=/$/ 
syn region deClare start="dc" end=/$/ 
syn region blkDefine start=/blk./ end=/$/

" comment
syn match asmComment		";.*"
syn match asmComment		"^\*.*"

" My default-color overrides:
hi asmCond          ctermfg=lightblue
hi asmOpcode        ctermfg=lightcyan
hi asmComment       ctermfg=darkgrey
hi asmAddrRegister	ctermfg=lightred
hi asmDataRegister	ctermfg=yellow
hi asmJump	        ctermfg=lightmagenta
hi deClare	        ctermfg=darkred
hi blkDefine	    ctermfg=darkred
hi constantStr	    ctermfg=darkred
hi section          ctermfg=lightred
hi asmOffset        ctermfg=lightred

let b:current_syntax = "asmx86"
