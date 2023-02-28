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
   #s2 equ [esp+12] cache esi
   #len equ [esp+8]
   #s1 equ [esp+4] cache edi
   #tocopy equ cx
.global sassign
.global _sassign
   # the following definitions are to make sure
   # the the functions are not looked for in the
   # external library
defined_stringassign= _stringassign
defineddstringassign= stringassign

_stringassign:
stringassign:
sassign:
_sassign:
	movl 12(%esp),%esi
	movl 4(%esp),%edi
	movl 8(%esp),%ecx
	cmpb (%esi),%cl
	jl shorter
	movb (%esi),%cl
shorter:inc %ecx
	rep movsw
	ret
   #cmplt(s1,s2) compares two strings, returns -1 if s1<s2,1 if si>s2,0 otherwise
   #s1 equ [esp+4] cache esi
   #s2 equ [esp+8] cache edi
.global cmplt
.global _cmplt
_cmplt:
cmplt:
.set defdsetcmp, setcmp
.set defd_setcmp, _setcmp
setcmp:
_setcmp:
	movl 8(%esp), %edi
	movl 4(%esp),%esi
	movl 12(%esp),%ecx
        jmp cmplt1
 defineddstringcompare= stringcompare
definedd_stringcompare= _stringcompare
stringcompare:
_stringcompare:
	movl 8(%esp), %edi
	movl 4(%esp), %esi
   # test both strings for null length
	movb (%edi), %cl
	orb (%esi),%cl
	jz cmpeq
   # determine which is the shortest
	movswl (%esi), %ecx
	cmpw (%edi), %cx
	jl cmpltsh
	         #
	movw (%edi), %cx
cmpltsh:
	inc %esi
	inc %edi
cmplt1: repe
	cmpsw
	jg cmpltg
	jl cmpltl
        movl 8(%esp),%edi
	movl 4(%esp),%esi
	movw (%esi), %ax
	cmpw (%edi),  %ax
	jl cmpltl
	jg cmpltg
cmpeq:
	xor %eax,%eax
	ret
cmpltl: movl $-1,%eax
	ret
cmpltg: movl $1, %eax
	ret

	mov %edx,%eax
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
.macro fildb p1

	pushl %esi
	movsbl \p1, %esi
	movl %esi, fttemp
	filds fttemp
	popl %esi
.endm
.macro fildr p1


	movl \p1, fttemp
	filds fttemp

.endm
.macro fistb p1

	fistps fttemp
	movb fttemp,\p1
.endm
.macro bytemult p1 p2
	pushl %esi
	pushl  %edi
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

