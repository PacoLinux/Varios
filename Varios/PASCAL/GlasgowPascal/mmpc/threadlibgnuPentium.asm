.ifndef threadlib
threadlib=1
definedunit$threadlib$base=1
.ifndef definedwait_on_done
definedwait_on_done=1
.extern 	 wait_on_done
.endif
.ifndef definedpost_job
definedpost_job=1
.extern 	 post_job
.endif
.ifndef definedgetframepointer
definedgetframepointer=1
.extern 	 getframepointer
.endif
.section .text  
; #procedure generated by code generator class ilcg.tree.gnuPentiumCG
label122748753eda9c:
#	 unit$threadlib
# entering a unit at lexical level 0
unit$threadlib:
 enter  $0,$0
	push %ebx
	push %esi
	push %edi
 call unit$system
cmpb $1,unit$threadlibready
 jnz unit$threadlibinit
 jmp unit$threadlibl107exit
unit$threadlibinit:movb $1, unit$threadlibready
 label122748753aba9a:
spaceforunit$threadlibl107 = 0
unit$threadlibl107exit:
	pop %edi
	pop %esi
	pop %ebx
	leave
 	ret $0
	.section .bss
	.align 4
	.space 0
	.align 4
 unit$threadlib$base:
	.section .data
unit$threadlibready: .byte  0
.include "/users/staff/wpc/src/VectorPascal/mmpc/systemgnuPentium.asm"
.endif