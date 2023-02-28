;    SALIB.MAC   ---- file to expand S-code instructions
;                     into 80386 instructions
;     assume bp is the sf register
;     all integers are to be 32 bits
;     all addresses are to be 48 bits
;     requires MASM

.386
assume cs:cseg
reallen    equ 4 ; length in words

ptrstacklen equ 3
ptrstackbytes equ 6
ptrlen equ 8
basefield equ  20
stackpntr macro p1,p2
          db ptrstacklen

  endm

realsize macro p1,p2

db reallen

endm

heappntr macro p1,p2

db ptrlen


endm
addresssize macro p1,p2
                db 3

endm
stridesize macro p1,p2
           db 2

endm
procsize macro p1,p2
         db  2    ; length in words

endm

intsize macro p1,p2
        db 2       ; integers are 32 bits

endm
;----------------- 32 bit addressing primitives
mov_esesi_al macro p1,p2
       mov es:[esi],al

endm

movb_esesi macro p1,p2
           mov BYTE PTR es:[esi],p1


endm
push_esesi macro p1,p2
           push dword ptr es:[esi]

endm

push_sssi macro p1,p2
                 push dword ptr ss:[si]

endm
mov_eax_esesi macro p1,p2
             mov eax,es:[esi]

endm
mov_esesi_eax macro p1,p2
        mov es:[esi],eax

endm
movi_esesi macro p1,p2

            mov DWORD PTR es:[esi],p1

endm
pushl_esesi macro p1,p2

          push dword ptr es:[esi]

endm
mov_esesi_eax macro p1,p2
          mov es:[esi],eax

endm
pushl_esesi4 macro p1,p2
             push dword ptr es:[esi+4]

endm
popl_esesi macro p1,p2
           pop dword ptr es:[esi]

endm
popl_esesi4 macro p1,p2
  pop dword ptr es:[esi+4]

endm

;-----------------
callc       macro p1,p2
            push bx

        int 18h               ; use int 18h for dynamic linking
            db 'p1',0
            pop bx

endm
getlev    macro p1,p2
          mov si,[bp+p1]

endm
enterframe macro p1,p2
           push bp
           push bx

endm
exitframe  macro p1,p2
           pop bx
           pop bp

endm
outbyte    macro p1,p2
           ; takes (file,selector,char ->file)
           pop ax   ; char to write
           pop dx   ; byte to write

   pop cx   ; file
                   push cx  ; leave copy on stack

   push bx  ; save bx
           mov bx,cx
           mov cx,1
           push ax  ; write  from memory buffer
           add dx,sp; ds:dx points at byte to write
           mov ah,40h
           int 21h
           pop ax   ; discard written char

   pop bx

endm

prolog286     macro p1,p2
           enter 0,p1


endm

prolog86 macro p1,p2

   push bp

   mov di,bp

   mov bp,sp


endm
pushdisp   macro p1,p2

   sub di,2

       push ss:[di]


endm

prolog     macro p1,p2
           prolog286 p1


endm
shrink     macro p1,p2
           ; release memory at start of program
           mov ah,4ah
           mov bx,1000h   ; keep one whole segment
           int 21h

endm
epilog     macro p1,p2
;           leave

   mov sp,bp

   pop bp
           retf p1

endm
call_static macro p1,p2
            ; call a proc in same segment
            push cs
            mov ax, offset p1
            call ax

endm

start_paramsi macro p1,p2
               push eax

endm
start_paramsv macro p1,p2

endm
start_paramsr macro p1,p2
              sub sp,reallen

endm
start_paramsp macro p1,p2
 sub sp, ptrstacklen
 endm
call_glob macro p1,p2

          db 36h   ; seg ss
          db 0ffh  ; call far
          db 9fh   ; [bx+offset]
          dw p1

endm
call_loc macro p1,p2
           db 0ffh ; call far
           db 9eh  ; indirect [bp+procvar]
           dw   p1

endm
call_ macro p1,p2
          getlev p1
          call dword ptr ss:[si+p2]

endm

duplicate       macro p1,p2
          pop eax
          push eax
          push eax

endm
dupi      macro p1,p2
          duplicate

endm
dupp      macro p1,p2
          pop eax
          pop es
          push es
          push eax
          push es
          push eax

endm
llint    macro p1,p2
;         mov ax,p1
;          push ax
   mov eax,p1
   push eax

endm

subsi   macro p1,p2
; assume that pid handle on top of stack
; field offset as parameter to macro p1,p2
          pop es        ; es points at pid descriptor
          pop esi
          push dword ptr es:[si+p1]

endm
subsr   macro p1,p2
; assume that pid handle on top of stack
; field offset as parameter to macro p1,p2
          pop es        ; es points at pid descriptor
          pop esi
          add esi,p1
          push dword ptr es:[esi+4]
          push dword ptr es:[esi]

endm
subsassi   macro p1,p2
; assume integer top of stack
; assume that pid handle second on stack
; field offset as parameter to macro p1,p2
          pop eax
          pop es        ; es points at pid descriptor
          pop esi
          mov dword ptr es:[esi+p1]    ,eax

endm

subsassr   macro p1,p2
; assume real top of stack
; assume that pid handle second on stack
; field offset as parameter to macro p1,p2
          mov si,sp
          les di,ss:[di+8]        ; es points at pid descriptor
          lea di, [di+p1]

  pop dword ptr es:[di]


  pop dword ptr es:[di+4]

           add sp,6             ; discard pointer

endm




pushreal  macro p1,p2         ; assume ss:si points at the real

  push dword ptr ss:[si+4]


  push dword ptr ss:[si]

endm

pushproc  macro p1,p2
          push dword ptr ss:[si]

endm
pushp     macro p1,p2         ; assume ss:si points at the ptr
          add sp,-ptrstackbytes

  mov di,ss
;
  mov ax,ds

  mov es,di
;
  mov ds,di
          mov di,sp
          mov cx,ptrstacklen      ; length
          rep  movsw
;
  mov ds,ax

endm

heappushreal  macro p1,p2         ; assume dx:si points at the real on heap

          add sp,-8
          mov di,sp
          push ss
          pop es
          mov cx,reallen      ; length
          mov ax,ds           ; save ds
          mov ds,dx           ; point at heap
          rep  movsw
          mov ds,ax           ; point back at  Data

endm
 heappushp     macro p1,p2         ; assume dx:si points at the ptr

          add sp,-ptrstackbytes
          mov di,sp
          push ss
          pop es
          mov cx,ptrlen      ; length
          mov ax,ds           ; save ds
          mov ds,dx           ; point at heap
          rep  movsw
          mov ds,ax           ; point back at  Data

  callc _fixp

endm

popreal   macro p1,p2    ; assume ss:di points at real var

      pop dword ptr ss:[di]
      pop dword ptr ss:[di+4]
endm

popproc   macro p1,p2
          pop dword ptr [di]


endm


popp      macro p1,p2    ; assume ss:di points at pntr var
          mov esi,esp

  push ds
          pop es
          mov cx,ptrlen
          rep movsw
          add sp,ptrstackbytes

endm

heappopreal   macro p1,p2    ; assume dx:di points at real field on heap
          mov es,dx

  pop dword ptr es:[edi]


  pop dword ptr es:[edi+4]


endm


heappopp      macro p1,p2   ; dx:edi points at pntr field on heap

          mov es,dx
          pop dword ptr es:[edi]
          pop word ptr es:[edi+4]

endm

movp      macro p1,p2    ; move a pointer on the stack di points at dest
          mov eax,[esp]
          mov ss:[di],eax
          mov ax,[esp+4]
          mov ss:[di+4],ax

endm
movr      macro p1,p2


          mov eax,[esp]
          mov ss:[di],eax
          mov eax,[esp+4]
          mov ss:[di+4],eax



endm
ldsesi     macro p1,p2

          mov ax,cs
          mov ds,ax
          lea esi, ds:p1

endm
pushfarpntr macro p1,p2

    push cs

            mov eax,offset p1
            push eax

endm
sspushfarpntr macro p1,p2

              push ss
              mov eax,offset p1
              push eax

endm
llreal_op    macro p1,p2
          ldsesi p1

          push [esi+6]

  push [esi+4]

  push [esi+2]

  push [esi]

  push ss

  pop ds

endm
globali  macro p1,p2
          push dword ptr ss:[p1+bx]

endm
globaleax macro p1,p2
 mov eax,ss:[p1+bx]
 endm
lea_eax_glob macro p1,p2
 lea eax,[p1+bx]
 endm
lea_esi_glob macro p1,p2
 lea esi,[p1+bx]
 endm
globaladdr macro p1,p2
         push ss
         lea_eax_glob p1
         push eax

endm
globalp macro p1,p2
        lea esi,[p1+bx]
        pushp

endm
globalproc macro p1,p2
        push dword ptr ss:[p1+bx]


endm
globalr macro p1,p2
        lea si,[p1+bx]
        pushreal

endm
locali     macro p1,p2
  push dword ptr [bp + p1]
  endm
localeax   macro p1,p2
 mov eax,[bp +p1]
 endm
localaddr macro p1,p2

           lea eax, [bp+ p1]
           push ss

           push eax

endm
localaddr_esi macro p1,p2

             lea esi,[bp+p1]
             push ss

endm
localp    macro p1,p2
          lea esi,[bp+p1]
          pushp

endm
localproc    macro p1,p2
             lea si,[bp+p1]

          push dword ptr [si]

endm
localr    macro p1,p2
          lea si,[bp+p1]
          pushreal

endm
loadi    macro p1,p2
          getlev p1
          push dword ptr ss:[si+p2]

endm
loadaddr macro p1,p2
         getlev p1
         add si,p2
         push ss
         push 0
         push si

endm
; ------------ indirect load and store
popesesi   macro p1,p2
          pop esi
          pop es

endm
popes_movesieax  macro p1,p2
          mov esi,eax
          pop es

endm
mov_es_ss macro p1,p2
          push ss
          pop es

endm
longmovb macro
          rep movs byte ptr  es:[edi],ds:[esi]
         endm

lindira   macro p1,p2 ;loads an array indirectly
          pop esi
          mov ax,ds ; save ds
          pop ds    ; ds : si points at src

          mov cx,p1
          sub sp,cx   ; create space
          push ss
          pop es
          mov edi,esp   ; source and dest point ok
          longmovb
          mov ds,ax

endm
assindira macro p1,p2 ;assign the array on the stack to the address below
                ; array must be less than 64k
          mov esi,esp
          mov ax,ds  ; save old ds
          mov cx,p1  ; get size of array
          add si,cx  ; si points at destination address

          lds edi,ss:[esi]   ; ds:di holds destination
          mov dx,ss
          mov es,dx
          lea dx, [si+6] ; save position of stack on completion

          mov esi,esp  ; es:si points at array on heap
          longmovb
          mov ds,ax  ; restore ds
          mov sp,dx  ; remove array and pointer from stack

endm
assindirb macro p1,p2
          pop ax
          popesesi
          mov_esesi_al

endm
assindir_al macro p1,p2
            popesesi
            mov_esesi_al

endm
assindirbl macro p1,p2
           popesesi
           movb_esesi p1

endm
lindiri   macro p1,p2
          popesesi
          push_esesi

endm

push_ssesi macro p1,p2
          push dword ptr ss:[si]
          endm
lindirb   macro p1,p2
          popesesi
          mov al,es:[esi]
          xor ah,ah
          push ax


endm
assindiri macro p1,p2
          pop eax
          popesesi
          mov es:[esi],eax
endm
assindiril macro p1,p2
           popesesi
           mov dword ptr es:[esi],p1

endm
assindireax macro p1,p2
          popesesi
          mov es:[esi],eax

endm

lindirp   macro p1,p2
          popesesi
          push_esesi

endm
assindirp macro p1,p2
          pop eax
          pop dx
          pop esi
          pop es
          mov es:[esi],eax
          mov es:[esi+4],dx

endm
pushc_esesi macro p1,p2
           push word ptr es:[esi+4]
           push dword ptr es:[esi]

endm

lindirc   macro p1,p2
          lindirp

endm
pushc_sssi macro p1,p2
           push word ptr ss:[si+4]
           push dword ptr ss:[si]

endm
assindirc macro p1,p2
          assindirp
endm


lindirr   macro p1,p2

          popesesi
          pushl_esesi4
          pushl_esesi

endm
assindirr macro p1,p2

          les esi,[si+8]
          popl_esesi
          popl_esesi4
          add sp,6      ; discard pointer

endm


loadr     macro p1,p2
          getlev p1

          lea esi,[p2+si]
          pushreal

endm
loadp     macro p1,p2
           getlev p1
          lea si,[p2+si]
          pushp

endm
loadproc     macro p1,p2

             loadi p1,p2
endm
assi     macro p1,p2
          getlev p1
          pop dword ptr [si+p2]

endm

assr      macro p1,p2
          getlev p1

          lea edi,[si+p2]
          popreal

endm
assp      macro p1,p2
          getlev p1
          lea di,[si+p2]
          popp

endm

globalassi  macro p1,p2
          pop dword ptr ss:[p1+bx]

endm
globalassr macro p1,p2
          lea  di,[p1+bx]
          popreal

endm
globalassp macro p1,p2
           lea di,[p1+bx]
           popp

endm
localassi  macro p1,p2
          pop dword ptr[bp + p1 ]

endm
localassr macro p1,p2
          lea di,[bp+p1]
          popreal

endm
localassp macro p1,p2
          lea di,[p1+bp]
          popp

endm

localmovi  macro p1,p2              ; move top of stack without popping
          pop eax
          push eax
          mov  [bp + p1 ]  ,eax

endm
localmovr macro p1,p2
          lea di,[bp+p1]
          movr

endm
localmovp macro p1,p2
          lea di,[p1+bp]
          movp

endm
discard_globali macro p1,p2
          add sp,p1



endm
neg_op     macro p1,p2
           neg dword ptr [esp]

endm
and_eax_ecx macro p1,p2
          and eax,ecx

endm

or_eax_ecx  macro p1,p2
          or ax,cx

endm

shr_eax_cl macro p1,p2
          shr eax,cl
          endm
shl_eax_cl macro p1,p2
 shl eax,cl
 endm


plusop    macro p1,p2
          pop ecx
          pop eax
          add eax,ecx
          push eax

endm
locplusi  macro p1,p2
          pop eax
          add eax,[bp + p1]
          push eax

endm
pluslint  macro p1,p2
          add dword ptr [esp], p1

endm
not_op    macro p1,p2
          xor dword ptr [esp],1

endm
minusop   macro p1,p2
          pop ecx
          pop eax
          sub eax,ecx
          push eax

endm
locminusi  macro p1,p2
          pop eax
          sub eax,[bp + p1]
          push eax

endm
multop    macro p1,p2
          pop ecx
          pop eax
          imul ecx
          push eax

endm

imul_ecx   macro p1,p2
 imul ecx
 endm
cwdop     macro p1,p2
 cwd
 endm
idiv_ecx   macro p1,p2
          idiv ecx

endm

divop     macro p1,p2
          pop ecx
          pop eax
          cwd
          idiv ecx
          push eax

endm

remop     macro p1,p2
          pop ecx
          pop eax
          cwd
          idiv ecx
          push edx

endm

cmp_eax_ecx macro p1,p2
 cmp eax,ecx
 endm

cmpop macro p1,p2
          pop ecx
          pop eax
          cmp eax,ecx

endm

jump   macro p1,p2
          jmp p1

endm

jumpt     macro p1,p2      ; pop stack and jump if true
          pop eax
          or ax,ax
          jnz p1


endm
jumptt    macro p1,p2      ; jump if true otherwise pop top of stack
          test byte ptr [esp],1
          jnz p1
          pop eax

endm
cjump     macro p1,p2
          pop ecx
          cmp [esp],cx
          jnz @f
          pop eax
          jmp p1
  @@:

endm
fortest   macro p1,p2
          local m1,m2,m3
          pop ecx; pop the increment
          pop edx; pop the limit
          pop eax; pop i
          cmp ecx,0
          jl m1 ; increment neg
          cmp eax,edx; increment pos

          jle m2
    m3    equ $

  jmp p1 ; exit if i ge limit

    m1    equ $
          cmp eax,edx; inc neg
          jge m2

  jmp  m3; exit if i lt limit
    m2    equ $
          push eax
          push edx
          push ecx

endm
forstep   macro p1,p2

          pop ecx; pop the increment
          add [esp+4],ecx
          push ecx
          jmp p1

endm

forprep macro p1,p2
           pop ecx
           pop eax
           push eax
           sub ecx,eax
           add ecx,2

endm
minfortest macro p1,p2
           local m1
           loop m1
           pop eax
           jmp p1
  m1       equ $
           push ecx

endm
minforstep macro p1,p2
           pop ecx
           inc dword ptr [esp]
           jmp p1

endm


start_write macro p1,p2
            mov eax,1
            push eax

endm
end_write   macro p1,p2
            pop eax

endm
            ;------------------------------- Calls to C library
calld       macro p1,p2
            push bx
            call p1
            pop bx

endm
writeint    macro p1,p2
            callc _writei

endm
writestring macro p1,p2
            callc _writes

endm
writepntr   macro p1,p2


callc _writep



endm
writebool macro p1,p2


callc _writeb

endm

writereal   macro p1,p2
            callc _writer

endm
writecint   macro p1,p2
            _writeint

endm
makevec_op     macro p1,p2
          callc _makevec

endm
subv_opi macro p1,p2
          callc _subvib

endm
subvass_opi macro p1,p2
             callc _subvassib

endm

subv_opr macro p1,p2
          callc _subvr

endm
subvass_opr macro p1,p2
             callc _subvassr

endm

subv_opp macro p1,p2
          callc _subvp

endm
subvass_opp macro p1,p2
            callc _subvassp

endm
cmpops macro p1,p2
        callc _compstr

endm
cmpoppntr macro p1,p2
         pop eax
         pop si
         pop ecx
         pop di
         xor eax,ecx
         xor di,si
         or ax,di
         push eax
         pop ax
         pop cx
         or ax,cx

endm
substr_op macro p1,p2
         callc _substrop

endm
concat_op  macro p1,p2
          callc _concat
          add sp,ptrstackbytes     ; remove top stack item

endm

add_sp macro p1,p2
       add sp,p1

endm

push_eax macro p1,p2
        push eax

endm
push_edx macro p1,p2
 push edx
 endm
cmp_eax macro p1,p2
       cmp eax,p1

endm

int18 macro p1,p2
      int 18h

endm

int21 macro p1,p2
      int 21h

endm

mov_ax_sp macro p1,p2
      mov ax,sp

endm

mov_bx_sp macro p1,p2
 mov bx,sp
 endm
mov_bp_sp macro p1,p2
 mov bp,sp
 endm
add_eax macro p1,p2
       add eax,p1

endm
push_ss macro p1,p2
        push ss

endm
push_cs macro p1,p2
 push cs
 endm
mov_edi_eax macro p1,p2
       mov edi,eax

endm
mov_es_dx macro p1,p2
          mov es,dx

endm

pop_es_edi macro p1,p2
          pop dword ptr es:[edi+p1]

endm
add_edi macro p1,p2
       add edi,p1

endm
add_esi macro p1,p2
 add esi,p1
 endm
push_es_esi macro p1,p2
 push dword ptr es:[esi+p1]
 endm

lea_eax macro p1,p2
 lea eax,ds:p1
 endm

cslea_eax macro p1,p2
 lea eax,cs:p1
 endm
pop_eax macro p1,p2
 pop eax
 endm
pop_ecx macro p1,p2
        pop ecx

endm
mov_eax macro p1,p2
 mov eax,p1
 endm

push_bx macro p1,p2
 push bx
 endm
pop_bx macro p1,p2
 pop bx
 endm
pop_es macro p1,p2
 pop es
 endm
pop_esi macro p1,p2
 pop esi
 endm
pop_cx macro p1,p2
 pop cx
 endm
push_bp macro p1,p2
 push bp
 endm
add_eax_ecx macro p1,p2
 add eax,ecx
 endm
mov_eax_esi macro p1,p2
 mov eax,esi
 endm
mov_esi_eax macro p1,p2
 mov esi,eax
 endm
add_eax_tos macro p1,p2
           pop ecx
           add eax,ecx

endm
add_l_tos  macro p1,p2
           pop eax
           add eax,p1

endm
sub_eax_ecx macro p1,p2
 sub eax,ecx
 endm
no_op macro p1,p2

      endm

