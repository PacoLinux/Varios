	.file	"rtl.c"
	.section	.debug_abbrev,""
Ldebug_abbrev0:
	.section	.debug_info,""
Ldebug_info0:
	.section	.debug_line,""
Ldebug_line0:
	.section .text
Ltext0:
.globl _iores
	.section	.bss
	.p2align 2
_iores:
	.space 4
	.section .text
.globl _initfs
_initfs:
LFB2:
	.file 1 "c:\\vp\\mmpc\\rtl.c"
	.loc 1 36 0
	pushl	%ebp
LCFI0:
	movl	%esp, %ebp
LCFI1:
	subl	$16, %esp
LCFI2:
	.loc 1 38 0
	movl	$0, -4(%ebp)
	jmp	L2
L3:
	movl	-4(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	$0, _files+252(%eax)
	movl	-4(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	$1, _files+256(%eax)
	leal	-4(%ebp), %eax
	incl	(%eax)
L2:
	cmpl	$30, -4(%ebp)
	jle	L3
	.loc 1 39 0
	movl	$1, _files+252
	.loc 1 40 0
	movl	$___dj_stdin, _files
	.loc 1 41 0
	movl	$1, _files+512
	.loc 1 42 0
	movl	$___dj_stdout, _files+260
	.loc 1 44 0
	leave
	ret
LFE2:
.globl _entryname
_entryname:
LFB3:
	.loc 1 46 0
	pushl	%ebp
LCFI3:
	movl	%esp, %ebp
LCFI4:
	.loc 1 46 0
	movl	8(%ebp), %eax
	incl	%eax
	popl	%ebp
	ret
LFE3:
.globl _isdir
_isdir:
LFB4:
	.loc 1 47 0
	pushl	%ebp
LCFI5:
	movl	%esp, %ebp
LCFI6:
	subl	$56, %esp
LCFI7:
	.loc 1 47 0
	subl	$8, %esp
	leal	-48(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
LCFI8:
	call	_stat
	addl	$16, %esp
	movl	-28(%ebp), %eax
	andl	$61440, %eax
	cmpl	$12288, %eax
	sete	%al
	andl	$255, %eax
	.loc 1 48 0
	leave
	ret
LFE4:
.globl _pascalexit
_pascalexit:
LFB5:
	.loc 1 52 0
	pushl	%ebp
LCFI9:
	movl	%esp, %ebp
LCFI10:
	subl	$8, %esp
LCFI11:
	.loc 1 52 0
	call	_closefiles
	subl	$12, %esp
	pushl	8(%ebp)
LCFI12:
	call	_exit
LFE5:
	.p2align 2
LC0:
	.ascii "Pascal file sub-system  error: %d\0"
LC1:
	.ascii "Unassigned file handle %d\0"
.globl _checkerr
_checkerr:
LFB6:
	.loc 1 53 0
	pushl	%ebp
LCFI13:
	movl	%esp, %ebp
LCFI14:
	subl	$8, %esp
LCFI15:
	.loc 1 54 0
	movl	_iores, %eax
	testl	%eax, %eax
	je	L13
	movl	_iores, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$LC0
	pushl	$___dj_stderr
LCFI16:
	call	_fprintf
	addl	$16, %esp
	movl	_iores, %eax
	subl	$12, %esp
	pushl	%eax
	call	_pascalexit
	addl	$16, %esp
L13:
	.loc 1 55 0
	cmpl	$0, 8(%ebp)
	js	L15
	cmpl	$31, 8(%ebp)
	jle	L18
L15:
	subl	$4, %esp
	pushl	8(%ebp)
	pushl	$LC1
	pushl	$___dj_stderr
	call	_fprintf
	addl	$16, %esp
	movl	_iores, %eax
	subl	$12, %esp
	pushl	%eax
	call	_pascalexit
	addl	$16, %esp
L18:
	.loc 1 57 0
	leave
	ret
LFE6:
.globl _findfreefileblock
_findfreefileblock:
LFB7:
	.loc 1 59 0
	pushl	%ebp
LCFI17:
	movl	%esp, %ebp
LCFI18:
	subl	$20, %esp
LCFI19:
	.loc 1 60 0
	movl	$0, -4(%ebp)
	jmp	L20
L21:
	movl	-4(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files+252(%eax), %eax
	testl	%eax, %eax
	jne	L22
	movl	-4(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L24
L22:
	leal	-4(%ebp), %eax
	incl	(%eax)
L20:
	cmpl	$30, -4(%ebp)
	jle	L21
	.loc 1 61 0
	movl	$-1, -20(%ebp)
L24:
	movl	-20(%ebp), %eax
	.loc 1 62 0
	leave
	ret
LFE7:
.globl _closefiles
_closefiles:
LFB8:
	.loc 1 64 0
	pushl	%ebp
LCFI20:
	movl	%esp, %ebp
LCFI21:
	subl	$24, %esp
LCFI22:
	.loc 1 66 0
	movl	$0, -4(%ebp)
	jmp	L28
L29:
	movl	-4(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files+252(%eax), %eax
	cmpl	$1, %eax
	jne	L30
	movl	-4(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI23:
	call	_fclose
	addl	$16, %esp
L30:
	leal	-4(%ebp), %eax
	incl	(%eax)
L28:
	cmpl	$30, -4(%ebp)
	jle	L29
	.loc 1 67 0
	leave
	ret
LFE8:
.globl _pasclose
_pasclose:
LFB9:
	.loc 1 70 0
	pushl	%ebp
LCFI24:
	movl	%esp, %ebp
LCFI25:
	subl	$8, %esp
LCFI26:
	.loc 1 71 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI27:
	call	_checkerr
	addl	$16, %esp
	.loc 1 72 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	_fclose
	addl	$16, %esp
	.loc 1 73 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	$0, _files+252(%eax)
	.loc 1 74 0
	leave
	ret
LFE9:
.globl _setchan
_setchan:
LFB10:
	.loc 1 75 0
	pushl	%ebp
LCFI28:
	movl	%esp, %ebp
LCFI29:
	.loc 1 75 0
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	popl	%ebp
	ret
LFE10:
.globl _pascaleof
_pascaleof:
LFB11:
	.loc 1 77 0
	pushl	%ebp
LCFI30:
	movl	%esp, %ebp
LCFI31:
	subl	$8, %esp
LCFI32:
	.loc 1 78 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI33:
	call	_checkerr
	addl	$16, %esp
	.loc 1 79 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	_feof
	addl	$16, %esp
	testl	%eax, %eax
	je	L39
	movl	$-1, -4(%ebp)
	jmp	L41
L39:
	.loc 1 80 0
	movl	$0, -4(%ebp)
L41:
	movl	-4(%ebp), %eax
	.loc 1 81 0
	leave
	ret
LFE11:
.globl _eoln
_eoln:
LFB12:
	.loc 1 83 0
	pushl	%ebp
LCFI34:
	movl	%esp, %ebp
LCFI35:
	subl	$24, %esp
LCFI36:
	.loc 1 84 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI37:
	call	_checkerr
	addl	$16, %esp
	.loc 1 85 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	_pascaleof
	addl	$16, %esp
	testl	%eax, %eax
	jne	L44
	.loc 1 86 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	_fgetc
	addl	$16, %esp
	movl	%eax, -4(%ebp)
	.loc 1 87 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	-4(%ebp)
	call	_ungetc
	addl	$16, %esp
	.loc 1 88 0
	cmpl	$10, -4(%ebp)
	jne	L44
	movl	$-1, -20(%ebp)
	jmp	L47
L44:
	.loc 1 90 0
	movl	$0, -20(%ebp)
L47:
	movl	-20(%ebp), %eax
	.loc 1 91 0
	leave
	ret
LFE12:
.globl _u2asciitrunc
_u2asciitrunc:
LFB13:
	.loc 1 94 0
	pushl	%ebp
LCFI38:
	movl	%esp, %ebp
LCFI39:
	subl	$16, %esp
LCFI40:
	.loc 1 96 0
	movl	$1, -4(%ebp)
	jmp	L50
L51:
	movl	-4(%ebp), %eax
	addl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	addl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$127, %eax
	movb	%al, (%edx)
	leal	-4(%ebp), %eax
	incl	(%eax)
L50:
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	andl	$255, %eax
	cmpl	-4(%ebp), %eax
	jge	L51
	.loc 1 97 0
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	andl	$255, %eax
	addl	12(%ebp), %eax
	movb	$0, (%eax)
	.loc 1 98 0
	leave
	ret
LFE13:
.globl _move
_move:
LFB14:
	.loc 1 100 0
	pushl	%ebp
LCFI41:
	movl	%esp, %ebp
LCFI42:
	pushl	%edi
LCFI43:
	pushl	%esi
LCFI44:
	.loc 1 100 0
	movl	16(%ebp), %ecx
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%eax, %edi
	movl	%edx, %esi
	cld
	rep
	movsb
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
LFE14:
.globl _erase
_erase:
LFB15:
	.loc 1 101 0
	pushl	%ebp
LCFI45:
	movl	%esp, %ebp
LCFI46:
	subl	$280, %esp
LCFI47:
	.loc 1 103 0
	leal	-257(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
LCFI48:
	call	_u2asciitrunc
	addl	$8, %esp
	.loc 1 104 0
	subl	$12, %esp
	leal	-257(%ebp), %eax
	pushl	%eax
LCFI49:
	call	_unlink
	addl	$16, %esp
	.loc 1 105 0
	leave
	ret
LFE15:
.globl _filesize
_filesize:
LFB16:
	.loc 1 107 0
	pushl	%ebp
LCFI50:
	movl	%esp, %ebp
LCFI51:
	subl	$24, %esp
LCFI52:
	.loc 1 108 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI53:
	call	_checkerr
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 109 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_ftell
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	.loc 1 110 0
	subl	$4, %esp
	pushl	$2
	pushl	$0
	pushl	-4(%ebp)
	call	_fseek
	addl	$16, %esp
	.loc 1 111 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_ftell
	addl	$16, %esp
	movl	%eax, -8(%ebp)
	.loc 1 112 0
	subl	$4, %esp
	pushl	$0
	pushl	-12(%ebp)
	pushl	-4(%ebp)
	call	_fseek
	addl	$16, %esp
	.loc 1 113 0
	movl	-8(%ebp), %eax
	.loc 1 114 0
	leave
	ret
LFE16:
.globl _filepos
_filepos:
LFB17:
	.loc 1 115 0
	pushl	%ebp
LCFI54:
	movl	%esp, %ebp
LCFI55:
	subl	$24, %esp
LCFI56:
	.loc 1 115 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI57:
	call	_checkerr
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_ftell
	addl	$16, %esp
	leave
	ret
LFE17:
.globl _seek
_seek:
LFB18:
	.loc 1 117 0
	pushl	%ebp
LCFI58:
	movl	%esp, %ebp
LCFI59:
	subl	$24, %esp
LCFI60:
	.loc 1 117 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI61:
	call	_checkerr
	addl	$16, %esp
	.loc 1 118 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 119 0
	subl	$4, %esp
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	-4(%ebp)
	call	_fseek
	addl	$16, %esp
	.loc 1 120 0
	leave
	ret
LFE18:
.globl _blockread
_blockread:
LFB19:
	.loc 1 127 0
	pushl	%ebp
LCFI62:
	movl	%esp, %ebp
LCFI63:
	pushl	%ebx
LCFI64:
	subl	$4, %esp
LCFI65:
	.loc 1 128 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI66:
	call	_checkerr
	addl	$16, %esp
	.loc 1 129 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %ecx
	movl	16(%ebp), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files+256(%eax), %eax
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	12(%ebp)
	call	_fread
	addl	$16, %esp
	movl	%eax, %edx
	movl	20(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 130 0
	movl	-4(%ebp), %ebx
	leave
	ret
LFE19:
.globl _blockwrite
_blockwrite:
LFB20:
	.loc 1 132 0
	pushl	%ebp
LCFI67:
	movl	%esp, %ebp
LCFI68:
	pushl	%ebx
LCFI69:
	subl	$4, %esp
LCFI70:
	.loc 1 133 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI71:
	call	_checkerr
	addl	$16, %esp
	.loc 1 134 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %ecx
	movl	16(%ebp), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files+256(%eax), %eax
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	12(%ebp)
	call	_fwrite
	addl	$16, %esp
	movl	%eax, %edx
	movl	20(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 135 0
	movl	-4(%ebp), %ebx
	leave
	ret
LFE20:
LC2:
	.ascii "wb\0"
.globl _rewrite
_rewrite:
LFB21:
	.loc 1 137 0
	pushl	%ebp
LCFI72:
	movl	%esp, %ebp
LCFI73:
	pushl	%ebx
LCFI74:
	subl	$4, %esp
LCFI75:
	.loc 1 138 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI76:
	call	_checkerr
	addl	$16, %esp
	.loc 1 139 0
	movl	8(%ebp), %eax
	movl	(%eax), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	addl	$_files, %eax
	addl	$4, %eax
	subl	$8, %esp
	pushl	$LC2
	pushl	%eax
	call	_fopen
	addl	$16, %esp
	movl	%eax, %ecx
	movl	%ebx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	%ecx, _files(%eax)
	.loc 1 140 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	$1, _files+252(%eax)
	.loc 1 141 0
	movl	-4(%ebp), %ebx
	leave
	ret
LFE21:
LC3:
	.ascii "rb+\0"
.globl _reset
_reset:
LFB22:
	.loc 1 143 0
	pushl	%ebp
LCFI77:
	movl	%esp, %ebp
LCFI78:
	pushl	%ebx
LCFI79:
	subl	$4, %esp
LCFI80:
	.loc 1 144 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI81:
	call	_checkerr
	addl	$16, %esp
	.loc 1 145 0
	movl	8(%ebp), %eax
	movl	(%eax), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	addl	$_files, %eax
	addl	$4, %eax
	subl	$8, %esp
	pushl	$LC3
	pushl	%eax
	call	_fopen
	addl	$16, %esp
	movl	%eax, %ecx
	movl	%ebx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	%ecx, _files(%eax)
	.loc 1 146 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	testl	%eax, %eax
	jne	L71
	movl	$2, _iores
	jmp	L74
L71:
	.loc 1 147 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	$1, _files+252(%eax)
L74:
	.loc 1 148 0
	movl	-4(%ebp), %ebx
	leave
	ret
LFE22:
LC4:
	.ascii "ab\0"
.globl _append
_append:
LFB23:
	.loc 1 150 0
	pushl	%ebp
LCFI82:
	movl	%esp, %ebp
LCFI83:
	pushl	%ebx
LCFI84:
	subl	$4, %esp
LCFI85:
	.loc 1 151 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI86:
	call	_checkerr
	addl	$16, %esp
	.loc 1 152 0
	movl	8(%ebp), %eax
	movl	(%eax), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	addl	$_files, %eax
	addl	$4, %eax
	subl	$8, %esp
	pushl	$LC4
	pushl	%eax
	call	_fopen
	addl	$16, %esp
	movl	%eax, %ecx
	movl	%ebx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	%ecx, _files(%eax)
	.loc 1 153 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	testl	%eax, %eax
	jne	L76
	movl	$2, _iores
	jmp	L79
L76:
	.loc 1 154 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	$1, _files+252(%eax)
L79:
	.loc 1 155 0
	movl	-4(%ebp), %ebx
	leave
	ret
LFE23:
.globl _setiores
_setiores:
LFB24:
	.loc 1 156 0
	pushl	%ebp
LCFI87:
	movl	%esp, %ebp
LCFI88:
	.loc 1 156 0
	movl	8(%ebp), %eax
	movl	%eax, _iores
	popl	%ebp
	ret
LFE24:
.globl _assign
_assign:
LFB25:
	.loc 1 158 0
	pushl	%ebp
LCFI89:
	movl	%esp, %ebp
LCFI90:
	pushl	%ebx
LCFI91:
	subl	$272, %esp
LCFI92:
	.loc 1 160 0
	leal	-268(%ebp), %eax
	pushl	%eax
	pushl	12(%ebp)
LCFI93:
	call	_u2asciitrunc
	addl	$8, %esp
	.loc 1 162 0
LCFI94:
	call	_findfreefileblock
	movl	%eax, -8(%ebp)
	.loc 1 163 0
	cmpl	$0, -8(%ebp)
	jns	L83
	movl	$4, _iores
	movl	8(%ebp), %eax
	movl	$-1, (%eax)
	jmp	L89
L83:
	.loc 1 164 0
	movl	$0, -12(%ebp)
	jmp	L86
L87:
	movl	-8(%ebp), %edx
	movl	-12(%ebp), %ecx
	movl	-12(%ebp), %eax
	movb	-268(%ebp,%eax), %bl
	movl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	addl	%ecx, %eax
	addl	$_files, %eax
	movb	%bl, 4(%eax)
	leal	-12(%ebp), %eax
	incl	(%eax)
L86:
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	andl	$255, %eax
	cmpl	-12(%ebp), %eax
	jg	L87
	.loc 1 165 0
	movl	-8(%ebp), %edx
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movzbl	%al,%ecx
	movl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	addl	%ecx, %eax
	addl	$_files, %eax
	movb	$0, 4(%eax)
	.loc 1 166 0
	movl	-8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	$-1, _files+252(%eax)
	.loc 1 167 0
	movl	8(%ebp), %edx
	movl	-8(%ebp), %eax
	movl	%eax, (%edx)
L89:
	.loc 1 168 0
	movl	-4(%ebp), %ebx
	leave
	ret
LFE25:
.globl _ioresult
_ioresult:
LFB26:
	.loc 1 169 0
	pushl	%ebp
LCFI95:
	movl	%esp, %ebp
LCFI96:
	subl	$16, %esp
LCFI97:
	.loc 1 169 0
	movl	_iores, %eax
	movl	%eax, -4(%ebp)
	movl	$0, _iores
	movl	-4(%ebp), %eax
	leave
	ret
LFE26:
.globl _readcharnarrow
_readcharnarrow:
LFB27:
	.loc 1 171 0
	pushl	%ebp
LCFI98:
	movl	%esp, %ebp
LCFI99:
	subl	$24, %esp
LCFI100:
	.loc 1 172 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI101:
	call	_checkerr
	addl	$16, %esp
	.loc 1 173 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 174 0
	cmpl	$0, 8(%ebp)
	jne	L93
	subl	$12, %esp
	pushl	$___dj_stdin
	call	_getc
	addl	$16, %esp
	movb	%al, %dl
	movl	12(%ebp), %eax
	movb	%dl, (%eax)
	jmp	L96
L93:
	.loc 1 175 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	movb	%al, %dl
	movl	12(%ebp), %eax
	movb	%dl, (%eax)
L96:
	.loc 1 176 0
	leave
	ret
LFE27:
.globl _readchar
_readchar:
LFB28:
	.loc 1 178 0
	pushl	%ebp
LCFI102:
	movl	%esp, %ebp
LCFI103:
	subl	$24, %esp
LCFI104:
	.loc 1 181 0
	subl	$8, %esp
	leal	-5(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
LCFI105:
	call	_readcharnarrow
	addl	$16, %esp
	.loc 1 182 0
	movb	-5(%ebp), %al
	movl	$0, %edx
	movb	%al, %dl
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
	.loc 1 183 0
	movb	-5(%ebp), %al
	testb	%al, %al
	jns	L102
	.loc 1 184 0
	movb	-5(%ebp), %al
	cmpb	$-33, %al
	ja	L100
	.loc 1 186 0
	movb	-5(%ebp), %al
	andl	$255, %eax
	andl	$31, %eax
	movl	%eax, %edx
	sall	$6, %edx
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
	.loc 1 187 0
	subl	$8, %esp
	leal	-5(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readcharnarrow
	addl	$16, %esp
	.loc 1 188 0
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	movl	%eax, %edx
	movb	-5(%ebp), %al
	andl	$255, %eax
	andl	$63, %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
L100:
	.loc 1 191 0
	movb	-5(%ebp), %al
	andl	$255, %eax
	andl	$15, %eax
	movl	%eax, %edx
	sall	$12, %edx
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
	.loc 1 192 0
	subl	$8, %esp
	leal	-5(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readcharnarrow
	addl	$16, %esp
	.loc 1 193 0
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	movl	%eax, %edx
	movb	-5(%ebp), %al
	andl	$255, %eax
	andl	$63, %eax
	sall	$6, %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
	.loc 1 194 0
	subl	$8, %esp
	leal	-5(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readcharnarrow
	addl	$16, %esp
	.loc 1 195 0
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	movl	%eax, %edx
	movb	-5(%ebp), %al
	andl	$255, %eax
	andl	$63, %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
L102:
	.loc 1 196 0
	leave
	ret
LFE28:
.globl _unicode2utf8
_unicode2utf8:
LFB29:
	.loc 1 198 0
	pushl	%ebp
LCFI106:
	movl	%esp, %ebp
LCFI107:
	subl	$4, %esp
LCFI108:
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 1 199 0
	cmpw	$127, -4(%ebp)
	ja	L104
	.loc 1 200 0
	movl	-4(%ebp), %eax
	movb	%al, %dl
	movl	12(%ebp), %eax
	movb	%dl, (%eax)
	.loc 1 201 0
	movl	12(%ebp), %eax
	incl	%eax
	movb	$0, (%eax)
	.loc 1 202 0
	jmp	L109
L104:
	.loc 1 204 0
	cmpw	$2047, -4(%ebp)
	ja	L107
	.loc 1 205 0
	movl	-4(%ebp), %eax
	shrw	$6, %ax
	movb	%al, %dl
	andl	$31, %edx
	movb	$-64, %al
	leal	(%edx,%eax), %eax
	movb	%al, %dl
	movl	12(%ebp), %eax
	movb	%dl, (%eax)
	.loc 1 206 0
	movl	12(%ebp), %ecx
	incl	%ecx
	movl	-4(%ebp), %eax
	movb	%al, %dl
	andl	$63, %edx
	movb	$-128, %al
	leal	(%edx,%eax), %eax
	movb	%al, (%ecx)
	.loc 1 207 0
	movl	12(%ebp), %eax
	addl	$2, %eax
	movb	$0, (%eax)
	.loc 1 208 0
	jmp	L109
L107:
	.loc 1 210 0
	movl	-4(%ebp), %eax
	shrw	$12, %ax
	movb	%al, %dl
	andl	$15, %edx
	movb	$-32, %al
	leal	(%edx,%eax), %eax
	movb	%al, %dl
	movl	12(%ebp), %eax
	movb	%dl, (%eax)
	.loc 1 211 0
	movl	12(%ebp), %ecx
	incl	%ecx
	movl	-4(%ebp), %eax
	shrw	$6, %ax
	movb	%al, %dl
	andl	$63, %edx
	movb	$-128, %al
	leal	(%edx,%eax), %eax
	movb	%al, (%ecx)
	.loc 1 212 0
	movl	12(%ebp), %ecx
	addl	$2, %ecx
	movl	-4(%ebp), %eax
	movb	%al, %dl
	andl	$63, %edx
	movb	$-128, %al
	leal	(%edx,%eax), %eax
	movb	%al, (%ecx)
	.loc 1 213 0
	movl	12(%ebp), %eax
	addl	$3, %eax
	movb	$0, (%eax)
L109:
	.loc 1 214 0
	leave
	ret
LFE29:
LC5:
	.ascii "%s\0"
.globl _printchar
_printchar:
LFB30:
	.loc 1 216 0
	pushl	%ebp
LCFI109:
	movl	%esp, %ebp
LCFI110:
	subl	$24, %esp
LCFI111:
	.loc 1 218 0
	cmpl	$127, 12(%ebp)
	jg	L111
	.loc 1 219 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI112:
	call	_checkerr
	addl	$16, %esp
	.loc 1 220 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 221 0
	cmpl	$0, 8(%ebp)
	jne	L113
	subl	$12, %esp
	pushl	12(%ebp)
	call	_putchar
	addl	$16, %esp
	jmp	L118
L113:
	.loc 1 222 0
	subl	$8, %esp
	pushl	-4(%ebp)
	pushl	12(%ebp)
	call	_putc
	addl	$16, %esp
	jmp	L118
L111:
	.loc 1 225 0
	movl	12(%ebp), %eax
	movl	%eax, %edx
	andl	$65535, %edx
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	%edx
LCFI113:
	call	_unicode2utf8
	addl	$8, %esp
	.loc 1 226 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI114:
	call	_checkerr
	addl	$16, %esp
	.loc 1 227 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 228 0
	cmpl	$0, 8(%ebp)
	jne	L116
	subl	$8, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	$LC5
	call	_printf
	addl	$16, %esp
	jmp	L118
L116:
	.loc 1 229 0
	subl	$4, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	$LC5
	pushl	-4(%ebp)
	call	_fprintf
	addl	$16, %esp
L118:
	.loc 1 230 0
	leave
	ret
LFE30:
.globl _readline
_readline:
LFB31:
	.loc 1 232 0
	pushl	%ebp
LCFI115:
	movl	%esp, %ebp
LCFI116:
	subl	$24, %esp
LCFI117:
	.loc 1 232 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI118:
	call	_checkerr
	addl	$16, %esp
	.loc 1 233 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 234 0
	cmpl	$0, 8(%ebp)
	jne	L120
	movl	$___dj_stdin, -4(%ebp)
L120:
	.loc 1 235 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	movb	%al, -5(%ebp)
	.loc 1 236 0
	jmp	L122
L123:
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	movb	%al, -5(%ebp)
L122:
	cmpb	$10, -5(%ebp)
	jne	L123
	.loc 1 237 0
	leave
	ret
LFE31:
.globl _endoffile
_endoffile:
LFB32:
	.loc 1 239 0
	pushl	%ebp
LCFI119:
	movl	%esp, %ebp
LCFI120:
	subl	$24, %esp
LCFI121:
	.loc 1 239 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI122:
	call	_checkerr
	addl	$16, %esp
	.loc 1 240 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 241 0
	cmpl	$0, 8(%ebp)
	jne	L127
	movl	$___dj_stdin, -4(%ebp)
L127:
	.loc 1 242 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	movl	%eax, -12(%ebp)
	.loc 1 243 0
	cmpl	$-1, -12(%ebp)
	jne	L129
	movl	$1, -8(%ebp)
	jmp	L131
L129:
	movl	$0, -8(%ebp)
	subl	$8, %esp
	pushl	-4(%ebp)
	pushl	-12(%ebp)
	call	_ungetc
	addl	$16, %esp
L131:
	.loc 1 244 0
	movl	-8(%ebp), %eax
	.loc 1 245 0
	leave
	ret
LFE32:
.globl _endofline
_endofline:
LFB33:
	.loc 1 247 0
	pushl	%ebp
LCFI123:
	movl	%esp, %ebp
LCFI124:
	subl	$24, %esp
LCFI125:
	.loc 1 247 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI126:
	call	_checkerr
	addl	$16, %esp
	.loc 1 248 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 249 0
	cmpl	$0, 8(%ebp)
	jne	L134
	movl	$___dj_stdin, -4(%ebp)
L134:
	.loc 1 250 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	movb	%al, -6(%ebp)
	.loc 1 251 0
	cmpb	$10, -6(%ebp)
	jne	L136
	movb	$1, -5(%ebp)
	jmp	L138
L136:
	movb	$0, -5(%ebp)
	movsbl	-6(%ebp),%eax
	subl	$8, %esp
	pushl	-4(%ebp)
	pushl	%eax
	call	_ungetc
	addl	$16, %esp
L138:
	.loc 1 252 0
	movsbl	-5(%ebp),%eax
	.loc 1 253 0
	leave
	ret
LFE33:
LC6:
	.ascii "\12\0"
.globl _println
_println:
LFB34:
	.loc 1 255 0
	pushl	%ebp
LCFI127:
	movl	%esp, %ebp
LCFI128:
	subl	$24, %esp
LCFI129:
	.loc 1 255 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI130:
	call	_checkerr
	addl	$16, %esp
	.loc 1 256 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 258 0
	cmpl	$0, 8(%ebp)
	jne	L141
	subl	$12, %esp
	pushl	$LC6
	call	_printf
	addl	$16, %esp
	jmp	L144
L141:
	.loc 1 263 0
	subl	$8, %esp
	pushl	$LC6
	pushl	-4(%ebp)
	call	_fprintf
	addl	$16, %esp
L144:
	.loc 1 265 0
	leave
	ret
LFE34:
.globl _printspaces
_printspaces:
LFB35:
	.loc 1 267 0
	pushl	%ebp
LCFI131:
	movl	%esp, %ebp
LCFI132:
	subl	$120, %esp
LCFI133:
	.loc 1 271 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI134:
	call	_checkerr
	addl	$16, %esp
	.loc 1 272 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -8(%ebp)
	.loc 1 273 0
	cmpl	$80, 12(%ebp)
	jle	L146
	movl	$80, 12(%ebp)
L146:
	.loc 1 274 0
	movl	$0, -4(%ebp)
	jmp	L148
L149:
	.loc 1 275 0
	movl	-4(%ebp), %eax
	movb	$32, -108(%ebp,%eax)
	.loc 1 276 0
	movl	-4(%ebp), %eax
	incl	%eax
	movb	$0, -108(%ebp,%eax)
	.loc 1 274 0
	leal	-4(%ebp), %eax
	incl	(%eax)
L148:
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L149
	.loc 1 278 0
	cmpl	$0, 8(%ebp)
	jne	L151
	subl	$8, %esp
	leal	-108(%ebp), %eax
	pushl	%eax
	pushl	$LC5
	call	_printf
	addl	$16, %esp
	jmp	L154
L151:
	.loc 1 279 0
	subl	$4, %esp
	leal	-108(%ebp), %eax
	pushl	%eax
	pushl	$LC5
	pushl	-8(%ebp)
	call	_fprintf
	addl	$16, %esp
L154:
	.loc 1 280 0
	leave
	ret
LFE35:
.globl _pascalerror
_pascalerror:
LFB36:
	.loc 1 282 0
	pushl	%ebp
LCFI135:
	movl	%esp, %ebp
LCFI136:
	subl	$8, %esp
LCFI137:
	.loc 1 283 0
	subl	$4, %esp
	pushl	8(%ebp)
	pushl	$LC5
	pushl	$___dj_stderr
LCFI138:
	call	_fprintf
	addl	$16, %esp
	.loc 1 284 0
	subl	$12, %esp
	pushl	$-1
	call	_pascalexit
	addl	$16, %esp
	.loc 1 285 0
	leave
	ret
LFE36:
.globl _length
_length:
LFB37:
	.loc 1 286 0
	pushl	%ebp
LCFI139:
	movl	%esp, %ebp
LCFI140:
	.loc 1 286 0
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	popl	%ebp
	ret
LFE37:
.globl _incr
_incr:
LFB38:
	.loc 1 287 0
	pushl	%ebp
LCFI141:
	movl	%esp, %ebp
LCFI142:
	.loc 1 287 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	leal	2(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	popl	%ebp
	ret
LFE38:
.globl _readstring
_readstring:
LFB39:
	.loc 1 289 0
	pushl	%ebp
LCFI143:
	movl	%esp, %ebp
LCFI144:
	subl	$24, %esp
LCFI145:
	.loc 1 291 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI146:
	call	_checkerr
	addl	$16, %esp
	.loc 1 292 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 293 0
	cmpl	$0, 8(%ebp)
	jne	L162
	movl	$___dj_stdin, -4(%ebp)
L162:
	.loc 1 294 0
	movl	$0, -8(%ebp)
	.loc 1 295 0
	movl	-8(%ebp), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
	.loc 1 296 0
	movw	$32, -10(%ebp)
	.loc 1 297 0
	jmp	L171
L165:
	.loc 1 299 0
	subl	$8, %esp
	leal	-10(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readchar
	addl	$16, %esp
	.loc 1 300 0
	movw	-10(%ebp), %ax
	cmpw	$10, %ax
	je	L166
	.loc 1 301 0
	leal	-8(%ebp), %eax
	incl	(%eax)
	.loc 1 302 0
	movl	-8(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	addl	12(%ebp), %edx
	movw	-10(%ebp), %ax
	movw	%ax, (%edx)
	.loc 1 303 0
	movl	-8(%ebp), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
	jmp	L164
L166:
	.loc 1 304 0
	movw	-10(%ebp), %ax
	andl	$65535, %eax
	subl	$8, %esp
	pushl	-4(%ebp)
	pushl	%eax
	call	_ungetc
	addl	$16, %esp
L164:
L171:
	.loc 1 297 0
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	cmpl	16(%ebp), %eax
	jge	L170
	movw	-10(%ebp), %ax
	cmpw	$10, %ax
	jne	L165
L170:
	.loc 1 306 0
	leave
	ret
LFE39:
.globl _printstring
_printstring:
LFB40:
	.loc 1 309 0
	pushl	%ebp
LCFI147:
	movl	%esp, %ebp
LCFI148:
	subl	$24, %esp
LCFI149:
	.loc 1 311 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI150:
	call	_checkerr
	addl	$16, %esp
	.loc 1 312 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 313 0
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -12(%ebp)
	.loc 1 315 0
	movl	16(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jle	L173
	movl	-12(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	_printspaces
	addl	$16, %esp
L173:
	.loc 1 316 0
	movl	$1, -16(%ebp)
	jmp	L175
L176:
	.loc 1 317 0
	movl	-16(%ebp), %eax
	addl	%eax, %eax
	addl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -8(%ebp)
	.loc 1 318 0
	pushl	$1
	pushl	$1
	pushl	-8(%ebp)
	pushl	8(%ebp)
	call	_printchar
	addl	$16, %esp
	.loc 1 316 0
	leal	-16(%ebp), %eax
	incl	(%eax)
L175:
	movl	-16(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jle	L176
	.loc 1 320 0
	leave
	ret
LFE40:
.globl _printordinal
_printordinal:
LFB41:
	.loc 1 322 0
	pushl	%ebp
LCFI151:
	movl	%esp, %ebp
LCFI152:
	subl	$8, %esp
LCFI153:
	.loc 1 323 0
	movl	12(%ebp), %eax
	sall	$2, %eax
	addl	24(%ebp), %eax
	movl	(%eax), %eax
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	%eax
	pushl	8(%ebp)
LCFI154:
	call	_printstring
	addl	$16, %esp
	.loc 1 324 0
	leave
	ret
LFE41:
.globl _skipspaces
_skipspaces:
LFB42:
	.loc 1 326 0
	pushl	%ebp
LCFI155:
	movl	%esp, %ebp
LCFI156:
	subl	$24, %esp
LCFI157:
	.loc 1 328 0
	movb	$32, -1(%ebp)
	jmp	L182
L183:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI158:
	call	_getc
	addl	$16, %esp
	movb	%al, -1(%ebp)
L182:
	cmpb	$32, -1(%ebp)
	je	L183
	.loc 1 329 0
	movsbl	-1(%ebp),%eax
	subl	$8, %esp
	pushl	8(%ebp)
	pushl	%eax
	call	_ungetc
	addl	$16, %esp
	.loc 1 330 0
	leave
	ret
LFE42:
.globl _utolower
_utolower:
LFB43:
	.loc 1 332 0
	pushl	%ebp
LCFI159:
	movl	%esp, %ebp
LCFI160:
	subl	$8, %esp
LCFI161:
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 1 333 0
	cmpw	$64, -4(%ebp)
	jbe	L187
	cmpw	$90, -4(%ebp)
	ja	L187
	movl	-4(%ebp), %eax
	andl	$65535, %eax
	addl	$32, %eax
	movl	%eax, -8(%ebp)
	jmp	L190
L187:
	.loc 1 334 0
	cmpw	$912, -4(%ebp)
	jbe	L191
	cmpw	$937, -4(%ebp)
	ja	L191
	movl	-4(%ebp), %eax
	andl	$65535, %eax
	addl	$32, %eax
	movl	%eax, -8(%ebp)
	jmp	L190
L191:
	.loc 1 335 0
	cmpw	$1039, -4(%ebp)
	jbe	L194
	cmpw	$1071, -4(%ebp)
	ja	L194
	movl	-4(%ebp), %eax
	andl	$65535, %eax
	addl	$32, %eax
	movl	%eax, -8(%ebp)
	jmp	L190
L194:
	.loc 1 336 0
	movl	-4(%ebp), %eax
	movl	%eax, %edx
	andl	$65535, %edx
	movl	%edx, -8(%ebp)
L190:
	movl	-8(%ebp), %eax
	.loc 1 337 0
	leave
	ret
LFE43:
.globl _readordinal
_readordinal:
LFB44:
	.loc 1 339 0
	pushl	%ebp
LCFI162:
	movl	%esp, %ebp
LCFI163:
	subl	$536, %esp
LCFI164:
	.loc 1 342 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI165:
	call	_checkerr
	addl	$16, %esp
	.loc 1 343 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 344 0
	cmpl	$0, 8(%ebp)
	jne	L199
	movl	$___dj_stdin, -4(%ebp)
L199:
	.loc 1 345 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_skipspaces
	addl	$16, %esp
	.loc 1 346 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_tolower
	addl	$16, %esp
	movw	%ax, -14(%ebp)
	.loc 1 347 0
	movw	$0, -526(%ebp)
	movl	$0, -8(%ebp)
	.loc 1 348 0
	movw	-14(%ebp), %ax
	cmpw	$122, %ax
	ja	L201
	movw	-14(%ebp), %ax
	cmpw	$96, %ax
	ja	L203
	jmp	L201
L204:
	.loc 1 351 0
	movl	-8(%ebp), %edx
	incl	%edx
	movw	-14(%ebp), %ax
	movw	%ax, -526(%ebp,%edx,2)
	movw	-526(%ebp), %ax
	incl	%eax
	movw	%ax, -526(%ebp)
	leal	-8(%ebp), %eax
	incl	(%eax)
	.loc 1 352 0
	movl	-8(%ebp), %eax
	incl	%eax
	movw	$0, -526(%ebp,%eax,2)
	.loc 1 353 0
	subl	$8, %esp
	leal	-14(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readchar
	addl	$16, %esp
	.loc 1 355 0
	movw	-14(%ebp), %ax
	andl	$65535, %eax
	pushl	%eax
LCFI166:
	call	_utolower
	addl	$4, %esp
	movw	%ax, -14(%ebp)
L203:
	.loc 1 349 0
	movw	-14(%ebp), %ax
	cmpw	$122, %ax
	ja	L205
	movw	-14(%ebp), %ax
	cmpw	$96, %ax
	ja	L207
L205:
	movw	-14(%ebp), %ax
	cmpw	$57, %ax
	ja	L201
	movw	-14(%ebp), %ax
	cmpw	$47, %ax
	jbe	L201
L207:
	cmpl	$253, -8(%ebp)
	jle	L204
L201:
	.loc 1 358 0
	movw	-14(%ebp), %ax
	andl	$65535, %eax
	subl	$8, %esp
	pushl	-4(%ebp)
	pushl	%eax
LCFI167:
	call	_ungetc
	addl	$16, %esp
	.loc 1 360 0
	movl	$0, -12(%ebp)
	jmp	L209
L210:
	.loc 1 362 0
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	16(%ebp), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%eax
	leal	-526(%ebp), %eax
	pushl	%eax
	call	_cstringcompare
	addl	$16, %esp
	testl	%eax, %eax
	jne	L211
	.loc 1 364 0
	cmpl	$255, 20(%ebp)
	jg	L213
	movl	-12(%ebp), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
	jmp	L217
L213:
	.loc 1 365 0
	movl	12(%ebp), %eax
	movl	-12(%ebp), %edx
	movw	%dx, (%eax)
	.loc 1 366 0
	jmp	L217
L211:
	.loc 1 360 0
	leal	-12(%ebp), %eax
	incl	(%eax)
L209:
	movl	-12(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	L210
	.loc 1 369 0
	movl	$301, _iores
L217:
	.loc 1 370 0
	leave
	ret
LFE44:
.globl _setcmprtl
_setcmprtl:
LFB45:
	.loc 1 377 0
	pushl	%ebp
LCFI168:
	movl	%esp, %ebp
LCFI169:
	subl	$36, %esp
LCFI170:
	.loc 1 380 0
	movl	$1, -12(%ebp)
	.loc 1 381 0
	movl	$0, -8(%ebp)
	.loc 1 382 0
	movl	$0, -4(%ebp)
	.loc 1 383 0
	movl	$0, -32(%ebp)
	jmp	L219
L220:
	.loc 1 385 0
	movl	-32(%ebp), %eax
	addl	8(%ebp), %eax
	movb	(%eax), %al
	movsbl	%al,%eax
	movl	%eax, -28(%ebp)
	.loc 1 386 0
	movl	-32(%ebp), %eax
	addl	12(%ebp), %eax
	movb	(%eax), %al
	movsbl	%al,%eax
	movl	%eax, -24(%ebp)
	.loc 1 387 0
	movl	-28(%ebp), %eax
	cmpl	-24(%ebp), %eax
	je	L221
	movl	$0, -12(%ebp)
L221:
	.loc 1 388 0
	movl	-24(%ebp), %eax
	notl	%eax
	andl	-28(%ebp), %eax
	testl	%eax, %eax
	je	L223
	movl	$1, -4(%ebp)
L223:
	.loc 1 389 0
	movl	-28(%ebp), %eax
	notl	%eax
	andl	-24(%ebp), %eax
	testl	%eax, %eax
	je	L225
	movl	$1, -8(%ebp)
L225:
	.loc 1 383 0
	leal	-32(%ebp), %eax
	incl	(%eax)
L219:
	movl	-32(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	L220
	.loc 1 392 0
	cmpl	$0, -12(%ebp)
	je	L228
	movl	$0, -36(%ebp)
	jmp	L230
L228:
	.loc 1 393 0
	movl	-8(%ebp), %eax
	andl	-4(%ebp), %eax
	testl	%eax, %eax
	je	L231
	movl	$2, -36(%ebp)
	jmp	L230
L231:
	.loc 1 394 0
	cmpl	$0, -4(%ebp)
	je	L233
	movl	$1, -36(%ebp)
	jmp	L230
L233:
	.loc 1 395 0
	movl	$-1, -36(%ebp)
L230:
	movl	-36(%ebp), %eax
	.loc 1 396 0
	leave
	ret
LFE45:
.globl _cstringcompare
_cstringcompare:
LFB46:
	.loc 1 400 0
	pushl	%ebp
LCFI171:
	movl	%esp, %ebp
LCFI172:
	subl	$20, %esp
LCFI173:
	.loc 1 403 0
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -4(%ebp)
	.loc 1 404 0
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	cmpl	-4(%ebp), %eax
	jge	L237
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -4(%ebp)
L237:
	.loc 1 406 0
	movl	$1, -8(%ebp)
	jmp	L239
L240:
	.loc 1 408 0
	movl	-8(%ebp), %eax
	addl	%eax, %eax
	addl	8(%ebp), %eax
	movw	(%eax), %dx
	movl	-8(%ebp), %eax
	addl	%eax, %eax
	addl	12(%ebp), %eax
	movw	(%eax), %ax
	cmpw	%ax, %dx
	jae	L241
	movl	$-1, -20(%ebp)
	jmp	L243
L241:
	.loc 1 409 0
	movl	-8(%ebp), %eax
	addl	%eax, %eax
	addl	8(%ebp), %eax
	movw	(%eax), %dx
	movl	-8(%ebp), %eax
	addl	%eax, %eax
	addl	12(%ebp), %eax
	movw	(%eax), %ax
	cmpw	%ax, %dx
	jbe	L244
	movl	$1, -20(%ebp)
	jmp	L243
L244:
	.loc 1 406 0
	leal	-8(%ebp), %eax
	incl	(%eax)
L239:
	movl	-8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	jle	L240
	.loc 1 411 0
	movl	8(%ebp), %eax
	movw	(%eax), %dx
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	cmpw	%ax, %dx
	jae	L247
	movl	$-1, -20(%ebp)
	jmp	L243
L247:
	.loc 1 412 0
	movl	8(%ebp), %eax
	movw	(%eax), %dx
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	cmpw	%ax, %dx
	jbe	L249
	movl	$1, -20(%ebp)
	jmp	L243
L249:
	.loc 1 413 0
	movl	$0, -20(%ebp)
L243:
	movl	-20(%ebp), %eax
	.loc 1 414 0
	leave
	ret
LFE46:
LC7:
	.ascii "error in reading a boolean\0"
.globl _readbool
_readbool:
LFB47:
	.loc 1 419 0
	pushl	%ebp
LCFI174:
	movl	%esp, %ebp
LCFI175:
	subl	$24, %esp
LCFI176:
	.loc 1 420 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI177:
	call	_checkerr
	addl	$16, %esp
	.loc 1 421 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 422 0
	cmpl	$0, 8(%ebp)
	jne	L253
	movl	$___dj_stdin, -4(%ebp)
L253:
	.loc 1 423 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_skipspaces
	addl	$16, %esp
	.loc 1 424 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_toupper
	addl	$16, %esp
	movb	%al, -5(%ebp)
	.loc 1 425 0
	cmpb	$70, -5(%ebp)
	jne	L255
	.loc 1 426 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_toupper
	addl	$16, %esp
	cmpl	$65, %eax
	jne	L257
	.loc 1 427 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_toupper
	addl	$16, %esp
	cmpl	$76, %eax
	jne	L257
	.loc 1 428 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_toupper
	addl	$16, %esp
	cmpl	$83, %eax
	jne	L257
	.loc 1 429 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_toupper
	addl	$16, %esp
	cmpl	$69, %eax
	jne	L257
	movl	12(%ebp), %eax
	movb	$0, (%eax)
	jmp	L267
L255:
	.loc 1 431 0
	cmpb	$84, -5(%ebp)
	jne	L257
	.loc 1 432 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_toupper
	addl	$16, %esp
	cmpl	$82, %eax
	jne	L257
	.loc 1 433 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_toupper
	addl	$16, %esp
	cmpl	$85, %eax
	jne	L257
	.loc 1 434 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_getc
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_toupper
	addl	$16, %esp
	cmpl	$69, %eax
	jne	L257
	movl	12(%ebp), %eax
	movb	$1, (%eax)
	jmp	L267
L257:
	.loc 1 436 0
	subl	$12, %esp
	pushl	$LC7
	call	_pascalerror
	addl	$16, %esp
L267:
	.loc 1 438 0
	leave
	ret
LFE47:
LC8:
	.ascii " true\0"
LC9:
	.ascii "false\0"
.globl _printbool
_printbool:
LFB48:
	.loc 1 440 0
	pushl	%ebp
LCFI178:
	movl	%esp, %ebp
LCFI179:
	subl	$24, %esp
LCFI180:
	movl	12(%ebp), %eax
	movb	%al, -20(%ebp)
	.loc 1 441 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI181:
	call	_checkerr
	addl	$16, %esp
	.loc 1 442 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 443 0
	cmpl	$5, 16(%ebp)
	jle	L269
	movl	16(%ebp), %eax
	subl	$5, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	_printspaces
	addl	$16, %esp
L269:
	.loc 1 444 0
	cmpl	$0, 8(%ebp)
	jne	L271
	.loc 1 445 0
	cmpb	$0, -20(%ebp)
	je	L273
	subl	$12, %esp
	pushl	$LC8
	call	_printf
	addl	$16, %esp
	jmp	L278
L273:
	subl	$12, %esp
	pushl	$LC9
	call	_printf
	addl	$16, %esp
	jmp	L278
L271:
	.loc 1 447 0
	cmpb	$0, -20(%ebp)
	je	L276
	subl	$8, %esp
	pushl	$LC8
	pushl	-4(%ebp)
	call	_fprintf
	addl	$16, %esp
	jmp	L278
L276:
	subl	$8, %esp
	pushl	$LC9
	pushl	-4(%ebp)
	call	_fprintf
	addl	$16, %esp
L278:
	.loc 1 450 0
	leave
	ret
LFE48:
LC10:
	.ascii "%d\0"
.globl _readint
_readint:
LFB49:
	.loc 1 452 0
	pushl	%ebp
LCFI182:
	movl	%esp, %ebp
LCFI183:
	subl	$24, %esp
LCFI184:
	.loc 1 453 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI185:
	call	_checkerr
	addl	$16, %esp
	.loc 1 454 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 455 0
	cmpl	$0, 8(%ebp)
	jne	L280
	movl	$___dj_stdin, -4(%ebp)
L280:
	.loc 1 457 0
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	$LC10
	pushl	-4(%ebp)
	call	_fscanf
	addl	$16, %esp
	.loc 1 458 0
	leave
	ret
LFE49:
.globl _readbyte
_readbyte:
LFB50:
	.loc 1 460 0
	pushl	%ebp
LCFI186:
	movl	%esp, %ebp
LCFI187:
	subl	$24, %esp
LCFI188:
	.loc 1 462 0
	subl	$8, %esp
	leal	-4(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
LCFI189:
	call	_readint
	addl	$16, %esp
	.loc 1 463 0
	movl	-4(%ebp), %eax
	testl	%eax, %eax
	js	L284
	movl	-4(%ebp), %eax
	cmpl	$255, %eax
	jg	L284
	movl	-4(%ebp), %eax
	movb	%al, %dl
	movl	12(%ebp), %eax
	movb	%dl, (%eax)
L284:
	.loc 1 464 0
	movl	-4(%ebp), %eax
	testl	%eax, %eax
	jns	L287
	movl	12(%ebp), %eax
	movb	$0, (%eax)
L287:
	.loc 1 465 0
	movl	-4(%ebp), %eax
	cmpl	$255, %eax
	jle	L291
	movl	12(%ebp), %eax
	movb	$-1, (%eax)
L291:
	.loc 1 466 0
	leave
	ret
LFE50:
LC11:
	.ascii "%c%dld\0"
.globl _printint64
_printint64:
LFB51:
	.loc 1 467 0
	pushl	%ebp
LCFI190:
	movl	%esp, %ebp
LCFI191:
	subl	$232, %esp
LCFI192:
	.loc 1 473 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI193:
	call	_checkerr
	addl	$16, %esp
	.loc 1 474 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 475 0
	pushl	16(%ebp)
	pushl	$37
	pushl	$LC11
	leal	-212(%ebp), %eax
	pushl	%eax
	call	_sprintf
	addl	$16, %esp
	.loc 1 477 0
	cmpl	$0, 8(%ebp)
	jne	L293
	subl	$4, %esp
	pushl	16(%ebp)
	pushl	12(%ebp)
	leal	-212(%ebp), %eax
	pushl	%eax
	call	_printf
	addl	$16, %esp
	jmp	L296
L293:
	.loc 1 478 0
	pushl	16(%ebp)
	pushl	12(%ebp)
	leal	-212(%ebp), %eax
	pushl	%eax
	pushl	-4(%ebp)
	call	_fprintf
	addl	$16, %esp
L296:
	.loc 1 479 0
	leave
	ret
LFE51:
LC12:
	.ascii "%c%dd\0"
.globl _printint
_printint:
LFB52:
	.loc 1 480 0
	pushl	%ebp
LCFI194:
	movl	%esp, %ebp
LCFI195:
	subl	$232, %esp
LCFI196:
	.loc 1 486 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI197:
	call	_checkerr
	addl	$16, %esp
	.loc 1 487 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 488 0
	pushl	16(%ebp)
	pushl	$37
	pushl	$LC12
	leal	-212(%ebp), %eax
	pushl	%eax
	call	_sprintf
	addl	$16, %esp
	.loc 1 491 0
	cmpl	$0, 8(%ebp)
	jne	L298
	subl	$8, %esp
	pushl	12(%ebp)
	leal	-212(%ebp), %eax
	pushl	%eax
	call	_printf
	addl	$16, %esp
	jmp	L301
L298:
	.loc 1 492 0
	subl	$4, %esp
	pushl	12(%ebp)
	leal	-212(%ebp), %eax
	pushl	%eax
	pushl	-4(%ebp)
	call	_fprintf
	addl	$16, %esp
L301:
	.loc 1 493 0
	leave
	ret
LFE52:
LC13:
	.ascii "%f\0"
.globl _readreal
_readreal:
LFB53:
	.loc 1 495 0
	pushl	%ebp
LCFI198:
	movl	%esp, %ebp
LCFI199:
	subl	$24, %esp
LCFI200:
	.loc 1 497 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI201:
	call	_checkerr
	addl	$16, %esp
	.loc 1 498 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 499 0
	cmpl	$0, 8(%ebp)
	jne	L303
	movl	$___dj_stdin, -4(%ebp)
L303:
	.loc 1 501 0
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	$LC13
	pushl	-4(%ebp)
	call	_fscanf
	addl	$16, %esp
	.loc 1 503 0
	leave
	ret
LFE53:
LC14:
	.ascii "%c%d.%dg\0"
LC15:
	.ascii "%c%d.%df\0"
.globl _printdouble
_printdouble:
LFB54:
	.loc 1 504 0
	pushl	%ebp
LCFI202:
	movl	%esp, %ebp
LCFI203:
	subl	$232, %esp
LCFI204:
	movl	12(%ebp), %eax
	movl	%eax, -232(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -228(%ebp)
	.loc 1 508 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI205:
	call	_checkerr
	addl	$16, %esp
	.loc 1 509 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%edx, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 510 0
	cmpl	$0, 24(%ebp)
	jne	L307
	subl	$12, %esp
	pushl	$6
	pushl	20(%ebp)
	pushl	$37
	pushl	$LC14
	leal	-212(%ebp), %eax
	pushl	%eax
LCFI206:
	call	_sprintf
	addl	$32, %esp
	jmp	L309
L307:
	.loc 1 511 0
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	$37
	pushl	$LC15
	leal	-212(%ebp), %eax
	pushl	%eax
	call	_sprintf
	addl	$32, %esp
L309:
	.loc 1 526 0
	cmpl	$0, 8(%ebp)
	jne	L310
	subl	$4, %esp
	pushl	-228(%ebp)
	pushl	-232(%ebp)
	leal	-212(%ebp), %eax
	pushl	%eax
LCFI207:
	call	_printf
	addl	$16, %esp
	jmp	L313
L310:
	.loc 1 527 0
	pushl	-228(%ebp)
	pushl	-232(%ebp)
	leal	-212(%ebp), %eax
	pushl	%eax
	pushl	-4(%ebp)
	call	_fprintf
	addl	$16, %esp
L313:
	.loc 1 528 0
	leave
	ret
LFE54:
.globl _printreal
_printreal:
LFB55:
	.loc 1 529 0
	pushl	%ebp
LCFI208:
	movl	%esp, %ebp
LCFI209:
	subl	$24, %esp
LCFI210:
	.loc 1 530 0
	flds	12(%ebp)
	fstpl	-8(%ebp)
	.loc 1 531 0
	subl	$12, %esp
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	-4(%ebp)
	pushl	-8(%ebp)
	pushl	8(%ebp)
LCFI211:
	call	_printdouble
	addl	$32, %esp
	.loc 1 532 0
	leave
	ret
LFE55:
.globl _cstringassign
_cstringassign:
LFB56:
	.loc 1 536 0
	pushl	%ebp
LCFI212:
	movl	%esp, %ebp
LCFI213:
	subl	$16, %esp
LCFI214:
	.loc 1 537 0
	movl	12(%ebp), %eax
	movl	%eax, -8(%ebp)
	.loc 1 539 0
	movl	16(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	cmpl	-8(%ebp), %eax
	jge	L317
	movl	16(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -8(%ebp)
L317:
	.loc 1 540 0
	movl	-8(%ebp), %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movw	%dx, (%eax)
	.loc 1 542 0
	movl	$1, -4(%ebp)
	jmp	L319
L320:
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	addl	8(%ebp), %edx
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	addl	16(%ebp), %eax
	movw	(%eax), %ax
	movw	%ax, (%edx)
	leal	-4(%ebp), %eax
	incl	(%eax)
L319:
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jle	L320
	.loc 1 544 0
	leave
	ret
LFE56:
.globl _stringappend
_stringappend:
LFB57:
	.loc 1 549 0
	pushl	%ebp
LCFI215:
	movl	%esp, %ebp
LCFI216:
	subl	$16, %esp
LCFI217:
	.loc 1 549 0
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -12(%ebp)
	.loc 1 550 0
	movl	-12(%ebp), %edx
	movl	12(%ebp), %eax
	subl	%edx, %eax
	movl	%eax, -8(%ebp)
	.loc 1 552 0
	movl	16(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	cmpl	-8(%ebp), %eax
	jge	L324
	movl	16(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -8(%ebp)
L324:
	.loc 1 553 0
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	movl	%eax, %edx
	movl	-8(%ebp), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movw	%dx, (%eax)
	.loc 1 554 0
	movl	$1, -4(%ebp)
	jmp	L326
L327:
	movl	-4(%ebp), %eax
	addl	-12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, %edx
	addl	8(%ebp), %edx
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	addl	16(%ebp), %eax
	movw	(%eax), %ax
	movw	%ax, (%edx)
	leal	-4(%ebp), %eax
	incl	(%eax)
L326:
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jle	L327
	.loc 1 556 0
	leave
	ret
LFE57:
.globl _gettime
_gettime:
LFB58:
	.loc 1 558 0
	pushl	%ebp
LCFI218:
	movl	%esp, %ebp
LCFI219:
	subl	$40, %esp
LCFI220:
	.loc 1 563 0
	subl	$12, %esp
	leal	-28(%ebp), %eax
	pushl	%eax
LCFI221:
	call	_ftime
	addl	$16, %esp
	.loc 1 564 0
	subl	$12, %esp
	leal	-28(%ebp), %eax
	pushl	%eax
	call	_localtime
	addl	$16, %esp
	movl	%eax, -8(%ebp)
	.loc 1 565 0
	movl	-8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 566 0
	movl	-8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 567 0
	movl	-8(%ebp), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 568 0
	movl	-24(%ebp), %eax
	movl	%eax, %ecx
	andl	$65535, %ecx
	movl	%ecx, %eax
	addl	%eax, %eax
	addl	%ecx, %eax
	movl	%eax, %edx
	sall	$4, %edx
	addl	%edx, %eax
	movl	%eax, %edx
	sall	$8, %edx
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	shrl	$16, %eax
	shrw	$3, %ax
	movswl	%ax,%edx
	movl	20(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 578 0
	leave
	ret
LFE58:
	.p2align 3
LC17:
	.long	0
	.long	1078853632
	.p2align 3
LC18:
	.long	1202590843
	.long	1065646817
.globl _secs
_secs:
LFB59:
	.loc 1 580 0
	pushl	%ebp
LCFI222:
	movl	%esp, %ebp
LCFI223:
	subl	$40, %esp
LCFI224:
	.loc 1 584 0
	leal	-24(%ebp), %eax
	pushl	%eax
	leal	-20(%ebp), %eax
	pushl	%eax
	leal	-16(%ebp), %eax
	pushl	%eax
	leal	-12(%ebp), %eax
	pushl	%eax
LCFI225:
	call	_gettime
	addl	$16, %esp
	.loc 1 586 0
	movl	-12(%ebp), %eax
	pushl	%eax
	fildl	(%esp)
	leal	4(%esp), %esp
	fldl	LC17
	fmulp	%st, %st(1)
	movl	-16(%ebp), %eax
	pushl	%eax
	fildl	(%esp)
	leal	4(%esp), %esp
	faddp	%st, %st(1)
	fldl	LC17
	fmulp	%st, %st(1)
	movl	-20(%ebp), %eax
	pushl	%eax
	fildl	(%esp)
	leal	4(%esp), %esp
	faddp	%st, %st(1)
	movl	-24(%ebp), %eax
	pushl	%eax
	fildl	(%esp)
	leal	4(%esp), %esp
	fldl	LC18
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	fstpl	-8(%ebp)
	.loc 1 588 0
	fldl	-8(%ebp)
	fstps	-36(%ebp)
	flds	-36(%ebp)
	.loc 1 589 0
	leave
	ret
LFE59:
.globl _doinitvec
_doinitvec:
LFB60:
	.loc 1 605 0
	pushl	%ebp
LCFI226:
	movl	%esp, %ebp
LCFI227:
	subl	$56, %esp
LCFI228:
	.loc 1 607 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 608 0
	movl	16(%ebp), %eax
	movl	%eax, -16(%ebp)
	.loc 1 609 0
	movl	12(%ebp), %eax
	movl	%eax, -32(%ebp)
	jmp	L335
L336:
	.loc 1 610 0
	movl	-32(%ebp), %eax
	decl	%eax
	movl	%eax, -28(%ebp)
	.loc 1 611 0
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	-4(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	.loc 1 612 0
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	-4(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
	.loc 1 613 0
	movl	-24(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	%edx, %eax
	leal	1(%eax), %edx
	movl	-16(%ebp), %eax
	imull	%edx, %eax
	movl	%eax, -16(%ebp)
	.loc 1 614 0
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, %edx
	addl	-4(%ebp), %edx
	movl	-16(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 609 0
	leal	-32(%ebp), %eax
	decl	(%eax)
L335:
	cmpl	$0, -32(%ebp)
	jg	L336
	.loc 1 617 0
	cmpl	$0, 20(%ebp)
	jne	L338
	.loc 1 618 0
	movl	12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, -12(%ebp)
	.loc 1 619 0
	movl	-16(%ebp), %eax
	addl	-12(%ebp), %eax
	movl	%eax, -36(%ebp)
	.loc 1 620 0
	movl	-36(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
LCFI229:
	call	_malloc
	addl	$16, %esp
	movl	%eax, -8(%ebp)
	.loc 1 621 0
	movl	-8(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 623 0
	movl	$0, -32(%ebp)
	jmp	L340
L341:
	movl	-32(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	addl	-8(%ebp), %edx
	movl	-32(%ebp), %eax
	sall	$2, %eax
	addl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	leal	-32(%ebp), %eax
	incl	(%eax)
L340:
	movl	12(%ebp), %eax
	movl	%eax, %edx
	addl	%edx, %edx
	leal	(%edx,%eax), %eax
	cmpl	-32(%ebp), %eax
	jg	L341
	.loc 1 624 0
	movl	8(%ebp), %edx
	movl	-8(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 625 0
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_free
	addl	$16, %esp
	jmp	L344
L338:
	.loc 1 629 0
	movl	-16(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	_malloc
	addl	$16, %esp
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, (%eax)
L344:
	.loc 1 632 0
	leave
	ret
LFE60:
.globl _initvec
_initvec:
LFB61:
	.loc 1 651 0
	pushl	%ebp
LCFI230:
	movl	%esp, %ebp
LCFI231:
	subl	$8, %esp
LCFI232:
	.loc 1 651 0
	pushl	$0
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	8(%ebp)
LCFI233:
	call	_doinitvec
	addl	$16, %esp
	leave
	ret
LFE61:
.globl _delphiinitvec
_delphiinitvec:
LFB62:
	.loc 1 653 0
	pushl	%ebp
LCFI234:
	movl	%esp, %ebp
LCFI235:
	subl	$8, %esp
LCFI236:
	.loc 1 653 0
	pushl	$1
	pushl	16(%ebp)
	pushl	12(%ebp)
	leal	8(%ebp), %eax
	pushl	%eax
LCFI237:
	call	_doinitvec
	addl	$16, %esp
	leave
	ret
LFE62:
.globl _getmem
_getmem:
LFB63:
	.loc 1 656 0
	pushl	%ebp
LCFI238:
	movl	%esp, %ebp
LCFI239:
	subl	$8, %esp
LCFI240:
	.loc 1 657 0
	movl	12(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
LCFI241:
	call	_malloc
	addl	$16, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 658 0
	leave
	ret
LFE63:
.globl _freemem
_freemem:
LFB64:
	.loc 1 660 0
	pushl	%ebp
LCFI242:
	movl	%esp, %ebp
LCFI243:
	subl	$8, %esp
LCFI244:
	.loc 1 661 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
LCFI245:
	call	_free
	addl	$16, %esp
	.loc 1 663 0
	leave
	ret
LFE64:
LC20:
	.ascii "%x\0"
.globl _printpointer
_printpointer:
LFB65:
	.loc 1 665 0
	pushl	%ebp
LCFI246:
	movl	%esp, %ebp
LCFI247:
	subl	$8, %esp
LCFI248:
	.loc 1 666 0
	subl	$8, %esp
	pushl	8(%ebp)
	pushl	$LC20
LCFI249:
	call	_printf
	addl	$16, %esp
	.loc 1 667 0
	leave
	ret
LFE65:
.globl _pdispose
_pdispose:
LFB66:
	.loc 1 669 0
	pushl	%ebp
LCFI250:
	movl	%esp, %ebp
LCFI251:
	subl	$8, %esp
LCFI252:
	.loc 1 671 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI253:
	call	_free
	addl	$16, %esp
	.loc 1 672 0
	leave
	ret
LFE66:
LC21:
	.ascii "bounds fault\12\0"
.globl _boundsfault
_boundsfault:
LFB67:
	.loc 1 676 0
	pushl	%ebp
LCFI254:
	movl	%esp, %ebp
LCFI255:
	subl	$8, %esp
LCFI256:
	.loc 1 677 0
	cmpl	$261, 8(%ebp)
	jne	L358
	subl	$12, %esp
	pushl	$LC21
LCFI257:
	call	_printf
	addl	$16, %esp
L358:
	.loc 1 678 0
	subl	$12, %esp
	pushl	$288
	call	_raise
	addl	$16, %esp
	.loc 1 680 0
	leave
	ret
LFE67:
.globl _paramcount
_paramcount:
LFB68:
	.loc 1 683 0
	pushl	%ebp
LCFI258:
	movl	%esp, %ebp
LCFI259:
	.loc 1 683 0
	movl	_Argc, %eax
	popl	%ebp
	ret
LFE68:
.globl _parampntr
_parampntr:
LFB69:
	.loc 1 685 0
	pushl	%ebp
LCFI260:
	movl	%esp, %ebp
LCFI261:
	.loc 1 685 0
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %edx
	movl	_Argv, %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	popl	%ebp
	ret
LFE69:
.globl _main
_main:
LFB70:
	.loc 1 688 0
	pushl	%ebp
LCFI262:
	movl	%esp, %ebp
LCFI263:
	subl	$8, %esp
LCFI264:
	andl	$-16, %esp
	movl	$0, %eax
	addl	$15, %eax
	addl	$15, %eax
	shrl	$4, %eax
	sall	$4, %eax
	subl	%eax, %esp
	.loc 1 689 0
	movl	8(%ebp), %eax
	movl	%eax, _Argc
	movl	12(%ebp), %eax
	movl	%eax, _Argv
	.loc 1 690 0
	call	_initfs
	.loc 1 691 0
	subl	$8, %esp
	pushl	$_boundsfault
	pushl	$291
LCFI265:
	call	_signal
	addl	$16, %esp
	.loc 1 692 0
LCFI266:
	call	_Pmain
	.loc 1 693 0
	subl	$12, %esp
	pushl	$0
LCFI267:
	call	_pascalexit
	addl	$16, %esp
	.loc 1 694 0
	leave
	ret
LFE70:
.comm _files,8320
.comm _Argc,16
.comm _Argv,16
	.section	.debug_frame,""
Lframe0:
	.long	LECIE0-LSCIE0
LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.ascii "\0"
	.uleb128 0x1
	.sleb128 -4
	.byte	0x8
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.p2align 2
LECIE0:
LSFDE0:
	.long	LEFDE0-LASFDE0
LASFDE0:
	.long	Lframe0
	.long	LFB2
	.long	LFE2-LFB2
	.byte	0x4
	.long	LCFI0-LFB2
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI1-LCFI0
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE0:
LSFDE2:
	.long	LEFDE2-LASFDE2
LASFDE2:
	.long	Lframe0
	.long	LFB3
	.long	LFE3-LFB3
	.byte	0x4
	.long	LCFI3-LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI4-LCFI3
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE2:
LSFDE4:
	.long	LEFDE4-LASFDE4
LASFDE4:
	.long	Lframe0
	.long	LFB4
	.long	LFE4-LFB4
	.byte	0x4
	.long	LCFI5-LFB4
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI6-LCFI5
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI8-LCFI6
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE4:
LSFDE6:
	.long	LEFDE6-LASFDE6
LASFDE6:
	.long	Lframe0
	.long	LFB5
	.long	LFE5-LFB5
	.byte	0x4
	.long	LCFI9-LFB5
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI10-LCFI9
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI12-LCFI10
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE6:
LSFDE8:
	.long	LEFDE8-LASFDE8
LASFDE8:
	.long	Lframe0
	.long	LFB6
	.long	LFE6-LFB6
	.byte	0x4
	.long	LCFI13-LFB6
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI14-LCFI13
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI16-LCFI14
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE8:
LSFDE10:
	.long	LEFDE10-LASFDE10
LASFDE10:
	.long	Lframe0
	.long	LFB7
	.long	LFE7-LFB7
	.byte	0x4
	.long	LCFI17-LFB7
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI18-LCFI17
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE10:
LSFDE12:
	.long	LEFDE12-LASFDE12
LASFDE12:
	.long	Lframe0
	.long	LFB8
	.long	LFE8-LFB8
	.byte	0x4
	.long	LCFI20-LFB8
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI21-LCFI20
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI23-LCFI21
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE12:
LSFDE14:
	.long	LEFDE14-LASFDE14
LASFDE14:
	.long	Lframe0
	.long	LFB9
	.long	LFE9-LFB9
	.byte	0x4
	.long	LCFI24-LFB9
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI25-LCFI24
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI27-LCFI25
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE14:
LSFDE16:
	.long	LEFDE16-LASFDE16
LASFDE16:
	.long	Lframe0
	.long	LFB10
	.long	LFE10-LFB10
	.byte	0x4
	.long	LCFI28-LFB10
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI29-LCFI28
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE16:
LSFDE18:
	.long	LEFDE18-LASFDE18
LASFDE18:
	.long	Lframe0
	.long	LFB11
	.long	LFE11-LFB11
	.byte	0x4
	.long	LCFI30-LFB11
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI31-LCFI30
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI33-LCFI31
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE18:
LSFDE20:
	.long	LEFDE20-LASFDE20
LASFDE20:
	.long	Lframe0
	.long	LFB12
	.long	LFE12-LFB12
	.byte	0x4
	.long	LCFI34-LFB12
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI35-LCFI34
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI37-LCFI35
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE20:
LSFDE22:
	.long	LEFDE22-LASFDE22
LASFDE22:
	.long	Lframe0
	.long	LFB13
	.long	LFE13-LFB13
	.byte	0x4
	.long	LCFI38-LFB13
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI39-LCFI38
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE22:
LSFDE24:
	.long	LEFDE24-LASFDE24
LASFDE24:
	.long	Lframe0
	.long	LFB14
	.long	LFE14-LFB14
	.byte	0x4
	.long	LCFI41-LFB14
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI42-LCFI41
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI44-LCFI42
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.p2align 2
LEFDE24:
LSFDE26:
	.long	LEFDE26-LASFDE26
LASFDE26:
	.long	Lframe0
	.long	LFB15
	.long	LFE15-LFB15
	.byte	0x4
	.long	LCFI45-LFB15
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI46-LCFI45
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI48-LCFI46
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	LCFI49-LCFI48
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE26:
LSFDE28:
	.long	LEFDE28-LASFDE28
LASFDE28:
	.long	Lframe0
	.long	LFB16
	.long	LFE16-LFB16
	.byte	0x4
	.long	LCFI50-LFB16
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI51-LCFI50
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI53-LCFI51
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE28:
LSFDE30:
	.long	LEFDE30-LASFDE30
LASFDE30:
	.long	Lframe0
	.long	LFB17
	.long	LFE17-LFB17
	.byte	0x4
	.long	LCFI54-LFB17
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI55-LCFI54
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI57-LCFI55
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE30:
LSFDE32:
	.long	LEFDE32-LASFDE32
LASFDE32:
	.long	Lframe0
	.long	LFB18
	.long	LFE18-LFB18
	.byte	0x4
	.long	LCFI58-LFB18
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI59-LCFI58
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI61-LCFI59
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE32:
LSFDE34:
	.long	LEFDE34-LASFDE34
LASFDE34:
	.long	Lframe0
	.long	LFB19
	.long	LFE19-LFB19
	.byte	0x4
	.long	LCFI62-LFB19
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI63-LCFI62
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI65-LCFI63
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI66-LCFI65
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE34:
LSFDE36:
	.long	LEFDE36-LASFDE36
LASFDE36:
	.long	Lframe0
	.long	LFB20
	.long	LFE20-LFB20
	.byte	0x4
	.long	LCFI67-LFB20
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI68-LCFI67
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI70-LCFI68
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI71-LCFI70
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE36:
LSFDE38:
	.long	LEFDE38-LASFDE38
LASFDE38:
	.long	Lframe0
	.long	LFB21
	.long	LFE21-LFB21
	.byte	0x4
	.long	LCFI72-LFB21
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI73-LCFI72
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI75-LCFI73
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI76-LCFI75
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE38:
LSFDE40:
	.long	LEFDE40-LASFDE40
LASFDE40:
	.long	Lframe0
	.long	LFB22
	.long	LFE22-LFB22
	.byte	0x4
	.long	LCFI77-LFB22
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI78-LCFI77
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI80-LCFI78
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI81-LCFI80
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE40:
LSFDE42:
	.long	LEFDE42-LASFDE42
LASFDE42:
	.long	Lframe0
	.long	LFB23
	.long	LFE23-LFB23
	.byte	0x4
	.long	LCFI82-LFB23
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI83-LCFI82
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI85-LCFI83
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI86-LCFI85
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE42:
LSFDE44:
	.long	LEFDE44-LASFDE44
LASFDE44:
	.long	Lframe0
	.long	LFB24
	.long	LFE24-LFB24
	.byte	0x4
	.long	LCFI87-LFB24
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI88-LCFI87
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE44:
LSFDE46:
	.long	LEFDE46-LASFDE46
LASFDE46:
	.long	Lframe0
	.long	LFB25
	.long	LFE25-LFB25
	.byte	0x4
	.long	LCFI89-LFB25
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI90-LCFI89
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI92-LCFI90
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI93-LCFI92
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	LCFI94-LCFI93
	.byte	0x2e
	.uleb128 0x0
	.p2align 2
LEFDE46:
LSFDE48:
	.long	LEFDE48-LASFDE48
LASFDE48:
	.long	Lframe0
	.long	LFB26
	.long	LFE26-LFB26
	.byte	0x4
	.long	LCFI95-LFB26
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI96-LCFI95
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE48:
LSFDE50:
	.long	LEFDE50-LASFDE50
LASFDE50:
	.long	Lframe0
	.long	LFB27
	.long	LFE27-LFB27
	.byte	0x4
	.long	LCFI98-LFB27
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI99-LCFI98
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI101-LCFI99
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE50:
LSFDE52:
	.long	LEFDE52-LASFDE52
LASFDE52:
	.long	Lframe0
	.long	LFB28
	.long	LFE28-LFB28
	.byte	0x4
	.long	LCFI102-LFB28
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI103-LCFI102
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI105-LCFI103
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE52:
LSFDE54:
	.long	LEFDE54-LASFDE54
LASFDE54:
	.long	Lframe0
	.long	LFB29
	.long	LFE29-LFB29
	.byte	0x4
	.long	LCFI106-LFB29
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI107-LCFI106
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE54:
LSFDE56:
	.long	LEFDE56-LASFDE56
LASFDE56:
	.long	Lframe0
	.long	LFB30
	.long	LFE30-LFB30
	.byte	0x4
	.long	LCFI109-LFB30
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI110-LCFI109
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI112-LCFI110
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI113-LCFI112
	.byte	0x2e
	.uleb128 0x8
	.byte	0x4
	.long	LCFI114-LCFI113
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE56:
LSFDE58:
	.long	LEFDE58-LASFDE58
LASFDE58:
	.long	Lframe0
	.long	LFB31
	.long	LFE31-LFB31
	.byte	0x4
	.long	LCFI115-LFB31
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI116-LCFI115
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI118-LCFI116
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE58:
LSFDE60:
	.long	LEFDE60-LASFDE60
LASFDE60:
	.long	Lframe0
	.long	LFB32
	.long	LFE32-LFB32
	.byte	0x4
	.long	LCFI119-LFB32
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI120-LCFI119
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI122-LCFI120
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE60:
LSFDE62:
	.long	LEFDE62-LASFDE62
LASFDE62:
	.long	Lframe0
	.long	LFB33
	.long	LFE33-LFB33
	.byte	0x4
	.long	LCFI123-LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI124-LCFI123
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI126-LCFI124
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE62:
LSFDE64:
	.long	LEFDE64-LASFDE64
LASFDE64:
	.long	Lframe0
	.long	LFB34
	.long	LFE34-LFB34
	.byte	0x4
	.long	LCFI127-LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI128-LCFI127
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI130-LCFI128
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE64:
LSFDE66:
	.long	LEFDE66-LASFDE66
LASFDE66:
	.long	Lframe0
	.long	LFB35
	.long	LFE35-LFB35
	.byte	0x4
	.long	LCFI131-LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI132-LCFI131
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI134-LCFI132
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE66:
LSFDE68:
	.long	LEFDE68-LASFDE68
LASFDE68:
	.long	Lframe0
	.long	LFB36
	.long	LFE36-LFB36
	.byte	0x4
	.long	LCFI135-LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI136-LCFI135
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI138-LCFI136
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE68:
LSFDE70:
	.long	LEFDE70-LASFDE70
LASFDE70:
	.long	Lframe0
	.long	LFB37
	.long	LFE37-LFB37
	.byte	0x4
	.long	LCFI139-LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI140-LCFI139
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE70:
LSFDE72:
	.long	LEFDE72-LASFDE72
LASFDE72:
	.long	Lframe0
	.long	LFB38
	.long	LFE38-LFB38
	.byte	0x4
	.long	LCFI141-LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI142-LCFI141
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE72:
LSFDE74:
	.long	LEFDE74-LASFDE74
LASFDE74:
	.long	Lframe0
	.long	LFB39
	.long	LFE39-LFB39
	.byte	0x4
	.long	LCFI143-LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI144-LCFI143
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI146-LCFI144
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE74:
LSFDE76:
	.long	LEFDE76-LASFDE76
LASFDE76:
	.long	Lframe0
	.long	LFB40
	.long	LFE40-LFB40
	.byte	0x4
	.long	LCFI147-LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI148-LCFI147
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI150-LCFI148
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE76:
LSFDE78:
	.long	LEFDE78-LASFDE78
LASFDE78:
	.long	Lframe0
	.long	LFB41
	.long	LFE41-LFB41
	.byte	0x4
	.long	LCFI151-LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI152-LCFI151
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI154-LCFI152
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE78:
LSFDE80:
	.long	LEFDE80-LASFDE80
LASFDE80:
	.long	Lframe0
	.long	LFB42
	.long	LFE42-LFB42
	.byte	0x4
	.long	LCFI155-LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI156-LCFI155
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI158-LCFI156
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE80:
LSFDE82:
	.long	LEFDE82-LASFDE82
LASFDE82:
	.long	Lframe0
	.long	LFB43
	.long	LFE43-LFB43
	.byte	0x4
	.long	LCFI159-LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI160-LCFI159
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE82:
LSFDE84:
	.long	LEFDE84-LASFDE84
LASFDE84:
	.long	Lframe0
	.long	LFB44
	.long	LFE44-LFB44
	.byte	0x4
	.long	LCFI162-LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI163-LCFI162
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI165-LCFI163
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI166-LCFI165
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI167-LCFI166
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE84:
LSFDE86:
	.long	LEFDE86-LASFDE86
LASFDE86:
	.long	Lframe0
	.long	LFB45
	.long	LFE45-LFB45
	.byte	0x4
	.long	LCFI168-LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI169-LCFI168
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE86:
LSFDE88:
	.long	LEFDE88-LASFDE88
LASFDE88:
	.long	Lframe0
	.long	LFB46
	.long	LFE46-LFB46
	.byte	0x4
	.long	LCFI171-LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI172-LCFI171
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE88:
LSFDE90:
	.long	LEFDE90-LASFDE90
LASFDE90:
	.long	Lframe0
	.long	LFB47
	.long	LFE47-LFB47
	.byte	0x4
	.long	LCFI174-LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI175-LCFI174
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI177-LCFI175
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE90:
LSFDE92:
	.long	LEFDE92-LASFDE92
LASFDE92:
	.long	Lframe0
	.long	LFB48
	.long	LFE48-LFB48
	.byte	0x4
	.long	LCFI178-LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI179-LCFI178
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI181-LCFI179
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE92:
LSFDE94:
	.long	LEFDE94-LASFDE94
LASFDE94:
	.long	Lframe0
	.long	LFB49
	.long	LFE49-LFB49
	.byte	0x4
	.long	LCFI182-LFB49
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI183-LCFI182
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI185-LCFI183
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE94:
LSFDE96:
	.long	LEFDE96-LASFDE96
LASFDE96:
	.long	Lframe0
	.long	LFB50
	.long	LFE50-LFB50
	.byte	0x4
	.long	LCFI186-LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI187-LCFI186
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI189-LCFI187
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE96:
LSFDE98:
	.long	LEFDE98-LASFDE98
LASFDE98:
	.long	Lframe0
	.long	LFB51
	.long	LFE51-LFB51
	.byte	0x4
	.long	LCFI190-LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI191-LCFI190
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI193-LCFI191
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE98:
LSFDE100:
	.long	LEFDE100-LASFDE100
LASFDE100:
	.long	Lframe0
	.long	LFB52
	.long	LFE52-LFB52
	.byte	0x4
	.long	LCFI194-LFB52
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI195-LCFI194
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI197-LCFI195
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE100:
LSFDE102:
	.long	LEFDE102-LASFDE102
LASFDE102:
	.long	Lframe0
	.long	LFB53
	.long	LFE53-LFB53
	.byte	0x4
	.long	LCFI198-LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI199-LCFI198
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI201-LCFI199
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE102:
LSFDE104:
	.long	LEFDE104-LASFDE104
LASFDE104:
	.long	Lframe0
	.long	LFB54
	.long	LFE54-LFB54
	.byte	0x4
	.long	LCFI202-LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI203-LCFI202
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI205-LCFI203
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI206-LCFI205
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	LCFI207-LCFI206
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE104:
LSFDE106:
	.long	LEFDE106-LASFDE106
LASFDE106:
	.long	Lframe0
	.long	LFB55
	.long	LFE55-LFB55
	.byte	0x4
	.long	LCFI208-LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI209-LCFI208
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI211-LCFI209
	.byte	0x2e
	.uleb128 0x20
	.p2align 2
LEFDE106:
LSFDE108:
	.long	LEFDE108-LASFDE108
LASFDE108:
	.long	Lframe0
	.long	LFB56
	.long	LFE56-LFB56
	.byte	0x4
	.long	LCFI212-LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI213-LCFI212
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE108:
LSFDE110:
	.long	LEFDE110-LASFDE110
LASFDE110:
	.long	Lframe0
	.long	LFB57
	.long	LFE57-LFB57
	.byte	0x4
	.long	LCFI215-LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI216-LCFI215
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE110:
LSFDE112:
	.long	LEFDE112-LASFDE112
LASFDE112:
	.long	Lframe0
	.long	LFB58
	.long	LFE58-LFB58
	.byte	0x4
	.long	LCFI218-LFB58
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI219-LCFI218
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI221-LCFI219
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE112:
LSFDE114:
	.long	LEFDE114-LASFDE114
LASFDE114:
	.long	Lframe0
	.long	LFB59
	.long	LFE59-LFB59
	.byte	0x4
	.long	LCFI222-LFB59
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI223-LCFI222
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI225-LCFI223
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE114:
LSFDE116:
	.long	LEFDE116-LASFDE116
LASFDE116:
	.long	Lframe0
	.long	LFB60
	.long	LFE60-LFB60
	.byte	0x4
	.long	LCFI226-LFB60
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI227-LCFI226
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI229-LCFI227
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE116:
LSFDE118:
	.long	LEFDE118-LASFDE118
LASFDE118:
	.long	Lframe0
	.long	LFB61
	.long	LFE61-LFB61
	.byte	0x4
	.long	LCFI230-LFB61
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI231-LCFI230
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI233-LCFI231
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE118:
LSFDE120:
	.long	LEFDE120-LASFDE120
LASFDE120:
	.long	Lframe0
	.long	LFB62
	.long	LFE62-LFB62
	.byte	0x4
	.long	LCFI234-LFB62
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI235-LCFI234
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI237-LCFI235
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE120:
LSFDE122:
	.long	LEFDE122-LASFDE122
LASFDE122:
	.long	Lframe0
	.long	LFB63
	.long	LFE63-LFB63
	.byte	0x4
	.long	LCFI238-LFB63
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI239-LCFI238
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI241-LCFI239
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE122:
LSFDE124:
	.long	LEFDE124-LASFDE124
LASFDE124:
	.long	Lframe0
	.long	LFB64
	.long	LFE64-LFB64
	.byte	0x4
	.long	LCFI242-LFB64
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI243-LCFI242
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI245-LCFI243
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE124:
LSFDE126:
	.long	LEFDE126-LASFDE126
LASFDE126:
	.long	Lframe0
	.long	LFB65
	.long	LFE65-LFB65
	.byte	0x4
	.long	LCFI246-LFB65
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI247-LCFI246
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI249-LCFI247
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE126:
LSFDE128:
	.long	LEFDE128-LASFDE128
LASFDE128:
	.long	Lframe0
	.long	LFB66
	.long	LFE66-LFB66
	.byte	0x4
	.long	LCFI250-LFB66
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI251-LCFI250
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI253-LCFI251
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE128:
LSFDE130:
	.long	LEFDE130-LASFDE130
LASFDE130:
	.long	Lframe0
	.long	LFB67
	.long	LFE67-LFB67
	.byte	0x4
	.long	LCFI254-LFB67
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI255-LCFI254
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI257-LCFI255
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE130:
LSFDE132:
	.long	LEFDE132-LASFDE132
LASFDE132:
	.long	Lframe0
	.long	LFB68
	.long	LFE68-LFB68
	.byte	0x4
	.long	LCFI258-LFB68
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI259-LCFI258
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE132:
LSFDE134:
	.long	LEFDE134-LASFDE134
LASFDE134:
	.long	Lframe0
	.long	LFB69
	.long	LFE69-LFB69
	.byte	0x4
	.long	LCFI260-LFB69
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI261-LCFI260
	.byte	0xd
	.uleb128 0x5
	.p2align 2
LEFDE134:
LSFDE136:
	.long	LEFDE136-LASFDE136
LASFDE136:
	.long	Lframe0
	.long	LFB70
	.long	LFE70-LFB70
	.byte	0x4
	.long	LCFI262-LFB70
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI263-LCFI262
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	LCFI265-LCFI263
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI266-LCFI265
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	LCFI267-LCFI266
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE136:
	.file 2 "c:/djgpp/include/dirent.h"
	.file 3 "c:/djgpp/include/sys/stat.h"
	.file 4 "c:/djgpp/include/sys/types.h"
	.file 5 "c:/djgpp/include/stdio.h"
	.file 6 "c:/djgpp/include/sys/timeb.h"
	.file 7 "c:/djgpp/include/time.h"
	.section .text
Letext0:
	.section	.debug_info,""
	.long	0x1b36
	.word	0x2
	.long	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	Ldebug_line0
	.long	Letext0
	.long	Ltext0
	.ascii "GNU C 4.0.1\0"
	.byte	0x1
	.ascii "c:\\vp\\mmpc\\rtl.c\0"
	.ascii "c:/vp/ilcg/Pascal\0"
	.uleb128 0x2
	.ascii "char\0"
	.byte	0x1
	.byte	0x6
	.uleb128 0x3
	.long	LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x4
	.long	0xee
	.byte	0x20
	.byte	0x5
	.byte	0x37
	.uleb128 0x5
	.ascii "_cnt\0"
	.byte	0x5
	.byte	0x2f
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "_ptr\0"
	.byte	0x5
	.byte	0x30
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "_base\0"
	.byte	0x5
	.byte	0x31
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "_bufsiz\0"
	.byte	0x5
	.byte	0x32
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "_flag\0"
	.byte	0x5
	.byte	0x33
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "_file\0"
	.byte	0x5
	.byte	0x34
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "_name_to_remove\0"
	.byte	0x5
	.byte	0x35
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "_fillsize\0"
	.byte	0x5
	.byte	0x36
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2
	.ascii "int\0"
	.byte	0x4
	.byte	0x5
	.uleb128 0x6
	.byte	0x4
	.long	0x48
	.uleb128 0x7
	.ascii "FILE\0"
	.byte	0x5
	.byte	0x37
	.long	0x57
	.uleb128 0x3
	.long	LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x7
	.ascii "dev_t\0"
	.byte	0x4
	.byte	0x11
	.long	0xee
	.uleb128 0x7
	.ascii "ino_t\0"
	.byte	0x4
	.byte	0x12
	.long	0xee
	.uleb128 0x7
	.ascii "mode_t\0"
	.byte	0x4
	.byte	0x13
	.long	0xee
	.uleb128 0x7
	.ascii "nlink_t\0"
	.byte	0x4
	.byte	0x14
	.long	0xee
	.uleb128 0x7
	.ascii "gid_t\0"
	.byte	0x4
	.byte	0x16
	.long	0xee
	.uleb128 0x7
	.ascii "off_t\0"
	.byte	0x4
	.byte	0x19
	.long	0xee
	.uleb128 0x7
	.ascii "uid_t\0"
	.byte	0x4
	.byte	0x25
	.long	0xee
	.uleb128 0x2
	.ascii "unsigned char\0"
	.byte	0x1
	.byte	0x8
	.uleb128 0x7
	.ascii "time_t\0"
	.byte	0x4
	.byte	0x39
	.long	0x18b
	.uleb128 0x2
	.ascii "unsigned int\0"
	.byte	0x4
	.byte	0x7
	.uleb128 0x8
	.long	0x271
	.ascii "tm\0"
	.byte	0x2c
	.byte	0x7
	.byte	0x22
	.uleb128 0x5
	.ascii "tm_sec\0"
	.byte	0x7
	.byte	0x23
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "tm_min\0"
	.byte	0x7
	.byte	0x24
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "tm_hour\0"
	.byte	0x7
	.byte	0x25
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "tm_mday\0"
	.byte	0x7
	.byte	0x26
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "tm_mon\0"
	.byte	0x7
	.byte	0x27
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "tm_year\0"
	.byte	0x7
	.byte	0x28
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "tm_wday\0"
	.byte	0x7
	.byte	0x29
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "tm_yday\0"
	.byte	0x7
	.byte	0x2a
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "tm_isdst\0"
	.byte	0x7
	.byte	0x2b
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.ascii "__tm_zone\0"
	.byte	0x7
	.byte	0x2c
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.ascii "__tm_gmtoff\0"
	.byte	0x7
	.byte	0x2d
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x2
	.ascii "long int\0"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.ascii "long long int\0"
	.byte	0x8
	.byte	0x5
	.uleb128 0x8
	.long	0x2de
	.ascii "timeb\0"
	.byte	0xc
	.byte	0x6
	.byte	0x16
	.uleb128 0x5
	.ascii "time\0"
	.byte	0x6
	.byte	0x17
	.long	0x17d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "millitm\0"
	.byte	0x6
	.byte	0x18
	.long	0x2de
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	LASF1
	.byte	0x6
	.byte	0x19
	.long	0x2f4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x5
	.ascii "dstflag\0"
	.byte	0x6
	.byte	0x1a
	.long	0x2f4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.ascii "short unsigned int\0"
	.byte	0x2
	.byte	0x7
	.uleb128 0x2
	.ascii "short int\0"
	.byte	0x2
	.byte	0x5
	.uleb128 0xa
	.long	0x336
	.ascii "dirent\0"
	.word	0x101
	.byte	0x2
	.byte	0x12
	.uleb128 0x5
	.ascii "d_namlen\0"
	.byte	0x2
	.byte	0x13
	.long	0x48
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "d_name\0"
	.byte	0x2
	.byte	0x14
	.long	0x336
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0xb
	.long	0x346
	.long	0x48
	.uleb128 0xc
	.long	0x107
	.byte	0xff
	.byte	0x0
	.uleb128 0x8
	.long	0x42f
	.ascii "stat\0"
	.byte	0x30
	.byte	0x3
	.byte	0x29
	.uleb128 0x5
	.ascii "st_atime\0"
	.byte	0x3
	.byte	0x2a
	.long	0x17d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "st_ctime\0"
	.byte	0x3
	.byte	0x2b
	.long	0x17d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "st_dev\0"
	.byte	0x3
	.byte	0x2c
	.long	0x10e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "st_gid\0"
	.byte	0x3
	.byte	0x2d
	.long	0x145
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "st_ino\0"
	.byte	0x3
	.byte	0x2e
	.long	0x11b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "st_mode\0"
	.byte	0x3
	.byte	0x2f
	.long	0x128
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "st_mtime\0"
	.byte	0x3
	.byte	0x30
	.long	0x17d
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "st_nlink\0"
	.byte	0x3
	.byte	0x31
	.long	0x136
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "st_size\0"
	.byte	0x3
	.byte	0x32
	.long	0x152
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.ascii "st_blksize\0"
	.byte	0x3
	.byte	0x33
	.long	0x152
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.ascii "st_uid\0"
	.byte	0x3
	.byte	0x34
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.ascii "st_rdev\0"
	.byte	0x3
	.byte	0x35
	.long	0x10e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.byte	0x0
	.uleb128 0xd
	.long	0x479
	.word	0x104
	.byte	0x1
	.byte	0x21
	.uleb128 0x5
	.ascii "f\0"
	.byte	0x1
	.byte	0x21
	.long	0x479
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "name\0"
	.byte	0x1
	.byte	0x21
	.long	0x47f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "status\0"
	.byte	0x1
	.byte	0x21
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0xfc
	.uleb128 0x5
	.ascii "recsize\0"
	.byte	0x1
	.byte	0x21
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0x100
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xfb
	.uleb128 0xb
	.long	0x48f
	.long	0x48
	.uleb128 0xc
	.long	0x107
	.byte	0xf4
	.byte	0x0
	.uleb128 0xe
	.long	0x4b5
	.byte	0x1
	.ascii "initfs\0"
	.byte	0x1
	.byte	0x24
	.long	LFB2
	.long	LFE2
	.byte	0x1
	.byte	0x55
	.uleb128 0xf
	.ascii "i\0"
	.byte	0x1
	.byte	0x25
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x10
	.long	0x4e3
	.byte	0x1
	.ascii "entryname\0"
	.byte	0x1
	.byte	0x2e
	.byte	0x1
	.long	0xf5
	.long	LFB3
	.long	LFE3
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "p\0"
	.byte	0x1
	.byte	0x2e
	.long	0x4e3
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x301
	.uleb128 0x10
	.long	0x524
	.byte	0x1
	.ascii "isdir\0"
	.byte	0x1
	.byte	0x2f
	.byte	0x1
	.long	0xee
	.long	LFB4
	.long	LFE4
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "name\0"
	.byte	0x1
	.byte	0x2f
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0xf
	.ascii "buf\0"
	.byte	0x1
	.byte	0x2f
	.long	0x346
	.byte	0x2
	.byte	0x75
	.sleb128 -48
	.byte	0x0
	.uleb128 0x12
	.long	0x552
	.byte	0x1
	.ascii "pascalexit\0"
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	LFB5
	.long	LFE5
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "code\0"
	.byte	0x1
	.byte	0x34
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x12
	.long	0x57c
	.byte	0x1
	.ascii "checkerr\0"
	.byte	0x1
	.byte	0x35
	.byte	0x1
	.long	LFB6
	.long	LFE6
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "fn\0"
	.byte	0x1
	.byte	0x35
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x13
	.long	0x5b1
	.byte	0x1
	.ascii "findfreefileblock\0"
	.byte	0x1
	.byte	0x3b
	.long	0xee
	.long	LFB7
	.long	LFE7
	.byte	0x1
	.byte	0x55
	.uleb128 0xf
	.ascii "i\0"
	.byte	0x1
	.byte	0x3b
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0xe
	.long	0x5db
	.byte	0x1
	.ascii "closefiles\0"
	.byte	0x1
	.byte	0x40
	.long	LFB8
	.long	LFE8
	.byte	0x1
	.byte	0x55
	.uleb128 0xf
	.ascii "i\0"
	.byte	0x1
	.byte	0x41
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x12
	.long	0x606
	.byte	0x1
	.ascii "pasclose\0"
	.byte	0x1
	.byte	0x46
	.byte	0x1
	.long	LFB9
	.long	LFE9
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x45
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xee
	.uleb128 0x12
	.long	0x644
	.byte	0x1
	.ascii "setchan\0"
	.byte	0x1
	.byte	0x4b
	.byte	0x1
	.long	LFB10
	.long	LFE10
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x4b
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "num\0"
	.byte	0x1
	.byte	0x4b
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.byte	0x0
	.uleb128 0x10
	.long	0x674
	.byte	0x1
	.ascii "pascaleof\0"
	.byte	0x1
	.byte	0x4d
	.byte	0x1
	.long	0xee
	.long	LFB11
	.long	LFE11
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x4c
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x10
	.long	0x6ab
	.byte	0x1
	.ascii "eoln\0"
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.long	0xee
	.long	LFB12
	.long	LFE12
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x52
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0xf
	.ascii "c\0"
	.byte	0x1
	.byte	0x53
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x12
	.long	0x6f5
	.byte	0x1
	.ascii "u2asciitrunc\0"
	.byte	0x1
	.byte	0x5e
	.byte	0x1
	.long	LFB13
	.long	LFE13
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "src\0"
	.byte	0x1
	.byte	0x5d
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "dest\0"
	.byte	0x1
	.byte	0x5d
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0xf
	.ascii "i\0"
	.byte	0x1
	.byte	0x5e
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2de
	.uleb128 0x12
	.long	0x73f
	.byte	0x1
	.ascii "move\0"
	.byte	0x1
	.byte	0x64
	.byte	0x1
	.long	LFB14
	.long	LFE14
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "src\0"
	.byte	0x1
	.byte	0x63
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "dest\0"
	.byte	0x1
	.byte	0x63
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x11
	.ascii "len\0"
	.byte	0x1
	.byte	0x63
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.byte	0x0
	.uleb128 0x12
	.long	0x776
	.byte	0x1
	.ascii "erase\0"
	.byte	0x1
	.byte	0x65
	.byte	0x1
	.long	LFB15
	.long	LFE15
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF3
	.byte	0x1
	.byte	0x65
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0xf
	.ascii "str\0"
	.byte	0x1
	.byte	0x66
	.long	0x776
	.byte	0x3
	.byte	0x75
	.sleb128 -257
	.byte	0x0
	.uleb128 0xb
	.long	0x787
	.long	0x48
	.uleb128 0x15
	.long	0x107
	.word	0x100
	.byte	0x0
	.uleb128 0x10
	.long	0x7da
	.byte	0x1
	.ascii "filesize\0"
	.byte	0x1
	.byte	0x6b
	.byte	0x1
	.long	0xee
	.long	LFB16
	.long	LFE16
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x6a
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0xf
	.ascii "p\0"
	.byte	0x1
	.byte	0x6c
	.long	0x271
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0xf
	.ascii "l\0"
	.byte	0x1
	.byte	0x6c
	.long	0x271
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0xf
	.ascii "f\0"
	.byte	0x1
	.byte	0x6c
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x10
	.long	0x814
	.byte	0x1
	.ascii "filepos\0"
	.byte	0x1
	.byte	0x73
	.byte	0x1
	.long	0xee
	.long	LFB17
	.long	LFE17
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x73
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0xf
	.ascii "f\0"
	.byte	0x1
	.byte	0x73
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x10
	.long	0x868
	.byte	0x1
	.ascii "seek\0"
	.byte	0x1
	.byte	0x75
	.byte	0x1
	.long	0xee
	.long	LFB18
	.long	LFE18
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x74
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "pos\0"
	.byte	0x1
	.byte	0x74
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x11
	.ascii "mode\0"
	.byte	0x1
	.byte	0x74
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0xf
	.ascii "f\0"
	.byte	0x1
	.byte	0x75
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x12
	.long	0x8be
	.byte	0x1
	.ascii "blockread\0"
	.byte	0x1
	.byte	0x7f
	.byte	0x1
	.long	LFB19
	.long	LFE19
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x7e
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "buf\0"
	.byte	0x1
	.byte	0x7e
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x14
	.long	LASF4
	.byte	0x1
	.byte	0x7e
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x14
	.long	LASF5
	.byte	0x1
	.byte	0x7e
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.byte	0x0
	.uleb128 0x12
	.long	0x915
	.byte	0x1
	.ascii "blockwrite\0"
	.byte	0x1
	.byte	0x84
	.byte	0x1
	.long	LFB20
	.long	LFE20
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x83
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "buf\0"
	.byte	0x1
	.byte	0x83
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x14
	.long	LASF4
	.byte	0x1
	.byte	0x83
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x14
	.long	LASF5
	.byte	0x1
	.byte	0x83
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.byte	0x0
	.uleb128 0x12
	.long	0x93f
	.byte	0x1
	.ascii "rewrite\0"
	.byte	0x1
	.byte	0x89
	.byte	0x1
	.long	LFB21
	.long	LFE21
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x88
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x12
	.long	0x967
	.byte	0x1
	.ascii "reset\0"
	.byte	0x1
	.byte	0x8f
	.byte	0x1
	.long	LFB22
	.long	LFE22
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x8e
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x12
	.long	0x990
	.byte	0x1
	.ascii "append\0"
	.byte	0x1
	.byte	0x96
	.byte	0x1
	.long	LFB23
	.long	LFE23
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x95
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x12
	.long	0x9bb
	.byte	0x1
	.ascii "setiores\0"
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	LFB24
	.long	LFE24
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "val\0"
	.byte	0x1
	.byte	0x9c
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x12
	.long	0xa18
	.byte	0x1
	.ascii "assign\0"
	.byte	0x1
	.byte	0x9e
	.byte	0x1
	.long	LFB25
	.long	LFE25
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.long	LASF2
	.byte	0x1
	.byte	0x9d
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "f\0"
	.byte	0x1
	.byte	0x9d
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0xf
	.ascii "i\0"
	.byte	0x1
	.byte	0x9e
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0xf
	.ascii "fn\0"
	.byte	0x1
	.byte	0x9e
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x16
	.long	LASF3
	.byte	0x1
	.byte	0x9f
	.long	0x336
	.byte	0x3
	.byte	0x75
	.sleb128 -268
	.byte	0x0
	.uleb128 0x13
	.long	0xa47
	.byte	0x1
	.ascii "ioresult\0"
	.byte	0x1
	.byte	0xa9
	.long	0xee
	.long	LFB26
	.long	LFE26
	.byte	0x1
	.byte	0x55
	.uleb128 0xf
	.ascii "temp\0"
	.byte	0x1
	.byte	0xa9
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x12
	.long	0xa8f
	.byte	0x1
	.ascii "readcharnarrow\0"
	.byte	0x1
	.byte	0xab
	.byte	0x1
	.long	LFB27
	.long	LFE27
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "fn\0"
	.byte	0x1
	.byte	0xaa
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "c\0"
	.byte	0x1
	.byte	0xaa
	.long	0xa8f
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0xf
	.ascii "f\0"
	.byte	0x1
	.byte	0xac
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x16c
	.uleb128 0x12
	.long	0xae3
	.byte	0x1
	.ascii "readchar\0"
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.long	LFB28
	.long	LFE28
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "fn\0"
	.byte	0x1
	.byte	0xb1
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "c\0"
	.byte	0x1
	.byte	0xb1
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0xf
	.ascii "C\0"
	.byte	0x1
	.byte	0xb3
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.uleb128 0xf
	.ascii "a\0"
	.byte	0x1
	.byte	0xb4
	.long	0x16c
	.byte	0x2
	.byte	0x75
	.sleb128 -5
	.byte	0x0
	.uleb128 0x12
	.long	0xb25
	.byte	0x1
	.ascii "unicode2utf8\0"
	.byte	0x1
	.byte	0xc6
	.byte	0x1
	.long	LFB29
	.long	LFE29
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "unicode\0"
	.byte	0x1
	.byte	0xc5
	.long	0x2de
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.uleb128 0x11
	.ascii "utf8\0"
	.byte	0x1
	.byte	0xc5
	.long	0xa8f
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.byte	0x0
	.uleb128 0x12
	.long	0xb93
	.byte	0x1
	.ascii "printchar\0"
	.byte	0x1
	.byte	0xd8
	.byte	0x1
	.long	LFB30
	.long	LFE30
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "fn\0"
	.byte	0x1
	.byte	0xd7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x11
	.ascii "x\0"
	.byte	0x1
	.byte	0xd7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x14
	.long	LASF6
	.byte	0x1
	.byte	0xd7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x14
	.long	LASF7
	.byte	0x1
	.byte	0xd7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0xf
	.ascii "f\0"
	.byte	0x1
	.byte	0xd8
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.uleb128 0xf
	.ascii "utf8\0"
	.byte	0x1
	.byte	0xd9
	.long	0xb93
	.byte	0x2
	.byte	0x75
	.sleb128 -9
	.byte	0x0
	.uleb128 0xb
	.long	0xba3
	.long	0x16c
	.uleb128 0xc
	.long	0x107
	.byte	0x4
	.byte	0x0
	.uleb128 0x12
	.long	0xbe5
	.byte	0x1
	.ascii "readline\0"
	.byte	0x1
	.byte	0xe8
	.byte	0x1
	.long	LFB31
	.long	LFE31
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "fn\0"
	.byte	0x1
	.byte	0xe7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0xf
	.ascii "c\0"
	.byte	0x1
	.byte	0xe8
	.long	0x48
	.byte	0x2
	.byte	0x75
	.sleb128 -5
	.uleb128 0xf
	.ascii "f\0"
	.byte	0x1
	.byte	0xe8
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x10
	.long	0xc38
	.byte	0x1
	.ascii "endoffile\0"
	.byte	0x1
	.byte	0xef
	.byte	0x1
	.long	0xee
	.long	LFB32
	.long	LFE32
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "fn\0"
	.byte	0x1
	.byte	0xee
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0xf
	.ascii "c\0"
	.byte	0x1
	.byte	0xef
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0xf
	.ascii "r\0"
	.byte	0x1
	.byte	0xef
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0xf
	.ascii "f\0"
	.byte	0x1
	.byte	0xef
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x10
	.long	0xc8b
	.byte	0x1
	.ascii "endofline\0"
	.byte	0x1
	.byte	0xf7
	.byte	0x1
	.long	0xee
	.long	LFB33
	.long	LFE33
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "fn\0"
	.byte	0x1
	.byte	0xf6
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0xf
	.ascii "c\0"
	.byte	0x1
	.byte	0xf7
	.long	0x48
	.byte	0x2
	.byte	0x75
	.sleb128 -6
	.uleb128 0xf
	.ascii "r\0"
	.byte	0x1
	.byte	0xf7
	.long	0x48
	.byte	0x2
	.byte	0x75
	.sleb128 -5
	.uleb128 0xf
	.ascii "f\0"
	.byte	0x1
	.byte	0xf7
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x12
	.long	0xcc0
	.byte	0x1
	.ascii "println\0"
	.byte	0x1
	.byte	0xff
	.byte	0x1
	.long	LFB34
	.long	LFE34
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.ascii "fn\0"
	.byte	0x1
	.byte	0xfe
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0xf
	.ascii "f\0"
	.byte	0x1
	.byte	0xff
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0xd2b
	.byte	0x1
	.ascii "printspaces\0"
	.byte	0x1
	.word	0x10b
	.byte	0x1
	.long	LFB35
	.long	LFE35
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x10a
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x19
	.long	LASF6
	.byte	0x1
	.word	0x10a
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x10b
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "spaces\0"
	.byte	0x1
	.word	0x10d
	.long	0xd2b
	.byte	0x3
	.byte	0x75
	.sleb128 -108
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x10e
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0xb
	.long	0xd3b
	.long	0x48
	.uleb128 0xc
	.long	0x107
	.byte	0x63
	.byte	0x0
	.uleb128 0x17
	.long	0xd69
	.byte	0x1
	.ascii "pascalerror\0"
	.byte	0x1
	.word	0x11a
	.byte	0x1
	.long	LFB36
	.long	LFE36
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "e\0"
	.byte	0x1
	.word	0x119
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x1b
	.long	0xd96
	.byte	0x1
	.ascii "length\0"
	.byte	0x1
	.word	0x11e
	.byte	0x1
	.long	0xee
	.long	LFB37
	.long	LFE37
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "s\0"
	.byte	0x1
	.word	0x11e
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x17
	.long	0xdbd
	.byte	0x1
	.ascii "incr\0"
	.byte	0x1
	.word	0x11f
	.byte	0x1
	.long	LFB38
	.long	LFE38
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "s\0"
	.byte	0x1
	.word	0x11f
	.long	0xdbd
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x6f5
	.uleb128 0x17
	.long	0xe36
	.byte	0x1
	.ascii "readstring\0"
	.byte	0x1
	.word	0x121
	.byte	0x1
	.long	LFB39
	.long	LFE39
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x120
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "s\0"
	.byte	0x1
	.word	0x120
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x18
	.ascii "len\0"
	.byte	0x1
	.word	0x120
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x1a
	.ascii "c\0"
	.byte	0x1
	.word	0x122
	.long	0x2de
	.byte	0x2
	.byte	0x75
	.sleb128 -10
	.uleb128 0x1c
	.long	LASF4
	.byte	0x1
	.word	0x122
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x123
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0xec2
	.byte	0x1
	.ascii "printstring\0"
	.byte	0x1
	.word	0x135
	.byte	0x1
	.long	LFB40
	.long	LFE40
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x134
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "s\0"
	.byte	0x1
	.word	0x134
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x18
	.ascii "e1\0"
	.byte	0x1
	.word	0x134
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x18
	.ascii "e2\0"
	.byte	0x1
	.word	0x134
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x135
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.uleb128 0x1a
	.ascii "l\0"
	.byte	0x1
	.word	0x135
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1a
	.ascii "c\0"
	.byte	0x1
	.word	0x135
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x137
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0xf2a
	.byte	0x1
	.ascii "printordinal\0"
	.byte	0x1
	.word	0x142
	.byte	0x1
	.long	LFB41
	.long	LFE41
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x141
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "o\0"
	.byte	0x1
	.word	0x141
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x18
	.ascii "e1\0"
	.byte	0x1
	.word	0x141
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x18
	.ascii "e2\0"
	.byte	0x1
	.word	0x141
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x18
	.ascii "tab\0"
	.byte	0x1
	.word	0x141
	.long	0xdbd
	.byte	0x2
	.byte	0x75
	.sleb128 24
	.byte	0x0
	.uleb128 0x17
	.long	0xf64
	.byte	0x1
	.ascii "skipspaces\0"
	.byte	0x1
	.word	0x146
	.byte	0x1
	.long	LFB42
	.long	LFE42
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "f\0"
	.byte	0x1
	.word	0x145
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x1a
	.ascii "c\0"
	.byte	0x1
	.word	0x147
	.long	0x48
	.byte	0x2
	.byte	0x75
	.sleb128 -1
	.byte	0x0
	.uleb128 0x1b
	.long	0xf93
	.byte	0x1
	.ascii "utolower\0"
	.byte	0x1
	.word	0x14c
	.byte	0x1
	.long	0xee
	.long	LFB43
	.long	LFE43
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "c\0"
	.byte	0x1
	.word	0x14b
	.long	0x2de
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x1036
	.byte	0x1
	.ascii "readordinal\0"
	.byte	0x1
	.word	0x153
	.byte	0x1
	.long	LFB44
	.long	LFE44
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x152
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "b\0"
	.byte	0x1
	.word	0x152
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x18
	.ascii "tab\0"
	.byte	0x1
	.word	0x152
	.long	0xdbd
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x18
	.ascii "len\0"
	.byte	0x1
	.word	0x152
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x1a
	.ascii "c\0"
	.byte	0x1
	.word	0x153
	.long	0x2de
	.byte	0x2
	.byte	0x75
	.sleb128 -14
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x154
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1c
	.long	LASF4
	.byte	0x1
	.word	0x154
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "string\0"
	.byte	0x1
	.word	0x155
	.long	0x1036
	.byte	0x3
	.byte	0x75
	.sleb128 -526
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x156
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0xb
	.long	0x1046
	.long	0x2de
	.uleb128 0xc
	.long	0x107
	.byte	0xff
	.byte	0x0
	.uleb128 0x1b
	.long	0x1113
	.byte	0x1
	.ascii "setcmprtl\0"
	.byte	0x1
	.word	0x179
	.byte	0x1
	.long	0xee
	.long	LFB45
	.long	LFE45
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "set1\0"
	.byte	0x1
	.word	0x178
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "set2\0"
	.byte	0x1
	.word	0x178
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x18
	.ascii "len\0"
	.byte	0x1
	.word	0x178
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x17a
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -32
	.uleb128 0x1a
	.ascii "c\0"
	.byte	0x1
	.word	0x17b
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -28
	.uleb128 0x1a
	.ascii "d\0"
	.byte	0x1
	.word	0x17b
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -24
	.uleb128 0x1a
	.ascii "nd\0"
	.byte	0x1
	.word	0x17b
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -20
	.uleb128 0x1a
	.ascii "nc\0"
	.byte	0x1
	.word	0x17b
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.uleb128 0x1a
	.ascii "eq\0"
	.byte	0x1
	.word	0x17c
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1a
	.ascii "set2extra\0"
	.byte	0x1
	.word	0x17d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "set1extra\0"
	.byte	0x1
	.word	0x17e
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x1b
	.long	0x1173
	.byte	0x1
	.ascii "cstringcompare\0"
	.byte	0x1
	.word	0x190
	.byte	0x1
	.long	0xee
	.long	LFB46
	.long	LFE46
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "s1\0"
	.byte	0x1
	.word	0x18f
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "s2\0"
	.byte	0x1
	.word	0x18f
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x191
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "len\0"
	.byte	0x1
	.word	0x191
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x11c6
	.byte	0x1
	.ascii "readbool\0"
	.byte	0x1
	.word	0x1a3
	.byte	0x1
	.long	LFB47
	.long	LFE47
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x1a2
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "b\0"
	.byte	0x1
	.word	0x1a2
	.long	0xf5
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x1a
	.ascii "c\0"
	.byte	0x1
	.word	0x1a3
	.long	0x48
	.byte	0x2
	.byte	0x75
	.sleb128 -5
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x1a4
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x1229
	.byte	0x1
	.ascii "printbool\0"
	.byte	0x1
	.word	0x1b8
	.byte	0x1
	.long	LFB48
	.long	LFE48
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x1b7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "b\0"
	.byte	0x1
	.word	0x1b7
	.long	0x48
	.byte	0x2
	.byte	0x75
	.sleb128 -20
	.uleb128 0x18
	.ascii "e1\0"
	.byte	0x1
	.word	0x1b7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x18
	.ascii "e2\0"
	.byte	0x1
	.word	0x1b7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x1b9
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x126e
	.byte	0x1
	.ascii "readint\0"
	.byte	0x1
	.word	0x1c4
	.byte	0x1
	.long	LFB49
	.long	LFE49
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x1c3
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "x\0"
	.byte	0x1
	.word	0x1c3
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x1c5
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x12b4
	.byte	0x1
	.ascii "readbyte\0"
	.byte	0x1
	.word	0x1cc
	.byte	0x1
	.long	LFB50
	.long	LFE50
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x1cb
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "c\0"
	.byte	0x1
	.word	0x1cb
	.long	0xa8f
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x1a
	.ascii "b\0"
	.byte	0x1
	.word	0x1cd
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x1356
	.byte	0x1
	.ascii "printint64\0"
	.byte	0x1
	.word	0x1d3
	.byte	0x1
	.long	LFB51
	.long	LFE51
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x1d3
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "x\0"
	.byte	0x1
	.word	0x1d3
	.long	0x271
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x19
	.long	LASF6
	.byte	0x1
	.word	0x1d3
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x19
	.long	LASF7
	.byte	0x1
	.word	0x1d3
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x1a
	.ascii "buf\0"
	.byte	0x1
	.word	0x1d6
	.long	0xd2b
	.byte	0x3
	.byte	0x75
	.sleb128 -112
	.uleb128 0x1c
	.long	LASF8
	.byte	0x1
	.word	0x1d6
	.long	0xd2b
	.byte	0x3
	.byte	0x75
	.sleb128 -212
	.uleb128 0x1a
	.ascii "len\0"
	.byte	0x1
	.word	0x1d7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x1d7
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x1d9
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x13f6
	.byte	0x1
	.ascii "printint\0"
	.byte	0x1
	.word	0x1e0
	.byte	0x1
	.long	LFB52
	.long	LFE52
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x1e0
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "x\0"
	.byte	0x1
	.word	0x1e0
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x19
	.long	LASF6
	.byte	0x1
	.word	0x1e0
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x19
	.long	LASF7
	.byte	0x1
	.word	0x1e0
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x1a
	.ascii "buf\0"
	.byte	0x1
	.word	0x1e3
	.long	0xd2b
	.byte	0x3
	.byte	0x75
	.sleb128 -112
	.uleb128 0x1c
	.long	LASF8
	.byte	0x1
	.word	0x1e3
	.long	0xd2b
	.byte	0x3
	.byte	0x75
	.sleb128 -212
	.uleb128 0x1a
	.ascii "len\0"
	.byte	0x1
	.word	0x1e4
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x1e4
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x1e6
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x143c
	.byte	0x1
	.ascii "readreal\0"
	.byte	0x1
	.word	0x1ef
	.byte	0x1
	.long	LFB53
	.long	LFE53
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x1ee
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "x\0"
	.byte	0x1
	.word	0x1ee
	.long	0x143c
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x1f1
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1442
	.uleb128 0x2
	.ascii "float\0"
	.byte	0x4
	.byte	0x4
	.uleb128 0x17
	.long	0x14ef
	.byte	0x1
	.ascii "printdouble\0"
	.byte	0x1
	.word	0x1f8
	.byte	0x1
	.long	LFB54
	.long	LFE54
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x1f8
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "x\0"
	.byte	0x1
	.word	0x1f8
	.long	0x14ef
	.byte	0x3
	.byte	0x75
	.sleb128 -232
	.uleb128 0x19
	.long	LASF6
	.byte	0x1
	.word	0x1f8
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x19
	.long	LASF7
	.byte	0x1
	.word	0x1f8
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 24
	.uleb128 0x1a
	.ascii "buf\0"
	.byte	0x1
	.word	0x1f9
	.long	0xd2b
	.byte	0x3
	.byte	0x75
	.sleb128 -112
	.uleb128 0x1c
	.long	LASF8
	.byte	0x1
	.word	0x1f9
	.long	0xd2b
	.byte	0x3
	.byte	0x75
	.sleb128 -212
	.uleb128 0x1a
	.ascii "len\0"
	.byte	0x1
	.word	0x1fa
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x1fa
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "f\0"
	.byte	0x1
	.word	0x1fc
	.long	0x479
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x2
	.ascii "double\0"
	.byte	0x8
	.byte	0x4
	.uleb128 0x17
	.long	0x155e
	.byte	0x1
	.ascii "printreal\0"
	.byte	0x1
	.word	0x211
	.byte	0x1
	.long	LFB55
	.long	LFE55
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "fn\0"
	.byte	0x1
	.word	0x211
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "x\0"
	.byte	0x1
	.word	0x211
	.long	0x1442
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x19
	.long	LASF6
	.byte	0x1
	.word	0x211
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x19
	.long	LASF7
	.byte	0x1
	.word	0x211
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x1a
	.ascii "d\0"
	.byte	0x1
	.word	0x212
	.long	0x14ef
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.byte	0x0
	.uleb128 0x17
	.long	0x15cb
	.byte	0x1
	.ascii "cstringassign\0"
	.byte	0x1
	.word	0x218
	.byte	0x1
	.long	LFB56
	.long	LFE56
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "s1\0"
	.byte	0x1
	.word	0x217
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "len\0"
	.byte	0x1
	.word	0x217
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x18
	.ascii "s2\0"
	.byte	0x1
	.word	0x217
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x1a
	.ascii "tocopy\0"
	.byte	0x1
	.word	0x219
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x21a
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x1648
	.byte	0x1
	.ascii "stringappend\0"
	.byte	0x1
	.word	0x225
	.byte	0x1
	.long	LFB57
	.long	LFE57
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "s1\0"
	.byte	0x1
	.word	0x224
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "len\0"
	.byte	0x1
	.word	0x224
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x18
	.ascii "s2\0"
	.byte	0x1
	.word	0x224
	.long	0x6f5
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x1a
	.ascii "start\0"
	.byte	0x1
	.word	0x225
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1a
	.ascii "tocopy\0"
	.byte	0x1
	.word	0x226
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x227
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x17
	.long	0x16ec
	.byte	0x1
	.ascii "gettime\0"
	.byte	0x1
	.word	0x22e
	.byte	0x1
	.long	LFB58
	.long	LFE58
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "hour\0"
	.byte	0x1
	.word	0x22d
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "min\0"
	.byte	0x1
	.word	0x22d
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x18
	.ascii "sec\0"
	.byte	0x1
	.word	0x22d
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x19
	.long	LASF9
	.byte	0x1
	.word	0x22d
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x1a
	.ascii "h\0"
	.byte	0x1
	.word	0x22f
	.long	0x271
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.uleb128 0x1a
	.ascii "tp\0"
	.byte	0x1
	.word	0x230
	.long	0x28e
	.byte	0x2
	.byte	0x75
	.sleb128 -28
	.uleb128 0x1a
	.ascii "clocks\0"
	.byte	0x1
	.word	0x232
	.long	0x17d
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1a
	.ascii "loc\0"
	.byte	0x1
	.word	0x232
	.long	0x16ec
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "t1\0"
	.byte	0x1
	.word	0x232
	.long	0x17d
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x19b
	.uleb128 0x1d
	.long	0x1759
	.byte	0x1
	.ascii "secs\0"
	.byte	0x1
	.word	0x244
	.long	0x1442
	.long	LFB59
	.long	LFE59
	.byte	0x1
	.byte	0x55
	.uleb128 0x1a
	.ascii "hour\0"
	.byte	0x1
	.word	0x244
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1a
	.ascii "min\0"
	.byte	0x1
	.word	0x244
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.uleb128 0x1a
	.ascii "sec\0"
	.byte	0x1
	.word	0x244
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -20
	.uleb128 0x1c
	.long	LASF9
	.byte	0x1
	.word	0x244
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -24
	.uleb128 0x1a
	.ascii "s\0"
	.byte	0x1
	.word	0x247
	.long	0x14ef
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.byte	0x0
	.uleb128 0x1e
	.ascii "Addr\0"
	.byte	0x1
	.word	0x25b
	.long	0xf5
	.uleb128 0x17
	.long	0x1858
	.byte	0x1
	.ascii "doinitvec\0"
	.byte	0x1
	.word	0x25d
	.byte	0x1
	.long	LFB60
	.long	LFE60
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "phdr\0"
	.byte	0x1
	.word	0x25c
	.long	0x1858
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "rank\0"
	.byte	0x1
	.word	0x25c
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x19
	.long	LASF10
	.byte	0x1
	.word	0x25c
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.uleb128 0x18
	.ascii "delphi\0"
	.byte	0x1
	.word	0x25c
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 20
	.uleb128 0x1a
	.ascii "newsize\0"
	.byte	0x1
	.word	0x25d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -36
	.uleb128 0x1a
	.ascii "i\0"
	.byte	0x1
	.word	0x25d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -32
	.uleb128 0x1a
	.ascii "pos\0"
	.byte	0x1
	.word	0x25d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -28
	.uleb128 0x1a
	.ascii "low\0"
	.byte	0x1
	.word	0x25d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -24
	.uleb128 0x1a
	.ascii "high\0"
	.byte	0x1
	.word	0x25d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -20
	.uleb128 0x1a
	.ascii "step\0"
	.byte	0x1
	.word	0x25d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.uleb128 0x1a
	.ascii "hdrsize\0"
	.byte	0x1
	.word	0x25d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1a
	.ascii "newhdr\0"
	.byte	0x1
	.word	0x25e
	.long	0x185e
	.byte	0x2
	.byte	0x75
	.sleb128 -8
	.uleb128 0x1a
	.ascii "hdr\0"
	.byte	0x1
	.word	0x25f
	.long	0x185e
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x185e
	.uleb128 0x6
	.byte	0x4
	.long	0x1759
	.uleb128 0x17
	.long	0x18b0
	.byte	0x1
	.ascii "initvec\0"
	.byte	0x1
	.word	0x28b
	.byte	0x1
	.long	LFB61
	.long	LFE61
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "phdr\0"
	.byte	0x1
	.word	0x28b
	.long	0x1858
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "rank\0"
	.byte	0x1
	.word	0x28b
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x19
	.long	LASF10
	.byte	0x1
	.word	0x28b
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.byte	0x0
	.uleb128 0x17
	.long	0x1902
	.byte	0x1
	.ascii "delphiinitvec\0"
	.byte	0x1
	.word	0x28d
	.byte	0x1
	.long	LFB62
	.long	LFE62
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "phdr\0"
	.byte	0x1
	.word	0x28d
	.long	0x185e
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "rank\0"
	.byte	0x1
	.word	0x28d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.uleb128 0x19
	.long	LASF10
	.byte	0x1
	.word	0x28d
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 16
	.byte	0x0
	.uleb128 0x17
	.long	0x193e
	.byte	0x1
	.ascii "getmem\0"
	.byte	0x1
	.word	0x290
	.byte	0x1
	.long	LFB63
	.long	LFE63
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "pntr\0"
	.byte	0x1
	.word	0x28f
	.long	0x193e
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "size\0"
	.byte	0x1
	.word	0x28f
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x606
	.uleb128 0x17
	.long	0x1981
	.byte	0x1
	.ascii "freemem\0"
	.byte	0x1
	.word	0x294
	.byte	0x1
	.long	LFB64
	.long	LFE64
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "pntr\0"
	.byte	0x1
	.word	0x293
	.long	0x193e
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "size\0"
	.byte	0x1
	.word	0x293
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.byte	0x0
	.uleb128 0x17
	.long	0x19b0
	.byte	0x1
	.ascii "printpointer\0"
	.byte	0x1
	.word	0x299
	.byte	0x1
	.long	LFB65
	.long	LFE65
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "p\0"
	.byte	0x1
	.word	0x298
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x17
	.long	0x19db
	.byte	0x1
	.ascii "pdispose\0"
	.byte	0x1
	.word	0x29d
	.byte	0x1
	.long	LFB66
	.long	LFE66
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "p\0"
	.byte	0x1
	.word	0x29d
	.long	0x606
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x17
	.long	0x1a09
	.byte	0x1
	.ascii "boundsfault\0"
	.byte	0x1
	.word	0x2a4
	.byte	0x1
	.long	LFB67
	.long	LFE67
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "x\0"
	.byte	0x1
	.word	0x2a3
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.ascii "paramcount\0"
	.byte	0x1
	.word	0x2ab
	.long	0xee
	.long	LFB68
	.long	LFE68
	.byte	0x1
	.byte	0x55
	.uleb128 0x1b
	.long	0x1a57
	.byte	0x1
	.ascii "parampntr\0"
	.byte	0x1
	.word	0x2ad
	.byte	0x1
	.long	0xf5
	.long	LFB69
	.long	LFE69
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "i\0"
	.byte	0x1
	.word	0x2ad
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0x0
	.uleb128 0x1b
	.long	0x1a95
	.byte	0x1
	.ascii "main\0"
	.byte	0x1
	.word	0x2b0
	.byte	0x1
	.long	0xee
	.long	LFB70
	.long	LFE70
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.ascii "argc\0"
	.byte	0x1
	.word	0x2b0
	.long	0xee
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.uleb128 0x18
	.ascii "argv\0"
	.byte	0x1
	.word	0x2b0
	.long	0x1a95
	.byte	0x2
	.byte	0x75
	.sleb128 12
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xf5
	.uleb128 0x20
	.ascii "__dj_stdin\0"
	.byte	0x5
	.byte	0x3b
	.long	0xfb
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.ascii "__dj_stdout\0"
	.byte	0x5
	.byte	0x3b
	.long	0xfb
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.ascii "__dj_stderr\0"
	.byte	0x5
	.byte	0x3b
	.long	0xfb
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.long	0x1ae9
	.long	0x42f
	.uleb128 0xc
	.long	0x107
	.byte	0x1f
	.byte	0x0
	.uleb128 0x21
	.ascii "files\0"
	.byte	0x1
	.byte	0x21
	.long	0x1ad9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_files
	.uleb128 0x21
	.ascii "iores\0"
	.byte	0x1
	.byte	0x22
	.long	0xee
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_iores
	.uleb128 0x22
	.ascii "Argc\0"
	.byte	0x1
	.word	0x2aa
	.long	0xee
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_Argc
	.uleb128 0x22
	.ascii "Argv\0"
	.byte	0x1
	.word	0x2ac
	.long	0x1a95
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_Argv
	.byte	0x0
	.section	.debug_abbrev,""
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,""
	.long	0x3e0
	.word	0x2
	.long	Ldebug_info0
	.long	0x1b3a
	.long	0x48f
	.ascii "initfs\0"
	.long	0x4b5
	.ascii "entryname\0"
	.long	0x4e9
	.ascii "isdir\0"
	.long	0x524
	.ascii "pascalexit\0"
	.long	0x552
	.ascii "checkerr\0"
	.long	0x57c
	.ascii "findfreefileblock\0"
	.long	0x5b1
	.ascii "closefiles\0"
	.long	0x5db
	.ascii "pasclose\0"
	.long	0x60c
	.ascii "setchan\0"
	.long	0x644
	.ascii "pascaleof\0"
	.long	0x674
	.ascii "eoln\0"
	.long	0x6ab
	.ascii "u2asciitrunc\0"
	.long	0x6fb
	.ascii "move\0"
	.long	0x73f
	.ascii "erase\0"
	.long	0x787
	.ascii "filesize\0"
	.long	0x7da
	.ascii "filepos\0"
	.long	0x814
	.ascii "seek\0"
	.long	0x868
	.ascii "blockread\0"
	.long	0x8be
	.ascii "blockwrite\0"
	.long	0x915
	.ascii "rewrite\0"
	.long	0x93f
	.ascii "reset\0"
	.long	0x967
	.ascii "append\0"
	.long	0x990
	.ascii "setiores\0"
	.long	0x9bb
	.ascii "assign\0"
	.long	0xa18
	.ascii "ioresult\0"
	.long	0xa47
	.ascii "readcharnarrow\0"
	.long	0xa95
	.ascii "readchar\0"
	.long	0xae3
	.ascii "unicode2utf8\0"
	.long	0xb25
	.ascii "printchar\0"
	.long	0xba3
	.ascii "readline\0"
	.long	0xbe5
	.ascii "endoffile\0"
	.long	0xc38
	.ascii "endofline\0"
	.long	0xc8b
	.ascii "println\0"
	.long	0xcc0
	.ascii "printspaces\0"
	.long	0xd3b
	.ascii "pascalerror\0"
	.long	0xd69
	.ascii "length\0"
	.long	0xd96
	.ascii "incr\0"
	.long	0xdc3
	.ascii "readstring\0"
	.long	0xe36
	.ascii "printstring\0"
	.long	0xec2
	.ascii "printordinal\0"
	.long	0xf2a
	.ascii "skipspaces\0"
	.long	0xf64
	.ascii "utolower\0"
	.long	0xf93
	.ascii "readordinal\0"
	.long	0x1046
	.ascii "setcmprtl\0"
	.long	0x1113
	.ascii "cstringcompare\0"
	.long	0x1173
	.ascii "readbool\0"
	.long	0x11c6
	.ascii "printbool\0"
	.long	0x1229
	.ascii "readint\0"
	.long	0x126e
	.ascii "readbyte\0"
	.long	0x12b4
	.ascii "printint64\0"
	.long	0x1356
	.ascii "printint\0"
	.long	0x13f6
	.ascii "readreal\0"
	.long	0x144b
	.ascii "printdouble\0"
	.long	0x14f9
	.ascii "printreal\0"
	.long	0x155e
	.ascii "cstringassign\0"
	.long	0x15cb
	.ascii "stringappend\0"
	.long	0x1648
	.ascii "gettime\0"
	.long	0x16f2
	.ascii "secs\0"
	.long	0x1766
	.ascii "doinitvec\0"
	.long	0x1864
	.ascii "initvec\0"
	.long	0x18b0
	.ascii "delphiinitvec\0"
	.long	0x1902
	.ascii "getmem\0"
	.long	0x1944
	.ascii "freemem\0"
	.long	0x1981
	.ascii "printpointer\0"
	.long	0x19b0
	.ascii "pdispose\0"
	.long	0x19db
	.ascii "boundsfault\0"
	.long	0x1a09
	.ascii "paramcount\0"
	.long	0x1a27
	.ascii "parampntr\0"
	.long	0x1a57
	.ascii "main\0"
	.long	0x1ae9
	.ascii "files\0"
	.long	0x1afd
	.ascii "iores\0"
	.long	0x1b11
	.ascii "Argc\0"
	.long	0x1b25
	.ascii "Argv\0"
	.long	0x0
	.section	.debug_aranges,""
	.long	0x1c
	.word	0x2
	.long	Ldebug_info0
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	Ltext0
	.long	Letext0-Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,""
LASF5:
	.ascii "resultcount\0"
LASF4:
	.ascii "count\0"
LASF7:
	.ascii "afterpoint\0"
LASF1:
	.ascii "timezone\0"
LASF0:
	.ascii "long unsigned int\0"
LASF6:
	.ascii "width\0"
LASF2:
	.ascii "filenum\0"
LASF9:
	.ascii "hundredths\0"
LASF3:
	.ascii "filename\0"
LASF8:
	.ascii "format\0"
LASF10:
	.ascii "elemsize\0"
	.ident	"GCC: (GNU) 4.0.1"
