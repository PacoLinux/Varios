%ifndef ilcgmacros
%define ilcgmacros
section .text
; Strings assumed to be of unicode chars
;void stringassign(unsigned char *s1, int len,unsigned  char* s2)
;	int tocopy = len;
;	int i;
;	if (s2[0]<tocopy) tocopy=s2[0];
;	s1[0]=tocopy;
;	for(i=1;i<=tocopy;i++)s1[i]=s2[i];
;s2 equ [esp+12] cache esi
;len equ [esp+8]
;s1 equ [esp+4] cache edi
;tocopy equ cx
global sassign
global _sassign
; the following definitions are to make sure
; the the functions are not looked for in the
; external library
%define defined_stringassign _stringassign
%define definedstringassign stringassign

_stringassign:
stringassign:
sassign:
_sassign:
	mov esi,[esp+12]
	mov edi,[esp+4]
	mov ecx,[esp+8]
	cmp cx,word[esi]
	jl shorter
	mov cx,word[esi]
shorter:inc ecx        ; include the length word
	rep movsw
	ret	
;cmplt(s1,s2) compares two strings, returns -1 if s1<s2,1 if si>s2,0 otherwise 
;s1 equ [esp+4] cache esi
;s2 equ [esp+8] cache edi
global cmplt
global _cmplt
_cmplt:
cmplt:  
%define definedsetcmp setcmp
%define defined_setcmp _setcmp
setcmp:
_setcmp:
	mov edi,[esp+8]
	mov esi,[esp+4]
	mov ecx,[esp+12]
        jmp cmplt1
%define definedstringcompare stringcompare
%define defined_stringcompare _stringcompare
stringcompare:
_stringcompare:
	mov edi,[esp+8]
	mov esi,[esp+4]
; test both strings for null length
	movzx ecx,word[edi]
	or cx,word[esi]
	jz cmpeq
; determine which is the shortest
	movzx ecx,word[esi]
	cmp cx,word[edi]
	jl cmpltsh
	      ;
	mov cx,word[edi]
cmpltsh:
	add esi,2
	add edi,2
cmplt1: repe
	cmpsw
	jg cmpltg
	jl cmpltl
        mov edi,[esp+8]
	mov esi,[esp+4]
	mov ax,[esi]
	cmp ax,[edi]
	jl cmpltl
	jg cmpltg
cmpeq:
	xor eax,eax
	ret	
cmpltl: mov eax, -1
	ret
cmpltg: mov eax,1
	ret	

	mov eax,edx
	ret


%macro andifgoto 7
	cmp %2,%3
	j%1 %%temp1
	jmp %%temp2
%%temp1: cmp %5,%6
	j%4 %%temp3
        jmp %%temp2
%%temp3:
        jmp near %7
%%temp2:
%endmacro

%macro xmmld 2
	test %2,15
	jnz %%unaligned
	movdqa %1,[%2]
	jmp %%done
%%unaligned 	movdqu %1,[%2]
%%done
%endmacro
%macro pandw 2
pand %1,%2
%endmacro
%macro porw 2
por %1,%2
%endmacro
%macro floadlit 1
section .data
%%lit:   dq %1
	section .text
	fld qword[%%lit]
	%endmacro
section .data
 
section .text
 
%macro LDRANGE0to7 1
section .data
	align 64
%%lit: dd 0
	dd 1
    dd 2
    dd 3
    dd 4
    dd 5
    dd 6 
    dd 7
	 
	section .text
    vmovaps %1,[%%lit]
	%endmacro

%macro rloadlit 2
section .data
%%lit: dd %2
	section .text
	mov %1, dword[%%lit]
	%endmacro
%macro xrloadlit 2
section .data
%%lit: dd %2
	section .text
	movss %1, [%%lit]
	%endmacro
%macro genabs 1
	cmp %1 ,0
	jge %%ok
	neg %1
%%ok:
%endmacro
%macro xrdloadlit 2
section .data
%%lit: dq %2
	section .text
	movsd %1, [%%lit]
	%endmacro
	
%macro vxrloadlit 2
section .data
%%lit: dd %2
	section .text
	vmovss %1, [%%lit]
	%endmacro
%macro vxrdloadlit 2
section .data
%%lit: dq %2
	section .text
	vmovsd %1, [%%lit]
	%endmacro
%macro mmxrloadlit 2
section .data
%%lit: dd %2
	section .text
	movd %1, dword[%%lit]
	%endmacro

%macro filoadlit 1
section .data
%%lit: dq %1.0
	section .text
	fld qword[%%lit]
	%endmacro


%macro boundc 3
section .data
%%lit: dd %2
       dd %3
section .text
	bound %1,[%%lit]
%endmacro

section .data
regutil0: dd 0
	  dd 0
regutil1: dd 0
	  dd 0
roundnear dw 03ffh
roundzero dw 0fffh

section .text
%endif
