       P8087
       Ideal
       Model Tpascal

       DataSeg
EXTRN  minus2: word

       Codeseg

       Proc TAN FAR Theta: qword
       Public Tan
       Local Status_word: Word, Sign_Store: Byte

; First Check for a negitive argument
; Note Tan(-X) = -Tan(X)

       FLD     [qword ptr Theta]
       Mov     [Sign_Store],         0           ; Assume Positive
       FTST
       FSTSW   [Status_Word]
       Fwait
       mov     ah,     [byte ptr Status_word + 1]
       sahf
       jnc     Non_Negitive
       mov     [Sign_Store],         -1          ; It's Negitive
       fabs

Non_Negitive:
; Now get ST between 0 and pi/4
       Fild    [Minus2]                        ; Load -2
       FLDPI                                   ; Load Pi
       FSCALE                                  ; Got pi/4
       FSTP    ST(1)                           ; Dump -2
       FXCH

; Now X is in ST and pi/4 in ST(1)
Range:
       FPREM
       FSTSW   [Status_Word]
       Fwait
       mov     ah,     [byte ptr status_word+1]
       sahf
       jp      Range                           ; This tests bit C2

; At this point AH has the status bits
; Now Lets see if the remainder was exactly zero

       mov     bx,     0
       and     [byte ptr status_word+1], 01000001B
       cmp     [byte ptr status_word+1], 01000001B
       jne     Not_zero
       Mov     Bx,     -1

Not_Zero:
; There are four possibilities given ST Now has x mod Pi/4

; Octant      C3   C1    Calculate          If Zero
; 0,4          0    0    FPTAN(ST)             0
; 1,5          0    1    1/FPTAN(PI/4-ST)      1
; 2,6          1    0    -1/FPTAN(ST)          infinity
; 3,7          1    1    -FPTAN(PI/4-ST)       -1

; First Check C1 and Take FPTAN
       Test    ah,     10B                     ; Is C1 on ?
       jz      C1ISOFF                         ; Jump if off
       CMP     BX,     0                       ; ST Exactly Zero?
       JNE     STOANDC1                        ; Jump if Yes
       Fsubp   ST(1),  ST                      ; Now PI - ST
       FPTAN
       JMP     TANDONE

STOANDC1:
       FSTP    ST                              ; Pop ST
       FSTP    ST                              ; and pi/4
       FLD1                                    ; Load Ratio 1 to 1
       FLD1
       Jmp     TANDONE

C1ISOFF:
       FSTP    ST(1)                           ; Get Rid of pi/4
       cmp     bx,     0                       ; ST exactly 0?
       jne     STOANDNOC1                      ; Jump if yes
       FPTAN
       jmp     TANDONE

STOANDNOC1:
       FSTP    ST                              ; Dump ST
       FLDZ                                    ; Load Ratio 0 to 1
       FLD1

TANDONE:
; Put C1 xor C3 in Bx
       mov     bx,     0                       ; Assume C3 off
; If C3 is on then change signs
       test    ah,     01000000b
       jz      NOC3                            ; Jump If Off
       FCHS
       Mov     bx,     1                       ; Note C3 is on

NoC3:
; Is c1 on?
       Test    ah,     10b
       jz      NOC1                            ; Jump if off
       xor     bx,     1
       jmp     recip
NoC1:  xor     bx,     0
Recip:
; If Bx=1 Then we want reciprocal of Ratio
       cmp     Bx,     1
       jne     NORECIP
       FXCH
NORECIP:
       FDIVP   ST(1),  ST                      ; That's It

; Did we orginally change the signs?
       cmp     [Sign_Store], 0
       je      Leave_Pos
       FCHS

Leave_Pos:
       Ret
       endp
       end



