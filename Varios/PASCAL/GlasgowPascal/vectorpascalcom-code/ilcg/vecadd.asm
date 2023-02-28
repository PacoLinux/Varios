; -- Machine type P
; mark_description "Intel(R) C Compiler Version 4.0 99026";
; mark_description "-Qvc6 -S -I \\program files\\intel\\compiler4.0\\include";
;ident "Intel(R) C Compiler Version 4.0 99026"
;ident "-Qvc6 -S -I \program files\intel\compiler4.0\include"
	.486P
 	.387
_TEXT	SEGMENT PARA PUBLIC USE32 'CODE'
_TEXT	ENDS
_DATA	SEGMENT PARA PUBLIC USE32 'DATA'
	ALIGN 010H
_DATA	ENDS
_BSS	SEGMENT PARA PUBLIC USE32 'BSS'
	ALIGN 010H
_BSS	ENDS
_TLS	SEGMENT PARA PUBLIC USE32 'TLS'
_TLS	ENDS
_TEXT1	SEGMENT PARA PUBLIC USE32 'CODE'
	ALIGN 010H
_TEXT1	ENDS
_DATA1	SEGMENT PARA PUBLIC USE32 'DATA'
	ALIGN 010H
_DATA1	ENDS
	ASSUME	CS:FLAT,DS:FLAT,SS:FLAT
;ident "libci"
_DATA	SEGMENT PARA PUBLIC USE32 'DATA'
_DATA	ENDS
_TEXT	SEGMENT PARA PUBLIC USE32 'CODE'
;	COMDAT _main
; -- Begin  _main
; mark_begin;
       ALIGN     4                                             ;
	PUBLIC   _main
_main	PROC NEAR
$B1$1:                          ; Preds $B1$0
        push      ebp                                           ; 6.1
        mov       ebp, esp                                      ; 6.1
        sub       esp, 3                                        ; 6.1
        and       esp, -8                                       ; 6.1
        add       esp, 4                                        ; 6.1
        mov       eax, 19204                                    ; 6.1
        call      __chkstk                                      ; 6.1
        mov       ecx, -100000                                  ; 9.6
                                ; LOE ecx ebx ebp esi edi esp cl ch
$B1$2:                          ; Preds $B1$4 $B1$1
        mov       eax, esp                                      ; 10.10
        lea       edx, DWORD PTR [esp+6400]                     ; 10.10
                                ; LOE eax edx ecx ebx ebp esi edi esp al ah dl dh cl ch
$B1$3:                          ; Preds $B1$3 $B1$2
                                ;unroll=1
        jmp       $L1                                           ;
        ALIGN     4                                             ;
$L2:                                                            ;
        movq      MMWORD PTR [eax+12792], mm1                   ;
$L1:                                                            ;
        movq      mm0, MMWORD PTR [eax]                         ; 76.38
        movq      mm1, MMWORD PTR [eax+8]                       ; 76.38
        paddb     mm0, MMWORD PTR [eax+6400]                    ; 715.1
        movq      MMWORD PTR [eax+12800], mm0                   ; 11.7
        paddb     mm1, MMWORD PTR [eax+6408]                    ; 715.1
        add       eax, 16                                       ; 10.20
        cmp       eax, edx                                      ; 10.5
        jl        $L2                                           ; 10.5
        movq      MMWORD PTR [eax+12792], mm1                   ; 11.7
                                ; LOE eax edx ecx ebx ebp esi edi esp al ah dl dh cl ch
$B1$4:                          ; Preds $B1$3
        inc       ecx                                           ; 9.16
        jne       $B1$2         ; Prob 80%                      ; 9.2
                                ; LOE ecx ebx ebp esi edi esp cl ch
$B1$5:                          ; Preds $B1$4
        add       esp, 19204                                    ; 12.1
        xor       eax, eax                                      ; 12.1
        mov       esp, ebp                                      ; 12.1
        pop       ebp                                           ; 12.1
        ret                                                     ; 12.1
        ALIGN     4                                             ;
                                ; LOE ebx ebp esi edi esp
; mark_end;
_main ENDP
;_main	ENDS
_TEXT	ENDS
_DATA	SEGMENT PARA PUBLIC USE32 'DATA'
_DATA	ENDS
; -- End  _main
_DATA	SEGMENT PARA PUBLIC USE32 'DATA'
_DATA	ENDS
; mark_proc_addr_taken _main;
EXTRN	__chkstk:PROC
	END
