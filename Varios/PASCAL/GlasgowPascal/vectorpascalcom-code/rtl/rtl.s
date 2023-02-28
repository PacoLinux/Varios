	.file	"rtl.c"
	.text
.globl double2float
	.type	double2float, @function
double2float:
.LFB9:
	pushq	%rbp
.LCFI0:
	movq	%rsp, %rbp
.LCFI1:
	movsd	%xmm0, -8(%rbp)
	cvtsd2ss	-8(%rbp), %xmm0
	movss	%xmm0, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
	movss	-12(%rbp), %xmm0
	leave
	ret
.LFE9:
	.size	double2float, .-double2float
.globl iores
	.bss
	.align 4
	.type	iores, @object
	.size	iores, 4
iores:
	.zero	4
	.text
.globl initfs
	.type	initfs, @function
initfs:
.LFB10:
	pushq	%rbp
.LCFI2:
	movq	%rsp, %rbp
.LCFI3:
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	$0, files+256(%rax)
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	$1, files+260(%rax)
	movl	-4(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	$97, %eax
	movl	%eax, %ecx
	movslq	%edx,%rax
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movb	%cl, files+10(%rax)
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movb	$86, files+8(%rax)
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movb	$80, files+9(%rax)
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movb	$0, files+11(%rax)
	addl	$1, -4(%rbp)
.L4:
	cmpl	$30, -4(%rbp)
	jle	.L5
	movl	$1, files+256(%rip)
	movq	stdin(%rip), %rax
	movq	%rax, files(%rip)
	movl	$1, files+520(%rip)
	movq	stdout(%rip), %rax
	movq	%rax, files+264(%rip)
	leave
	ret
.LFE10:
	.size	initfs, .-initfs
.globl entryname
	.type	entryname, @function
entryname:
.LFB11:
	pushq	%rbp
.LCFI4:
	movq	%rsp, %rbp
.LCFI5:
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$19, %rax
	leave
	ret
.LFE11:
	.size	entryname, .-entryname
.globl isdir
	.type	isdir, @function
isdir:
.LFB12:
	pushq	%rbp
.LCFI6:
	movq	%rsp, %rbp
.LCFI7:
	subq	$160, %rsp
.LCFI8:
	movq	%rdi, -152(%rbp)
	leaq	-144(%rbp), %rsi
	movq	-152(%rbp), %rdi
	call	stat
	movl	-120(%rbp), %eax
	andl	$61440, %eax
	cmpl	$16384, %eax
	sete	%al
	movzbl	%al, %eax
	leave
	ret
.LFE12:
	.size	isdir, .-isdir
.globl pascalexit
	.type	pascalexit, @function
pascalexit:
.LFB13:
	pushq	%rbp
.LCFI9:
	movq	%rsp, %rbp
.LCFI10:
	subq	$16, %rsp
.LCFI11:
	movl	%edi, -4(%rbp)
	movl	$0, %eax
	call	closefiles
	movl	-4(%rbp), %edi
	call	exit
.LFE13:
	.size	pascalexit, .-pascalexit
.globl findfreefileblock
	.type	findfreefileblock, @function
findfreefileblock:
.LFB14:
	pushq	%rbp
.LCFI12:
	movq	%rsp, %rbp
.LCFI13:
	movl	$0, -4(%rbp)
	jmp	.L15
.L16:
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	files+256(%rax), %eax
	testl	%eax, %eax
	jne	.L17
	movl	-4(%rbp), %eax
	movl	%eax, -20(%rbp)
	jmp	.L19
.L17:
	addl	$1, -4(%rbp)
.L15:
	cmpl	$30, -4(%rbp)
	jle	.L16
	movl	$-1, -20(%rbp)
.L19:
	movl	-20(%rbp), %eax
	leave
	ret
.LFE14:
	.size	findfreefileblock, .-findfreefileblock
.globl closefiles
	.type	closefiles, @function
closefiles:
.LFB15:
	pushq	%rbp
.LCFI14:
	movq	%rsp, %rbp
.LCFI15:
	subq	$16, %rsp
.LCFI16:
	movl	$0, -4(%rbp)
	jmp	.L23
.L24:
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	files+256(%rax), %eax
	cmpl	$1, %eax
	jne	.L25
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rdi
	call	fclose
.L25:
	addl	$1, -4(%rbp)
.L23:
	cmpl	$30, -4(%rbp)
	jle	.L24
	leave
	ret
.LFE15:
	.size	closefiles, .-closefiles
.globl pasclose
	.type	pasclose, @function
pasclose:
.LFB16:
	pushq	%rbp
.LCFI17:
	movq	%rsp, %rbp
.LCFI18:
	subq	$16, %rsp
.LCFI19:
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rdi
	call	fclose
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	$0, files+256(%rax)
	leave
	ret
.LFE16:
	.size	pasclose, .-pasclose
.globl setchan
	.type	setchan, @function
setchan:
.LFB17:
	pushq	%rbp
.LCFI20:
	movq	%rsp, %rbp
.LCFI21:
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdx
	movl	-12(%rbp), %eax
	movl	%eax, (%rdx)
	leave
	ret
.LFE17:
	.size	setchan, .-setchan
.globl pascaleof
	.type	pascaleof, @function
pascaleof:
.LFB18:
	pushq	%rbp
.LCFI22:
	movq	%rsp, %rbp
.LCFI23:
	subq	$32, %rsp
.LCFI24:
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rdi
	call	feof
	testl	%eax, %eax
	je	.L34
	movl	$-1, -28(%rbp)
	jmp	.L36
.L34:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rdi
	call	ftell
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rdi
	movl	$2, %edx
	movl	$0, %esi
	call	fseek
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rdi
	call	ftell
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rdi
	movq	-16(%rbp), %rsi
	movl	$0, %edx
	call	fseek
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jne	.L37
	movl	$-1, -28(%rbp)
	jmp	.L36
.L37:
	movl	$0, -28(%rbp)
.L36:
	movl	-28(%rbp), %eax
	leave
	ret
.LFE18:
	.size	pascaleof, .-pascaleof
.globl eoln
	.type	eoln, @function
eoln:
.LFB19:
	pushq	%rbp
.LCFI25:
	movq	%rsp, %rbp
.LCFI26:
	subq	$32, %rsp
.LCFI27:
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-24(%rbp), %rdi
	call	pascaleof
	testl	%eax, %eax
	jne	.L41
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rdi
	call	fgetc
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rsi
	movl	-4(%rbp), %edi
	call	ungetc
	cmpl	$10, -4(%rbp)
	jne	.L41
	movl	$-1, -28(%rbp)
	jmp	.L44
.L41:
	movl	$0, -28(%rbp)
.L44:
	movl	-28(%rbp), %eax
	leave
	ret
.LFE19:
	.size	eoln, .-eoln
.globl u2asciitrunc
	.type	u2asciitrunc, @function
u2asciitrunc:
.LFB20:
	pushq	%rbp
.LCFI28:
	movq	%rsp, %rbp
.LCFI29:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L47
.L48:
	movq	-32(%rbp), %rdx
	subq	$1, %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	-24(%rbp), %rax
	movzwl	(%rax), %eax
	andl	$127, %eax
	movb	%al, (%rdx)
	addl	$1, -4(%rbp)
.L47:
	movq	-24(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$255, %eax
	cmpl	-4(%rbp), %eax
	jge	.L48
	movq	-24(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$255, %eax
	addq	-32(%rbp), %rax
	movb	$0, (%rax)
	leave
	ret
.LFE20:
	.size	u2asciitrunc, .-u2asciitrunc
.globl move
	.type	move, @function
move:
.LFB21:
	pushq	%rbp
.LCFI30:
	movq	%rsp, %rbp
.LCFI31:
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax,%rcx
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	cld
	rep
	movsb
	leave
	ret
.LFE21:
	.size	move, .-move
.globl erase
	.type	erase, @function
erase:
.LFB22:
	pushq	%rbp
.LCFI32:
	movq	%rsp, %rbp
.LCFI33:
	subq	$288, %rsp
.LCFI34:
	movq	%rdi, -280(%rbp)
	leaq	-272(%rbp), %rsi
	movq	-280(%rbp), %rdi
	call	u2asciitrunc
	leaq	-272(%rbp), %rdi
	call	unlink
	leave
	ret
.LFE22:
	.size	erase, .-erase
.globl filesize
	.type	filesize, @function
filesize:
.LFB23:
	pushq	%rbp
.LCFI35:
	movq	%rsp, %rbp
.LCFI36:
	subq	$48, %rsp
.LCFI37:
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdi
	call	ftell
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rdi
	movl	$2, %edx
	movl	$0, %esi
	call	fseek
	movq	-8(%rbp), %rdi
	call	ftell
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rsi
	movq	-8(%rbp), %rdi
	movl	$0, %edx
	call	fseek
	movq	-16(%rbp), %rax
	leave
	ret
.LFE23:
	.size	filesize, .-filesize
	.section	.rodata
	.align 8
.LC0:
	.string	"Pascal file sub-system  error: %d"
.LC1:
	.string	"Unassigned file handle %d"
	.align 8
.LC2:
	.string	"Unassigned or closed file handle %d"
	.text
.globl checkerr
	.type	checkerr, @function
checkerr:
.LFB24:
	pushq	%rbp
.LCFI38:
	movq	%rsp, %rbp
.LCFI39:
	subq	$16, %rsp
.LCFI40:
	movl	%edi, -4(%rbp)
	movl	iores(%rip), %eax
	testl	%eax, %eax
	je	.L58
	movl	iores(%rip), %edx
	movq	stderr(%rip), %rdi
	movl	$.LC0, %esi
	movl	$0, %eax
	call	fprintf
	movl	iores(%rip), %edi
	call	pascalexit
.L58:
	cmpl	$0, -4(%rbp)
	js	.L60
	cmpl	$31, -4(%rbp)
	jle	.L62
.L60:
	movq	stderr(%rip), %rdi
	movl	-4(%rbp), %edx
	movl	$.LC1, %esi
	movl	$0, %eax
	call	fprintf
	movl	iores(%rip), %edi
	call	pascalexit
.L62:
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	files+256(%rax), %eax
	testl	%eax, %eax
	jne	.L65
	movq	stderr(%rip), %rdi
	movl	-4(%rbp), %edx
	movl	$.LC2, %esi
	movl	$0, %eax
	call	fprintf
	movl	iores(%rip), %edi
	call	pascalexit
.L65:
	leave
	ret
.LFE24:
	.size	checkerr, .-checkerr
.globl filepos
	.type	filepos, @function
filepos:
.LFB25:
	pushq	%rbp
.LCFI41:
	movq	%rsp, %rbp
.LCFI42:
	subq	$32, %rsp
.LCFI43:
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdi
	call	ftell
	leave
	ret
.LFE25:
	.size	filepos, .-filepos
.globl seek
	.type	seek, @function
seek:
.LFB26:
	pushq	%rbp
.LCFI44:
	movq	%rsp, %rbp
.LCFI45:
	subq	$32, %rsp
.LCFI46:
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-28(%rbp), %eax
	movslq	%eax,%rsi
	movl	-32(%rbp), %edx
	movq	-8(%rbp), %rdi
	call	fseek
	leave
	ret
.LFE26:
	.size	seek, .-seek
.globl blockread
	.type	blockread, @function
blockread:
.LFB27:
	pushq	%rbp
.LCFI47:
	movq	%rsp, %rbp
.LCFI48:
	subq	$32, %rsp
.LCFI49:
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax,%r8
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	files+260(%rax), %eax
	movslq	%eax,%rsi
	movq	-16(%rbp), %rdi
	movq	%r8, %rdx
	call	fread
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	leave
	ret
.LFE27:
	.size	blockread, .-blockread
.globl blockwrite
	.type	blockwrite, @function
blockwrite:
.LFB28:
	pushq	%rbp
.LCFI50:
	movq	%rsp, %rbp
.LCFI51:
	subq	$32, %rsp
.LCFI52:
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax,%r8
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	files+260(%rax), %eax
	movslq	%eax,%rsi
	movq	-16(%rbp), %rdi
	movq	%r8, %rdx
	call	fwrite
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	leave
	ret
.LFE28:
	.size	blockwrite, .-blockwrite
	.section	.rodata
.LC3:
	.string	"w+b"
	.text
.globl rewrite
	.type	rewrite, @function
rewrite:
.LFB29:
	pushq	%rbp
.LCFI53:
	movq	%rsp, %rbp
.LCFI54:
	pushq	%rbx
.LCFI55:
	subq	$8, %rsp
.LCFI56:
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	js	.L75
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$31, %eax
	jle	.L77
.L75:
	movl	$0, %eax
	call	findfreefileblock
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
.L77:
	movq	-16(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-16(%rbp), %rax
	movl	(%rax), %ebx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	$files, %rax
	leaq	8(%rax), %rdi
	movl	$.LC3, %esi
	call	fopen
	movq	%rax, %rcx
	movslq	%ebx,%rax
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	%rcx, files(%rax)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	$1, files+256(%rax)
	addq	$8, %rsp
	popq	%rbx
	leave
	ret
.LFE29:
	.size	rewrite, .-rewrite
	.section	.rodata
.LC4:
	.string	"r+b"
	.text
.globl reset
	.type	reset, @function
reset:
.LFB30:
	pushq	%rbp
.LCFI57:
	movq	%rsp, %rbp
.LCFI58:
	pushq	%rbx
.LCFI59:
	subq	$8, %rsp
.LCFI60:
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	files+256(%rax), %eax
	cmpl	$1, %eax
	je	.L80
	movq	-16(%rbp), %rax
	movl	(%rax), %ebx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	$files, %rax
	leaq	8(%rax), %rdi
	movl	$.LC4, %esi
	call	fopen
	movq	%rax, %rcx
	movslq	%ebx,%rax
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	%rcx, files(%rax)
	jmp	.L82
.L80:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rdi
	movl	$0, %edx
	movl	$0, %esi
	call	fseek
.L82:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	testq	%rax, %rax
	jne	.L83
	movl	$2, iores(%rip)
	jmp	.L86
.L83:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	$1, files+256(%rax)
.L86:
	addq	$8, %rsp
	popq	%rbx
	leave
	ret
.LFE30:
	.size	reset, .-reset
	.section	.rodata
.LC5:
	.string	"ab"
	.text
.globl append
	.type	append, @function
append:
.LFB31:
	pushq	%rbp
.LCFI61:
	movq	%rsp, %rbp
.LCFI62:
	pushq	%rbx
.LCFI63:
	subq	$8, %rsp
.LCFI64:
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %edi
	call	checkerr
	movq	-16(%rbp), %rax
	movl	(%rax), %ebx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	$files, %rax
	leaq	8(%rax), %rdi
	movl	$.LC5, %esi
	call	fopen
	movq	%rax, %rcx
	movslq	%ebx,%rax
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	%rcx, files(%rax)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	testq	%rax, %rax
	jne	.L88
	movl	$2, iores(%rip)
	jmp	.L91
.L88:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	$1, files+256(%rax)
.L91:
	addq	$8, %rsp
	popq	%rbx
	leave
	ret
.LFE31:
	.size	append, .-append
.globl setiores
	.type	setiores, @function
setiores:
.LFB32:
	pushq	%rbp
.LCFI65:
	movq	%rsp, %rbp
.LCFI66:
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, iores(%rip)
	leave
	ret
.LFE32:
	.size	setiores, .-setiores
.globl assign
	.type	assign, @function
assign:
.LFB33:
	pushq	%rbp
.LCFI67:
	movq	%rsp, %rbp
.LCFI68:
	subq	$288, %rsp
.LCFI69:
	movq	%rdi, -280(%rbp)
	movq	%rsi, -288(%rbp)
	leaq	-272(%rbp), %rsi
	movq	-288(%rbp), %rdi
	call	u2asciitrunc
	movl	$0, %eax
	call	findfreefileblock
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.L95
	movl	$4, iores(%rip)
	movq	-280(%rbp), %rax
	movl	$-1, (%rax)
	jmp	.L101
.L95:
	movl	$0, -8(%rbp)
	jmp	.L98
.L99:
	movl	-4(%rbp), %ecx
	movl	-8(%rbp), %edx
	movl	-8(%rbp), %eax
	cltq
	movzbl	-272(%rbp,%rax), %esi
	movslq	%edx,%rdi
	movslq	%ecx,%rax
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	%rdi, %rax
	addq	$files, %rax
	movb	%sil, 8(%rax)
	addl	$1, -8(%rbp)
.L98:
	movq	-288(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$255, %eax
	cmpl	-8(%rbp), %eax
	jg	.L99
	movl	-4(%rbp), %edx
	movq	-288(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$255, %eax
	movslq	%eax,%rcx
	movslq	%edx,%rax
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	addq	%rcx, %rax
	addq	$files, %rax
	movb	$0, 8(%rax)
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movl	$-1, files+256(%rax)
	movq	-280(%rbp), %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
.L101:
	leave
	ret
.LFE33:
	.size	assign, .-assign
.globl ioresult
	.type	ioresult, @function
ioresult:
.LFB34:
	pushq	%rbp
.LCFI70:
	movq	%rsp, %rbp
.LCFI71:
	movl	iores(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	$0, iores(%rip)
	movl	-4(%rbp), %eax
	leave
	ret
.LFE34:
	.size	ioresult, .-ioresult
.globl readcharnarrow
	.type	readcharnarrow, @function
readcharnarrow:
.LFB35:
	pushq	%rbp
.LCFI72:
	movq	%rsp, %rbp
.LCFI73:
	subq	$32, %rsp
.LCFI74:
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L105
	movq	stdin(%rip), %rdi
	call	_IO_getc
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
	jmp	.L108
.L105:
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
.L108:
	leave
	ret
.LFE35:
	.size	readcharnarrow, .-readcharnarrow
.globl readchar
	.type	readchar, @function
readchar:
.LFB36:
	pushq	%rbp
.LCFI75:
	movq	%rsp, %rbp
.LCFI76:
	subq	$32, %rsp
.LCFI77:
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	leaq	-5(%rbp), %rsi
	movl	-20(%rbp), %edi
	call	readcharnarrow
	movzbl	-5(%rbp), %eax
	movzbw	%al, %dx
	movq	-32(%rbp), %rax
	movw	%dx, (%rax)
	movzbl	-5(%rbp), %eax
	testb	%al, %al
	jns	.L114
	movzbl	-5(%rbp), %eax
	cmpb	$-33, %al
	ja	.L112
	movzbl	-5(%rbp), %eax
	movzbw	%al, %ax
	andl	$31, %eax
	movl	%eax, %edx
	sall	$6, %edx
	movq	-32(%rbp), %rax
	movw	%dx, (%rax)
	leaq	-5(%rbp), %rsi
	movl	-20(%rbp), %edi
	call	readcharnarrow
	movq	-32(%rbp), %rax
	movzwl	(%rax), %edx
	movzbl	-5(%rbp), %eax
	movzbw	%al, %ax
	andl	$63, %eax
	addl	%eax, %edx
	movq	-32(%rbp), %rax
	movw	%dx, (%rax)
.L112:
	movzbl	-5(%rbp), %eax
	movzbw	%al, %ax
	andl	$15, %eax
	movl	%eax, %edx
	sall	$12, %edx
	movq	-32(%rbp), %rax
	movw	%dx, (%rax)
	leaq	-5(%rbp), %rsi
	movl	-20(%rbp), %edi
	call	readcharnarrow
	movq	-32(%rbp), %rax
	movzwl	(%rax), %edx
	movzbl	-5(%rbp), %eax
	movzbw	%al, %ax
	andl	$63, %eax
	sall	$6, %eax
	addl	%eax, %edx
	movq	-32(%rbp), %rax
	movw	%dx, (%rax)
	leaq	-5(%rbp), %rsi
	movl	-20(%rbp), %edi
	call	readcharnarrow
	movq	-32(%rbp), %rax
	movzwl	(%rax), %edx
	movzbl	-5(%rbp), %eax
	movzbw	%al, %ax
	andl	$63, %eax
	addl	%eax, %edx
	movq	-32(%rbp), %rax
	movw	%dx, (%rax)
.L114:
	leave
	ret
.LFE36:
	.size	readchar, .-readchar
.globl unicode2utf8
	.type	unicode2utf8, @function
unicode2utf8:
.LFB37:
	pushq	%rbp
.LCFI78:
	movq	%rsp, %rbp
.LCFI79:
	movq	%rsi, -16(%rbp)
	movw	%di, -4(%rbp)
	cmpw	$127, -4(%rbp)
	ja	.L116
	movzwl	-4(%rbp), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movb	%dl, (%rax)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movb	$0, (%rax)
	jmp	.L121
.L116:
	cmpw	$2047, -4(%rbp)
	ja	.L119
	movzwl	-4(%rbp), %eax
	shrw	$6, %ax
	andl	$31, %eax
	leal	-64(%rax), %edx
	movq	-16(%rbp), %rax
	movb	%dl, (%rax)
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movzwl	-4(%rbp), %eax
	andl	$63, %eax
	addl	$-128, %eax
	movb	%al, (%rdx)
	movq	-16(%rbp), %rax
	addq	$2, %rax
	movb	$0, (%rax)
	jmp	.L121
.L119:
	movzwl	-4(%rbp), %eax
	shrw	$12, %ax
	andl	$15, %eax
	leal	-32(%rax), %edx
	movq	-16(%rbp), %rax
	movb	%dl, (%rax)
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movzwl	-4(%rbp), %eax
	shrw	$6, %ax
	andl	$63, %eax
	addl	$-128, %eax
	movb	%al, (%rdx)
	movq	-16(%rbp), %rdx
	addq	$2, %rdx
	movzwl	-4(%rbp), %eax
	andl	$63, %eax
	addl	$-128, %eax
	movb	%al, (%rdx)
	movq	-16(%rbp), %rax
	addq	$3, %rax
	movb	$0, (%rax)
.L121:
	leave
	ret
.LFE37:
	.size	unicode2utf8, .-unicode2utf8
	.section	.rodata
.LC6:
	.string	"%s"
	.text
.globl printspaces
	.type	printspaces, @function
printspaces:
.LFB38:
	pushq	%rbp
.LCFI80:
	movq	%rsp, %rbp
.LCFI81:
	subq	$1040, %rsp
.LCFI82:
	movl	%edi, -1028(%rbp)
	movl	%esi, -1032(%rbp)
	movl	-1028(%rbp), %edi
	call	checkerr
	movl	-1028(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -16(%rbp)
	cmpl	$999, -1032(%rbp)
	jle	.L123
	movl	$999, -1032(%rbp)
.L123:
	movb	$0, -1024(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L125
.L126:
	movl	-4(%rbp), %eax
	cltq
	movb	$32, -1024(%rbp,%rax)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cltq
	movb	$0, -1024(%rbp,%rax)
	addl	$1, -4(%rbp)
.L125:
	movl	-4(%rbp), %eax
	cmpl	-1032(%rbp), %eax
	jl	.L126
	cmpl	$0, -1028(%rbp)
	jne	.L128
	leaq	-1024(%rbp), %rsi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	jmp	.L131
.L128:
	movq	-16(%rbp), %rsi
	leaq	-1024(%rbp), %rdi
	call	fputs
.L131:
	leave
	ret
.LFE38:
	.size	printspaces, .-printspaces
.globl printchar
	.type	printchar, @function
printchar:
.LFB39:
	pushq	%rbp
.LCFI83:
	movq	%rsp, %rbp
.LCFI84:
	subq	$32, %rsp
.LCFI85:
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movl	-28(%rbp), %esi
	subl	$1, %esi
	movl	-20(%rbp), %edi
	call	printspaces
	cmpl	$127, -24(%rbp)
	jg	.L133
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L135
	movl	-24(%rbp), %edi
	call	putchar
	jmp	.L141
.L135:
	movq	-8(%rbp), %rsi
	movl	-24(%rbp), %edi
	call	_IO_putc
	jmp	.L141
.L133:
	movl	-24(%rbp), %eax
	movzwl	%ax, %edi
	leaq	-16(%rbp), %rsi
	call	unicode2utf8
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L139
	leaq	-16(%rbp), %rsi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	jmp	.L141
.L139:
	movq	-8(%rbp), %rsi
	leaq	-16(%rbp), %rdi
	call	fputs
.L141:
	leave
	ret
.LFE39:
	.size	printchar, .-printchar
.globl readline
	.type	readline, @function
readline:
.LFB40:
	pushq	%rbp
.LCFI86:
	movq	%rsp, %rbp
.LCFI87:
	subq	$32, %rsp
.LCFI88:
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L143
	movq	stdin(%rip), %rax
	movq	%rax, -8(%rbp)
.L143:
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movb	%al, -9(%rbp)
	jmp	.L145
.L146:
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movb	%al, -9(%rbp)
.L145:
	cmpb	$10, -9(%rbp)
	jne	.L146
	leave
	ret
.LFE40:
	.size	readline, .-readline
.globl endoffile
	.type	endoffile, @function
endoffile:
.LFB41:
	pushq	%rbp
.LCFI89:
	movq	%rsp, %rbp
.LCFI90:
	subq	$32, %rsp
.LCFI91:
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L150
	movq	stdin(%rip), %rax
	movq	%rax, -8(%rbp)
.L150:
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, -16(%rbp)
	cmpl	$-1, -16(%rbp)
	jne	.L152
	movl	$1, -12(%rbp)
	jmp	.L154
.L152:
	movl	$0, -12(%rbp)
	movq	-8(%rbp), %rsi
	movl	-16(%rbp), %edi
	call	ungetc
.L154:
	movl	-12(%rbp), %eax
	leave
	ret
.LFE41:
	.size	endoffile, .-endoffile
.globl endofline
	.type	endofline, @function
endofline:
.LFB42:
	pushq	%rbp
.LCFI92:
	movq	%rsp, %rbp
.LCFI93:
	subq	$32, %rsp
.LCFI94:
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L157
	movq	stdin(%rip), %rax
	movq	%rax, -8(%rbp)
.L157:
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movb	%al, -10(%rbp)
	cmpb	$10, -10(%rbp)
	jne	.L159
	movb	$1, -9(%rbp)
	jmp	.L161
.L159:
	movb	$0, -9(%rbp)
	movsbl	-10(%rbp),%edi
	movq	-8(%rbp), %rsi
	call	ungetc
.L161:
	movsbl	-9(%rbp),%eax
	leave
	ret
.LFE42:
	.size	endofline, .-endofline
.globl println
	.type	println, @function
println:
.LFB43:
	pushq	%rbp
.LCFI95:
	movq	%rsp, %rbp
.LCFI96:
	subq	$32, %rsp
.LCFI97:
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L164
	movl	$10, %edi
	call	putchar
	jmp	.L167
.L164:
	movq	-8(%rbp), %rsi
	movl	$10, %edi
	call	fputc
.L167:
	leave
	ret
.LFE43:
	.size	println, .-println
.globl pascalerror
	.type	pascalerror, @function
pascalerror:
.LFB44:
	pushq	%rbp
.LCFI98:
	movq	%rsp, %rbp
.LCFI99:
	subq	$16, %rsp
.LCFI100:
	movq	%rdi, -8(%rbp)
	movq	stderr(%rip), %rsi
	movq	-8(%rbp), %rdi
	call	fputs
	movl	$-1, %edi
	call	pascalexit
	leave
	ret
.LFE44:
	.size	pascalerror, .-pascalerror
.globl length
	.type	length, @function
length:
.LFB45:
	pushq	%rbp
.LCFI101:
	movq	%rsp, %rbp
.LCFI102:
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	leave
	ret
.LFE45:
	.size	length, .-length
.globl incr
	.type	incr, @function
incr:
.LFB46:
	pushq	%rbp
.LCFI103:
	movq	%rsp, %rbp
.LCFI104:
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	2(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	leave
	ret
.LFE46:
	.size	incr, .-incr
.globl readstring
	.type	readstring, @function
readstring:
.LFB47:
	pushq	%rbp
.LCFI105:
	movq	%rsp, %rbp
.LCFI106:
	subq	$48, %rsp
.LCFI107:
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L175
	movq	stdin(%rip), %rax
	movq	%rax, -8(%rbp)
.L175:
	movl	$0, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movw	%dx, (%rax)
	movw	$32, -14(%rbp)
	jmp	.L184
.L178:
	leaq	-14(%rbp), %rsi
	movl	-20(%rbp), %edi
	call	readchar
	movzwl	-14(%rbp), %eax
	cmpw	$10, %ax
	je	.L179
	addl	$1, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	addq	%rax, %rax
	movq	%rax, %rdx
	addq	-32(%rbp), %rdx
	movzwl	-14(%rbp), %eax
	movw	%ax, (%rdx)
	movl	-12(%rbp), %eax
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movw	%dx, (%rax)
	jmp	.L177
.L179:
	movzwl	-14(%rbp), %eax
	movzwl	%ax, %edi
	movq	-8(%rbp), %rsi
	call	ungetc
.L177:
.L184:
	movq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	cmpl	-36(%rbp), %eax
	jge	.L183
	movzwl	-14(%rbp), %eax
	cmpw	$10, %ax
	jne	.L178
.L183:
	leave
	ret
.LFE47:
	.size	readstring, .-readstring
.globl printstring
	.type	printstring, @function
printstring:
.LFB48:
	pushq	%rbp
.LCFI108:
	movq	%rsp, %rbp
.LCFI109:
	subq	$64, %rsp
.LCFI110:
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movl	%ecx, -56(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-36(%rbp), %edi
	call	checkerr
	movl	-36(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, -20(%rbp)
	cmpl	$0, -12(%rbp)
	jns	.L186
	movl	-20(%rbp), %eax
	movl	%eax, -12(%rbp)
.L186:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L188
	movl	$1, -28(%rbp)
	jmp	.L190
.L191:
	movl	-28(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	-48(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %esi
	movl	-36(%rbp), %edi
	movl	$1, %ecx
	movl	$1, %edx
	call	printchar
	addl	$1, -28(%rbp)
.L190:
	movl	-28(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.L191
	jmp	.L198
.L188:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L194
	movl	-20(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	subl	%edx, %esi
	movl	-36(%rbp), %edi
	call	printspaces
.L194:
	movl	$1, -28(%rbp)
	jmp	.L196
.L197:
	movl	-28(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	-48(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %esi
	movl	-36(%rbp), %edi
	movl	$1, %ecx
	movl	$1, %edx
	call	printchar
	addl	$1, -28(%rbp)
.L196:
	movl	-28(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L197
.L198:
	leave
	ret
.LFE48:
	.size	printstring, .-printstring
.globl printordinal
	.type	printordinal, @function
printordinal:
.LFB49:
	pushq	%rbp
.LCFI111:
	movq	%rsp, %rbp
.LCFI112:
	subq	$32, %rsp
.LCFI113:
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movq	%r8, -24(%rbp)
	movl	-8(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-24(%rbp), %rax
	movq	(%rax), %rsi
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %edx
	movl	-4(%rbp), %edi
	call	printstring
	leave
	ret
.LFE49:
	.size	printordinal, .-printordinal
.globl skipspaces
	.type	skipspaces, @function
skipspaces:
.LFB50:
	pushq	%rbp
.LCFI114:
	movq	%rsp, %rbp
.LCFI115:
	subq	$32, %rsp
.LCFI116:
	movq	%rdi, -24(%rbp)
	movb	$32, -1(%rbp)
	jmp	.L202
.L203:
	movq	-24(%rbp), %rdi
	call	_IO_getc
	movb	%al, -1(%rbp)
.L202:
	cmpb	$32, -1(%rbp)
	je	.L203
	movsbl	-1(%rbp),%edi
	movq	-24(%rbp), %rsi
	call	ungetc
	leave
	ret
.LFE50:
	.size	skipspaces, .-skipspaces
.globl utolower
	.type	utolower, @function
utolower:
.LFB51:
	pushq	%rbp
.LCFI117:
	movq	%rsp, %rbp
.LCFI118:
	movw	%di, -4(%rbp)
	cmpw	$64, -4(%rbp)
	jbe	.L207
	cmpw	$90, -4(%rbp)
	ja	.L207
	movzwl	-4(%rbp), %eax
	addl	$32, %eax
	movl	%eax, -8(%rbp)
	jmp	.L210
.L207:
	cmpw	$912, -4(%rbp)
	jbe	.L211
	cmpw	$937, -4(%rbp)
	ja	.L211
	movzwl	-4(%rbp), %eax
	addl	$32, %eax
	movl	%eax, -8(%rbp)
	jmp	.L210
.L211:
	cmpw	$1039, -4(%rbp)
	jbe	.L214
	cmpw	$1071, -4(%rbp)
	ja	.L214
	movzwl	-4(%rbp), %eax
	addl	$32, %eax
	movl	%eax, -8(%rbp)
	jmp	.L210
.L214:
	movzwl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
.L210:
	movl	-8(%rbp), %eax
	leave
	ret
.LFE51:
	.size	utolower, .-utolower
.globl readordinal
	.type	readordinal, @function
readordinal:
.LFB52:
	pushq	%rbp
.LCFI119:
	movq	%rsp, %rbp
.LCFI120:
	subq	$576, %rsp
.LCFI121:
	movl	%edi, -548(%rbp)
	movq	%rsi, -560(%rbp)
	movq	%rdx, -568(%rbp)
	movl	%ecx, -572(%rbp)
	movl	-548(%rbp), %edi
	call	checkerr
	movl	-548(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -548(%rbp)
	jne	.L219
	movq	stdin(%rip), %rax
	movq	%rax, -8(%rbp)
.L219:
	movq	-8(%rbp), %rdi
	call	skipspaces
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edi
	movl	$0, %eax
	call	tolower
	movw	%ax, -18(%rbp)
	movw	$0, -544(%rbp)
	movl	$0, -12(%rbp)
	movzwl	-18(%rbp), %eax
	cmpw	$122, %ax
	ja	.L221
	movzwl	-18(%rbp), %eax
	cmpw	$96, %ax
	jbe	.L221
	jmp	.L224
.L225:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movzwl	-18(%rbp), %edx
	cltq
	movw	%dx, -544(%rbp,%rax,2)
	movzwl	-544(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -544(%rbp)
	addl	$1, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1, %eax
	cltq
	movw	$0, -544(%rbp,%rax,2)
	leaq	-18(%rbp), %rsi
	movl	-548(%rbp), %edi
	call	readchar
	movzwl	-18(%rbp), %eax
	movzwl	%ax, %edi
	call	utolower
	movw	%ax, -18(%rbp)
.L224:
	movzwl	-18(%rbp), %eax
	cmpw	$122, %ax
	ja	.L226
	movzwl	-18(%rbp), %eax
	cmpw	$96, %ax
	ja	.L228
.L226:
	movzwl	-18(%rbp), %eax
	cmpw	$57, %ax
	ja	.L221
	movzwl	-18(%rbp), %eax
	cmpw	$47, %ax
	jbe	.L221
.L228:
	cmpl	$253, -12(%rbp)
	jle	.L225
.L221:
	movzwl	-18(%rbp), %eax
	movzwl	%ax, %edi
	movq	-8(%rbp), %rsi
	call	ungetc
	movl	$0, -16(%rbp)
	jmp	.L230
.L231:
	movl	-16(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	-568(%rbp), %rax
	movq	(%rax), %rsi
	leaq	-544(%rbp), %rdi
	movl	$0, %eax
	call	cstringcompare
	testl	%eax, %eax
	jne	.L232
	cmpl	$255, -572(%rbp)
	jg	.L234
	movl	-16(%rbp), %eax
	movl	%eax, %edx
	movq	-560(%rbp), %rax
	movw	%dx, (%rax)
	jmp	.L238
.L234:
	movq	-560(%rbp), %rax
	movl	-16(%rbp), %edx
	movw	%dx, (%rax)
	jmp	.L238
.L232:
	addl	$1, -16(%rbp)
.L230:
	movl	-16(%rbp), %eax
	cmpl	-572(%rbp), %eax
	jl	.L231
	movl	$301, iores(%rip)
.L238:
	leave
	ret
.LFE52:
	.size	readordinal, .-readordinal
.globl setcmprtl
	.type	setcmprtl, @function
setcmprtl:
.LFB53:
	pushq	%rbp
.LCFI122:
	movq	%rsp, %rbp
.LCFI123:
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movl	$1, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L240
.L241:
	movl	-32(%rbp), %eax
	cltq
	addq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al,%eax
	movl	%eax, -28(%rbp)
	movl	-32(%rbp), %eax
	cltq
	addq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al,%eax
	movl	%eax, -24(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-24(%rbp), %eax
	je	.L242
	movl	$0, -12(%rbp)
.L242:
	movl	-24(%rbp), %eax
	notl	%eax
	andl	-28(%rbp), %eax
	testl	%eax, %eax
	je	.L244
	movl	$1, -4(%rbp)
.L244:
	movl	-28(%rbp), %eax
	notl	%eax
	andl	-24(%rbp), %eax
	testl	%eax, %eax
	je	.L246
	movl	$1, -8(%rbp)
.L246:
	addl	$1, -32(%rbp)
.L240:
	movl	-32(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L241
	cmpl	$0, -12(%rbp)
	je	.L249
	movl	$0, -56(%rbp)
	jmp	.L251
.L249:
	movl	-8(%rbp), %eax
	andl	-4(%rbp), %eax
	testl	%eax, %eax
	je	.L252
	movl	$2, -56(%rbp)
	jmp	.L251
.L252:
	cmpl	$0, -4(%rbp)
	je	.L254
	movl	$1, -56(%rbp)
	jmp	.L251
.L254:
	movl	$-1, -56(%rbp)
.L251:
	movl	-56(%rbp), %eax
	leave
	ret
.LFE53:
	.size	setcmprtl, .-setcmprtl
.globl cstringcompare
	.type	cstringcompare, @function
cstringcompare:
.LFB54:
	pushq	%rbp
.LCFI124:
	movq	%rsp, %rbp
.LCFI125:
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, -4(%rbp)
	movq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	cmpl	-4(%rbp), %eax
	jge	.L258
	movq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, -4(%rbp)
.L258:
	movl	$1, -8(%rbp)
	jmp	.L260
.L261:
	movl	-8(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	-24(%rbp), %rax
	movzwl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	cmpw	%ax, %dx
	jae	.L262
	movl	$-1, -36(%rbp)
	jmp	.L264
.L262:
	movl	-8(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	-24(%rbp), %rax
	movzwl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	cmpw	%ax, %dx
	jbe	.L265
	movl	$1, -36(%rbp)
	jmp	.L264
.L265:
	addl	$1, -8(%rbp)
.L260:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.L261
	movq	-24(%rbp), %rax
	movzwl	(%rax), %edx
	movq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	cmpw	%ax, %dx
	jae	.L268
	movl	$-1, -36(%rbp)
	jmp	.L264
.L268:
	movq	-24(%rbp), %rax
	movzwl	(%rax), %edx
	movq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	cmpw	%ax, %dx
	jbe	.L270
	movl	$1, -36(%rbp)
	jmp	.L264
.L270:
	movl	$0, -36(%rbp)
.L264:
	movl	-36(%rbp), %eax
	leave
	ret
.LFE54:
	.size	cstringcompare, .-cstringcompare
	.section	.rodata
.LC7:
	.string	"error in reading a boolean"
	.text
.globl readbool
	.type	readbool, @function
readbool:
.LFB55:
	pushq	%rbp
.LCFI126:
	movq	%rsp, %rbp
.LCFI127:
	subq	$32, %rsp
.LCFI128:
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L274
	movq	stdin(%rip), %rax
	movq	%rax, -8(%rbp)
.L274:
	movq	-8(%rbp), %rdi
	call	skipspaces
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edi
	movl	$0, %eax
	call	toupper
	movb	%al, -9(%rbp)
	cmpb	$70, -9(%rbp)
	jne	.L276
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edi
	movl	$0, %eax
	call	toupper
	cmpl	$65, %eax
	jne	.L284
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edi
	movl	$0, %eax
	call	toupper
	cmpl	$76, %eax
	jne	.L284
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edi
	movl	$0, %eax
	call	toupper
	cmpl	$83, %eax
	jne	.L284
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edi
	movl	$0, %eax
	call	toupper
	cmpl	$69, %eax
	jne	.L284
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
	jmp	.L289
.L276:
	cmpb	$84, -9(%rbp)
	jne	.L284
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edi
	movl	$0, %eax
	call	toupper
	cmpl	$82, %eax
	jne	.L284
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edi
	movl	$0, %eax
	call	toupper
	cmpl	$85, %eax
	jne	.L284
	movq	-8(%rbp), %rdi
	call	_IO_getc
	movl	%eax, %edi
	movl	$0, %eax
	call	toupper
	cmpl	$69, %eax
	jne	.L284
	movq	-32(%rbp), %rax
	movb	$1, (%rax)
	jmp	.L289
.L284:
	movl	$.LC7, %edi
	call	pascalerror
.L289:
	leave
	ret
.LFE55:
	.size	readbool, .-readbool
	.section	.rodata
.LC8:
	.string	" true"
.LC9:
	.string	"false"
	.text
.globl printbool
	.type	printbool, @function
printbool:
.LFB56:
	pushq	%rbp
.LCFI129:
	movq	%rsp, %rbp
.LCFI130:
	subq	$32, %rsp
.LCFI131:
	movl	%edi, -20(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movb	%sil, -24(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$5, -28(%rbp)
	jle	.L291
	movl	-28(%rbp), %esi
	subl	$5, %esi
	movl	-20(%rbp), %edi
	call	printspaces
.L291:
	cmpl	$0, -20(%rbp)
	jne	.L293
	cmpb	$0, -24(%rbp)
	je	.L295
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	jmp	.L301
.L295:
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	jmp	.L301
.L293:
	cmpb	$0, -24(%rbp)
	je	.L299
	movq	-8(%rbp), %rcx
	movl	$5, %edx
	movl	$1, %esi
	movl	$.LC8, %edi
	call	fwrite
	jmp	.L301
.L299:
	movq	-8(%rbp), %rcx
	movl	$5, %edx
	movl	$1, %esi
	movl	$.LC9, %edi
	call	fwrite
.L301:
	leave
	ret
.LFE56:
	.size	printbool, .-printbool
	.section	.rodata
.LC10:
	.string	"%d"
	.text
.globl readint
	.type	readint, @function
readint:
.LFB57:
	pushq	%rbp
.LCFI132:
	movq	%rsp, %rbp
.LCFI133:
	subq	$32, %rsp
.LCFI134:
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L303
	movq	stdin(%rip), %rax
	movq	%rax, -8(%rbp)
.L303:
	movq	-32(%rbp), %rdx
	movq	-8(%rbp), %rdi
	movl	$.LC10, %esi
	movl	$0, %eax
	call	fscanf
	leave
	ret
.LFE57:
	.size	readint, .-readint
.globl readbyte
	.type	readbyte, @function
readbyte:
.LFB58:
	pushq	%rbp
.LCFI135:
	movq	%rsp, %rbp
.LCFI136:
	subq	$32, %rsp
.LCFI137:
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	leaq	-4(%rbp), %rsi
	movl	-20(%rbp), %edi
	call	readint
	movl	-4(%rbp), %eax
	testl	%eax, %eax
	js	.L307
	movl	-4(%rbp), %eax
	cmpl	$255, %eax
	jg	.L307
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
.L307:
	movl	-4(%rbp), %eax
	testl	%eax, %eax
	jns	.L310
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
.L310:
	movl	-4(%rbp), %eax
	cmpl	$255, %eax
	jle	.L314
	movq	-32(%rbp), %rax
	movb	$-1, (%rax)
.L314:
	leave
	ret
.LFE58:
	.size	readbyte, .-readbyte
	.section	.rodata
.LC11:
	.string	"%c%dld"
	.text
.globl printint64
	.type	printint64, @function
printint64:
.LFB59:
	pushq	%rbp
.LCFI138:
	movq	%rsp, %rbp
.LCFI139:
	subq	$272, %rsp
.LCFI140:
	movl	%edi, -244(%rbp)
	movq	%rsi, -256(%rbp)
	movl	%edx, -260(%rbp)
	movl	%ecx, -264(%rbp)
	movl	-244(%rbp), %edi
	call	checkerr
	movl	-244(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-260(%rbp), %ecx
	leaq	-240(%rbp), %rdi
	movl	$37, %edx
	movl	$.LC11, %esi
	movl	$0, %eax
	call	sprintf
	cmpl	$0, -244(%rbp)
	jne	.L316
	movl	-260(%rbp), %edx
	movq	-256(%rbp), %rsi
	leaq	-240(%rbp), %rdi
	movl	$0, %eax
	call	printf
	jmp	.L319
.L316:
	movl	-260(%rbp), %ecx
	movq	-256(%rbp), %rdx
	leaq	-240(%rbp), %rsi
	movq	-8(%rbp), %rdi
	movl	$0, %eax
	call	fprintf
.L319:
	leave
	ret
.LFE59:
	.size	printint64, .-printint64
	.section	.rodata
.LC12:
	.string	"%c%dd"
	.text
.globl printint
	.type	printint, @function
printint:
.LFB60:
	pushq	%rbp
.LCFI141:
	movq	%rsp, %rbp
.LCFI142:
	subq	$256, %rsp
.LCFI143:
	movl	%edi, -244(%rbp)
	movl	%esi, -248(%rbp)
	movl	%edx, -252(%rbp)
	movl	%ecx, -256(%rbp)
	movl	-244(%rbp), %edi
	call	checkerr
	movl	-244(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-252(%rbp), %ecx
	leaq	-240(%rbp), %rdi
	movl	$37, %edx
	movl	$.LC12, %esi
	movl	$0, %eax
	call	sprintf
	cmpl	$0, -244(%rbp)
	jne	.L321
	movl	-248(%rbp), %esi
	leaq	-240(%rbp), %rdi
	movl	$0, %eax
	call	printf
	jmp	.L324
.L321:
	movl	-248(%rbp), %edx
	leaq	-240(%rbp), %rsi
	movq	-8(%rbp), %rdi
	movl	$0, %eax
	call	fprintf
.L324:
	leave
	ret
.LFE60:
	.size	printint, .-printint
	.section	.rodata
.LC13:
	.string	"%f"
	.text
.globl readreal
	.type	readreal, @function
readreal:
.LFB61:
	pushq	%rbp
.LCFI144:
	movq	%rsp, %rbp
.LCFI145:
	subq	$32, %rsp
.LCFI146:
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-20(%rbp), %edi
	call	checkerr
	movl	-20(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L326
	movq	stdin(%rip), %rax
	movq	%rax, -8(%rbp)
.L326:
	movq	-32(%rbp), %rdx
	movq	-8(%rbp), %rdi
	movl	$.LC13, %esi
	movl	$0, %eax
	call	fscanf
	leave
	ret
.LFE61:
	.size	readreal, .-readreal
	.section	.rodata
.LC14:
	.string	"%c%d.%dg"
.LC15:
	.string	"%c%d.%df"
	.text
.globl printdouble
	.type	printdouble, @function
printdouble:
.LFB62:
	pushq	%rbp
.LCFI147:
	movq	%rsp, %rbp
.LCFI148:
	subq	$288, %rsp
.LCFI149:
	movl	%edi, -244(%rbp)
	movsd	%xmm0, -256(%rbp)
	movl	%esi, -260(%rbp)
	movl	%edx, -264(%rbp)
	movl	-244(%rbp), %edi
	call	checkerr
	movl	-244(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	salq	$5, %rdx
	addq	%rdx, %rax
	movq	files(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpl	$0, -264(%rbp)
	jne	.L330
	movl	-260(%rbp), %ecx
	leaq	-240(%rbp), %rdi
	movl	$6, %r8d
	movl	$37, %edx
	movl	$.LC14, %esi
	movl	$0, %eax
	call	sprintf
	jmp	.L332
.L330:
	movl	-264(%rbp), %eax
	movl	-260(%rbp), %ecx
	leaq	-240(%rbp), %rdi
	movl	%eax, %r8d
	movl	$37, %edx
	movl	$.LC15, %esi
	movl	$0, %eax
	call	sprintf
.L332:
	cmpl	$0, -244(%rbp)
	jne	.L333
	movq	-256(%rbp), %rax
	leaq	-240(%rbp), %rdi
	movq	%rax, -280(%rbp)
	movsd	-280(%rbp), %xmm0
	movl	$1, %eax
	call	printf
	jmp	.L336
.L333:
	movq	-256(%rbp), %rax
	leaq	-240(%rbp), %rsi
	movq	-8(%rbp), %rdi
	movq	%rax, -280(%rbp)
	movsd	-280(%rbp), %xmm0
	movl	$1, %eax
	call	fprintf
.L336:
	leave
	ret
.LFE62:
	.size	printdouble, .-printdouble
.globl printreal
	.type	printreal, @function
printreal:
.LFB63:
	pushq	%rbp
.LCFI150:
	movq	%rsp, %rbp
.LCFI151:
	subq	$48, %rsp
.LCFI152:
	movl	%edi, -20(%rbp)
	movss	%xmm0, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movss	-24(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %esi
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edi
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	call	printdouble
	leave
	ret
.LFE63:
	.size	printreal, .-printreal
.globl cstringassign
	.type	cstringassign, @function
cstringassign:
.LFB64:
	pushq	%rbp
.LCFI153:
	movq	%rsp, %rbp
.LCFI154:
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -8(%rbp)
	movq	-40(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	cmpl	-8(%rbp), %eax
	jge	.L340
	movq	-40(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, -8(%rbp)
.L340:
	movl	-8(%rbp), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movw	%dx, (%rax)
	movl	$1, -4(%rbp)
	jmp	.L342
.L343:
	movl	-4(%rbp), %eax
	cltq
	addq	%rax, %rax
	movq	%rax, %rdx
	addq	-24(%rbp), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	-40(%rbp), %rax
	movzwl	(%rax), %eax
	movw	%ax, (%rdx)
	addl	$1, -4(%rbp)
.L342:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L343
	leave
	ret
.LFE64:
	.size	cstringassign, .-cstringassign
.globl stringappend
	.type	stringappend, @function
stringappend:
.LFB65:
	pushq	%rbp
.LCFI155:
	movq	%rsp, %rbp
.LCFI156:
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edx
	movl	-28(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, -8(%rbp)
	movq	-40(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	cmpl	-8(%rbp), %eax
	jge	.L347
	movq	-40(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movl	%eax, -8(%rbp)
.L347:
	movq	-24(%rbp), %rax
	movzwl	(%rax), %edx
	movl	-8(%rbp), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movw	%dx, (%rax)
	movl	$1, -4(%rbp)
	jmp	.L349
.L350:
	movl	-4(%rbp), %eax
	addl	-12(%rbp), %eax
	cltq
	addq	%rax, %rax
	movq	%rax, %rdx
	addq	-24(%rbp), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	-40(%rbp), %rax
	movzwl	(%rax), %eax
	movw	%ax, (%rdx)
	addl	$1, -4(%rbp)
.L349:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L350
	leave
	ret
.LFE65:
	.size	stringappend, .-stringappend
.globl gettime
	.type	gettime, @function
gettime:
.LFB66:
	pushq	%rbp
.LCFI157:
	movq	%rsp, %rbp
.LCFI158:
	pushq	%rbx
.LCFI159:
	subq	$136, %rsp
.LCFI160:
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movq	%rcx, -112(%rbp)
	leaq	-80(%rbp), %rsi
	leaq	-64(%rbp), %rdi
	call	gettimeofday
	movq	-64(%rbp), %rcx
	movl	$-2004318071, -136(%rbp)
	movl	$-2004318072, -132(%rbp)
	movq	-136(%rbp), %rax
	imulq	%rcx
	leaq	(%rdx,%rcx), %rax
	movq	%rax, %rdx
	sarq	$5, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	%rdx, %rbx
	subq	%rax, %rbx
	movq	%rbx, -128(%rbp)
	movq	-128(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	movq	%rcx, %rdx
	subq	%rax, %rdx
	movq	%rdx, -128(%rbp)
	movl	-128(%rbp), %edx
	movq	-104(%rbp), %rax
	movl	%edx, (%rax)
	movq	-64(%rbp), %rcx
	movl	$-2004318071, -136(%rbp)
	movl	$-2004318072, -132(%rbp)
	movq	-136(%rbp), %rax
	imulq	%rcx
	leaq	(%rdx,%rcx), %rax
	movq	%rax, %rdx
	sarq	$5, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	%rdx, %rcx
	subq	%rax, %rcx
	movl	$-2004318071, -136(%rbp)
	movl	$-2004318072, -132(%rbp)
	movq	-136(%rbp), %rax
	imulq	%rcx
	leaq	(%rdx,%rcx), %rax
	movq	%rax, %rdx
	sarq	$5, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	%rdx, %rbx
	subq	%rax, %rbx
	movq	%rbx, -120(%rbp)
	movq	-120(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	%rdx, %rax
	salq	$4, %rax
	subq	%rdx, %rax
	movq	%rcx, %rdx
	subq	%rax, %rdx
	movq	%rdx, -120(%rbp)
	movl	-120(%rbp), %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movq	-64(%rbp), %rcx
	movl	$1794341893, -136(%rbp)
	movl	$1221679586, -132(%rbp)
	movq	-136(%rbp), %rax
	imulq	%rcx
	sarq	$10, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	%rdx, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	movl	%eax, %edx
	movq	-88(%rbp), %rax
	movl	%edx, (%rax)
	movq	-56(%rbp), %rcx
	movl	$948328779, -136(%rbp)
	movl	$879609302, -132(%rbp)
	movq	-136(%rbp), %rax
	imulq	%rcx
	sarq	$11, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	%rdx, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	movl	%eax, %edx
	movq	-112(%rbp), %rax
	movl	%edx, (%rax)
	addq	$136, %rsp
	popq	%rbx
	leave
	ret
.LFE66:
	.size	gettime, .-gettime
	.section	.rodata
	.align 8
.LC16:
	.long	0
	.long	1078853632
	.align 8
.LC17:
	.long	1202590843
	.long	1065646817
	.text
.globl secs
	.type	secs, @function
secs:
.LFB67:
	pushq	%rbp
.LCFI161:
	movq	%rsp, %rbp
.LCFI162:
	subq	$48, %rsp
.LCFI163:
	leaq	-24(%rbp), %rcx
	leaq	-20(%rbp), %rdx
	leaq	-16(%rbp), %rsi
	leaq	-12(%rbp), %rdi
	call	gettime
	movl	-12(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LC16(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movl	-16(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	addsd	%xmm0, %xmm1
	movsd	.LC16(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movl	-20(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	movapd	%xmm1, %xmm2
	addsd	%xmm0, %xmm2
	movl	-24(%rbp), %eax
	cvtsi2sd	%eax, %xmm1
	movsd	.LC17(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	leave
	ret
.LFE67:
	.size	secs, .-secs
.globl doinitvec
	.type	doinitvec, @function
doinitvec:
.LFB68:
	pushq	%rbp
.LCFI164:
	movq	%rsp, %rbp
.LCFI165:
	subq	$112, %rsp
.LCFI166:
	movq	%rdi, -88(%rbp)
	movl	%esi, -92(%rbp)
	movl	%edx, -96(%rbp)
	movl	%ecx, -100(%rbp)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-96(%rbp), %eax
	cltq
	movq	%rax, -40(%rbp)
	movl	-92(%rbp), %eax
	cltq
	movq	%rax, -64(%rbp)
	jmp	.L358
.L359:
	movq	-64(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -56(%rbp)
	movq	-8(%rbp), %rcx
	addq	$8, %rcx
	movq	-56(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rcx
	addq	$16, %rcx
	movq	-56(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rax
	leaq	1(%rax), %rdx
	movq	-40(%rbp), %rax
	imulq	%rdx, %rax
	movq	%rax, -40(%rbp)
	movq	-56(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	addq	-8(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, (%rdx)
	subq	$1, -64(%rbp)
.L358:
	cmpq	$0, -64(%rbp)
	jg	.L359
	cmpl	$0, -100(%rbp)
	jne	.L361
	movl	-92(%rbp), %eax
	movslq	%eax,%rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	addq	-48(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	$0, -64(%rbp)
	jmp	.L363
.L364:
	movq	-64(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdx
	addq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	salq	$3, %rax
	addq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	addq	$1, -64(%rbp)
.L363:
	movl	-92(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	cltq
	cmpq	-64(%rbp), %rax
	jg	.L364
	movq	-88(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rdi
	call	free
	jmp	.L367
.L361:
	movq	-40(%rbp), %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
.L367:
	leave
	ret
.LFE68:
	.size	doinitvec, .-doinitvec
.globl initvec
	.type	initvec, @function
initvec:
.LFB69:
	pushq	%rbp
.LCFI167:
	movq	%rsp, %rbp
.LCFI168:
	subq	$16, %rsp
.LCFI169:
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %esi
	movq	-8(%rbp), %rdi
	movl	$0, %ecx
	call	doinitvec
	leave
	ret
.LFE69:
	.size	initvec, .-initvec
.globl delphiinitvec
	.type	delphiinitvec, @function
delphiinitvec:
.LFB70:
	pushq	%rbp
.LCFI170:
	movq	%rsp, %rbp
.LCFI171:
	subq	$16, %rsp
.LCFI172:
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %esi
	leaq	-8(%rbp), %rdi
	movl	$1, %ecx
	call	doinitvec
	leave
	ret
.LFE70:
	.size	delphiinitvec, .-delphiinitvec
.globl getmem
	.type	getmem, @function
getmem:
.LFB71:
	pushq	%rbp
.LCFI173:
	movq	%rsp, %rbp
.LCFI174:
	subq	$16, %rsp
.LCFI175:
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax,%rdi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	leave
	ret
.LFE71:
	.size	getmem, .-getmem
.globl freemem
	.type	freemem, @function
freemem:
.LFB72:
	pushq	%rbp
.LCFI176:
	movq	%rsp, %rbp
.LCFI177:
	subq	$16, %rsp
.LCFI178:
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	call	free
	leave
	ret
.LFE72:
	.size	freemem, .-freemem
	.section	.rodata
.LC18:
	.string	"%x"
	.text
.globl printpointer
	.type	printpointer, @function
printpointer:
.LFB73:
	pushq	%rbp
.LCFI179:
	movq	%rsp, %rbp
.LCFI180:
	subq	$16, %rsp
.LCFI181:
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %esi
	movl	$.LC18, %edi
	movl	$0, %eax
	call	printf
	leave
	ret
.LFE73:
	.size	printpointer, .-printpointer
.globl pdispose
	.type	pdispose, @function
pdispose:
.LFB74:
	pushq	%rbp
.LCFI182:
	movq	%rsp, %rbp
.LCFI183:
	subq	$16, %rsp
.LCFI184:
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	call	free
	leave
	ret
.LFE74:
	.size	pdispose, .-pdispose
	.section	.rodata
.LC19:
	.string	"bounds fault"
	.text
.globl boundsfault
	.type	boundsfault, @function
boundsfault:
.LFB75:
	pushq	%rbp
.LCFI185:
	movq	%rsp, %rbp
.LCFI186:
	subq	$16, %rsp
.LCFI187:
	movl	%edi, -4(%rbp)
	cmpl	$261, -4(%rbp)
	jne	.L381
	movl	$.LC19, %edi
	call	puts
.L381:
	movl	$6, %edi
	call	raise
	leave
	ret
.LFE75:
	.size	boundsfault, .-boundsfault
.globl createdset
	.type	createdset, @function
createdset:
.LFB76:
	pushq	%rbp
.LCFI188:
	movq	%rsp, %rbp
.LCFI189:
	subq	$80, %rsp
.LCFI190:
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-80(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -44(%rbp)
	movq	-80(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	movl	%eax, -48(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L385
.L386:
	movl	-40(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-80(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	-44(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	cmovle	-12(%rbp), %eax
	movl	%eax, -44(%rbp)
	movq	-80(%rbp), %rdx
	addq	$4, %rdx
	movl	-40(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	(%rdx,%rax), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	cmpl	%eax, -48(%rbp)
	cmovge	-48(%rbp), %eax
	movl	%eax, -48(%rbp)
	addl	$2, -40(%rbp)
.L385:
	movl	-40(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L386
	movl	-44(%rbp), %eax
	andl	$-8, %eax
	movl	%eax, -28(%rbp)
	movl	-48(%rbp), %eax
	orl	$7, %eax
	movl	%eax, -32(%rbp)
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %eax
	subl	%edx, %eax
	leal	7(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	movslq	%eax,%rdi
	call	malloc
	movq	%rax, -56(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L388
.L389:
	movl	-40(%rbp), %eax
	cltq
	addq	-56(%rbp), %rax
	movb	$0, (%rax)
	addl	$1, -40(%rbp)
.L388:
	movl	-40(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L389
	movl	$0, -40(%rbp)
	jmp	.L391
.L392:
	movl	-40(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-80(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -36(%rbp)
	jmp	.L393
.L394:
	movl	-28(%rbp), %edx
	movl	-36(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	sarl	$3, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	cltq
	movq	%rax, %rsi
	addq	-56(%rbp), %rsi
	movl	-16(%rbp), %eax
	cltq
	addq	-56(%rbp), %rax
	movzbl	(%rax), %edx
	movl	-20(%rbp), %ecx
	andl	$7, %ecx
	movl	$1, %eax
	sall	%cl, %eax
	orl	%edx, %eax
	movb	%al, (%rsi)
	addl	$1, -36(%rbp)
.L393:
	movq	-80(%rbp), %rdx
	addq	$4, %rdx
	movl	-40(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	(%rdx,%rax), %rax
	movl	(%rax), %eax
	cmpl	-36(%rbp), %eax
	jge	.L394
	addl	$2, -40(%rbp)
.L391:
	movl	-40(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L392
	movl	$24, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movl	-32(%rbp), %eax
	movl	%eax, 4(%rdx)
	movq	-8(%rbp), %rdx
	movl	-28(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, 16(%rdx)
	movq	-8(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
.LFE76:
	.size	createdset, .-createdset
.globl cround
	.type	cround, @function
cround:
.LFB77:
	pushq	%rbp
.LCFI191:
	movq	%rsp, %rbp
.LCFI192:
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	cvttss2si	%xmm0, %eax
	leave
	ret
.LFE77:
	.size	cround, .-cround
.globl grabstack
	.type	grabstack, @function
grabstack:
.LFB78:
	pushq	%rbp
.LCFI193:
	movq	%rsp, %rbp
.LCFI194:
	subq	$3999896, %rsp
.LCFI195:
	leave
	ret
.LFE78:
	.size	grabstack, .-grabstack
.globl paramcount
	.type	paramcount, @function
paramcount:
.LFB79:
	pushq	%rbp
.LCFI196:
	movq	%rsp, %rbp
.LCFI197:
	movl	Argc(%rip), %eax
	leave
	ret
.LFE79:
	.size	paramcount, .-paramcount
.globl parampntr
	.type	parampntr, @function
parampntr:
.LFB80:
	pushq	%rbp
.LCFI198:
	movq	%rsp, %rbp
.LCFI199:
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	movq	Argv(%rip), %rax
	leaq	(%rdx,%rax), %rax
	movq	(%rax), %rax
	leave
	ret
.LFE80:
	.size	parampntr, .-parampntr
.globl main
	.type	main, @function
main:
.LFB81:
	pushq	%rbp
.LCFI200:
	movq	%rsp, %rbp
.LCFI201:
	subq	$16, %rsp
.LCFI202:
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, Argc(%rip)
	movq	-16(%rbp), %rax
	movq	%rax, Argv(%rip)
	movl	$0, %eax
	call	initfs
	movl	$0, %eax
	call	Pmain
	movl	$0, %edi
	call	pascalexit
	leave
	ret
.LFE81:
	.size	main, .-main
	.comm	files,8448,32
	.comm	Argc,4,4
	.comm	Argv,8,8
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0x0
	.byte	0x1
	.string	"zR"
	.uleb128 0x1
	.sleb128 -8
	.byte	0x10
	.uleb128 0x1
	.byte	0x3
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x1
	.align 8
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.long	.LFB9
	.long	.LFE9-.LFB9
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI0-.LFB9
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE1:
.LSFDE3:
	.long	.LEFDE3-.LASFDE3
.LASFDE3:
	.long	.LASFDE3-.Lframe1
	.long	.LFB10
	.long	.LFE10-.LFB10
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI2-.LFB10
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE3:
.LSFDE5:
	.long	.LEFDE5-.LASFDE5
.LASFDE5:
	.long	.LASFDE5-.Lframe1
	.long	.LFB11
	.long	.LFE11-.LFB11
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI4-.LFB11
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE5:
.LSFDE7:
	.long	.LEFDE7-.LASFDE7
.LASFDE7:
	.long	.LASFDE7-.Lframe1
	.long	.LFB12
	.long	.LFE12-.LFB12
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI6-.LFB12
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE7:
.LSFDE9:
	.long	.LEFDE9-.LASFDE9
.LASFDE9:
	.long	.LASFDE9-.Lframe1
	.long	.LFB13
	.long	.LFE13-.LFB13
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI9-.LFB13
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE9:
.LSFDE11:
	.long	.LEFDE11-.LASFDE11
.LASFDE11:
	.long	.LASFDE11-.Lframe1
	.long	.LFB14
	.long	.LFE14-.LFB14
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI12-.LFB14
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE11:
.LSFDE13:
	.long	.LEFDE13-.LASFDE13
.LASFDE13:
	.long	.LASFDE13-.Lframe1
	.long	.LFB15
	.long	.LFE15-.LFB15
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI14-.LFB15
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI15-.LCFI14
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE13:
.LSFDE15:
	.long	.LEFDE15-.LASFDE15
.LASFDE15:
	.long	.LASFDE15-.Lframe1
	.long	.LFB16
	.long	.LFE16-.LFB16
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI17-.LFB16
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE15:
.LSFDE17:
	.long	.LEFDE17-.LASFDE17
.LASFDE17:
	.long	.LASFDE17-.Lframe1
	.long	.LFB17
	.long	.LFE17-.LFB17
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI20-.LFB17
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE17:
.LSFDE19:
	.long	.LEFDE19-.LASFDE19
.LASFDE19:
	.long	.LASFDE19-.Lframe1
	.long	.LFB18
	.long	.LFE18-.LFB18
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI22-.LFB18
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE19:
.LSFDE21:
	.long	.LEFDE21-.LASFDE21
.LASFDE21:
	.long	.LASFDE21-.Lframe1
	.long	.LFB19
	.long	.LFE19-.LFB19
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI25-.LFB19
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE21:
.LSFDE23:
	.long	.LEFDE23-.LASFDE23
.LASFDE23:
	.long	.LASFDE23-.Lframe1
	.long	.LFB20
	.long	.LFE20-.LFB20
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI28-.LFB20
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI29-.LCFI28
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE23:
.LSFDE25:
	.long	.LEFDE25-.LASFDE25
.LASFDE25:
	.long	.LASFDE25-.Lframe1
	.long	.LFB21
	.long	.LFE21-.LFB21
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI30-.LFB21
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI31-.LCFI30
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE25:
.LSFDE27:
	.long	.LEFDE27-.LASFDE27
.LASFDE27:
	.long	.LASFDE27-.Lframe1
	.long	.LFB22
	.long	.LFE22-.LFB22
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI32-.LFB22
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI33-.LCFI32
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE27:
.LSFDE29:
	.long	.LEFDE29-.LASFDE29
.LASFDE29:
	.long	.LASFDE29-.Lframe1
	.long	.LFB23
	.long	.LFE23-.LFB23
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI35-.LFB23
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI36-.LCFI35
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE29:
.LSFDE31:
	.long	.LEFDE31-.LASFDE31
.LASFDE31:
	.long	.LASFDE31-.Lframe1
	.long	.LFB24
	.long	.LFE24-.LFB24
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI38-.LFB24
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI39-.LCFI38
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE31:
.LSFDE33:
	.long	.LEFDE33-.LASFDE33
.LASFDE33:
	.long	.LASFDE33-.Lframe1
	.long	.LFB25
	.long	.LFE25-.LFB25
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI41-.LFB25
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI42-.LCFI41
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE33:
.LSFDE35:
	.long	.LEFDE35-.LASFDE35
.LASFDE35:
	.long	.LASFDE35-.Lframe1
	.long	.LFB26
	.long	.LFE26-.LFB26
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI44-.LFB26
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI45-.LCFI44
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE35:
.LSFDE37:
	.long	.LEFDE37-.LASFDE37
.LASFDE37:
	.long	.LASFDE37-.Lframe1
	.long	.LFB27
	.long	.LFE27-.LFB27
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI47-.LFB27
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI48-.LCFI47
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE37:
.LSFDE39:
	.long	.LEFDE39-.LASFDE39
.LASFDE39:
	.long	.LASFDE39-.Lframe1
	.long	.LFB28
	.long	.LFE28-.LFB28
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI50-.LFB28
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI51-.LCFI50
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE39:
.LSFDE41:
	.long	.LEFDE41-.LASFDE41
.LASFDE41:
	.long	.LASFDE41-.Lframe1
	.long	.LFB29
	.long	.LFE29-.LFB29
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI53-.LFB29
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI54-.LCFI53
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI56-.LCFI54
	.byte	0x83
	.uleb128 0x3
	.align 8
.LEFDE41:
.LSFDE43:
	.long	.LEFDE43-.LASFDE43
.LASFDE43:
	.long	.LASFDE43-.Lframe1
	.long	.LFB30
	.long	.LFE30-.LFB30
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI57-.LFB30
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI58-.LCFI57
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI60-.LCFI58
	.byte	0x83
	.uleb128 0x3
	.align 8
.LEFDE43:
.LSFDE45:
	.long	.LEFDE45-.LASFDE45
.LASFDE45:
	.long	.LASFDE45-.Lframe1
	.long	.LFB31
	.long	.LFE31-.LFB31
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI61-.LFB31
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI62-.LCFI61
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI64-.LCFI62
	.byte	0x83
	.uleb128 0x3
	.align 8
.LEFDE45:
.LSFDE47:
	.long	.LEFDE47-.LASFDE47
.LASFDE47:
	.long	.LASFDE47-.Lframe1
	.long	.LFB32
	.long	.LFE32-.LFB32
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI65-.LFB32
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI66-.LCFI65
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE47:
.LSFDE49:
	.long	.LEFDE49-.LASFDE49
.LASFDE49:
	.long	.LASFDE49-.Lframe1
	.long	.LFB33
	.long	.LFE33-.LFB33
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI67-.LFB33
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI68-.LCFI67
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE49:
.LSFDE51:
	.long	.LEFDE51-.LASFDE51
.LASFDE51:
	.long	.LASFDE51-.Lframe1
	.long	.LFB34
	.long	.LFE34-.LFB34
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI70-.LFB34
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI71-.LCFI70
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE51:
.LSFDE53:
	.long	.LEFDE53-.LASFDE53
.LASFDE53:
	.long	.LASFDE53-.Lframe1
	.long	.LFB35
	.long	.LFE35-.LFB35
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI72-.LFB35
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI73-.LCFI72
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE53:
.LSFDE55:
	.long	.LEFDE55-.LASFDE55
.LASFDE55:
	.long	.LASFDE55-.Lframe1
	.long	.LFB36
	.long	.LFE36-.LFB36
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI75-.LFB36
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI76-.LCFI75
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE55:
.LSFDE57:
	.long	.LEFDE57-.LASFDE57
.LASFDE57:
	.long	.LASFDE57-.Lframe1
	.long	.LFB37
	.long	.LFE37-.LFB37
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI78-.LFB37
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI79-.LCFI78
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE57:
.LSFDE59:
	.long	.LEFDE59-.LASFDE59
.LASFDE59:
	.long	.LASFDE59-.Lframe1
	.long	.LFB38
	.long	.LFE38-.LFB38
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI80-.LFB38
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI81-.LCFI80
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE59:
.LSFDE61:
	.long	.LEFDE61-.LASFDE61
.LASFDE61:
	.long	.LASFDE61-.Lframe1
	.long	.LFB39
	.long	.LFE39-.LFB39
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI83-.LFB39
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI84-.LCFI83
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE61:
.LSFDE63:
	.long	.LEFDE63-.LASFDE63
.LASFDE63:
	.long	.LASFDE63-.Lframe1
	.long	.LFB40
	.long	.LFE40-.LFB40
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI86-.LFB40
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI87-.LCFI86
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE63:
.LSFDE65:
	.long	.LEFDE65-.LASFDE65
.LASFDE65:
	.long	.LASFDE65-.Lframe1
	.long	.LFB41
	.long	.LFE41-.LFB41
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI89-.LFB41
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI90-.LCFI89
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE65:
.LSFDE67:
	.long	.LEFDE67-.LASFDE67
.LASFDE67:
	.long	.LASFDE67-.Lframe1
	.long	.LFB42
	.long	.LFE42-.LFB42
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI92-.LFB42
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI93-.LCFI92
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE67:
.LSFDE69:
	.long	.LEFDE69-.LASFDE69
.LASFDE69:
	.long	.LASFDE69-.Lframe1
	.long	.LFB43
	.long	.LFE43-.LFB43
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI95-.LFB43
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI96-.LCFI95
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE69:
.LSFDE71:
	.long	.LEFDE71-.LASFDE71
.LASFDE71:
	.long	.LASFDE71-.Lframe1
	.long	.LFB44
	.long	.LFE44-.LFB44
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI98-.LFB44
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI99-.LCFI98
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE71:
.LSFDE73:
	.long	.LEFDE73-.LASFDE73
.LASFDE73:
	.long	.LASFDE73-.Lframe1
	.long	.LFB45
	.long	.LFE45-.LFB45
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI101-.LFB45
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI102-.LCFI101
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE73:
.LSFDE75:
	.long	.LEFDE75-.LASFDE75
.LASFDE75:
	.long	.LASFDE75-.Lframe1
	.long	.LFB46
	.long	.LFE46-.LFB46
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI103-.LFB46
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI104-.LCFI103
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE75:
.LSFDE77:
	.long	.LEFDE77-.LASFDE77
.LASFDE77:
	.long	.LASFDE77-.Lframe1
	.long	.LFB47
	.long	.LFE47-.LFB47
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI105-.LFB47
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI106-.LCFI105
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE77:
.LSFDE79:
	.long	.LEFDE79-.LASFDE79
.LASFDE79:
	.long	.LASFDE79-.Lframe1
	.long	.LFB48
	.long	.LFE48-.LFB48
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI108-.LFB48
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI109-.LCFI108
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE79:
.LSFDE81:
	.long	.LEFDE81-.LASFDE81
.LASFDE81:
	.long	.LASFDE81-.Lframe1
	.long	.LFB49
	.long	.LFE49-.LFB49
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI111-.LFB49
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI112-.LCFI111
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE81:
.LSFDE83:
	.long	.LEFDE83-.LASFDE83
.LASFDE83:
	.long	.LASFDE83-.Lframe1
	.long	.LFB50
	.long	.LFE50-.LFB50
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI114-.LFB50
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI115-.LCFI114
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE83:
.LSFDE85:
	.long	.LEFDE85-.LASFDE85
.LASFDE85:
	.long	.LASFDE85-.Lframe1
	.long	.LFB51
	.long	.LFE51-.LFB51
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI117-.LFB51
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI118-.LCFI117
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE85:
.LSFDE87:
	.long	.LEFDE87-.LASFDE87
.LASFDE87:
	.long	.LASFDE87-.Lframe1
	.long	.LFB52
	.long	.LFE52-.LFB52
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI119-.LFB52
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI120-.LCFI119
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE87:
.LSFDE89:
	.long	.LEFDE89-.LASFDE89
.LASFDE89:
	.long	.LASFDE89-.Lframe1
	.long	.LFB53
	.long	.LFE53-.LFB53
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI122-.LFB53
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI123-.LCFI122
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE89:
.LSFDE91:
	.long	.LEFDE91-.LASFDE91
.LASFDE91:
	.long	.LASFDE91-.Lframe1
	.long	.LFB54
	.long	.LFE54-.LFB54
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI124-.LFB54
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI125-.LCFI124
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE91:
.LSFDE93:
	.long	.LEFDE93-.LASFDE93
.LASFDE93:
	.long	.LASFDE93-.Lframe1
	.long	.LFB55
	.long	.LFE55-.LFB55
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI126-.LFB55
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI127-.LCFI126
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE93:
.LSFDE95:
	.long	.LEFDE95-.LASFDE95
.LASFDE95:
	.long	.LASFDE95-.Lframe1
	.long	.LFB56
	.long	.LFE56-.LFB56
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI129-.LFB56
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI130-.LCFI129
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE95:
.LSFDE97:
	.long	.LEFDE97-.LASFDE97
.LASFDE97:
	.long	.LASFDE97-.Lframe1
	.long	.LFB57
	.long	.LFE57-.LFB57
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI132-.LFB57
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI133-.LCFI132
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE97:
.LSFDE99:
	.long	.LEFDE99-.LASFDE99
.LASFDE99:
	.long	.LASFDE99-.Lframe1
	.long	.LFB58
	.long	.LFE58-.LFB58
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI135-.LFB58
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI136-.LCFI135
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE99:
.LSFDE101:
	.long	.LEFDE101-.LASFDE101
.LASFDE101:
	.long	.LASFDE101-.Lframe1
	.long	.LFB59
	.long	.LFE59-.LFB59
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI138-.LFB59
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI139-.LCFI138
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE101:
.LSFDE103:
	.long	.LEFDE103-.LASFDE103
.LASFDE103:
	.long	.LASFDE103-.Lframe1
	.long	.LFB60
	.long	.LFE60-.LFB60
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI141-.LFB60
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI142-.LCFI141
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE103:
.LSFDE105:
	.long	.LEFDE105-.LASFDE105
.LASFDE105:
	.long	.LASFDE105-.Lframe1
	.long	.LFB61
	.long	.LFE61-.LFB61
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI144-.LFB61
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI145-.LCFI144
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE105:
.LSFDE107:
	.long	.LEFDE107-.LASFDE107
.LASFDE107:
	.long	.LASFDE107-.Lframe1
	.long	.LFB62
	.long	.LFE62-.LFB62
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI147-.LFB62
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI148-.LCFI147
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE107:
.LSFDE109:
	.long	.LEFDE109-.LASFDE109
.LASFDE109:
	.long	.LASFDE109-.Lframe1
	.long	.LFB63
	.long	.LFE63-.LFB63
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI150-.LFB63
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI151-.LCFI150
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE109:
.LSFDE111:
	.long	.LEFDE111-.LASFDE111
.LASFDE111:
	.long	.LASFDE111-.Lframe1
	.long	.LFB64
	.long	.LFE64-.LFB64
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI153-.LFB64
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI154-.LCFI153
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE111:
.LSFDE113:
	.long	.LEFDE113-.LASFDE113
.LASFDE113:
	.long	.LASFDE113-.Lframe1
	.long	.LFB65
	.long	.LFE65-.LFB65
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI155-.LFB65
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI156-.LCFI155
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE113:
.LSFDE115:
	.long	.LEFDE115-.LASFDE115
.LASFDE115:
	.long	.LASFDE115-.Lframe1
	.long	.LFB66
	.long	.LFE66-.LFB66
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI157-.LFB66
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI158-.LCFI157
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI160-.LCFI158
	.byte	0x83
	.uleb128 0x3
	.align 8
.LEFDE115:
.LSFDE117:
	.long	.LEFDE117-.LASFDE117
.LASFDE117:
	.long	.LASFDE117-.Lframe1
	.long	.LFB67
	.long	.LFE67-.LFB67
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI161-.LFB67
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI162-.LCFI161
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE117:
.LSFDE119:
	.long	.LEFDE119-.LASFDE119
.LASFDE119:
	.long	.LASFDE119-.Lframe1
	.long	.LFB68
	.long	.LFE68-.LFB68
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI164-.LFB68
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI165-.LCFI164
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE119:
.LSFDE121:
	.long	.LEFDE121-.LASFDE121
.LASFDE121:
	.long	.LASFDE121-.Lframe1
	.long	.LFB69
	.long	.LFE69-.LFB69
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI167-.LFB69
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI168-.LCFI167
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE121:
.LSFDE123:
	.long	.LEFDE123-.LASFDE123
.LASFDE123:
	.long	.LASFDE123-.Lframe1
	.long	.LFB70
	.long	.LFE70-.LFB70
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI170-.LFB70
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI171-.LCFI170
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE123:
.LSFDE125:
	.long	.LEFDE125-.LASFDE125
.LASFDE125:
	.long	.LASFDE125-.Lframe1
	.long	.LFB71
	.long	.LFE71-.LFB71
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI173-.LFB71
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI174-.LCFI173
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE125:
.LSFDE127:
	.long	.LEFDE127-.LASFDE127
.LASFDE127:
	.long	.LASFDE127-.Lframe1
	.long	.LFB72
	.long	.LFE72-.LFB72
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI176-.LFB72
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI177-.LCFI176
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE127:
.LSFDE129:
	.long	.LEFDE129-.LASFDE129
.LASFDE129:
	.long	.LASFDE129-.Lframe1
	.long	.LFB73
	.long	.LFE73-.LFB73
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI179-.LFB73
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI180-.LCFI179
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE129:
.LSFDE131:
	.long	.LEFDE131-.LASFDE131
.LASFDE131:
	.long	.LASFDE131-.Lframe1
	.long	.LFB74
	.long	.LFE74-.LFB74
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI182-.LFB74
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI183-.LCFI182
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE131:
.LSFDE133:
	.long	.LEFDE133-.LASFDE133
.LASFDE133:
	.long	.LASFDE133-.Lframe1
	.long	.LFB75
	.long	.LFE75-.LFB75
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI185-.LFB75
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI186-.LCFI185
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE133:
.LSFDE135:
	.long	.LEFDE135-.LASFDE135
.LASFDE135:
	.long	.LASFDE135-.Lframe1
	.long	.LFB76
	.long	.LFE76-.LFB76
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI188-.LFB76
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI189-.LCFI188
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE135:
.LSFDE137:
	.long	.LEFDE137-.LASFDE137
.LASFDE137:
	.long	.LASFDE137-.Lframe1
	.long	.LFB77
	.long	.LFE77-.LFB77
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI191-.LFB77
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI192-.LCFI191
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE137:
.LSFDE139:
	.long	.LEFDE139-.LASFDE139
.LASFDE139:
	.long	.LASFDE139-.Lframe1
	.long	.LFB78
	.long	.LFE78-.LFB78
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI193-.LFB78
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI194-.LCFI193
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE139:
.LSFDE141:
	.long	.LEFDE141-.LASFDE141
.LASFDE141:
	.long	.LASFDE141-.Lframe1
	.long	.LFB79
	.long	.LFE79-.LFB79
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI196-.LFB79
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI197-.LCFI196
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE141:
.LSFDE143:
	.long	.LEFDE143-.LASFDE143
.LASFDE143:
	.long	.LASFDE143-.Lframe1
	.long	.LFB80
	.long	.LFE80-.LFB80
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI198-.LFB80
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI199-.LCFI198
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE143:
.LSFDE145:
	.long	.LEFDE145-.LASFDE145
.LASFDE145:
	.long	.LASFDE145-.Lframe1
	.long	.LFB81
	.long	.LFE81-.LFB81
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI200-.LFB81
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI201-.LCFI200
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE145:
	.ident	"GCC: (GNU) 4.1.2 20071124 (Red Hat 4.1.2-42)"
	.section	.note.GNU-stack,"",@progbits
