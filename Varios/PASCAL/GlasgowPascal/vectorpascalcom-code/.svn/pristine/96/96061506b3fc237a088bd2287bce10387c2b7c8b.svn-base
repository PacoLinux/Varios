	.file	"testless.c"
	.version	"01.01"
gcc2_compiled.:
		.section	.rodata
	.align 4
.LC0:
	.long	0x40400000
.text
	.align 4
.globl main
	.type	 main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	cmpl	$2, -4(%ebp)
	jg	.L3
	movl	$4, -4(%ebp)
.L3:
	flds	-8(%ebp)
	flds	.LC0
	fmulp	%st, %st(1)
	fadds	-12(%ebp)
	fstps	-8(%ebp)
	flds	-8(%ebp)
	flds	-12(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	testb	$69, %ah
	je	.L6
	jmp	.L4
	.p2align 2
.L6:
	flds	-8(%ebp)
	fstps	-16(%ebp)
	jmp	.L5
	.p2align 2
.L4:
	flds	-12(%ebp)
	fstps	-16(%ebp)
.L5:
	flds	-16(%ebp)
	fstps	-8(%ebp)
	leave
	ret
.Lfe1:
	.size	 main,.Lfe1-main
	.ident	"GCC: (GNU) 2.96 20000731 (Red Hat Linux 7.3 2.96-110)"
