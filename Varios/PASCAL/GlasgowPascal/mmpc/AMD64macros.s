.ifndef ilcgmacros
.set ilcgmacros,yes
.section .data
regutil0: .double 0.0
.section .text
   #void stringassign(unsigned char *s1, int len,unsigned  char* s2)
   #	int tocopy = len   #
   #	int i   #
   #	if (s2[0]<tocopy) tocopy=s2[0]   #
   #	s1[0]=tocopy   #
   #	for(i=1   #i<=tocopy   #i++)s1[i]=s2[i]   #
   #s2 equ [esp+20] cache rsi
   #len equ [esp+16]
   #s1 equ [esp+8] cache rdi
   #tocopy equ cx
.global sassign
.global _sassign
   # the following definitions are to make sure
   # the the functions are not looked for in the
   # external library
.set defd_stringassign, _stringassign
.set defdstringassign, stringassign

_stringassign:
stringassign:
sassign:
_sassign:
#	movq 20(%rsp),%rsi
#	movq 8(%rsp),%rdi
	movq %rdx,%rcx # was	movslq 16(%rsp),%rcx
	cmpw (%rsi),%cx
	jl shorter
	movw (%rsi),%cx
shorter:inc %cx
	rep movsw
	ret
   #cmplt(s1,s2) compares two strings, returns -1 if s1<s2,1 if si>s2,0 otherwise
   #s1 equ [esp+8] cache rsi
   #s2 equ [esp+16] cache rdi
.global cmplt
.global _cmplt
_cmplt:
cmplt:
.set defdsetcmp, setcmp
.set defd_setcmp, _setcmp
setcmp:
_setcmp:
#	movq 16(%rsp), %rdi
#	movq 8(%rsp),%rsi
        movq %rdx,%rcx  #was	movq 24(%rsp),%rcx

        jmp cmplt1
.set defdstringcompare, stringcompare
.set defd_stringcompare, _stringcompare
stringcompare:
_stringcompare:
#	movq 16(%rsp), %rdi
#	movq 8(%rsp), %rsi
   # test both strings for null length looking at the length words
	movw (%rdi), %cx
	orw (%rsi),%cx
	jz cmpeq
   # determine which is the shortest
	movswq (%rsi), %rcx
	cmpw (%rdi), %cx
	jl cmpltsh
	         #
	movw (%rdi), %cx
cmpltsh:
	addq $2, %rsi  # move on past the length word
	addq $2, %rdi
cmplt1: repe
	cmpsw
	jg cmpltg
	jl cmpltl
#        movq 16(%rsp),%rdi
#	movq 8(%rsp),%rsi
#	movw (%rsi), %ax
#	cmpw (%rdi),  %ax
#	jl cmpltl
#	jg cmpltg
cmpeq:
	xor %rax,%rax
	ret
cmpltl: movq $-1,%rax
	ret
cmpltg: movq $1, %rax
	ret

	mov %rdx,%rax
	ret

/*'andifgoto ' c','r1',' r2','c2','r3','  r4 ',' l','t','t2 */
.macro andifgoto c r1 r2 c2 r3 r4 l t t2
	cmp  \r2,\r1
	j\c  1f
	jmp 2f
1: cmp \r4,\r3
	j\c2 3f
        jmp 2f
3:
        jmp \l
2:
.endm

.macro xmmld p1 p2
	test $15,\p2
	jnz 1f
	movdqa (\p2),\p1
	jmp 2f
1:movdqu (\p2),p1
2:
.endm

.macro floadlit p1
.section .data
1: .double \p1
	.section .text
	fldl 1b
.endm
.section .data
fttemp: .float 0.0
.section .text
 
.macro fildr p1
	sub $8, %rsp

	movl \p1, (%rsp)
	filds (%rsp)
	add $8, %rsp

.endm
.macro fistr p1
	
.endm
.macro bytemult p1 p2
	pushd %esi
	pushd  %edi
	movsbl \p1,%esi

	movsbl \p2, %edi
	imul %esi,%edi
	mov %edi,fttemp
	popl %edi
	popl %esi

	movb fttemp,\p1
.endm



.macro rloadlit p1 p2
.section .data
1: .float \p2
	.section .text
	movl 1b, \p1
.endm
.macro xrloadlit p1 p2
.section .data
1: .float \p2
.section .text
	movss 1b,\p1
.endm
.macro xrdloadlit p1 p2
.section .data
1: .double \p2
.section .text
	movsd  1b,\p1
.endm
.macro mmxrloadlit p1 p2
.section .data
1: .float \p2
	.section .text
	movd 1b,\p1
	.endm

.macro filoadlit p1
.section .data
1: .double \p1
	.section .text
	fldl 1b
	.endm

.endif

