.ifndef ilcgmacros
.intel_syntax noprefix
.set ilcgmacros,yes
.section .data
regutil0: .double 0.0
.section .text
   
   

/*'andifgoto ' c','r1',' r2','c2','r3','  r4 ',' l','t','t2 */
.macro andifgoto c r1 r2 c2 r3 r4 l t t2
	cmp  \r1,\r2
	j\c  1f
	jmp 2f
1: cmp \r3,\r4
	j\c2 3f
        jmp 2f
3:
        jmp \l
2:
.endm

.macro xmmld p1 p2
	test \p2,$15
	jnz 1f
	movdqa \p1,[\p2]
	jmp 2f
1:movdqu p1,[\p2]
2:
.endm

.macro floadlit p1
.section .data
1: .double \p1
	.section .text
	fld dword ptr 1b
.endm
 
 
.section .text
 
.macro fildr p1
	sub  rsp,8

	mov [rsp], \p1,  
	fild dword ptr[rsp]
	add rsp,8

.endm
.macro fistr p1
	
.endm




.macro rloadlit p1 p2
.section .data
1: .float \p2
	.section .text
	mov  \p1,1b
.endm
 
.macro filoadlit p1
.section .data
1: .double \p1
	.section .text
	fld qword ptr 1b
	.endm

.endif

