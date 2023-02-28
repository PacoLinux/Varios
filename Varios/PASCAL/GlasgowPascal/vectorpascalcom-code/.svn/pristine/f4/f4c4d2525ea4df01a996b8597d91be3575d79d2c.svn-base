	.file	"rtl.c"
	.file 1 "c:/src/VectorPascal/mmpc/rtl.c"
	.section	.debug_abbrev,""
Ldebug_abbrev0:
	.section	.debug_info,""
Ldebug_info0:
	.section	.debug_line,""
Ldebug_line0:
	.section .text
Ltext0:
	.file 2 "c:/djgpp/include/stdio.h"
	.file 3 "c:/djgpp/include/signal.h"
	.file 4 "c:/djgpp/include/sys/types.h"
	.file 5 "c:/djgpp/include/time.h"
	.file 6 "c:/djgpp/include/sys/time.h"
	.file 7 "c:/djgpp/include/sys/timeb.h"
	.file 8 "c:/djgpp/include/dirent.h"
	.file 9 "c:/djgpp/include/sys/stat.h"
.globl _iores
	.section	.bss
	.p2align 2
_iores:
	.space 4
	.section .text
.globl _initfs
_initfs:
LFB3:
	.loc 1 32 0
	pushl	%ebp
LCFI0:
	movl	%esp, %ebp
LCFI1:
	subl	$4, %esp
LCFI2:
	.loc 1 34 0
LBB2:
	movl	$0, -4(%ebp)
L2:
	cmpl	$30, -4(%ebp)
	jle	L5
	jmp	L3
L5:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	$0, _files+252(%eax)
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	$1, _files+256(%eax)
	leal	-4(%ebp), %eax
	incl	(%eax)
	jmp	L2
L3:
	.loc 1 35 0
	movl	$1, _files+252
	.loc 1 36 0
	movl	$___dj_stdin, _files
	.loc 1 37 0
	movl	$1, _files+512
	.loc 1 38 0
	movl	$___dj_stdout, _files+260
	.loc 1 40 0
	leave
	ret
LBE2:
LFE3:
.globl _entryname
_entryname:
LFB5:
	.loc 1 41 0
	pushl	%ebp
LCFI3:
	movl	%esp, %ebp
LCFI4:
	.loc 1 41 0
	movl	8(%ebp), %eax
	incl	%eax
	popl	%ebp
	ret
LFE5:
.globl _isdir
_isdir:
LFB7:
	.loc 1 42 0
	pushl	%ebp
LCFI5:
	movl	%esp, %ebp
LCFI6:
	subl	$72, %esp
LCFI7:
	.loc 1 42 0
LBB3:
	subl	$8, %esp
	leal	-56(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
LCFI8:
	call	_stat
	addl	$16, %esp
	movl	-36(%ebp), %eax
	andl	$61440, %eax
	movl	%eax, -60(%ebp)
	cmpl	$12288, -60(%ebp)
	sete	%al
	movl	$0, %edx
	movb	%al, %dl
	movl	%edx, -60(%ebp)
	movl	-60(%ebp), %eax
	.loc 1 43 0
	leave
	ret
LBE3:
LFE7:
.globl _pascalexit
_pascalexit:
LFB9:
	.loc 1 44 0
	pushl	%ebp
LCFI9:
	movl	%esp, %ebp
LCFI10:
	subl	$8, %esp
LCFI11:
	.loc 1 44 0
	call	_closefiles
	subl	$12, %esp
	pushl	8(%ebp)
LCFI12:
	call	_exit
LFE9:
	.p2align 5
LC0:
	.ascii "Pascal file sub-system  error: %d\0"
LC1:
	.ascii "Unassigned file handle %d\0"
.globl _checkerr
_checkerr:
LFB11:
	.loc 1 45 0
	pushl	%ebp
LCFI13:
	movl	%esp, %ebp
LCFI14:
	subl	$8, %esp
LCFI15:
	.loc 1 46 0
	cmpl	$0, _iores
	je	L10
	subl	$4, %esp
	pushl	_iores
	pushl	$LC0
	pushl	$___dj_stderr
LCFI16:
	call	_fprintf
	addl	$16, %esp
	subl	$12, %esp
	pushl	_iores
	call	_pascalexit
	addl	$16, %esp
L10:
	.loc 1 47 0
	cmpl	$0, 8(%ebp)
	js	L12
	cmpl	$31, 8(%ebp)
	jg	L12
	jmp	L9
L12:
	subl	$4, %esp
	pushl	8(%ebp)
	pushl	$LC1
	pushl	$___dj_stderr
	call	_fprintf
	addl	$16, %esp
	subl	$12, %esp
	pushl	_iores
	call	_pascalexit
	addl	$16, %esp
	.loc 1 49 0
L9:
	leave
	ret
LFE11:
.globl _findfreefileblock
_findfreefileblock:
LFB13:
	.loc 1 51 0
	pushl	%ebp
LCFI17:
	movl	%esp, %ebp
LCFI18:
	subl	$8, %esp
LCFI19:
	.loc 1 52 0
LBB4:
	movl	$0, -4(%ebp)
L14:
	cmpl	$30, -4(%ebp)
	jle	L17
	jmp	L15
L17:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	cmpl	$0, _files+252(%eax)
	jne	L16
	movl	-4(%ebp), %eax
	movl	%eax, -8(%ebp)
	jmp	L13
L16:
	leal	-4(%ebp), %eax
	incl	(%eax)
	jmp	L14
L15:
	.loc 1 53 0
	movl	$-1, -8(%ebp)
	.loc 1 54 0
L13:
LBE4:
	movl	-8(%ebp), %eax
	leave
	ret
LFE13:
.globl _closefiles
_closefiles:
LFB15:
	.loc 1 56 0
	pushl	%ebp
LCFI20:
	movl	%esp, %ebp
LCFI21:
	subl	$8, %esp
LCFI22:
	.loc 1 58 0
LBB5:
	movl	$0, -4(%ebp)
L20:
	cmpl	$30, -4(%ebp)
	jle	L23
	jmp	L19
L23:
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	cmpl	$1, _files+252(%eax)
	jne	L22
	subl	$12, %esp
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	pushl	_files(%eax)
LCFI23:
	call	_fclose
	addl	$16, %esp
L22:
	leal	-4(%ebp), %eax
	incl	(%eax)
	jmp	L20
	.loc 1 59 0
L19:
	leave
	ret
LBE5:
LFE15:
.globl _pasclose
_pasclose:
LFB17:
	.loc 1 62 0
	pushl	%ebp
LCFI24:
	movl	%esp, %ebp
LCFI25:
	subl	$8, %esp
LCFI26:
	.loc 1 63 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI27:
	call	_checkerr
	addl	$16, %esp
	.loc 1 64 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	pushl	_files(%eax)
	call	_fclose
	addl	$16, %esp
	.loc 1 65 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	$0, _files+252(%eax)
	.loc 1 66 0
	leave
	ret
LFE17:
.globl _setchan
_setchan:
LFB19:
	.loc 1 67 0
	pushl	%ebp
LCFI28:
	movl	%esp, %ebp
LCFI29:
	.loc 1 67 0
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	popl	%ebp
	ret
LFE19:
.globl _eof
_eof:
LFB21:
	.loc 1 69 0
	pushl	%ebp
LCFI30:
	movl	%esp, %ebp
LCFI31:
	subl	$8, %esp
LCFI32:
	.loc 1 70 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI33:
	call	_checkerr
	addl	$16, %esp
	.loc 1 71 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	pushl	_files(%eax)
	call	_feof
	addl	$16, %esp
	testl	%eax, %eax
	je	L28
	movl	$-1, -4(%ebp)
	jmp	L27
L28:
	.loc 1 72 0
	movl	$0, -4(%ebp)
	.loc 1 73 0
L27:
	movl	-4(%ebp), %eax
	leave
	ret
LFE21:
.globl _eoln
_eoln:
LFB23:
	.loc 1 75 0
	pushl	%ebp
LCFI34:
	movl	%esp, %ebp
LCFI35:
	subl	$8, %esp
LCFI36:
	.loc 1 76 0
LBB6:
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI37:
	call	_checkerr
	addl	$16, %esp
	.loc 1 77 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	_eof
	addl	$16, %esp
	testl	%eax, %eax
	jne	L30
	.loc 1 78 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	pushl	_files(%eax)
	call	_fgetc
	addl	$16, %esp
	movl	%eax, -4(%ebp)
	.loc 1 79 0
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	pushl	_files(%eax)
	pushl	-4(%ebp)
	call	_ungetc
	addl	$16, %esp
	.loc 1 80 0
	cmpl	$10, -4(%ebp)
	jne	L30
	movl	$-1, -8(%ebp)
	jmp	L29
L30:
	.loc 1 82 0
	movl	$0, -8(%ebp)
	.loc 1 83 0
L29:
LBE6:
	movl	-8(%ebp), %eax
	leave
	ret
LFE23:
.globl _u2asciitrunc
_u2asciitrunc:
LFB25:
	.loc 1 86 0
	pushl	%ebp
LCFI38:
	movl	%esp, %ebp
LCFI39:
	subl	$4, %esp
LCFI40:
	.loc 1 88 0
LBB7:
	movl	$1, -4(%ebp)
L33:
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	andl	$255, %eax
	cmpl	%eax, -4(%ebp)
	jle	L36
	jmp	L34
L36:
	movl	-4(%ebp), %eax
	addl	12(%ebp), %eax
	leal	-1(%eax), %ecx
	movl	-4(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	movb	(%eax,%edx), %al
	andl	$127, %eax
	movb	%al, (%ecx)
	leal	-4(%ebp), %eax
	incl	(%eax)
	jmp	L33
L34:
	.loc 1 89 0
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movzbl	%al,%edx
	movl	12(%ebp), %eax
	movb	$0, (%edx,%eax)
	.loc 1 90 0
	leave
	ret
LBE7:
LFE25:
.globl _erase
_erase:
LFB27:
	.loc 1 92 0
	pushl	%ebp
LCFI41:
	movl	%esp, %ebp
LCFI42:
	subl	$280, %esp
LCFI43:
	.loc 1 94 0
LBB8:
	subl	$8, %esp
	leal	-280(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
LCFI44:
	call	_u2asciitrunc
	addl	$16, %esp
	.loc 1 95 0
	subl	$12, %esp
	leal	-280(%ebp), %eax
	pushl	%eax
	call	_unlink
	addl	$16, %esp
	.loc 1 96 0
	leave
	ret
LBE8:
LFE27:
.globl _filesize
_filesize:
LFB29:
	.loc 1 98 0
	pushl	%ebp
LCFI45:
	movl	%esp, %ebp
LCFI46:
	subl	$24, %esp
LCFI47:
	.loc 1 99 0
LBB9:
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI48:
	call	_checkerr
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 100 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	_ftell
	addl	$16, %esp
	movl	%eax, -4(%ebp)
	.loc 1 101 0
	subl	$4, %esp
	pushl	$2
	pushl	$0
	pushl	-12(%ebp)
	call	_fseek
	addl	$16, %esp
	.loc 1 102 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	_ftell
	addl	$16, %esp
	movl	%eax, -8(%ebp)
	.loc 1 103 0
	subl	$4, %esp
	pushl	$0
	pushl	-4(%ebp)
	pushl	-12(%ebp)
	call	_fseek
	addl	$16, %esp
	.loc 1 104 0
	movl	-8(%ebp), %eax
	.loc 1 105 0
	leave
	ret
LBE9:
LFE29:
.globl _filepos
_filepos:
LFB31:
	.loc 1 106 0
	pushl	%ebp
LCFI49:
	movl	%esp, %ebp
LCFI50:
	subl	$8, %esp
LCFI51:
	.loc 1 106 0
LBB10:
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI52:
	call	_checkerr
	addl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_ftell
	addl	$16, %esp
	leave
	ret
LBE10:
LFE31:
.globl _seek
_seek:
LFB33:
	.loc 1 108 0
	pushl	%ebp
LCFI53:
	movl	%esp, %ebp
LCFI54:
	subl	$8, %esp
LCFI55:
	.loc 1 108 0
LBB11:
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI56:
	call	_checkerr
	addl	$16, %esp
	.loc 1 109 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 110 0
	subl	$4, %esp
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	-4(%ebp)
	call	_fseek
	addl	$16, %esp
	.loc 1 111 0
	leave
	ret
LBE11:
LFE33:
.globl _blockread
_blockread:
LFB35:
	.loc 1 118 0
	pushl	%ebp
LCFI57:
	movl	%esp, %ebp
LCFI58:
	pushl	%ebx
LCFI59:
	subl	$4, %esp
LCFI60:
	.loc 1 119 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI61:
	call	_checkerr
	addl	$16, %esp
	.loc 1 120 0
	movl	20(%ebp), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	pushl	_files(%eax)
	pushl	16(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	pushl	_files+256(%eax)
	pushl	12(%ebp)
	call	_fread
	addl	$16, %esp
	movl	%eax, (%ebx)
	.loc 1 121 0
	movl	-4(%ebp), %ebx
	leave
	ret
LFE35:
.globl _blockwrite
_blockwrite:
LFB37:
	.loc 1 123 0
	pushl	%ebp
LCFI62:
	movl	%esp, %ebp
LCFI63:
	pushl	%ebx
LCFI64:
	subl	$4, %esp
LCFI65:
	.loc 1 124 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI66:
	call	_checkerr
	addl	$16, %esp
	.loc 1 125 0
	movl	20(%ebp), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	pushl	_files(%eax)
	pushl	16(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	pushl	_files+256(%eax)
	pushl	12(%ebp)
	call	_fwrite
	addl	$16, %esp
	movl	%eax, (%ebx)
	.loc 1 126 0
	movl	-4(%ebp), %ebx
	leave
	ret
LFE37:
LC2:
	.ascii "wb\0"
.globl _rewrite
_rewrite:
LFB39:
	.loc 1 128 0
	pushl	%ebp
LCFI67:
	movl	%esp, %ebp
LCFI68:
	pushl	%ebx
LCFI69:
	subl	$4, %esp
LCFI70:
	.loc 1 129 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI71:
	call	_checkerr
	addl	$16, %esp
	.loc 1 130 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	leal	0(,%eax,4), %ebx
	subl	$8, %esp
	pushl	$LC2
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_files+4, %eax
	pushl	%eax
	call	_fopen
	addl	$16, %esp
	movl	%eax, _files(%ebx)
	.loc 1 131 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	$1, _files+252(%eax)
	.loc 1 132 0
	movl	-4(%ebp), %ebx
	leave
	ret
LFE39:
LC3:
	.ascii "rb+\0"
.globl _reset
_reset:
LFB41:
	.loc 1 134 0
	pushl	%ebp
LCFI72:
	movl	%esp, %ebp
LCFI73:
	pushl	%ebx
LCFI74:
	subl	$4, %esp
LCFI75:
	.loc 1 135 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI76:
	call	_checkerr
	addl	$16, %esp
	.loc 1 136 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	leal	0(,%eax,4), %ebx
	subl	$8, %esp
	pushl	$LC3
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_files+4, %eax
	pushl	%eax
	call	_fopen
	addl	$16, %esp
	movl	%eax, _files(%ebx)
	.loc 1 137 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	cmpl	$0, _files(%eax)
	jne	L45
	movl	$2, _iores
	jmp	L44
L45:
	.loc 1 138 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	$1, _files+252(%eax)
	.loc 1 139 0
L44:
	movl	-4(%ebp), %ebx
	leave
	ret
LFE41:
LC4:
	.ascii "ab\0"
.globl _append
_append:
LFB43:
	.loc 1 141 0
	pushl	%ebp
LCFI77:
	movl	%esp, %ebp
LCFI78:
	pushl	%ebx
LCFI79:
	subl	$4, %esp
LCFI80:
	.loc 1 142 0
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI81:
	call	_checkerr
	addl	$16, %esp
	.loc 1 143 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	leal	0(,%eax,4), %ebx
	subl	$8, %esp
	pushl	$LC4
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	$_files+4, %eax
	pushl	%eax
	call	_fopen
	addl	$16, %esp
	movl	%eax, _files(%ebx)
	.loc 1 144 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	cmpl	$0, _files(%eax)
	jne	L48
	movl	$2, _iores
	jmp	L47
L48:
	.loc 1 145 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	$1, _files+252(%eax)
	.loc 1 146 0
L47:
	movl	-4(%ebp), %ebx
	leave
	ret
LFE43:
.globl _setiores
_setiores:
LFB45:
	.loc 1 147 0
	pushl	%ebp
LCFI82:
	movl	%esp, %ebp
LCFI83:
	.loc 1 147 0
	movl	8(%ebp), %eax
	movl	%eax, _iores
	popl	%ebp
	ret
LFE45:
.globl _assign
_assign:
LFB47:
	.loc 1 149 0
	pushl	%ebp
LCFI84:
	movl	%esp, %ebp
LCFI85:
	subl	$280, %esp
LCFI86:
	.loc 1 151 0
LBB12:
	subl	$8, %esp
	leal	-280(%ebp), %eax
	pushl	%eax
	pushl	12(%ebp)
LCFI87:
	call	_u2asciitrunc
	addl	$16, %esp
	.loc 1 153 0
LCFI88:
	call	_findfreefileblock
	movl	%eax, -16(%ebp)
	.loc 1 154 0
	cmpl	$0, -16(%ebp)
	jns	L52
	movl	$4, _iores
	movl	8(%ebp), %eax
	movl	$-1, (%eax)
	jmp	L51
L52:
	.loc 1 155 0
	movl	$0, -12(%ebp)
L53:
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	andl	$255, %eax
	cmpl	%eax, -12(%ebp)
	jl	L56
	jmp	L54
L56:
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	-12(%ebp), %eax
	leal	_files(%eax), %edx
	leal	-280(%ebp), %eax
	addl	-12(%ebp), %eax
	movb	(%eax), %al
	movb	%al, 4(%edx)
	leal	-12(%ebp), %eax
	incl	(%eax)
	jmp	L53
L54:
	.loc 1 156 0
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movzbl	%al,%ecx
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	addl	$_files, %eax
	movb	$0, 4(%eax)
	.loc 1 157 0
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	$-1, _files+252(%eax)
	.loc 1 158 0
	movl	8(%ebp), %edx
	movl	-16(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 159 0
L51:
	leave
	ret
LBE12:
LFE47:
.globl _ioresult
_ioresult:
LFB49:
	.loc 1 160 0
	pushl	%ebp
LCFI89:
	movl	%esp, %ebp
LCFI90:
	subl	$4, %esp
LCFI91:
	.loc 1 160 0
LBB13:
	movl	_iores, %eax
	movl	%eax, -4(%ebp)
	movl	$0, _iores
	movl	-4(%ebp), %eax
	leave
	ret
LBE13:
LFE49:
.globl _readcharnarrow
_readcharnarrow:
LFB51:
	.loc 1 162 0
	pushl	%ebp
LCFI92:
	movl	%esp, %ebp
LCFI93:
	pushl	%ebx
LCFI94:
	subl	$4, %esp
LCFI95:
	.loc 1 163 0
LBB14:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI96:
	call	_checkerr
	addl	$16, %esp
	.loc 1 164 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -8(%ebp)
	.loc 1 165 0
	cmpl	$0, 8(%ebp)
	jne	L59
	movl	12(%ebp), %ebx
	subl	$12, %esp
	pushl	$___dj_stdin
	call	_getc
	addl	$16, %esp
	movb	%al, (%ebx)
	jmp	L58
L59:
	.loc 1 166 0
	movl	12(%ebp), %ebx
	subl	$12, %esp
	pushl	-8(%ebp)
	call	_getc
	addl	$16, %esp
	movb	%al, (%ebx)
	.loc 1 167 0
L58:
	movl	-4(%ebp), %ebx
	leave
	ret
LBE14:
LFE51:
.globl _readchar
_readchar:
LFB53:
	.loc 1 169 0
	pushl	%ebp
LCFI97:
	movl	%esp, %ebp
LCFI98:
	subl	$8, %esp
LCFI99:
	.loc 1 172 0
LBB15:
	subl	$8, %esp
	leal	-5(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
LCFI100:
	call	_readcharnarrow
	addl	$16, %esp
	.loc 1 173 0
	movl	12(%ebp), %edx
	movl	$0, %eax
	movb	-5(%ebp), %al
	movw	%ax, (%edx)
	.loc 1 174 0
	cmpb	$0, -5(%ebp)
	js	L62
	jmp	L61
L62:
	.loc 1 175 0
	cmpb	$-33, -5(%ebp)
	ja	L63
	.loc 1 177 0
	movl	12(%ebp), %edx
	movl	$0, %eax
	movb	-5(%ebp), %al
	andl	$31, %eax
	sall	$6, %eax
	movw	%ax, (%edx)
	.loc 1 178 0
	subl	$8, %esp
	leal	-5(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readcharnarrow
	addl	$16, %esp
	.loc 1 179 0
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	$0, %eax
	movb	-5(%ebp), %al
	andl	$63, %eax
	addw	(%edx), %ax
	movw	%ax, (%ecx)
L63:
	.loc 1 182 0
	movl	12(%ebp), %edx
	movl	$0, %eax
	movb	-5(%ebp), %al
	andl	$15, %eax
	sall	$12, %eax
	movw	%ax, (%edx)
	.loc 1 183 0
	subl	$8, %esp
	leal	-5(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readcharnarrow
	addl	$16, %esp
	.loc 1 184 0
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	$0, %eax
	movb	-5(%ebp), %al
	andl	$63, %eax
	sall	$6, %eax
	addw	(%edx), %ax
	movw	%ax, (%ecx)
	.loc 1 185 0
	subl	$8, %esp
	leal	-5(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readcharnarrow
	addl	$16, %esp
	.loc 1 186 0
	movl	12(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	$0, %eax
	movb	-5(%ebp), %al
	andl	$63, %eax
	addw	(%edx), %ax
	movw	%ax, (%ecx)
	.loc 1 187 0
L61:
	leave
	ret
LBE15:
LFE53:
.globl _unicode2utf8
_unicode2utf8:
LFB55:
	.loc 1 189 0
	pushl	%ebp
LCFI101:
	movl	%esp, %ebp
LCFI102:
	subl	$4, %esp
LCFI103:
	movl	8(%ebp), %eax
	movw	%ax, -2(%ebp)
	.loc 1 190 0
	cmpw	$127, -2(%ebp)
	ja	L65
	.loc 1 191 0
	movl	12(%ebp), %eax
	movb	-2(%ebp), %dl
	movb	%dl, (%eax)
	.loc 1 192 0
	movl	12(%ebp), %eax
	incl	%eax
	movb	$0, (%eax)
	.loc 1 193 0
	jmp	L64
L65:
	.loc 1 195 0
	cmpw	$2047, -2(%ebp)
	ja	L66
	.loc 1 196 0
	movl	12(%ebp), %ecx
	movw	-2(%ebp), %ax
	shrw	$6, %ax
	movb	%al, %dl
	andl	$31, %edx
	movb	$-64, %al
	leal	(%eax,%edx), %eax
	movb	%al, (%ecx)
	.loc 1 197 0
	movl	12(%ebp), %ecx
	incl	%ecx
	movb	-2(%ebp), %dl
	andl	$63, %edx
	movb	$-128, %al
	leal	(%eax,%edx), %eax
	movb	%al, (%ecx)
	.loc 1 198 0
	movl	12(%ebp), %eax
	addl	$2, %eax
	movb	$0, (%eax)
	.loc 1 199 0
	jmp	L64
L66:
	.loc 1 201 0
	movl	12(%ebp), %ecx
	movw	-2(%ebp), %ax
	shrw	$12, %ax
	movb	%al, %dl
	andl	$15, %edx
	movb	$-32, %al
	leal	(%eax,%edx), %eax
	movb	%al, (%ecx)
	.loc 1 202 0
	movl	12(%ebp), %ecx
	incl	%ecx
	movw	-2(%ebp), %ax
	shrw	$6, %ax
	movb	%al, %dl
	andl	$63, %edx
	movb	$-128, %al
	leal	(%eax,%edx), %eax
	movb	%al, (%ecx)
	.loc 1 203 0
	movl	12(%ebp), %ecx
	addl	$2, %ecx
	movb	-2(%ebp), %dl
	andl	$63, %edx
	movb	$-128, %al
	leal	(%eax,%edx), %eax
	movb	%al, (%ecx)
	.loc 1 204 0
	movl	12(%ebp), %eax
	addl	$3, %eax
	movb	$0, (%eax)
	.loc 1 205 0
L64:
	leave
	ret
LFE55:
LC5:
	.ascii "%s\0"
.globl _printchar
_printchar:
LFB57:
	.loc 1 207 0
	pushl	%ebp
LCFI104:
	movl	%esp, %ebp
LCFI105:
	subl	$40, %esp
LCFI106:
	.loc 1 209 0
LBB16:
	cmpl	$127, 12(%ebp)
	jg	L68
	.loc 1 210 0
	subl	$12, %esp
	pushl	8(%ebp)
LCFI107:
	call	_checkerr
	addl	$16, %esp
	.loc 1 211 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 212 0
	cmpl	$0, 8(%ebp)
	jne	L69
	subl	$12, %esp
	pushl	12(%ebp)
	call	_putchar
	addl	$16, %esp
	jmp	L67
L69:
	.loc 1 213 0
	subl	$8, %esp
	pushl	-12(%ebp)
	pushl	12(%ebp)
	call	_putc
	addl	$16, %esp
	.loc 1 214 0
	jmp	L67
L68:
	.loc 1 216 0
	subl	$8, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
	movl	12(%ebp), %eax
	andl	$65535, %eax
	pushl	%eax
	call	_unicode2utf8
	addl	$16, %esp
	.loc 1 217 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	_checkerr
	addl	$16, %esp
	.loc 1 218 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 219 0
	cmpl	$0, 8(%ebp)
	jne	L71
	subl	$8, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
	pushl	$LC5
	call	_printf
	addl	$16, %esp
	jmp	L67
L71:
	.loc 1 220 0
	subl	$4, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
	pushl	$LC5
	pushl	-12(%ebp)
	call	_fprintf
	addl	$16, %esp
	.loc 1 221 0
L67:
	leave
	ret
LBE16:
LFE57:
.globl _readline
_readline:
LFB59:
	.loc 1 223 0
	pushl	%ebp
LCFI108:
	movl	%esp, %ebp
LCFI109:
	subl	$8, %esp
LCFI110:
	.loc 1 223 0
LBB17:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI111:
	call	_checkerr
	addl	$16, %esp
	.loc 1 224 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -8(%ebp)
	.loc 1 225 0
	cmpl	$0, 8(%ebp)
	jne	L74
	movl	$___dj_stdin, -8(%ebp)
L74:
	.loc 1 226 0
	subl	$12, %esp
	pushl	-8(%ebp)
	call	_getc
	addl	$16, %esp
	movb	%al, -1(%ebp)
	.loc 1 227 0
L75:
	cmpb	$10, -1(%ebp)
	jne	L77
	jmp	L73
L77:
	subl	$12, %esp
	pushl	-8(%ebp)
	call	_getc
	addl	$16, %esp
	movb	%al, -1(%ebp)
	jmp	L75
	.loc 1 228 0
L73:
	leave
	ret
LBE17:
LFE59:
.globl _endoffile
_endoffile:
LFB61:
	.loc 1 230 0
	pushl	%ebp
LCFI112:
	movl	%esp, %ebp
LCFI113:
	subl	$24, %esp
LCFI114:
	.loc 1 230 0
LBB18:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI115:
	call	_checkerr
	addl	$16, %esp
	.loc 1 231 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 232 0
	cmpl	$0, 8(%ebp)
	jne	L79
	movl	$___dj_stdin, -12(%ebp)
L79:
	.loc 1 233 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	_getc
	addl	$16, %esp
	movl	%eax, -4(%ebp)
	.loc 1 234 0
	cmpl	$-1, -4(%ebp)
	jne	L80
	movl	$1, -8(%ebp)
	jmp	L81
L80:
	movl	$0, -8(%ebp)
	subl	$8, %esp
	pushl	-12(%ebp)
	pushl	-4(%ebp)
	call	_ungetc
	addl	$16, %esp
L81:
	.loc 1 235 0
	movl	-8(%ebp), %eax
	.loc 1 236 0
	leave
	ret
LBE18:
LFE61:
.globl _endofline
_endofline:
LFB63:
	.loc 1 238 0
	pushl	%ebp
LCFI116:
	movl	%esp, %ebp
LCFI117:
	subl	$8, %esp
LCFI118:
	.loc 1 238 0
LBB19:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI119:
	call	_checkerr
	addl	$16, %esp
	.loc 1 239 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -8(%ebp)
	.loc 1 240 0
	cmpl	$0, 8(%ebp)
	jne	L83
	movl	$___dj_stdin, -8(%ebp)
L83:
	.loc 1 241 0
	subl	$12, %esp
	pushl	-8(%ebp)
	call	_getc
	addl	$16, %esp
	movb	%al, -1(%ebp)
	.loc 1 242 0
	cmpb	$10, -1(%ebp)
	jne	L84
	movb	$1, -2(%ebp)
	jmp	L85
L84:
	movb	$0, -2(%ebp)
	subl	$8, %esp
	pushl	-8(%ebp)
	movsbl	-1(%ebp),%eax
	pushl	%eax
	call	_ungetc
	addl	$16, %esp
L85:
	.loc 1 243 0
	movsbl	-2(%ebp),%eax
	.loc 1 244 0
	leave
	ret
LBE19:
LFE63:
LC6:
	.ascii "\12\0"
.globl _println
_println:
LFB65:
	.loc 1 246 0
	pushl	%ebp
LCFI120:
	movl	%esp, %ebp
LCFI121:
	subl	$8, %esp
LCFI122:
	.loc 1 246 0
LBB20:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI123:
	call	_checkerr
	addl	$16, %esp
	.loc 1 247 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 249 0
	cmpl	$0, 8(%ebp)
	jne	L87
	subl	$12, %esp
	pushl	$LC6
	call	_printf
	addl	$16, %esp
	jmp	L86
L87:
	.loc 1 254 0
	subl	$8, %esp
	pushl	$LC6
	pushl	-4(%ebp)
	call	_fprintf
	addl	$16, %esp
	.loc 1 256 0
L86:
	leave
	ret
LBE20:
LFE65:
.globl _printspaces
_printspaces:
LFB67:
	.loc 1 258 0
	pushl	%ebp
LCFI124:
	movl	%esp, %ebp
LCFI125:
	subl	$152, %esp
LCFI126:
	.loc 1 262 0
LBB21:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI127:
	call	_checkerr
	addl	$16, %esp
	.loc 1 263 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 264 0
	cmpl	$80, 12(%ebp)
	jle	L90
	movl	$80, 12(%ebp)
L90:
	.loc 1 265 0
	movl	$0, -140(%ebp)
L91:
	movl	-140(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L94
	jmp	L92
L94:
	.loc 1 266 0
	leal	-136(%ebp), %eax
	addl	-140(%ebp), %eax
	movb	$32, (%eax)
	.loc 1 267 0
	leal	-135(%ebp), %eax
	addl	-140(%ebp), %eax
	movb	$0, (%eax)
	.loc 1 265 0
	leal	-140(%ebp), %eax
	incl	(%eax)
	jmp	L91
L92:
	.loc 1 269 0
	cmpl	$0, 8(%ebp)
	jne	L95
	subl	$8, %esp
	leal	-136(%ebp), %eax
	pushl	%eax
	pushl	$LC5
	call	_printf
	addl	$16, %esp
	jmp	L89
L95:
	.loc 1 270 0
	subl	$4, %esp
	leal	-136(%ebp), %eax
	pushl	%eax
	pushl	$LC5
	pushl	-12(%ebp)
	call	_fprintf
	addl	$16, %esp
	.loc 1 271 0
L89:
	leave
	ret
LBE21:
LFE67:
.globl _pascalerror
_pascalerror:
LFB69:
	.loc 1 273 0
	pushl	%ebp
LCFI128:
	movl	%esp, %ebp
LCFI129:
	subl	$8, %esp
LCFI130:
	.loc 1 274 0
	subl	$4, %esp
	pushl	8(%ebp)
	pushl	$LC5
	pushl	$___dj_stderr
LCFI131:
	call	_fprintf
	addl	$16, %esp
	.loc 1 275 0
	subl	$12, %esp
	pushl	$-1
	call	_pascalexit
	addl	$16, %esp
	.loc 1 276 0
	leave
	ret
LFE69:
.globl _length
_length:
LFB71:
	.loc 1 277 0
	pushl	%ebp
LCFI132:
	movl	%esp, %ebp
LCFI133:
	.loc 1 277 0
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	popl	%ebp
	ret
LFE71:
.globl _incr
_incr:
LFB73:
	.loc 1 278 0
	pushl	%ebp
LCFI134:
	movl	%esp, %ebp
LCFI135:
	.loc 1 278 0
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	movl	(%edx), %edx
	addl	$2, %edx
	movl	%edx, (%eax)
	popl	%ebp
	ret
LFE73:
.globl _readstring
_readstring:
LFB75:
	.loc 1 280 0
	pushl	%ebp
LCFI136:
	movl	%esp, %ebp
LCFI137:
	subl	$24, %esp
LCFI138:
	.loc 1 282 0
LBB22:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI139:
	call	_checkerr
	addl	$16, %esp
	.loc 1 283 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 284 0
	cmpl	$0, 8(%ebp)
	jne	L101
	movl	$___dj_stdin, -12(%ebp)
L101:
	.loc 1 285 0
	movl	$0, -8(%ebp)
	.loc 1 286 0
	movl	12(%ebp), %edx
	movl	-8(%ebp), %eax
	movw	%ax, (%edx)
	.loc 1 287 0
	movw	$32, -2(%ebp)
	.loc 1 288 0
L102:
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	cmpl	16(%ebp), %eax
	jge	L100
	cmpw	$10, -2(%ebp)
	jne	L104
	jmp	L100
L104:
	.loc 1 290 0
	subl	$8, %esp
	leal	-2(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readchar
	addl	$16, %esp
	.loc 1 291 0
	cmpw	$10, -2(%ebp)
	je	L106
	.loc 1 292 0
	leal	-8(%ebp), %eax
	incl	(%eax)
	.loc 1 293 0
	movl	-8(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	12(%ebp), %edx
	movw	-2(%ebp), %ax
	movw	%ax, (%edx,%ecx)
	.loc 1 294 0
	movl	12(%ebp), %edx
	movl	-8(%ebp), %eax
	movw	%ax, (%edx)
	jmp	L102
L106:
	.loc 1 295 0
	subl	$8, %esp
	pushl	-12(%ebp)
	movw	-2(%ebp), %ax
	andl	$65535, %eax
	pushl	%eax
	call	_ungetc
	addl	$16, %esp
	jmp	L102
	.loc 1 297 0
L100:
	leave
	ret
LBE22:
LFE75:
.globl _printstring
_printstring:
LFB77:
	.loc 1 300 0
	pushl	%ebp
LCFI140:
	movl	%esp, %ebp
LCFI141:
	subl	$24, %esp
LCFI142:
	.loc 1 302 0
LBB23:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI143:
	call	_checkerr
	addl	$16, %esp
	.loc 1 303 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -16(%ebp)
	.loc 1 304 0
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -8(%ebp)
	.loc 1 306 0
	movl	16(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jle	L109
	subl	$8, %esp
	movl	-8(%ebp), %eax
	movl	16(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_printspaces
	addl	$16, %esp
L109:
	.loc 1 307 0
	movl	$1, -4(%ebp)
L110:
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jle	L113
	jmp	L108
L113:
	.loc 1 308 0
	movl	-4(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	12(%ebp), %eax
	movw	(%eax,%edx), %ax
	andl	$65535, %eax
	movl	%eax, -12(%ebp)
	.loc 1 309 0
	pushl	$1
	pushl	$1
	pushl	-12(%ebp)
	pushl	8(%ebp)
	call	_printchar
	addl	$16, %esp
	.loc 1 307 0
	leal	-4(%ebp), %eax
	incl	(%eax)
	jmp	L110
	.loc 1 311 0
L108:
	leave
	ret
LBE23:
LFE77:
.globl _printordinal
_printordinal:
LFB79:
	.loc 1 313 0
	pushl	%ebp
LCFI144:
	movl	%esp, %ebp
LCFI145:
	subl	$8, %esp
LCFI146:
	.loc 1 314 0
	pushl	20(%ebp)
	pushl	16(%ebp)
	movl	12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	24(%ebp), %eax
	pushl	(%eax,%edx)
	pushl	8(%ebp)
LCFI147:
	call	_printstring
	addl	$16, %esp
	.loc 1 315 0
	leave
	ret
LFE79:
.globl _skipspaces
_skipspaces:
LFB81:
	.loc 1 317 0
	pushl	%ebp
LCFI148:
	movl	%esp, %ebp
LCFI149:
	subl	$8, %esp
LCFI150:
	.loc 1 319 0
LBB24:
	movb	$32, -1(%ebp)
L116:
	cmpb	$32, -1(%ebp)
	je	L118
	jmp	L117
L118:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI151:
	call	_getc
	addl	$16, %esp
	movb	%al, -1(%ebp)
	jmp	L116
L117:
	.loc 1 320 0
	subl	$8, %esp
	pushl	8(%ebp)
	movsbl	-1(%ebp),%eax
	pushl	%eax
	call	_ungetc
	addl	$16, %esp
	.loc 1 321 0
	leave
	ret
LBE24:
LFE81:
.globl _utolower
_utolower:
LFB83:
	.loc 1 323 0
	pushl	%ebp
LCFI152:
	movl	%esp, %ebp
LCFI153:
	subl	$8, %esp
LCFI154:
	movl	8(%ebp), %eax
	movw	%ax, -2(%ebp)
	.loc 1 324 0
	cmpw	$64, -2(%ebp)
	jbe	L121
	cmpw	$90, -2(%ebp)
	ja	L121
	movw	-2(%ebp), %ax
	andl	$65535, %eax
	addl	$32, %eax
	movl	%eax, -8(%ebp)
	jmp	L120
L121:
	.loc 1 325 0
	cmpw	$912, -2(%ebp)
	jbe	L122
	cmpw	$937, -2(%ebp)
	ja	L122
	movw	-2(%ebp), %ax
	andl	$65535, %eax
	addl	$32, %eax
	movl	%eax, -8(%ebp)
	jmp	L120
L122:
	.loc 1 326 0
	cmpw	$1039, -2(%ebp)
	jbe	L123
	cmpw	$1071, -2(%ebp)
	ja	L123
	movw	-2(%ebp), %ax
	andl	$65535, %eax
	addl	$32, %eax
	movl	%eax, -8(%ebp)
	jmp	L120
L123:
	.loc 1 327 0
	movw	-2(%ebp), %ax
	andl	$65535, %eax
	movl	%eax, -8(%ebp)
	.loc 1 328 0
L120:
	movl	-8(%ebp), %eax
	leave
	ret
LFE83:
.globl _readordinal
_readordinal:
LFB85:
	.loc 1 330 0
	pushl	%ebp
LCFI155:
	movl	%esp, %ebp
LCFI156:
	subl	$552, %esp
LCFI157:
	.loc 1 333 0
LBB25:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI158:
	call	_checkerr
	addl	$16, %esp
	.loc 1 334 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -540(%ebp)
	.loc 1 335 0
	cmpl	$0, 8(%ebp)
	jne	L125
	movl	$___dj_stdin, -540(%ebp)
L125:
	.loc 1 336 0
	subl	$12, %esp
	pushl	-540(%ebp)
	call	_skipspaces
	addl	$16, %esp
	.loc 1 337 0
	subl	$12, %esp
	pushl	-540(%ebp)
LCFI159:
	call	_getc
	addl	$4, %esp
	pushl	%eax
LCFI160:
	call	_tolower
	addl	$16, %esp
	movw	%ax, -10(%ebp)
	.loc 1 338 0
	movw	$0, -536(%ebp)
	movl	$0, -20(%ebp)
	.loc 1 339 0
	cmpw	$122, -10(%ebp)
	ja	L126
	cmpw	$96, -10(%ebp)
	jbe	L126
	.loc 1 340 0
L127:
	cmpw	$122, -10(%ebp)
	ja	L132
	cmpw	$96, -10(%ebp)
	ja	L131
L132:
	cmpw	$57, -10(%ebp)
	ja	L126
	cmpw	$47, -10(%ebp)
	ja	L131
	jmp	L126
L131:
	cmpl	$253, -20(%ebp)
	jle	L129
	jmp	L126
L129:
	.loc 1 342 0
	movl	-20(%ebp), %edx
	movw	-10(%ebp), %ax
	movw	%ax, -534(%ebp,%edx,2)
	leal	-536(%ebp), %eax
	incw	(%eax)
	leal	-20(%ebp), %eax
	incl	(%eax)
	.loc 1 343 0
	movl	-20(%ebp), %eax
	movw	$0, -534(%ebp,%eax,2)
	.loc 1 344 0
	subl	$8, %esp
	leal	-10(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_readchar
	addl	$16, %esp
	.loc 1 346 0
	subl	$12, %esp
	movw	-10(%ebp), %ax
	andl	$65535, %eax
	pushl	%eax
	call	_utolower
	addl	$16, %esp
	movw	%ax, -10(%ebp)
	jmp	L127
L126:
	.loc 1 349 0
	subl	$8, %esp
	pushl	-540(%ebp)
	movw	-10(%ebp), %ax
	andl	$65535, %eax
	pushl	%eax
	call	_ungetc
	addl	$16, %esp
	.loc 1 351 0
	movl	$0, -16(%ebp)
L133:
	movl	-16(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	L136
	jmp	L134
L136:
	.loc 1 353 0
LBB26:
	subl	$8, %esp
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	pushl	(%eax,%edx)
	leal	-536(%ebp), %eax
	pushl	%eax
	call	_cstringcompare
	addl	$16, %esp
	testl	%eax, %eax
	jne	L135
	.loc 1 355 0
	cmpl	$255, 20(%ebp)
	jg	L138
	movl	12(%ebp), %edx
	movl	-16(%ebp), %eax
	movw	%ax, (%edx)
	jmp	L124
L138:
	.loc 1 356 0
	movl	12(%ebp), %edx
	movl	-16(%ebp), %eax
	movw	%ax, (%edx)
	.loc 1 357 0
	jmp	L124
	.loc 1 351 0
L135:
	leal	-16(%ebp), %eax
LBE26:
	incl	(%eax)
	jmp	L133
L134:
	.loc 1 360 0
	movl	$301, _iores
	.loc 1 361 0
L124:
	leave
	ret
LBE25:
LFE85:
.globl _setcmprtl
_setcmprtl:
LFB87:
	.loc 1 368 0
	pushl	%ebp
LCFI161:
	movl	%esp, %ebp
LCFI162:
	subl	$36, %esp
LCFI163:
	.loc 1 371 0
LBB27:
	movl	$1, -24(%ebp)
	.loc 1 372 0
	movl	$0, -28(%ebp)
	.loc 1 373 0
	movl	$0, -32(%ebp)
	.loc 1 374 0
	movl	$0, -4(%ebp)
L140:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	L143
	jmp	L141
L143:
	.loc 1 376 0
	movl	-4(%ebp), %eax
	addl	8(%ebp), %eax
	movsbl	(%eax),%eax
	movl	%eax, -8(%ebp)
	.loc 1 377 0
	movl	-4(%ebp), %eax
	addl	12(%ebp), %eax
	movsbl	(%eax),%eax
	movl	%eax, -12(%ebp)
	.loc 1 378 0
	movl	-8(%ebp), %eax
	cmpl	-12(%ebp), %eax
	je	L144
	movl	$0, -24(%ebp)
L144:
	.loc 1 379 0
	movl	-12(%ebp), %eax
	notl	%eax
	andl	-8(%ebp), %eax
	testl	%eax, %eax
	je	L145
	movl	$1, -32(%ebp)
L145:
	.loc 1 380 0
	movl	-8(%ebp), %eax
	notl	%eax
	andl	-12(%ebp), %eax
	testl	%eax, %eax
	je	L142
	movl	$1, -28(%ebp)
	.loc 1 374 0
L142:
	leal	-4(%ebp), %eax
	incl	(%eax)
	jmp	L140
L141:
	.loc 1 383 0
	cmpl	$0, -24(%ebp)
	je	L147
	movl	$0, -36(%ebp)
	jmp	L139
L147:
	.loc 1 384 0
	movl	-28(%ebp), %eax
	andl	-32(%ebp), %eax
	testl	%eax, %eax
	je	L148
	movl	$2, -36(%ebp)
	jmp	L139
L148:
	.loc 1 385 0
	cmpl	$0, -32(%ebp)
	je	L149
	movl	$1, -36(%ebp)
	jmp	L139
L149:
	.loc 1 386 0
	movl	$-1, -36(%ebp)
	.loc 1 387 0
L139:
LBE27:
	movl	-36(%ebp), %eax
	leave
	ret
LFE87:
.globl _cstringcompare
_cstringcompare:
LFB89:
	.loc 1 391 0
	pushl	%ebp
LCFI164:
	movl	%esp, %ebp
LCFI165:
	pushl	%esi
LCFI166:
	pushl	%ebx
LCFI167:
	subl	$12, %esp
LCFI168:
	.loc 1 394 0
LBB28:
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -16(%ebp)
	.loc 1 395 0
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	cmpl	-16(%ebp), %eax
	jge	L151
	movl	12(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -16(%ebp)
L151:
	.loc 1 397 0
	movl	$1, -12(%ebp)
L152:
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jle	L155
	jmp	L153
L155:
	.loc 1 399 0
	movl	-12(%ebp), %eax
	leal	(%eax,%eax), %esi
	movl	8(%ebp), %ebx
	movl	-12(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	12(%ebp), %edx
	movw	(%ebx,%esi), %ax
	cmpw	(%edx,%ecx), %ax
	jae	L156
	movl	$-1, -20(%ebp)
	jmp	L150
L156:
	.loc 1 400 0
	movl	-12(%ebp), %eax
	leal	(%eax,%eax), %esi
	movl	8(%ebp), %ebx
	movl	-12(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	12(%ebp), %edx
	movw	(%ebx,%esi), %ax
	cmpw	(%edx,%ecx), %ax
	jbe	L154
	movl	$1, -20(%ebp)
	jmp	L150
	.loc 1 397 0
L154:
	leal	-12(%ebp), %eax
	incl	(%eax)
	jmp	L152
L153:
	.loc 1 402 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movw	(%eax), %ax
	cmpw	(%edx), %ax
	jae	L158
	movl	$-1, -20(%ebp)
	jmp	L150
L158:
	.loc 1 403 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movw	(%eax), %ax
	cmpw	(%edx), %ax
	jbe	L159
	movl	$1, -20(%ebp)
	jmp	L150
L159:
	.loc 1 404 0
	movl	$0, -20(%ebp)
	.loc 1 405 0
L150:
LBE28:
	movl	-20(%ebp), %eax
	addl	$12, %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
LFE89:
LC7:
	.ascii "error in reading a boolean\0"
.globl _readbool
_readbool:
LFB91:
	.loc 1 408 0
	pushl	%ebp
LCFI169:
	movl	%esp, %ebp
LCFI170:
	subl	$8, %esp
LCFI171:
	.loc 1 409 0
LBB29:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI172:
	call	_checkerr
	addl	$16, %esp
	.loc 1 410 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -8(%ebp)
	.loc 1 411 0
	cmpl	$0, 8(%ebp)
	jne	L161
	movl	$___dj_stdin, -8(%ebp)
L161:
	.loc 1 412 0
	subl	$12, %esp
	pushl	-8(%ebp)
	call	_skipspaces
	addl	$16, %esp
	.loc 1 413 0
	subl	$12, %esp
	pushl	-8(%ebp)
LCFI173:
	call	_getc
	addl	$4, %esp
	pushl	%eax
LCFI174:
	call	_toupper
	addl	$16, %esp
	movb	%al, -1(%ebp)
	.loc 1 414 0
	cmpb	$70, -1(%ebp)
	jne	L162
	.loc 1 415 0
	subl	$12, %esp
	pushl	-8(%ebp)
LCFI175:
	call	_getc
	addl	$4, %esp
	pushl	%eax
LCFI176:
	call	_toupper
	addl	$16, %esp
	cmpl	$65, %eax
	jne	L167
	.loc 1 416 0
	subl	$12, %esp
	pushl	-8(%ebp)
LCFI177:
	call	_getc
	addl	$4, %esp
	pushl	%eax
LCFI178:
	call	_toupper
	addl	$16, %esp
	cmpl	$76, %eax
	jne	L167
	.loc 1 417 0
	subl	$12, %esp
	pushl	-8(%ebp)
LCFI179:
	call	_getc
	addl	$4, %esp
	pushl	%eax
LCFI180:
	call	_toupper
	addl	$16, %esp
	cmpl	$83, %eax
	jne	L167
	.loc 1 418 0
	subl	$12, %esp
	pushl	-8(%ebp)
LCFI181:
	call	_getc
	addl	$4, %esp
	pushl	%eax
LCFI182:
	call	_toupper
	addl	$16, %esp
	cmpl	$69, %eax
	jne	L167
	movl	12(%ebp), %eax
	movb	$0, (%eax)
	jmp	L160
L162:
	.loc 1 420 0
	cmpb	$84, -1(%ebp)
	jne	L167
	.loc 1 421 0
	subl	$12, %esp
	pushl	-8(%ebp)
LCFI183:
	call	_getc
	addl	$4, %esp
	pushl	%eax
LCFI184:
	call	_toupper
	addl	$16, %esp
	cmpl	$82, %eax
	jne	L167
	.loc 1 422 0
	subl	$12, %esp
	pushl	-8(%ebp)
LCFI185:
	call	_getc
	addl	$4, %esp
	pushl	%eax
LCFI186:
	call	_toupper
	addl	$16, %esp
	cmpl	$85, %eax
	jne	L167
	.loc 1 423 0
	subl	$12, %esp
	pushl	-8(%ebp)
LCFI187:
	call	_getc
	addl	$4, %esp
	pushl	%eax
LCFI188:
	call	_toupper
	addl	$16, %esp
	cmpl	$69, %eax
	jne	L167
	movl	12(%ebp), %eax
	movb	$1, (%eax)
	jmp	L160
L167:
	.loc 1 425 0
	subl	$12, %esp
	pushl	$LC7
	call	_pascalerror
	addl	$16, %esp
	.loc 1 427 0
L160:
	leave
	ret
LBE29:
LFE91:
LC8:
	.ascii " true\0"
LC9:
	.ascii "false\0"
.globl _printbool
_printbool:
LFB93:
	.loc 1 429 0
	pushl	%ebp
LCFI189:
	movl	%esp, %ebp
LCFI190:
	subl	$8, %esp
LCFI191:
	movl	12(%ebp), %eax
	movb	%al, -1(%ebp)
	.loc 1 430 0
LBB30:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI192:
	call	_checkerr
	addl	$16, %esp
	.loc 1 431 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -8(%ebp)
	.loc 1 432 0
	cmpl	$5, 16(%ebp)
	jle	L173
	subl	$8, %esp
	movl	16(%ebp), %eax
	subl	$5, %eax
	pushl	%eax
	pushl	8(%ebp)
	call	_printspaces
	addl	$16, %esp
L173:
	.loc 1 433 0
	cmpl	$0, 8(%ebp)
	jne	L174
	.loc 1 434 0
	cmpb	$0, -1(%ebp)
	je	L175
	subl	$12, %esp
	pushl	$LC8
	call	_printf
	addl	$16, %esp
	jmp	L172
L175:
	subl	$12, %esp
	pushl	$LC9
	call	_printf
	addl	$16, %esp
	jmp	L172
L174:
	.loc 1 436 0
	cmpb	$0, -1(%ebp)
	je	L178
	subl	$8, %esp
	pushl	$LC8
	pushl	-8(%ebp)
	call	_fprintf
	addl	$16, %esp
	jmp	L172
L178:
	subl	$8, %esp
	pushl	$LC9
	pushl	-8(%ebp)
	call	_fprintf
	addl	$16, %esp
	.loc 1 439 0
L172:
	leave
	ret
LBE30:
LFE93:
LC10:
	.ascii "%d\0"
.globl _readint
_readint:
LFB95:
	.loc 1 441 0
	pushl	%ebp
LCFI193:
	movl	%esp, %ebp
LCFI194:
	subl	$8, %esp
LCFI195:
	.loc 1 442 0
LBB31:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI196:
	call	_checkerr
	addl	$16, %esp
	.loc 1 443 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 444 0
	cmpl	$0, 8(%ebp)
	jne	L181
	movl	$___dj_stdin, -4(%ebp)
L181:
	.loc 1 446 0
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	$LC10
	pushl	-4(%ebp)
	call	_fscanf
	addl	$16, %esp
	.loc 1 447 0
	leave
	ret
LBE31:
LFE95:
.globl _readbyte
_readbyte:
LFB97:
	.loc 1 449 0
	pushl	%ebp
LCFI197:
	movl	%esp, %ebp
LCFI198:
	subl	$8, %esp
LCFI199:
	.loc 1 451 0
LBB32:
	subl	$8, %esp
	leal	-4(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
LCFI200:
	call	_readint
	addl	$16, %esp
	.loc 1 452 0
	cmpl	$0, -4(%ebp)
	js	L183
	cmpl	$255, -4(%ebp)
	jg	L183
	movl	12(%ebp), %edx
	movb	-4(%ebp), %al
	movb	%al, (%edx)
L183:
	.loc 1 453 0
	cmpl	$0, -4(%ebp)
	jns	L184
	movl	12(%ebp), %eax
	movb	$0, (%eax)
L184:
	.loc 1 454 0
	cmpl	$255, -4(%ebp)
	jle	L182
	movl	12(%ebp), %eax
	movb	$-1, (%eax)
	.loc 1 455 0
L182:
	leave
	ret
LBE32:
LFE97:
LC11:
	.ascii "%c%dld\0"
.globl _printint64
_printint64:
LFB99:
	.loc 1 456 0
	pushl	%ebp
LCFI201:
	movl	%esp, %ebp
LCFI202:
	subl	$248, %esp
LCFI203:
	.loc 1 462 0
LBB33:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI204:
	call	_checkerr
	addl	$16, %esp
	.loc 1 463 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -244(%ebp)
	.loc 1 464 0
	pushl	16(%ebp)
	pushl	$37
	pushl	$LC11
	leal	-232(%ebp), %eax
	pushl	%eax
	call	_sprintf
	addl	$16, %esp
	.loc 1 466 0
	cmpl	$0, 8(%ebp)
	jne	L187
	subl	$4, %esp
	pushl	16(%ebp)
	pushl	12(%ebp)
	leal	-232(%ebp), %eax
	pushl	%eax
	call	_printf
	addl	$16, %esp
	jmp	L186
L187:
	.loc 1 467 0
	pushl	16(%ebp)
	pushl	12(%ebp)
	leal	-232(%ebp), %eax
	pushl	%eax
	pushl	-244(%ebp)
	call	_fprintf
	addl	$16, %esp
	.loc 1 468 0
L186:
	leave
	ret
LBE33:
LFE99:
LC12:
	.ascii "%c%dd\0"
.globl _printint
_printint:
LFB101:
	.loc 1 469 0
	pushl	%ebp
LCFI205:
	movl	%esp, %ebp
LCFI206:
	subl	$248, %esp
LCFI207:
	.loc 1 475 0
LBB34:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI208:
	call	_checkerr
	addl	$16, %esp
	.loc 1 476 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -244(%ebp)
	.loc 1 477 0
	pushl	16(%ebp)
	pushl	$37
	pushl	$LC12
	leal	-232(%ebp), %eax
	pushl	%eax
	call	_sprintf
	addl	$16, %esp
	.loc 1 480 0
	cmpl	$0, 8(%ebp)
	jne	L190
	subl	$8, %esp
	pushl	12(%ebp)
	leal	-232(%ebp), %eax
	pushl	%eax
	call	_printf
	addl	$16, %esp
	jmp	L189
L190:
	.loc 1 481 0
	subl	$4, %esp
	pushl	12(%ebp)
	leal	-232(%ebp), %eax
	pushl	%eax
	pushl	-244(%ebp)
	call	_fprintf
	addl	$16, %esp
	.loc 1 482 0
L189:
	leave
	ret
LBE34:
LFE101:
LC13:
	.ascii "%f\0"
.globl _readreal
_readreal:
LFB103:
	.loc 1 484 0
	pushl	%ebp
LCFI209:
	movl	%esp, %ebp
LCFI210:
	subl	$8, %esp
LCFI211:
	.loc 1 486 0
LBB35:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI212:
	call	_checkerr
	addl	$16, %esp
	.loc 1 487 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 488 0
	cmpl	$0, 8(%ebp)
	jne	L193
	movl	$___dj_stdin, -4(%ebp)
L193:
	.loc 1 490 0
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	$LC13
	pushl	-4(%ebp)
	call	_fscanf
	addl	$16, %esp
	.loc 1 492 0
	leave
	ret
LBE35:
LFE103:
LC14:
	.ascii "%c%d.%dg\0"
LC15:
	.ascii "%c%d.%df\0"
.globl _printdouble
_printdouble:
LFB105:
	.loc 1 493 0
	pushl	%ebp
LCFI213:
	movl	%esp, %ebp
LCFI214:
	subl	$264, %esp
LCFI215:
	movl	12(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%eax, -16(%ebp)
	movl	%edx, -12(%ebp)
	.loc 1 497 0
LBB36:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI216:
	call	_checkerr
	addl	$16, %esp
	.loc 1 498 0
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	_files(%eax), %eax
	movl	%eax, -260(%ebp)
	.loc 1 499 0
	cmpl	$0, 24(%ebp)
	jne	L195
	subl	$12, %esp
	pushl	$6
	pushl	20(%ebp)
	pushl	$37
	pushl	$LC14
	leal	-248(%ebp), %eax
	pushl	%eax
LCFI217:
	call	_sprintf
	addl	$32, %esp
	jmp	L196
L195:
	.loc 1 500 0
	subl	$12, %esp
	pushl	24(%ebp)
	pushl	20(%ebp)
	pushl	$37
	pushl	$LC15
	leal	-248(%ebp), %eax
	pushl	%eax
	call	_sprintf
	addl	$32, %esp
L196:
	.loc 1 515 0
	cmpl	$0, 8(%ebp)
	jne	L197
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	leal	-248(%ebp), %eax
	pushl	%eax
LCFI218:
	call	_printf
	addl	$16, %esp
	jmp	L194
L197:
	.loc 1 516 0
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	leal	-248(%ebp), %eax
	pushl	%eax
	pushl	-260(%ebp)
	call	_fprintf
	addl	$16, %esp
	.loc 1 517 0
L194:
	leave
	ret
LBE36:
LFE105:
.globl _printreal
_printreal:
LFB107:
	.loc 1 518 0
	pushl	%ebp
LCFI219:
	movl	%esp, %ebp
LCFI220:
	subl	$8, %esp
LCFI221:
	.loc 1 519 0
LBB37:
	flds	12(%ebp)
	fstpl	-8(%ebp)
	.loc 1 520 0
	subl	$12, %esp
	pushl	20(%ebp)
	pushl	16(%ebp)
	pushl	-4(%ebp)
	pushl	-8(%ebp)
	pushl	8(%ebp)
LCFI222:
	call	_printdouble
	addl	$32, %esp
	.loc 1 521 0
	leave
	ret
LBE37:
LFE107:
.globl _cstringassign
_cstringassign:
LFB109:
	.loc 1 525 0
	pushl	%ebp
LCFI223:
	movl	%esp, %ebp
LCFI224:
	pushl	%ebx
LCFI225:
	subl	$8, %esp
LCFI226:
	.loc 1 526 0
LBB38:
	movl	12(%ebp), %eax
	movl	%eax, -8(%ebp)
	.loc 1 528 0
	movl	16(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	cmpl	-8(%ebp), %eax
	jge	L201
	movl	16(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -8(%ebp)
L201:
	.loc 1 529 0
	movl	8(%ebp), %edx
	movl	-8(%ebp), %eax
	movw	%ax, (%edx)
	.loc 1 531 0
	movl	$1, -12(%ebp)
L202:
	movl	-12(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jle	L205
	jmp	L200
L205:
	movl	-12(%ebp), %eax
	leal	(%eax,%eax), %ebx
	movl	8(%ebp), %ecx
	movl	-12(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	16(%ebp), %eax
	movw	(%eax,%edx), %ax
	movw	%ax, (%ecx,%ebx)
	leal	-12(%ebp), %eax
	incl	(%eax)
	jmp	L202
	.loc 1 533 0
L200:
	addl	$8, %esp
	popl	%ebx
	popl	%ebp
	ret
LBE38:
LFE109:
.globl _stringappend
_stringappend:
LFB111:
	.loc 1 535 0
	pushl	%ebp
LCFI227:
	movl	%esp, %ebp
LCFI228:
	pushl	%ebx
LCFI229:
	subl	$12, %esp
LCFI230:
	.loc 1 535 0
LBB39:
	movl	8(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -8(%ebp)
	.loc 1 536 0
	movl	-8(%ebp), %edx
	movl	12(%ebp), %eax
	subl	%edx, %eax
	movl	%eax, -12(%ebp)
	.loc 1 538 0
	movl	16(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	cmpl	-12(%ebp), %eax
	jge	L207
	movl	16(%ebp), %eax
	movw	(%eax), %ax
	andl	$65535, %eax
	movl	%eax, -12(%ebp)
L207:
	.loc 1 539 0
	movl	8(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	addw	(%edx), %ax
	movw	%ax, (%ecx)
	.loc 1 540 0
	movl	$1, -16(%ebp)
L208:
	movl	-16(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jle	L211
	jmp	L206
L211:
	movl	-16(%ebp), %eax
	addl	-8(%ebp), %eax
	leal	(%eax,%eax), %ebx
	movl	8(%ebp), %ecx
	movl	-16(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	16(%ebp), %eax
	movw	(%eax,%edx), %ax
	movw	%ax, (%ecx,%ebx)
	leal	-16(%ebp), %eax
	incl	(%eax)
	jmp	L208
	.loc 1 542 0
L206:
	addl	$12, %esp
	popl	%ebx
	popl	%ebp
	ret
LBE39:
LFE111:
.globl _gettime
_gettime:
LFB113:
	.loc 1 544 0
	pushl	%ebp
LCFI231:
	movl	%esp, %ebp
LCFI232:
	pushl	%ebx
LCFI233:
	subl	$52, %esp
LCFI234:
	.loc 1 548 0
LBB40:
	subl	$12, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
LCFI235:
	call	_ftime
	addl	$16, %esp
	.loc 1 549 0
	subl	$12, %esp
	leal	-40(%ebp), %eax
	pushl	%eax
	call	_localtime
	addl	$16, %esp
	movl	%eax, -48(%ebp)
	.loc 1 550 0
	movl	8(%ebp), %edx
	movl	-48(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%edx)
	.loc 1 551 0
	movl	12(%ebp), %edx
	movl	-48(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%edx)
	.loc 1 552 0
	movl	16(%ebp), %edx
	movl	-48(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	.loc 1 553 0
	movl	20(%ebp), %ebx
	movl	-36(%ebp), %eax
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
	cwtl
	movl	%eax, (%ebx)
	.loc 1 554 0
	movl	-4(%ebp), %ebx
	leave
	ret
LBE40:
LFE113:
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
LFB115:
	.loc 1 556 0
	pushl	%ebp
LCFI236:
	movl	%esp, %ebp
LCFI237:
	subl	$40, %esp
LCFI238:
	.loc 1 560 0
LBB41:
	leal	-16(%ebp), %eax
	pushl	%eax
	leal	-12(%ebp), %eax
	pushl	%eax
	leal	-8(%ebp), %eax
	pushl	%eax
	leal	-4(%ebp), %eax
	pushl	%eax
LCFI239:
	call	_gettime
	addl	$16, %esp
	.loc 1 562 0
	fildl	-4(%ebp)
	fldl	LC17
	fmulp	%st, %st(1)
	fildl	-8(%ebp)
	faddp	%st, %st(1)
	fldl	LC17
	fmulp	%st, %st(1)
	fildl	-12(%ebp)
	faddp	%st, %st(1)
	fildl	-16(%ebp)
	fldl	LC18
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	fstpl	-24(%ebp)
	.loc 1 564 0
	fldl	-24(%ebp)
	fstps	-28(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, -36(%ebp)
	flds	-36(%ebp)
	.loc 1 565 0
	leave
	ret
LBE41:
LFE115:
.globl _trunc
_trunc:
LFB117:
	.loc 1 567 0
	pushl	%ebp
LCFI240:
	movl	%esp, %ebp
LCFI241:
	subl	$16, %esp
LCFI242:
	.loc 1 567 0
LBB42:
	flds	8(%ebp)
	fnstcw	-6(%ebp)
	movw	-6(%ebp), %ax
	movb	$12, %ah
	movw	%ax, -8(%ebp)
	fldcw	-8(%ebp)
	fistpl	-4(%ebp)
	fldcw	-6(%ebp)
	fildl	-4(%ebp)
	flds	8(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	testb	$69, %ah
	je	L216
	jmp	L215
L216:
	movl	-4(%ebp), %eax
	decl	%eax
	movl	%eax, -16(%ebp)
	jmp	L214
L215:
	flds	8(%ebp)
	fldcw	-8(%ebp)
	fistpl	-12(%ebp)
	fldcw	-6(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
L214:
LBE42:
	movl	-16(%ebp), %eax
	leave
	ret
LFE117:
.globl _initvec
_initvec:
LFB119:
	.loc 1 587 0
	pushl	%ebp
LCFI243:
	movl	%esp, %ebp
LCFI244:
	pushl	%ebx
LCFI245:
	subl	$36, %esp
LCFI246:
	.loc 1 589 0
LBB43:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	.loc 1 591 0
	movl	16(%ebp), %eax
	movl	%eax, -28(%ebp)
	.loc 1 593 0
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)
L218:
	cmpl	$0, -12(%ebp)
	jg	L221
	jmp	L219
L221:
	.loc 1 594 0
	movl	-12(%ebp), %eax
	decl	%eax
	movl	%eax, -16(%ebp)
	.loc 1 595 0
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	-40(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
	.loc 1 596 0
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	-40(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	.loc 1 598 0
	movl	-20(%ebp), %edx
	movl	-24(%ebp), %eax
	subl	%edx, %eax
	leal	1(%eax), %edx
	movl	-28(%ebp), %eax
	imull	%edx, %eax
	movl	%eax, -28(%ebp)
	.loc 1 599 0
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	0(,%eax,4), %ecx
	movl	-40(%ebp), %edx
	movl	-28(%ebp), %eax
	movl	%eax, (%edx,%ecx)
	.loc 1 593 0
	leal	-12(%ebp), %eax
	decl	(%eax)
	jmp	L218
L219:
	.loc 1 602 0
	movl	12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%eax, -32(%ebp)
	.loc 1 603 0
	movl	-28(%ebp), %eax
	addl	-32(%ebp), %eax
	movl	%eax, -8(%ebp)
	.loc 1 604 0
	movl	8(%ebp), %ebx
	subl	$12, %esp
	pushl	-8(%ebp)
LCFI247:
	call	_malloc
	addl	$16, %esp
	movl	%eax, (%ebx)
	.loc 1 605 0
	movl	-40(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	(%edx), %eax
	movl	%eax, (%ecx)
	.loc 1 607 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -36(%ebp)
	.loc 1 608 0
	movl	$0, -12(%ebp)
L222:
	movl	12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	cmpl	%eax, -12(%ebp)
	jl	L225
	jmp	L223
L225:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %ebx
	movl	-36(%ebp), %ecx
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-40(%ebp), %eax
	movl	(%eax,%edx), %eax
	movl	%eax, (%ecx,%ebx)
	leal	-12(%ebp), %eax
	incl	(%eax)
	jmp	L222
L223:
	.loc 1 610 0
	subl	$12, %esp
	pushl	-40(%ebp)
	call	_free
	addl	$16, %esp
	.loc 1 611 0
	movl	-4(%ebp), %ebx
	leave
	ret
LBE43:
LFE119:
.globl _getmem
_getmem:
LFB121:
	.loc 1 613 0
	pushl	%ebp
LCFI248:
	movl	%esp, %ebp
LCFI249:
	pushl	%ebx
LCFI250:
	subl	$4, %esp
LCFI251:
	.loc 1 614 0
LBB44:
	movl	8(%ebp), %ebx
	subl	$12, %esp
	pushl	12(%ebp)
LCFI252:
	call	_malloc
	addl	$16, %esp
	movl	%eax, (%ebx)
	.loc 1 615 0
	movl	-4(%ebp), %ebx
	leave
	ret
LBE44:
LFE121:
.globl _freemem
_freemem:
LFB123:
	.loc 1 617 0
	pushl	%ebp
LCFI253:
	movl	%esp, %ebp
LCFI254:
	subl	$8, %esp
LCFI255:
	.loc 1 618 0
LBB45:
	subl	$12, %esp
	movl	8(%ebp), %eax
	pushl	(%eax)
LCFI256:
	call	_free
	addl	$16, %esp
	.loc 1 620 0
	leave
	ret
LBE45:
LFE123:
LC21:
	.ascii "%x\0"
.globl _printpointer
_printpointer:
LFB125:
	.loc 1 622 0
	pushl	%ebp
LCFI257:
	movl	%esp, %ebp
LCFI258:
	subl	$8, %esp
LCFI259:
	.loc 1 623 0
	subl	$8, %esp
	pushl	8(%ebp)
	pushl	$LC21
LCFI260:
	call	_printf
	addl	$16, %esp
	.loc 1 624 0
	leave
	ret
LFE125:
.globl _pdispose
_pdispose:
LFB127:
	.loc 1 626 0
	pushl	%ebp
LCFI261:
	movl	%esp, %ebp
LCFI262:
	subl	$8, %esp
LCFI263:
	.loc 1 628 0
LBB46:
	subl	$12, %esp
	pushl	8(%ebp)
LCFI264:
	call	_free
	addl	$16, %esp
	.loc 1 629 0
	leave
	ret
LBE46:
LFE127:
LC22:
	.ascii "bounds fault\12\0"
.globl _boundsfault
_boundsfault:
LFB129:
	.loc 1 633 0
	pushl	%ebp
LCFI265:
	movl	%esp, %ebp
LCFI266:
	subl	$8, %esp
LCFI267:
	.loc 1 634 0
	cmpl	$261, 8(%ebp)
	jne	L231
	subl	$12, %esp
	pushl	$LC22
LCFI268:
	call	_printf
	addl	$16, %esp
L231:
	.loc 1 635 0
	subl	$12, %esp
	pushl	$288
	call	_raise
	addl	$16, %esp
	.loc 1 637 0
	leave
	ret
LFE129:
.globl _paramcount
_paramcount:
LFB131:
	.loc 1 640 0
	pushl	%ebp
LCFI269:
	movl	%esp, %ebp
LCFI270:
	.loc 1 640 0
	movl	_Argc, %eax
	popl	%ebp
	ret
LFE131:
.globl _parampntr
_parampntr:
LFB133:
	.loc 1 642 0
	pushl	%ebp
LCFI271:
	movl	%esp, %ebp
LCFI272:
	.loc 1 642 0
	movl	8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	_Argv, %eax
	movl	(%eax,%edx), %eax
	popl	%ebp
	ret
LFE133:
.globl _main
_main:
LFB135:
	.loc 1 643 0
	pushl	%ebp
LCFI273:
	movl	%esp, %ebp
LCFI274:
	subl	$8, %esp
LCFI275:
	andl	$-16, %esp
	movl	$0, %eax
	subl	%eax, %esp
	.loc 1 644 0
	movl	8(%ebp), %eax
	movl	%eax, _Argc
	movl	12(%ebp), %eax
	movl	%eax, _Argv
	.loc 1 645 0
	call	_initfs
	.loc 1 646 0
	subl	$8, %esp
	pushl	$_boundsfault
	pushl	$291
LCFI276:
	call	_signal
	addl	$16, %esp
	.loc 1 647 0
LCFI277:
	call	_Pmain
	.loc 1 648 0
	subl	$12, %esp
	pushl	$0
LCFI278:
	call	_pascalexit
	addl	$16, %esp
	.loc 1 649 0
	leave
	ret
LFE135:
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
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.p2align 2
LECIE0:
LSFDE0:
	.long	LEFDE0-LASFDE0
LASFDE0:
	.long	Lframe0
	.long	LFB3
	.long	LFE3-LFB3
	.byte	0x4
	.long	LCFI0-LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI1-LCFI0
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE0:
LSFDE2:
	.long	LEFDE2-LASFDE2
LASFDE2:
	.long	Lframe0
	.long	LFB5
	.long	LFE5-LFB5
	.byte	0x4
	.long	LCFI3-LFB5
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI4-LCFI3
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE2:
LSFDE4:
	.long	LEFDE4-LASFDE4
LASFDE4:
	.long	Lframe0
	.long	LFB7
	.long	LFE7-LFB7
	.byte	0x4
	.long	LCFI5-LFB7
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI6-LCFI5
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB9
	.long	LFE9-LFB9
	.byte	0x4
	.long	LCFI9-LFB9
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI10-LCFI9
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB11
	.long	LFE11-LFB11
	.byte	0x4
	.long	LCFI13-LFB11
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI14-LCFI13
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB13
	.long	LFE13-LFB13
	.byte	0x4
	.long	LCFI17-LFB13
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI18-LCFI17
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE10:
LSFDE12:
	.long	LEFDE12-LASFDE12
LASFDE12:
	.long	Lframe0
	.long	LFB15
	.long	LFE15-LFB15
	.byte	0x4
	.long	LCFI20-LFB15
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI21-LCFI20
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB17
	.long	LFE17-LFB17
	.byte	0x4
	.long	LCFI24-LFB17
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI25-LCFI24
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB19
	.long	LFE19-LFB19
	.byte	0x4
	.long	LCFI28-LFB19
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI29-LCFI28
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE16:
LSFDE18:
	.long	LEFDE18-LASFDE18
LASFDE18:
	.long	Lframe0
	.long	LFB21
	.long	LFE21-LFB21
	.byte	0x4
	.long	LCFI30-LFB21
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI31-LCFI30
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB23
	.long	LFE23-LFB23
	.byte	0x4
	.long	LCFI34-LFB23
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI35-LCFI34
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB25
	.long	LFE25-LFB25
	.byte	0x4
	.long	LCFI38-LFB25
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI39-LCFI38
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE22:
LSFDE24:
	.long	LEFDE24-LASFDE24
LASFDE24:
	.long	Lframe0
	.long	LFB27
	.long	LFE27-LFB27
	.byte	0x4
	.long	LCFI41-LFB27
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI42-LCFI41
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI44-LCFI42
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE24:
LSFDE26:
	.long	LEFDE26-LASFDE26
LASFDE26:
	.long	Lframe0
	.long	LFB29
	.long	LFE29-LFB29
	.byte	0x4
	.long	LCFI45-LFB29
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI46-LCFI45
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI48-LCFI46
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE26:
LSFDE28:
	.long	LEFDE28-LASFDE28
LASFDE28:
	.long	Lframe0
	.long	LFB31
	.long	LFE31-LFB31
	.byte	0x4
	.long	LCFI49-LFB31
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI50-LCFI49
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI52-LCFI50
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE28:
LSFDE30:
	.long	LEFDE30-LASFDE30
LASFDE30:
	.long	Lframe0
	.long	LFB33
	.long	LFE33-LFB33
	.byte	0x4
	.long	LCFI53-LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI54-LCFI53
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI56-LCFI54
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE30:
LSFDE32:
	.long	LEFDE32-LASFDE32
LASFDE32:
	.long	Lframe0
	.long	LFB35
	.long	LFE35-LFB35
	.byte	0x4
	.long	LCFI57-LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI58-LCFI57
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI60-LCFI58
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI61-LCFI60
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE32:
LSFDE34:
	.long	LEFDE34-LASFDE34
LASFDE34:
	.long	Lframe0
	.long	LFB37
	.long	LFE37-LFB37
	.byte	0x4
	.long	LCFI62-LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI63-LCFI62
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB39
	.long	LFE39-LFB39
	.byte	0x4
	.long	LCFI67-LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI68-LCFI67
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB41
	.long	LFE41-LFB41
	.byte	0x4
	.long	LCFI72-LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI73-LCFI72
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB43
	.long	LFE43-LFB43
	.byte	0x4
	.long	LCFI77-LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI78-LCFI77
	.byte	0xd
	.uleb128 0x4
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
	.long	LFB45
	.long	LFE45-LFB45
	.byte	0x4
	.long	LCFI82-LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI83-LCFI82
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE42:
LSFDE44:
	.long	LEFDE44-LASFDE44
LASFDE44:
	.long	Lframe0
	.long	LFB47
	.long	LFE47-LFB47
	.byte	0x4
	.long	LCFI84-LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI85-LCFI84
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI87-LCFI85
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI88-LCFI87
	.byte	0x2e
	.uleb128 0x0
	.p2align 2
LEFDE44:
LSFDE46:
	.long	LEFDE46-LASFDE46
LASFDE46:
	.long	Lframe0
	.long	LFB49
	.long	LFE49-LFB49
	.byte	0x4
	.long	LCFI89-LFB49
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI90-LCFI89
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE46:
LSFDE48:
	.long	LEFDE48-LASFDE48
LASFDE48:
	.long	Lframe0
	.long	LFB51
	.long	LFE51-LFB51
	.byte	0x4
	.long	LCFI92-LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI93-LCFI92
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI95-LCFI93
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI96-LCFI95
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE48:
LSFDE50:
	.long	LEFDE50-LASFDE50
LASFDE50:
	.long	Lframe0
	.long	LFB53
	.long	LFE53-LFB53
	.byte	0x4
	.long	LCFI97-LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI98-LCFI97
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI100-LCFI98
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE50:
LSFDE52:
	.long	LEFDE52-LASFDE52
LASFDE52:
	.long	Lframe0
	.long	LFB55
	.long	LFE55-LFB55
	.byte	0x4
	.long	LCFI101-LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI102-LCFI101
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE52:
LSFDE54:
	.long	LEFDE54-LASFDE54
LASFDE54:
	.long	Lframe0
	.long	LFB57
	.long	LFE57-LFB57
	.byte	0x4
	.long	LCFI104-LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI105-LCFI104
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI107-LCFI105
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE54:
LSFDE56:
	.long	LEFDE56-LASFDE56
LASFDE56:
	.long	Lframe0
	.long	LFB59
	.long	LFE59-LFB59
	.byte	0x4
	.long	LCFI108-LFB59
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI109-LCFI108
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI111-LCFI109
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE56:
LSFDE58:
	.long	LEFDE58-LASFDE58
LASFDE58:
	.long	Lframe0
	.long	LFB61
	.long	LFE61-LFB61
	.byte	0x4
	.long	LCFI112-LFB61
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI113-LCFI112
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI115-LCFI113
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE58:
LSFDE60:
	.long	LEFDE60-LASFDE60
LASFDE60:
	.long	Lframe0
	.long	LFB63
	.long	LFE63-LFB63
	.byte	0x4
	.long	LCFI116-LFB63
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI117-LCFI116
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI119-LCFI117
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE60:
LSFDE62:
	.long	LEFDE62-LASFDE62
LASFDE62:
	.long	Lframe0
	.long	LFB65
	.long	LFE65-LFB65
	.byte	0x4
	.long	LCFI120-LFB65
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI121-LCFI120
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI123-LCFI121
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE62:
LSFDE64:
	.long	LEFDE64-LASFDE64
LASFDE64:
	.long	Lframe0
	.long	LFB67
	.long	LFE67-LFB67
	.byte	0x4
	.long	LCFI124-LFB67
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI125-LCFI124
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI127-LCFI125
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE64:
LSFDE66:
	.long	LEFDE66-LASFDE66
LASFDE66:
	.long	Lframe0
	.long	LFB69
	.long	LFE69-LFB69
	.byte	0x4
	.long	LCFI128-LFB69
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI129-LCFI128
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI131-LCFI129
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE66:
LSFDE68:
	.long	LEFDE68-LASFDE68
LASFDE68:
	.long	Lframe0
	.long	LFB71
	.long	LFE71-LFB71
	.byte	0x4
	.long	LCFI132-LFB71
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI133-LCFI132
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE68:
LSFDE70:
	.long	LEFDE70-LASFDE70
LASFDE70:
	.long	Lframe0
	.long	LFB73
	.long	LFE73-LFB73
	.byte	0x4
	.long	LCFI134-LFB73
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI135-LCFI134
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE70:
LSFDE72:
	.long	LEFDE72-LASFDE72
LASFDE72:
	.long	Lframe0
	.long	LFB75
	.long	LFE75-LFB75
	.byte	0x4
	.long	LCFI136-LFB75
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI137-LCFI136
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI139-LCFI137
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE72:
LSFDE74:
	.long	LEFDE74-LASFDE74
LASFDE74:
	.long	Lframe0
	.long	LFB77
	.long	LFE77-LFB77
	.byte	0x4
	.long	LCFI140-LFB77
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI141-LCFI140
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI143-LCFI141
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE74:
LSFDE76:
	.long	LEFDE76-LASFDE76
LASFDE76:
	.long	Lframe0
	.long	LFB79
	.long	LFE79-LFB79
	.byte	0x4
	.long	LCFI144-LFB79
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI145-LCFI144
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI147-LCFI145
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE76:
LSFDE78:
	.long	LEFDE78-LASFDE78
LASFDE78:
	.long	Lframe0
	.long	LFB81
	.long	LFE81-LFB81
	.byte	0x4
	.long	LCFI148-LFB81
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI149-LCFI148
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI151-LCFI149
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE78:
LSFDE80:
	.long	LEFDE80-LASFDE80
LASFDE80:
	.long	Lframe0
	.long	LFB83
	.long	LFE83-LFB83
	.byte	0x4
	.long	LCFI152-LFB83
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI153-LCFI152
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE80:
LSFDE82:
	.long	LEFDE82-LASFDE82
LASFDE82:
	.long	Lframe0
	.long	LFB85
	.long	LFE85-LFB85
	.byte	0x4
	.long	LCFI155-LFB85
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI156-LCFI155
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI158-LCFI156
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI159-LCFI158
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI160-LCFI159
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE82:
LSFDE84:
	.long	LEFDE84-LASFDE84
LASFDE84:
	.long	Lframe0
	.long	LFB87
	.long	LFE87-LFB87
	.byte	0x4
	.long	LCFI161-LFB87
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI162-LCFI161
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE84:
LSFDE86:
	.long	LEFDE86-LASFDE86
LASFDE86:
	.long	Lframe0
	.long	LFB89
	.long	LFE89-LFB89
	.byte	0x4
	.long	LCFI164-LFB89
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI165-LCFI164
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI168-LCFI165
	.byte	0x83
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.p2align 2
LEFDE86:
LSFDE88:
	.long	LEFDE88-LASFDE88
LASFDE88:
	.long	Lframe0
	.long	LFB91
	.long	LFE91-LFB91
	.byte	0x4
	.long	LCFI169-LFB91
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI170-LCFI169
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI172-LCFI170
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI173-LCFI172
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI174-LCFI173
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI175-LCFI174
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI176-LCFI175
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI177-LCFI176
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI178-LCFI177
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI179-LCFI178
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI180-LCFI179
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI181-LCFI180
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI182-LCFI181
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI183-LCFI182
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI184-LCFI183
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI185-LCFI184
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI186-LCFI185
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI187-LCFI186
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.long	LCFI188-LCFI187
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE88:
LSFDE90:
	.long	LEFDE90-LASFDE90
LASFDE90:
	.long	Lframe0
	.long	LFB93
	.long	LFE93-LFB93
	.byte	0x4
	.long	LCFI189-LFB93
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI190-LCFI189
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI192-LCFI190
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE90:
LSFDE92:
	.long	LEFDE92-LASFDE92
LASFDE92:
	.long	Lframe0
	.long	LFB95
	.long	LFE95-LFB95
	.byte	0x4
	.long	LCFI193-LFB95
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI194-LCFI193
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI196-LCFI194
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE92:
LSFDE94:
	.long	LEFDE94-LASFDE94
LASFDE94:
	.long	Lframe0
	.long	LFB97
	.long	LFE97-LFB97
	.byte	0x4
	.long	LCFI197-LFB97
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI198-LCFI197
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI200-LCFI198
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE94:
LSFDE96:
	.long	LEFDE96-LASFDE96
LASFDE96:
	.long	Lframe0
	.long	LFB99
	.long	LFE99-LFB99
	.byte	0x4
	.long	LCFI201-LFB99
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI202-LCFI201
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI204-LCFI202
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE96:
LSFDE98:
	.long	LEFDE98-LASFDE98
LASFDE98:
	.long	Lframe0
	.long	LFB101
	.long	LFE101-LFB101
	.byte	0x4
	.long	LCFI205-LFB101
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI206-LCFI205
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI208-LCFI206
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE98:
LSFDE100:
	.long	LEFDE100-LASFDE100
LASFDE100:
	.long	Lframe0
	.long	LFB103
	.long	LFE103-LFB103
	.byte	0x4
	.long	LCFI209-LFB103
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI210-LCFI209
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI212-LCFI210
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE100:
LSFDE102:
	.long	LEFDE102-LASFDE102
LASFDE102:
	.long	Lframe0
	.long	LFB105
	.long	LFE105-LFB105
	.byte	0x4
	.long	LCFI213-LFB105
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI214-LCFI213
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI216-LCFI214
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI217-LCFI216
	.byte	0x2e
	.uleb128 0x20
	.byte	0x4
	.long	LCFI218-LCFI217
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE102:
LSFDE104:
	.long	LEFDE104-LASFDE104
LASFDE104:
	.long	Lframe0
	.long	LFB107
	.long	LFE107-LFB107
	.byte	0x4
	.long	LCFI219-LFB107
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI220-LCFI219
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI222-LCFI220
	.byte	0x2e
	.uleb128 0x20
	.p2align 2
LEFDE104:
LSFDE106:
	.long	LEFDE106-LASFDE106
LASFDE106:
	.long	Lframe0
	.long	LFB109
	.long	LFE109-LFB109
	.byte	0x4
	.long	LCFI223-LFB109
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI224-LCFI223
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI226-LCFI224
	.byte	0x83
	.uleb128 0x3
	.p2align 2
LEFDE106:
LSFDE108:
	.long	LEFDE108-LASFDE108
LASFDE108:
	.long	Lframe0
	.long	LFB111
	.long	LFE111-LFB111
	.byte	0x4
	.long	LCFI227-LFB111
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI228-LCFI227
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI230-LCFI228
	.byte	0x83
	.uleb128 0x3
	.p2align 2
LEFDE108:
LSFDE110:
	.long	LEFDE110-LASFDE110
LASFDE110:
	.long	Lframe0
	.long	LFB113
	.long	LFE113-LFB113
	.byte	0x4
	.long	LCFI231-LFB113
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI232-LCFI231
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI234-LCFI232
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI235-LCFI234
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE110:
LSFDE112:
	.long	LEFDE112-LASFDE112
LASFDE112:
	.long	Lframe0
	.long	LFB115
	.long	LFE115-LFB115
	.byte	0x4
	.long	LCFI236-LFB115
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI237-LCFI236
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI239-LCFI237
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE112:
LSFDE114:
	.long	LEFDE114-LASFDE114
LASFDE114:
	.long	Lframe0
	.long	LFB117
	.long	LFE117-LFB117
	.byte	0x4
	.long	LCFI240-LFB117
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI241-LCFI240
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE114:
LSFDE116:
	.long	LEFDE116-LASFDE116
LASFDE116:
	.long	Lframe0
	.long	LFB119
	.long	LFE119-LFB119
	.byte	0x4
	.long	LCFI243-LFB119
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI244-LCFI243
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI246-LCFI244
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI247-LCFI246
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE116:
LSFDE118:
	.long	LEFDE118-LASFDE118
LASFDE118:
	.long	Lframe0
	.long	LFB121
	.long	LFE121-LFB121
	.byte	0x4
	.long	LCFI248-LFB121
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI249-LCFI248
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI251-LCFI249
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI252-LCFI251
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE118:
LSFDE120:
	.long	LEFDE120-LASFDE120
LASFDE120:
	.long	Lframe0
	.long	LFB123
	.long	LFE123-LFB123
	.byte	0x4
	.long	LCFI253-LFB123
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI254-LCFI253
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI256-LCFI254
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE120:
LSFDE122:
	.long	LEFDE122-LASFDE122
LASFDE122:
	.long	Lframe0
	.long	LFB125
	.long	LFE125-LFB125
	.byte	0x4
	.long	LCFI257-LFB125
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI258-LCFI257
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI260-LCFI258
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE122:
LSFDE124:
	.long	LEFDE124-LASFDE124
LASFDE124:
	.long	Lframe0
	.long	LFB127
	.long	LFE127-LFB127
	.byte	0x4
	.long	LCFI261-LFB127
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI262-LCFI261
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI264-LCFI262
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE124:
LSFDE126:
	.long	LEFDE126-LASFDE126
LASFDE126:
	.long	Lframe0
	.long	LFB129
	.long	LFE129-LFB129
	.byte	0x4
	.long	LCFI265-LFB129
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI266-LCFI265
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI268-LCFI266
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE126:
LSFDE128:
	.long	LEFDE128-LASFDE128
LASFDE128:
	.long	Lframe0
	.long	LFB131
	.long	LFE131-LFB131
	.byte	0x4
	.long	LCFI269-LFB131
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI270-LCFI269
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE128:
LSFDE130:
	.long	LEFDE130-LASFDE130
LASFDE130:
	.long	Lframe0
	.long	LFB133
	.long	LFE133-LFB133
	.byte	0x4
	.long	LCFI271-LFB133
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI272-LCFI271
	.byte	0xd
	.uleb128 0x4
	.p2align 2
LEFDE130:
LSFDE132:
	.long	LEFDE132-LASFDE132
LASFDE132:
	.long	Lframe0
	.long	LFB135
	.long	LFE135-LFB135
	.byte	0x4
	.long	LCFI273-LFB135
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x4
	.long	LCFI274-LCFI273
	.byte	0xd
	.uleb128 0x4
	.byte	0x4
	.long	LCFI276-LCFI274
	.byte	0x2e
	.uleb128 0x10
	.byte	0x4
	.long	LCFI277-LCFI276
	.byte	0x2e
	.uleb128 0x0
	.byte	0x4
	.long	LCFI278-LCFI277
	.byte	0x2e
	.uleb128 0x10
	.p2align 2
LEFDE132:
	.section .text
Letext0:
	.section	.debug_info,""
	.long	0x1d4a
	.word	0x2
	.long	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	Ldebug_line0
	.long	Letext0
	.long	Ltext0
	.ascii "c:/src/VectorPascal/mmpc/rtl.c\0"
	.ascii "c:/src/VectorPascal/tests/graphlib\0"
	.ascii "GNU C 3.3.4\0"
	.byte	0x1
	.uleb128 0x2
	.ascii "va_list\0"
	.byte	0x2
	.byte	0x23
	.long	0x76
	.uleb128 0x3
	.byte	0x4
	.long	0x7c
	.uleb128 0x4
	.ascii "char\0"
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.ascii "size_t\0"
	.byte	0x2
	.byte	0x26
	.long	0x92
	.uleb128 0x5
	.long	LC23
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.long	0x130
	.byte	0x20
	.byte	0x2
	.byte	0x37
	.uleb128 0x7
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0x2f
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0x30
	.long	0x137
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.ascii "_base\0"
	.byte	0x2
	.byte	0x31
	.long	0x137
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0x32
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x7
	.ascii "_flag\0"
	.byte	0x2
	.byte	0x33
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.ascii "_file\0"
	.byte	0x2
	.byte	0x34
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x7
	.ascii "_name_to_remove\0"
	.byte	0x2
	.byte	0x35
	.long	0x137
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.ascii "_fillsize\0"
	.byte	0x2
	.byte	0x36
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x4
	.ascii "int\0"
	.byte	0x4
	.byte	0x5
	.uleb128 0x3
	.byte	0x4
	.long	0x7c
	.uleb128 0x2
	.ascii "FILE\0"
	.byte	0x2
	.byte	0x37
	.long	0x99
	.uleb128 0x2
	.ascii "fpos_t\0"
	.byte	0x2
	.byte	0x39
	.long	0x92
	.uleb128 0x2
	.ascii "pid_t\0"
	.byte	0x3
	.byte	0x1b
	.long	0x130
	.uleb128 0x2
	.ascii "sig_atomic_t\0"
	.byte	0x3
	.byte	0x1f
	.long	0x130
	.uleb128 0x6
	.long	0x192
	.byte	0x28
	.byte	0x3
	.byte	0x37
	.uleb128 0x7
	.ascii "__bits\0"
	.byte	0x3
	.byte	0x36
	.long	0x192
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x8
	.long	0x1a2
	.long	0x92
	.uleb128 0x9
	.long	0x1a2
	.byte	0x9
	.byte	0x0
	.uleb128 0x5
	.long	LC23
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.ascii "sigset_t\0"
	.byte	0x3
	.byte	0x37
	.long	0x178
	.uleb128 0xa
	.long	0x206
	.ascii "sigaction\0"
	.byte	0x30
	.byte	0x3
	.byte	0x39
	.uleb128 0x7
	.ascii "sa_flags\0"
	.byte	0x3
	.byte	0x3a
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "sa_handler\0"
	.byte	0x3
	.byte	0x3b
	.long	0x212
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.ascii "sa_mask\0"
	.byte	0x3
	.byte	0x3c
	.long	0x1a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xb
	.long	0x212
	.byte	0x1
	.uleb128 0xc
	.long	0x130
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x206
	.uleb128 0x2
	.ascii "dev_t\0"
	.byte	0x4
	.byte	0x11
	.long	0x130
	.uleb128 0x2
	.ascii "ino_t\0"
	.byte	0x4
	.byte	0x12
	.long	0x130
	.uleb128 0x2
	.ascii "mode_t\0"
	.byte	0x4
	.byte	0x13
	.long	0x130
	.uleb128 0x2
	.ascii "nlink_t\0"
	.byte	0x4
	.byte	0x14
	.long	0x130
	.uleb128 0x2
	.ascii "gid_t\0"
	.byte	0x4
	.byte	0x16
	.long	0x130
	.uleb128 0x2
	.ascii "off_t\0"
	.byte	0x4
	.byte	0x19
	.long	0x130
	.uleb128 0x2
	.ascii "ssize_t\0"
	.byte	0x4
	.byte	0x22
	.long	0x130
	.uleb128 0x2
	.ascii "uid_t\0"
	.byte	0x4
	.byte	0x25
	.long	0x130
	.uleb128 0xa
	.long	0x2a7
	.ascii "fd_set\0"
	.byte	0x20
	.byte	0x4
	.byte	0x30
	.uleb128 0x7
	.ascii "fd_bits\0"
	.byte	0x4
	.byte	0x31
	.long	0x2a7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x8
	.long	0x2b7
	.long	0x2b7
	.uleb128 0x9
	.long	0x1a2
	.byte	0x1f
	.byte	0x0
	.uleb128 0x4
	.ascii "unsigned char\0"
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.ascii "fd_set\0"
	.byte	0x4
	.byte	0x32
	.long	0x285
	.uleb128 0x2
	.ascii "time_t\0"
	.byte	0x4
	.byte	0x39
	.long	0x2e4
	.uleb128 0x4
	.ascii "unsigned int\0"
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.ascii "clock_t\0"
	.byte	0x5
	.byte	0x18
	.long	0x130
	.uleb128 0xa
	.long	0x3d9
	.ascii "tm\0"
	.byte	0x2c
	.byte	0x5
	.byte	0x22
	.uleb128 0x7
	.ascii "tm_sec\0"
	.byte	0x5
	.byte	0x23
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "tm_min\0"
	.byte	0x5
	.byte	0x24
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.ascii "tm_hour\0"
	.byte	0x5
	.byte	0x25
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.ascii "tm_mday\0"
	.byte	0x5
	.byte	0x26
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x7
	.ascii "tm_mon\0"
	.byte	0x5
	.byte	0x27
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.ascii "tm_year\0"
	.byte	0x5
	.byte	0x28
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x7
	.ascii "tm_wday\0"
	.byte	0x5
	.byte	0x29
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.ascii "tm_yday\0"
	.byte	0x5
	.byte	0x2a
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.ascii "tm_isdst\0"
	.byte	0x5
	.byte	0x2b
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.ascii "__tm_zone\0"
	.byte	0x5
	.byte	0x2c
	.long	0x137
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.ascii "__tm_gmtoff\0"
	.byte	0x5
	.byte	0x2d
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0xa
	.long	0x40d
	.ascii "timeval\0"
	.byte	0x8
	.byte	0x5
	.byte	0x47
	.uleb128 0x7
	.ascii "tv_sec\0"
	.byte	0x5
	.byte	0x48
	.long	0x2d6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "tv_usec\0"
	.byte	0x5
	.byte	0x49
	.long	0x40d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.ascii "long int\0"
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	0x454
	.long	LC24
	.byte	0x8
	.byte	0x5
	.byte	0x4c
	.uleb128 0x7
	.ascii "tz_minuteswest\0"
	.byte	0x5
	.byte	0x4d
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "tz_dsttime\0"
	.byte	0x5
	.byte	0x4e
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.ascii "uclock_t\0"
	.byte	0x5
	.byte	0x53
	.long	0x464
	.uleb128 0x4
	.ascii "long long int\0"
	.byte	0x8
	.byte	0x5
	.uleb128 0xa
	.long	0x4b1
	.ascii "itimerval\0"
	.byte	0x10
	.byte	0x6
	.byte	0x15
	.uleb128 0x7
	.ascii "it_interval\0"
	.byte	0x6
	.byte	0x16
	.long	0x3d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "it_value\0"
	.byte	0x6
	.byte	0x17
	.long	0x3d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xa
	.long	0x501
	.ascii "timeb\0"
	.byte	0xc
	.byte	0x7
	.byte	0x16
	.uleb128 0x7
	.ascii "time\0"
	.byte	0x7
	.byte	0x17
	.long	0x2d6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "millitm\0"
	.byte	0x7
	.byte	0x18
	.long	0x501
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.long	LC24
	.byte	0x7
	.byte	0x19
	.long	0x517
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x7
	.ascii "dstflag\0"
	.byte	0x7
	.byte	0x1a
	.long	0x517
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x4
	.ascii "short unsigned int\0"
	.byte	0x2
	.byte	0x7
	.uleb128 0x4
	.ascii "short int\0"
	.byte	0x2
	.byte	0x5
	.uleb128 0x2
	.ascii "DIR\0"
	.byte	0x8
	.byte	0x10
	.long	0x52f
	.uleb128 0xf
	.ascii "__dj_DIR\0"
	.byte	0x1
	.uleb128 0x10
	.long	0x56f
	.ascii "dirent\0"
	.word	0x101
	.byte	0x8
	.byte	0x12
	.uleb128 0x7
	.ascii "d_namlen\0"
	.byte	0x8
	.byte	0x13
	.long	0x7c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "d_name\0"
	.byte	0x8
	.byte	0x14
	.long	0x56f
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x8
	.long	0x57f
	.long	0x7c
	.uleb128 0x9
	.long	0x1a2
	.byte	0xff
	.byte	0x0
	.uleb128 0xa
	.long	0x668
	.ascii "stat\0"
	.byte	0x30
	.byte	0x9
	.byte	0x29
	.uleb128 0x7
	.ascii "st_atime\0"
	.byte	0x9
	.byte	0x2a
	.long	0x2d6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "st_ctime\0"
	.byte	0x9
	.byte	0x2b
	.long	0x2d6
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.ascii "st_dev\0"
	.byte	0x9
	.byte	0x2c
	.long	0x218
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.ascii "st_gid\0"
	.byte	0x9
	.byte	0x2d
	.long	0x24f
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x7
	.ascii "st_ino\0"
	.byte	0x9
	.byte	0x2e
	.long	0x225
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.ascii "st_mode\0"
	.byte	0x9
	.byte	0x2f
	.long	0x232
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x7
	.ascii "st_mtime\0"
	.byte	0x9
	.byte	0x30
	.long	0x2d6
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.ascii "st_nlink\0"
	.byte	0x9
	.byte	0x31
	.long	0x240
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.ascii "st_size\0"
	.byte	0x9
	.byte	0x32
	.long	0x25c
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.ascii "st_blksize\0"
	.byte	0x9
	.byte	0x33
	.long	0x25c
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.ascii "st_uid\0"
	.byte	0x9
	.byte	0x34
	.long	0x278
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x7
	.ascii "st_rdev\0"
	.byte	0x9
	.byte	0x35
	.long	0x218
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.byte	0x0
	.uleb128 0x11
	.long	0x6b2
	.word	0x104
	.byte	0x1
	.byte	0x1d
	.uleb128 0x7
	.ascii "f\0"
	.byte	0x1
	.byte	0x1d
	.long	0x6b2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.ascii "name\0"
	.byte	0x1
	.byte	0x1d
	.long	0x6b8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.ascii "status\0"
	.byte	0x1
	.byte	0x1d
	.long	0x130
	.byte	0x3
	.byte	0x23
	.uleb128 0xfc
	.uleb128 0x7
	.ascii "recsize\0"
	.byte	0x1
	.byte	0x1d
	.long	0x130
	.byte	0x3
	.byte	0x23
	.uleb128 0x100
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x13d
	.uleb128 0x8
	.long	0x6c8
	.long	0x7c
	.uleb128 0x9
	.long	0x1a2
	.byte	0xf4
	.byte	0x0
	.uleb128 0x12
	.long	0x6ee
	.byte	0x1
	.ascii "initfs\0"
	.byte	0x1
	.byte	0x20
	.long	LFB3
	.long	LFE3
	.byte	0x1
	.byte	0x55
	.uleb128 0x13
	.ascii "i\0"
	.byte	0x1
	.byte	0x21
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x14
	.long	0x71c
	.byte	0x1
	.ascii "entryname\0"
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.long	0x137
	.long	LFB5
	.long	LFE5
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "p\0"
	.byte	0x1
	.byte	0x29
	.long	0x71c
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x53a
	.uleb128 0x14
	.long	0x75d
	.byte	0x1
	.ascii "isdir\0"
	.byte	0x1
	.byte	0x2a
	.byte	0x1
	.long	0x130
	.long	LFB7
	.long	LFE7
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "name\0"
	.byte	0x1
	.byte	0x2a
	.long	0x137
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "buf\0"
	.byte	0x1
	.byte	0x2a
	.long	0x57f
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.byte	0x0
	.uleb128 0x16
	.long	0x78b
	.byte	0x1
	.ascii "pascalexit\0"
	.byte	0x1
	.byte	0x2c
	.byte	0x1
	.long	LFB9
	.long	LFE9
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "code\0"
	.byte	0x1
	.byte	0x2c
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x16
	.long	0x7b5
	.byte	0x1
	.ascii "checkerr\0"
	.byte	0x1
	.byte	0x2d
	.byte	0x1
	.long	LFB11
	.long	LFE11
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "fn\0"
	.byte	0x1
	.byte	0x2d
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x17
	.long	0x7ea
	.byte	0x1
	.ascii "findfreefileblock\0"
	.byte	0x1
	.byte	0x33
	.long	0x130
	.long	LFB13
	.long	LFE13
	.byte	0x1
	.byte	0x55
	.uleb128 0x13
	.ascii "i\0"
	.byte	0x1
	.byte	0x33
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x12
	.long	0x814
	.byte	0x1
	.ascii "closefiles\0"
	.byte	0x1
	.byte	0x38
	.long	LFB15
	.long	LFE15
	.byte	0x1
	.byte	0x55
	.uleb128 0x13
	.ascii "i\0"
	.byte	0x1
	.byte	0x39
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x16
	.long	0x83f
	.byte	0x1
	.ascii "pasclose\0"
	.byte	0x1
	.byte	0x3e
	.byte	0x1
	.long	LFB17
	.long	LFE17
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x3d
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x130
	.uleb128 0x16
	.long	0x87d
	.byte	0x1
	.ascii "setchan\0"
	.byte	0x1
	.byte	0x43
	.byte	0x1
	.long	LFB19
	.long	LFE19
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x43
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "num\0"
	.byte	0x1
	.byte	0x43
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.byte	0x0
	.uleb128 0x14
	.long	0x8a7
	.byte	0x1
	.ascii "eof\0"
	.byte	0x1
	.byte	0x45
	.byte	0x1
	.long	0x130
	.long	LFB21
	.long	LFE21
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x44
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x14
	.long	0x8de
	.byte	0x1
	.ascii "eoln\0"
	.byte	0x1
	.byte	0x4b
	.byte	0x1
	.long	0x130
	.long	LFB23
	.long	LFE23
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x4a
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "c\0"
	.byte	0x1
	.byte	0x4b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x16
	.long	0x928
	.byte	0x1
	.ascii "u2asciitrunc\0"
	.byte	0x1
	.byte	0x56
	.byte	0x1
	.long	LFB25
	.long	LFE25
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "src\0"
	.byte	0x1
	.byte	0x55
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "dest\0"
	.byte	0x1
	.byte	0x55
	.long	0x137
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x13
	.ascii "i\0"
	.byte	0x1
	.byte	0x56
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x501
	.uleb128 0x16
	.long	0x965
	.byte	0x1
	.ascii "erase\0"
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.long	LFB27
	.long	LFE27
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC26
	.byte	0x1
	.byte	0x5c
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "str\0"
	.byte	0x1
	.byte	0x5d
	.long	0x965
	.byte	0x3
	.byte	0x91
	.sleb128 -280
	.byte	0x0
	.uleb128 0x8
	.long	0x976
	.long	0x7c
	.uleb128 0x19
	.long	0x1a2
	.word	0x100
	.byte	0x0
	.uleb128 0x14
	.long	0x9c9
	.byte	0x1
	.ascii "filesize\0"
	.byte	0x1
	.byte	0x62
	.byte	0x1
	.long	0x130
	.long	LFB29
	.long	LFE29
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x61
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "p\0"
	.byte	0x1
	.byte	0x63
	.long	0x40d
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x13
	.ascii "l\0"
	.byte	0x1
	.byte	0x63
	.long	0x40d
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x13
	.ascii "f\0"
	.byte	0x1
	.byte	0x63
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x14
	.long	0xa03
	.byte	0x1
	.ascii "filepos\0"
	.byte	0x1
	.byte	0x6a
	.byte	0x1
	.long	0x130
	.long	LFB31
	.long	LFE31
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x6a
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "f\0"
	.byte	0x1
	.byte	0x6a
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x14
	.long	0xa57
	.byte	0x1
	.ascii "seek\0"
	.byte	0x1
	.byte	0x6c
	.byte	0x1
	.long	0x130
	.long	LFB33
	.long	LFE33
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x6b
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "pos\0"
	.byte	0x1
	.byte	0x6b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x15
	.ascii "mode\0"
	.byte	0x1
	.byte	0x6b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x13
	.ascii "f\0"
	.byte	0x1
	.byte	0x6c
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x16
	.long	0xaad
	.byte	0x1
	.ascii "blockread\0"
	.byte	0x1
	.byte	0x76
	.byte	0x1
	.long	LFB35
	.long	LFE35
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x75
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "buf\0"
	.byte	0x1
	.byte	0x75
	.long	0x137
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x18
	.long	LC27
	.byte	0x1
	.byte	0x75
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x18
	.long	LC28
	.byte	0x1
	.byte	0x75
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.byte	0x0
	.uleb128 0x16
	.long	0xb04
	.byte	0x1
	.ascii "blockwrite\0"
	.byte	0x1
	.byte	0x7b
	.byte	0x1
	.long	LFB37
	.long	LFE37
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x7a
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "buf\0"
	.byte	0x1
	.byte	0x7a
	.long	0x137
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x18
	.long	LC27
	.byte	0x1
	.byte	0x7a
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x18
	.long	LC28
	.byte	0x1
	.byte	0x7a
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.byte	0x0
	.uleb128 0x16
	.long	0xb2e
	.byte	0x1
	.ascii "rewrite\0"
	.byte	0x1
	.byte	0x80
	.byte	0x1
	.long	LFB39
	.long	LFE39
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x7f
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x16
	.long	0xb56
	.byte	0x1
	.ascii "reset\0"
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.long	LFB41
	.long	LFE41
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x85
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x16
	.long	0xb7f
	.byte	0x1
	.ascii "append\0"
	.byte	0x1
	.byte	0x8d
	.byte	0x1
	.long	LFB43
	.long	LFE43
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x8c
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x16
	.long	0xbaa
	.byte	0x1
	.ascii "setiores\0"
	.byte	0x1
	.byte	0x93
	.byte	0x1
	.long	LFB45
	.long	LFE45
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "val\0"
	.byte	0x1
	.byte	0x93
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x16
	.long	0xc07
	.byte	0x1
	.ascii "assign\0"
	.byte	0x1
	.byte	0x95
	.byte	0x1
	.long	LFB47
	.long	LFE47
	.byte	0x1
	.byte	0x55
	.uleb128 0x18
	.long	LC25
	.byte	0x1
	.byte	0x94
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "f\0"
	.byte	0x1
	.byte	0x94
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x13
	.ascii "i\0"
	.byte	0x1
	.byte	0x95
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.ascii "fn\0"
	.byte	0x1
	.byte	0x95
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.long	LC26
	.byte	0x1
	.byte	0x96
	.long	0xc07
	.byte	0x3
	.byte	0x91
	.sleb128 -280
	.byte	0x0
	.uleb128 0x8
	.long	0xc17
	.long	0x2b7
	.uleb128 0x9
	.long	0x1a2
	.byte	0xff
	.byte	0x0
	.uleb128 0x17
	.long	0xc46
	.byte	0x1
	.ascii "ioresult\0"
	.byte	0x1
	.byte	0xa0
	.long	0x130
	.long	LFB49
	.long	LFE49
	.byte	0x1
	.byte	0x55
	.uleb128 0x13
	.ascii "temp\0"
	.byte	0x1
	.byte	0xa0
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x16
	.long	0xc8e
	.byte	0x1
	.ascii "readcharnarrow\0"
	.byte	0x1
	.byte	0xa2
	.byte	0x1
	.long	LFB51
	.long	LFE51
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "fn\0"
	.byte	0x1
	.byte	0xa1
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "c\0"
	.byte	0x1
	.byte	0xa1
	.long	0x137
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x13
	.ascii "f\0"
	.byte	0x1
	.byte	0xa3
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0x0
	.uleb128 0x16
	.long	0xcdc
	.byte	0x1
	.ascii "readchar\0"
	.byte	0x1
	.byte	0xa9
	.byte	0x1
	.long	LFB53
	.long	LFE53
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "fn\0"
	.byte	0x1
	.byte	0xa8
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "c\0"
	.byte	0x1
	.byte	0xa8
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x13
	.ascii "C\0"
	.byte	0x1
	.byte	0xaa
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x13
	.ascii "a\0"
	.byte	0x1
	.byte	0xab
	.long	0x2b7
	.byte	0x2
	.byte	0x91
	.sleb128 -5
	.byte	0x0
	.uleb128 0x16
	.long	0xd1e
	.byte	0x1
	.ascii "unicode2utf8\0"
	.byte	0x1
	.byte	0xbd
	.byte	0x1
	.long	LFB55
	.long	LFE55
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "unicode\0"
	.byte	0x1
	.byte	0xbc
	.long	0x501
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0x15
	.ascii "utf8\0"
	.byte	0x1
	.byte	0xbc
	.long	0xd1e
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x2b7
	.uleb128 0x16
	.long	0xd92
	.byte	0x1
	.ascii "printchar\0"
	.byte	0x1
	.byte	0xcf
	.byte	0x1
	.long	LFB57
	.long	LFE57
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "fn\0"
	.byte	0x1
	.byte	0xce
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "x\0"
	.byte	0x1
	.byte	0xce
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x18
	.long	LC29
	.byte	0x1
	.byte	0xce
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x18
	.long	LC30
	.byte	0x1
	.byte	0xce
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x13
	.ascii "f\0"
	.byte	0x1
	.byte	0xcf
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.ascii "utf8\0"
	.byte	0x1
	.byte	0xd0
	.long	0xd92
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.byte	0x0
	.uleb128 0x8
	.long	0xda2
	.long	0x7c
	.uleb128 0x9
	.long	0x1a2
	.byte	0x4
	.byte	0x0
	.uleb128 0x16
	.long	0xde4
	.byte	0x1
	.ascii "readline\0"
	.byte	0x1
	.byte	0xdf
	.byte	0x1
	.long	LFB59
	.long	LFE59
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "fn\0"
	.byte	0x1
	.byte	0xde
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "c\0"
	.byte	0x1
	.byte	0xdf
	.long	0x7c
	.byte	0x2
	.byte	0x91
	.sleb128 -1
	.uleb128 0x13
	.ascii "f\0"
	.byte	0x1
	.byte	0xdf
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0x0
	.uleb128 0x14
	.long	0xe37
	.byte	0x1
	.ascii "endoffile\0"
	.byte	0x1
	.byte	0xe6
	.byte	0x1
	.long	0x130
	.long	LFB61
	.long	LFE61
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "fn\0"
	.byte	0x1
	.byte	0xe5
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "c\0"
	.byte	0x1
	.byte	0xe6
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x13
	.ascii "r\0"
	.byte	0x1
	.byte	0xe6
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x13
	.ascii "f\0"
	.byte	0x1
	.byte	0xe6
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x14
	.long	0xe8a
	.byte	0x1
	.ascii "endofline\0"
	.byte	0x1
	.byte	0xee
	.byte	0x1
	.long	0x130
	.long	LFB63
	.long	LFE63
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "fn\0"
	.byte	0x1
	.byte	0xed
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "c\0"
	.byte	0x1
	.byte	0xee
	.long	0x7c
	.byte	0x2
	.byte	0x91
	.sleb128 -1
	.uleb128 0x13
	.ascii "r\0"
	.byte	0x1
	.byte	0xee
	.long	0x7c
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0x13
	.ascii "f\0"
	.byte	0x1
	.byte	0xee
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0x0
	.uleb128 0x16
	.long	0xebf
	.byte	0x1
	.ascii "println\0"
	.byte	0x1
	.byte	0xf6
	.byte	0x1
	.long	LFB65
	.long	LFE65
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.ascii "fn\0"
	.byte	0x1
	.byte	0xf5
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "f\0"
	.byte	0x1
	.byte	0xf6
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x1b
	.long	0xf2b
	.byte	0x1
	.ascii "printspaces\0"
	.byte	0x1
	.word	0x102
	.byte	0x1
	.long	LFB67
	.long	LFE67
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x101
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1d
	.long	LC29
	.byte	0x1
	.word	0x101
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x102
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.ascii "spaces\0"
	.byte	0x1
	.word	0x104
	.long	0xf2b
	.byte	0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x105
	.long	0x130
	.byte	0x3
	.byte	0x91
	.sleb128 -140
	.byte	0x0
	.uleb128 0x8
	.long	0xf3b
	.long	0x7c
	.uleb128 0x9
	.long	0x1a2
	.byte	0x63
	.byte	0x0
	.uleb128 0x1b
	.long	0xf69
	.byte	0x1
	.ascii "pascalerror\0"
	.byte	0x1
	.word	0x111
	.byte	0x1
	.long	LFB69
	.long	LFE69
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "e\0"
	.byte	0x1
	.word	0x110
	.long	0x137
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x1f
	.long	0xf96
	.byte	0x1
	.ascii "length\0"
	.byte	0x1
	.word	0x115
	.byte	0x1
	.long	0x130
	.long	LFB71
	.long	LFE71
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "s\0"
	.byte	0x1
	.word	0x115
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x1b
	.long	0xfbd
	.byte	0x1
	.ascii "incr\0"
	.byte	0x1
	.word	0x116
	.byte	0x1
	.long	LFB73
	.long	LFE73
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "s\0"
	.byte	0x1
	.word	0x116
	.long	0xfbd
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x928
	.uleb128 0x1b
	.long	0x1036
	.byte	0x1
	.ascii "readstring\0"
	.byte	0x1
	.word	0x118
	.byte	0x1
	.long	LFB75
	.long	LFE75
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x117
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "s\0"
	.byte	0x1
	.word	0x117
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "len\0"
	.byte	0x1
	.word	0x117
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1e
	.ascii "c\0"
	.byte	0x1
	.word	0x119
	.long	0x501
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0x20
	.long	LC27
	.byte	0x1
	.word	0x119
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x11a
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x1b
	.long	0x10c2
	.byte	0x1
	.ascii "printstring\0"
	.byte	0x1
	.word	0x12c
	.byte	0x1
	.long	LFB77
	.long	LFE77
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x12b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "s\0"
	.byte	0x1
	.word	0x12b
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "e1\0"
	.byte	0x1
	.word	0x12b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1c
	.ascii "e2\0"
	.byte	0x1
	.word	0x12b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x12c
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1e
	.ascii "l\0"
	.byte	0x1
	.word	0x12c
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1e
	.ascii "c\0"
	.byte	0x1
	.word	0x12c
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x12e
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x1b
	.long	0x112a
	.byte	0x1
	.ascii "printordinal\0"
	.byte	0x1
	.word	0x139
	.byte	0x1
	.long	LFB79
	.long	LFE79
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x138
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "o\0"
	.byte	0x1
	.word	0x138
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "e1\0"
	.byte	0x1
	.word	0x138
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1c
	.ascii "e2\0"
	.byte	0x1
	.word	0x138
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1c
	.ascii "tab\0"
	.byte	0x1
	.word	0x138
	.long	0xfbd
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.byte	0x0
	.uleb128 0x1b
	.long	0x1164
	.byte	0x1
	.ascii "skipspaces\0"
	.byte	0x1
	.word	0x13d
	.byte	0x1
	.long	LFB81
	.long	LFE81
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "f\0"
	.byte	0x1
	.word	0x13c
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.ascii "c\0"
	.byte	0x1
	.word	0x13e
	.long	0x7c
	.byte	0x2
	.byte	0x91
	.sleb128 -1
	.byte	0x0
	.uleb128 0x1f
	.long	0x1193
	.byte	0x1
	.ascii "utolower\0"
	.byte	0x1
	.word	0x143
	.byte	0x1
	.long	0x130
	.long	LFB83
	.long	LFE83
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "c\0"
	.byte	0x1
	.word	0x142
	.long	0x501
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.byte	0x0
	.uleb128 0x1b
	.long	0x1269
	.byte	0x1
	.ascii "readordinal\0"
	.byte	0x1
	.word	0x14a
	.byte	0x1
	.long	LFB85
	.long	LFE85
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x149
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "b\0"
	.byte	0x1
	.word	0x149
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "tab\0"
	.byte	0x1
	.word	0x149
	.long	0xfbd
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1c
	.ascii "len\0"
	.byte	0x1
	.word	0x149
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1e
	.ascii "c\0"
	.byte	0x1
	.word	0x14a
	.long	0x501
	.byte	0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x14b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x20
	.long	LC27
	.byte	0x1
	.word	0x14b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.ascii "string\0"
	.byte	0x1
	.word	0x14c
	.long	0x1269
	.byte	0x3
	.byte	0x91
	.sleb128 -536
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x14d
	.long	0x6b2
	.byte	0x3
	.byte	0x91
	.sleb128 -540
	.uleb128 0x21
	.long	0x124e
	.byte	0x1
	.ascii "tolower\0"
	.byte	0x1
	.word	0x151
	.long	0x130
	.byte	0x1
	.uleb128 0x22
	.byte	0x0
	.uleb128 0x23
	.long	LBB26
	.long	LBE26
	.uleb128 0x24
	.byte	0x1
	.long	LC31
	.byte	0x1
	.word	0x161
	.long	0x130
	.byte	0x1
	.uleb128 0x22
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.long	0x1279
	.long	0x501
	.uleb128 0x9
	.long	0x1a2
	.byte	0xff
	.byte	0x0
	.uleb128 0x1f
	.long	0x1346
	.byte	0x1
	.ascii "setcmprtl\0"
	.byte	0x1
	.word	0x170
	.byte	0x1
	.long	0x130
	.long	LFB87
	.long	LFE87
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "set1\0"
	.byte	0x1
	.word	0x16f
	.long	0x137
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "set2\0"
	.byte	0x1
	.word	0x16f
	.long	0x137
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "len\0"
	.byte	0x1
	.word	0x16f
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x171
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1e
	.ascii "c\0"
	.byte	0x1
	.word	0x172
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1e
	.ascii "d\0"
	.byte	0x1
	.word	0x172
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.ascii "nd\0"
	.byte	0x1
	.word	0x172
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.ascii "nc\0"
	.byte	0x1
	.word	0x172
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.ascii "eq\0"
	.byte	0x1
	.word	0x173
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.ascii "set2extra\0"
	.byte	0x1
	.word	0x174
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.ascii "set1extra\0"
	.byte	0x1
	.word	0x175
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0x0
	.uleb128 0x25
	.long	0x139b
	.byte	0x1
	.long	LC31
	.byte	0x1
	.word	0x187
	.byte	0x1
	.long	0x130
	.long	LFB89
	.long	LFE89
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "s1\0"
	.byte	0x1
	.word	0x186
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "s2\0"
	.byte	0x1
	.word	0x186
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x188
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.ascii "len\0"
	.byte	0x1
	.word	0x188
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x1b
	.long	0x1402
	.byte	0x1
	.ascii "readbool\0"
	.byte	0x1
	.word	0x198
	.byte	0x1
	.long	LFB91
	.long	LFE91
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x197
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "b\0"
	.byte	0x1
	.word	0x197
	.long	0x137
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1e
	.ascii "c\0"
	.byte	0x1
	.word	0x198
	.long	0x7c
	.byte	0x2
	.byte	0x91
	.sleb128 -1
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x199
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x26
	.byte	0x1
	.ascii "toupper\0"
	.byte	0x1
	.word	0x19d
	.long	0x130
	.byte	0x1
	.uleb128 0x22
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.long	0x1465
	.byte	0x1
	.ascii "printbool\0"
	.byte	0x1
	.word	0x1ad
	.byte	0x1
	.long	LFB93
	.long	LFE93
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x1ac
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "b\0"
	.byte	0x1
	.word	0x1ac
	.long	0x7c
	.byte	0x2
	.byte	0x91
	.sleb128 -1
	.uleb128 0x1c
	.ascii "e1\0"
	.byte	0x1
	.word	0x1ac
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1c
	.ascii "e2\0"
	.byte	0x1
	.word	0x1ac
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x1ae
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0x0
	.uleb128 0x1b
	.long	0x14aa
	.byte	0x1
	.ascii "readint\0"
	.byte	0x1
	.word	0x1b9
	.byte	0x1
	.long	LFB95
	.long	LFE95
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x1b8
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "x\0"
	.byte	0x1
	.word	0x1b8
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x1ba
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x1b
	.long	0x14f0
	.byte	0x1
	.ascii "readbyte\0"
	.byte	0x1
	.word	0x1c1
	.byte	0x1
	.long	LFB97
	.long	LFE97
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x1c0
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "c\0"
	.byte	0x1
	.word	0x1c0
	.long	0xd1e
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1e
	.ascii "b\0"
	.byte	0x1
	.word	0x1c2
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x1b
	.long	0x1595
	.byte	0x1
	.ascii "printint64\0"
	.byte	0x1
	.word	0x1c8
	.byte	0x1
	.long	LFB99
	.long	LFE99
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x1c8
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "x\0"
	.byte	0x1
	.word	0x1c8
	.long	0x40d
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1d
	.long	LC29
	.byte	0x1
	.word	0x1c8
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1d
	.long	LC30
	.byte	0x1
	.word	0x1c8
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1e
	.ascii "buf\0"
	.byte	0x1
	.word	0x1cb
	.long	0xf2b
	.byte	0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x20
	.long	LC32
	.byte	0x1
	.word	0x1cb
	.long	0xf2b
	.byte	0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x1e
	.ascii "len\0"
	.byte	0x1
	.word	0x1cc
	.long	0x130
	.byte	0x3
	.byte	0x91
	.sleb128 -236
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x1cc
	.long	0x130
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x1ce
	.long	0x6b2
	.byte	0x3
	.byte	0x91
	.sleb128 -244
	.byte	0x0
	.uleb128 0x1b
	.long	0x1638
	.byte	0x1
	.ascii "printint\0"
	.byte	0x1
	.word	0x1d5
	.byte	0x1
	.long	LFB101
	.long	LFE101
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x1d5
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "x\0"
	.byte	0x1
	.word	0x1d5
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1d
	.long	LC29
	.byte	0x1
	.word	0x1d5
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1d
	.long	LC30
	.byte	0x1
	.word	0x1d5
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1e
	.ascii "buf\0"
	.byte	0x1
	.word	0x1d8
	.long	0xf2b
	.byte	0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x20
	.long	LC32
	.byte	0x1
	.word	0x1d8
	.long	0xf2b
	.byte	0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x1e
	.ascii "len\0"
	.byte	0x1
	.word	0x1d9
	.long	0x130
	.byte	0x3
	.byte	0x91
	.sleb128 -236
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x1d9
	.long	0x130
	.byte	0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x1db
	.long	0x6b2
	.byte	0x3
	.byte	0x91
	.sleb128 -244
	.byte	0x0
	.uleb128 0x1b
	.long	0x167e
	.byte	0x1
	.ascii "readreal\0"
	.byte	0x1
	.word	0x1e4
	.byte	0x1
	.long	LFB103
	.long	LFE103
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x1e3
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "x\0"
	.byte	0x1
	.word	0x1e3
	.long	0x167e
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x1e6
	.long	0x6b2
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x1684
	.uleb128 0x4
	.ascii "float\0"
	.byte	0x4
	.byte	0x4
	.uleb128 0x1b
	.long	0x1733
	.byte	0x1
	.ascii "printdouble\0"
	.byte	0x1
	.word	0x1ed
	.byte	0x1
	.long	LFB105
	.long	LFE105
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x1ed
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "x\0"
	.byte	0x1
	.word	0x1ed
	.long	0x1733
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1d
	.long	LC29
	.byte	0x1
	.word	0x1ed
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1d
	.long	LC30
	.byte	0x1
	.word	0x1ed
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1e
	.ascii "buf\0"
	.byte	0x1
	.word	0x1ee
	.long	0xf2b
	.byte	0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x20
	.long	LC32
	.byte	0x1
	.word	0x1ee
	.long	0xf2b
	.byte	0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x1e
	.ascii "len\0"
	.byte	0x1
	.word	0x1ef
	.long	0x130
	.byte	0x3
	.byte	0x91
	.sleb128 -252
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x1ef
	.long	0x130
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x1e
	.ascii "f\0"
	.byte	0x1
	.word	0x1f1
	.long	0x6b2
	.byte	0x3
	.byte	0x91
	.sleb128 -260
	.byte	0x0
	.uleb128 0x4
	.ascii "double\0"
	.byte	0x8
	.byte	0x4
	.uleb128 0x1b
	.long	0x17a2
	.byte	0x1
	.ascii "printreal\0"
	.byte	0x1
	.word	0x206
	.byte	0x1
	.long	LFB107
	.long	LFE107
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "fn\0"
	.byte	0x1
	.word	0x206
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "x\0"
	.byte	0x1
	.word	0x206
	.long	0x1684
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1d
	.long	LC29
	.byte	0x1
	.word	0x206
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1d
	.long	LC30
	.byte	0x1
	.word	0x206
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1e
	.ascii "d\0"
	.byte	0x1
	.word	0x207
	.long	0x1733
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0x0
	.uleb128 0x1b
	.long	0x180f
	.byte	0x1
	.ascii "cstringassign\0"
	.byte	0x1
	.word	0x20d
	.byte	0x1
	.long	LFB109
	.long	LFE109
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "s1\0"
	.byte	0x1
	.word	0x20c
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "len\0"
	.byte	0x1
	.word	0x20c
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "s2\0"
	.byte	0x1
	.word	0x20c
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1e
	.ascii "tocopy\0"
	.byte	0x1
	.word	0x20e
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x20f
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x1b
	.long	0x188c
	.byte	0x1
	.ascii "stringappend\0"
	.byte	0x1
	.word	0x217
	.byte	0x1
	.long	LFB111
	.long	LFE111
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "s1\0"
	.byte	0x1
	.word	0x216
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "len\0"
	.byte	0x1
	.word	0x216
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "s2\0"
	.byte	0x1
	.word	0x216
	.long	0x928
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1e
	.ascii "start\0"
	.byte	0x1
	.word	0x217
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1e
	.ascii "tocopy\0"
	.byte	0x1
	.word	0x218
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x219
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0x0
	.uleb128 0x1b
	.long	0x1930
	.byte	0x1
	.ascii "gettime\0"
	.byte	0x1
	.word	0x220
	.byte	0x1
	.long	LFB113
	.long	LFE113
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "hour\0"
	.byte	0x1
	.word	0x21f
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "min\0"
	.byte	0x1
	.word	0x21f
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "sec\0"
	.byte	0x1
	.word	0x21f
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1d
	.long	LC33
	.byte	0x1
	.word	0x21f
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1e
	.ascii "h\0"
	.byte	0x1
	.word	0x221
	.long	0x40d
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.ascii "tp\0"
	.byte	0x1
	.word	0x222
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.ascii "clocks\0"
	.byte	0x1
	.word	0x223
	.long	0x2d6
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1e
	.ascii "loc\0"
	.byte	0x1
	.word	0x223
	.long	0x1930
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1e
	.ascii "t1\0"
	.byte	0x1
	.word	0x223
	.long	0x2d6
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x303
	.uleb128 0x27
	.long	0x199d
	.byte	0x1
	.ascii "secs\0"
	.byte	0x1
	.word	0x22c
	.long	0x1684
	.long	LFB115
	.long	LFE115
	.byte	0x1
	.byte	0x55
	.uleb128 0x1e
	.ascii "hour\0"
	.byte	0x1
	.word	0x22c
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1e
	.ascii "min\0"
	.byte	0x1
	.word	0x22c
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1e
	.ascii "sec\0"
	.byte	0x1
	.word	0x22c
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x20
	.long	LC33
	.byte	0x1
	.word	0x22c
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.ascii "s\0"
	.byte	0x1
	.word	0x22f
	.long	0x1733
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0x0
	.uleb128 0x1f
	.long	0x19d6
	.byte	0x1
	.ascii "trunc\0"
	.byte	0x1
	.word	0x237
	.byte	0x1
	.long	0x130
	.long	LFB117
	.long	LFE117
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "f\0"
	.byte	0x1
	.word	0x237
	.long	0x1684
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.ascii "a\0"
	.byte	0x1
	.word	0x237
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0x0
	.uleb128 0x1b
	.long	0x1ae1
	.byte	0x1
	.ascii "initvec\0"
	.byte	0x1
	.word	0x24b
	.byte	0x1
	.long	LFB119
	.long	LFE119
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "phdr\0"
	.byte	0x1
	.word	0x24a
	.long	0x1ae1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "rank\0"
	.byte	0x1
	.word	0x24a
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "elemsize\0"
	.byte	0x1
	.word	0x24a
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1e
	.ascii "newsize\0"
	.byte	0x1
	.word	0x24b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1e
	.ascii "i\0"
	.byte	0x1
	.word	0x24b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.ascii "pos\0"
	.byte	0x1
	.word	0x24b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.ascii "low\0"
	.byte	0x1
	.word	0x24b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.ascii "high\0"
	.byte	0x1
	.word	0x24b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.ascii "step\0"
	.byte	0x1
	.word	0x24b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.ascii "hdrsize\0"
	.byte	0x1
	.word	0x24b
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.ascii "newhdr\0"
	.byte	0x1
	.word	0x24c
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.ascii "hdr\0"
	.byte	0x1
	.word	0x24d
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.long	0x1acf
	.byte	0x1
	.ascii "malloc\0"
	.byte	0x1
	.word	0x25c
	.long	0x130
	.byte	0x1
	.uleb128 0x22
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.ascii "free\0"
	.byte	0x1
	.word	0x262
	.long	0x130
	.byte	0x1
	.uleb128 0x22
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x83f
	.uleb128 0x1b
	.long	0x1b36
	.byte	0x1
	.ascii "getmem\0"
	.byte	0x1
	.word	0x265
	.byte	0x1
	.long	LFB121
	.long	LFE121
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "pntr\0"
	.byte	0x1
	.word	0x264
	.long	0x1ae1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "size\0"
	.byte	0x1
	.word	0x264
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x26
	.byte	0x1
	.ascii "malloc\0"
	.byte	0x1
	.word	0x266
	.long	0x130
	.byte	0x1
	.uleb128 0x22
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.long	0x1b84
	.byte	0x1
	.ascii "freemem\0"
	.byte	0x1
	.word	0x269
	.byte	0x1
	.long	LFB123
	.long	LFE123
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "pntr\0"
	.byte	0x1
	.word	0x268
	.long	0x1ae1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "size\0"
	.byte	0x1
	.word	0x268
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x26
	.byte	0x1
	.ascii "free\0"
	.byte	0x1
	.word	0x26a
	.long	0x130
	.byte	0x1
	.uleb128 0x22
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.long	0x1bb3
	.byte	0x1
	.ascii "printpointer\0"
	.byte	0x1
	.word	0x26e
	.byte	0x1
	.long	LFB125
	.long	LFE125
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "p\0"
	.byte	0x1
	.word	0x26d
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x1b
	.long	0x1bef
	.byte	0x1
	.ascii "pdispose\0"
	.byte	0x1
	.word	0x272
	.byte	0x1
	.long	LFB127
	.long	LFE127
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "p\0"
	.byte	0x1
	.word	0x272
	.long	0x83f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x26
	.byte	0x1
	.ascii "free\0"
	.byte	0x1
	.word	0x274
	.long	0x130
	.byte	0x1
	.uleb128 0x22
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.long	0x1c1d
	.byte	0x1
	.ascii "boundsfault\0"
	.byte	0x1
	.word	0x279
	.byte	0x1
	.long	LFB129
	.long	LFE129
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "x\0"
	.byte	0x1
	.word	0x278
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x28
	.byte	0x1
	.ascii "paramcount\0"
	.byte	0x1
	.word	0x280
	.long	0x130
	.long	LFB131
	.long	LFE131
	.byte	0x1
	.byte	0x55
	.uleb128 0x1f
	.long	0x1c6b
	.byte	0x1
	.ascii "parampntr\0"
	.byte	0x1
	.word	0x282
	.byte	0x1
	.long	0x137
	.long	LFB133
	.long	LFE133
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "i\0"
	.byte	0x1
	.word	0x282
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x1f
	.long	0x1ca9
	.byte	0x1
	.ascii "main\0"
	.byte	0x1
	.word	0x283
	.byte	0x1
	.long	0x130
	.long	LFB135
	.long	LFE135
	.byte	0x1
	.byte	0x55
	.uleb128 0x1c
	.ascii "argc\0"
	.byte	0x1
	.word	0x283
	.long	0x130
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "argv\0"
	.byte	0x1
	.word	0x283
	.long	0x1ca9
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.long	0x137
	.uleb128 0x29
	.ascii "__dj_stdin\0"
	.byte	0x2
	.byte	0x3b
	.long	0x13d
	.byte	0x1
	.byte	0x1
	.uleb128 0x29
	.ascii "__dj_stdout\0"
	.byte	0x2
	.byte	0x3b
	.long	0x13d
	.byte	0x1
	.byte	0x1
	.uleb128 0x29
	.ascii "__dj_stderr\0"
	.byte	0x2
	.byte	0x3b
	.long	0x13d
	.byte	0x1
	.byte	0x1
	.uleb128 0x8
	.long	0x1cfd
	.long	0x668
	.uleb128 0x9
	.long	0x1a2
	.byte	0x1f
	.byte	0x0
	.uleb128 0x2a
	.ascii "files\0"
	.byte	0x1
	.byte	0x1d
	.long	0x1ced
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_files
	.uleb128 0x2a
	.ascii "iores\0"
	.byte	0x1
	.byte	0x1e
	.long	0x130
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_iores
	.uleb128 0x2b
	.ascii "Argc\0"
	.byte	0x1
	.word	0x27f
	.long	0x130
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_Argc
	.uleb128 0x2b
	.ascii "Argv\0"
	.byte	0x1
	.word	0x281
	.long	0x1ca9
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
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
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
	.uleb128 0x3
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x27
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x18
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.long	0x3bb
	.word	0x2
	.long	Ldebug_info0
	.long	0x1d4e
	.long	0x6c8
	.ascii "initfs\0"
	.long	0x6ee
	.ascii "entryname\0"
	.long	0x722
	.ascii "isdir\0"
	.long	0x75d
	.ascii "pascalexit\0"
	.long	0x78b
	.ascii "checkerr\0"
	.long	0x7b5
	.ascii "findfreefileblock\0"
	.long	0x7ea
	.ascii "closefiles\0"
	.long	0x814
	.ascii "pasclose\0"
	.long	0x845
	.ascii "setchan\0"
	.long	0x87d
	.ascii "eof\0"
	.long	0x8a7
	.ascii "eoln\0"
	.long	0x8de
	.ascii "u2asciitrunc\0"
	.long	0x92e
	.ascii "erase\0"
	.long	0x976
	.ascii "filesize\0"
	.long	0x9c9
	.ascii "filepos\0"
	.long	0xa03
	.ascii "seek\0"
	.long	0xa57
	.ascii "blockread\0"
	.long	0xaad
	.ascii "blockwrite\0"
	.long	0xb04
	.ascii "rewrite\0"
	.long	0xb2e
	.ascii "reset\0"
	.long	0xb56
	.ascii "append\0"
	.long	0xb7f
	.ascii "setiores\0"
	.long	0xbaa
	.ascii "assign\0"
	.long	0xc17
	.ascii "ioresult\0"
	.long	0xc46
	.ascii "readcharnarrow\0"
	.long	0xc8e
	.ascii "readchar\0"
	.long	0xcdc
	.ascii "unicode2utf8\0"
	.long	0xd24
	.ascii "printchar\0"
	.long	0xda2
	.ascii "readline\0"
	.long	0xde4
	.ascii "endoffile\0"
	.long	0xe37
	.ascii "endofline\0"
	.long	0xe8a
	.ascii "println\0"
	.long	0xebf
	.ascii "printspaces\0"
	.long	0xf3b
	.ascii "pascalerror\0"
	.long	0xf69
	.ascii "length\0"
	.long	0xf96
	.ascii "incr\0"
	.long	0xfc3
	.ascii "readstring\0"
	.long	0x1036
	.ascii "printstring\0"
	.long	0x10c2
	.ascii "printordinal\0"
	.long	0x112a
	.ascii "skipspaces\0"
	.long	0x1164
	.ascii "utolower\0"
	.long	0x1193
	.ascii "readordinal\0"
	.long	0x1279
	.ascii "setcmprtl\0"
	.long	0x1346
	.ascii "cstringcompare\0"
	.long	0x139b
	.ascii "readbool\0"
	.long	0x1402
	.ascii "printbool\0"
	.long	0x1465
	.ascii "readint\0"
	.long	0x14aa
	.ascii "readbyte\0"
	.long	0x14f0
	.ascii "printint64\0"
	.long	0x1595
	.ascii "printint\0"
	.long	0x1638
	.ascii "readreal\0"
	.long	0x168d
	.ascii "printdouble\0"
	.long	0x173d
	.ascii "printreal\0"
	.long	0x17a2
	.ascii "cstringassign\0"
	.long	0x180f
	.ascii "stringappend\0"
	.long	0x188c
	.ascii "gettime\0"
	.long	0x1936
	.ascii "secs\0"
	.long	0x199d
	.ascii "trunc\0"
	.long	0x19d6
	.ascii "initvec\0"
	.long	0x1ae7
	.ascii "getmem\0"
	.long	0x1b36
	.ascii "freemem\0"
	.long	0x1b84
	.ascii "printpointer\0"
	.long	0x1bb3
	.ascii "pdispose\0"
	.long	0x1bef
	.ascii "boundsfault\0"
	.long	0x1c1d
	.ascii "paramcount\0"
	.long	0x1c3b
	.ascii "parampntr\0"
	.long	0x1c6b
	.ascii "main\0"
	.long	0x1cfd
	.ascii "files\0"
	.long	0x1d11
	.ascii "iores\0"
	.long	0x1d25
	.ascii "Argc\0"
	.long	0x1d39
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
LC28:
	.ascii "resultcount\0"
LC31:
	.ascii "cstringcompare\0"
LC27:
	.ascii "count\0"
LC25:
	.ascii "filenum\0"
LC23:
	.ascii "long unsigned int\0"
LC33:
	.ascii "hundredths\0"
LC32:
	.ascii "format\0"
LC29:
	.ascii "width\0"
LC26:
	.ascii "filename\0"
LC30:
	.ascii "afterpoint\0"
LC24:
	.ascii "timezone\0"
	.ident	"GCC: (GNU) 3.3.4"
