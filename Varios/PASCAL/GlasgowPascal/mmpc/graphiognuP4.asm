.ifndef graphio
graphio=1
definedunit$graphio$base=1
.section .text  
; #procedure generated by code generator class ilcg.tree.gnuP4CG
label121f7ffc8f1a94:
#	 loadbmpfile
# entering a procedure at lexical level 1
	enter   $0,$1
	sub $spaceforloadbmpfilel107+  0,%esp
	push %ebx
	push %esi
	push %edi
; #182
 movb  $ 0,         -5(%ebp)
; #183
 lea       8(%ebp),%eax
 pushl %eax
 lea       -148(%ebp),%eax
 pushl %eax
.ifndef definedassign
definedassign=1
.extern 	 assign
.endif
 call assign#imported
 add  $8,%esp
; #184
 lea       -148(%ebp),%eax
 pushl %eax
.ifndef definedreset
definedreset=1
.extern 	 reset
.endif
 call reset#imported
 add  $4,%esp
; #216
.ifndef definedioresult
definedioresult=1
.extern 	 ioresult
.endif
 call ioresult#imported
 movl %eax,        -152(%ebp)#STORER
  cmpl  $    0,          -152(%ebp)
 jnz   label121f7ffcb19ad6
; #191
 lea       -148(%ebp),%eax
 pushl %eax
.ifndef definedfilesize
definedfilesize=1
.extern 	 filesize
.endif
 call filesize#imported
 add  $4,%esp
 movl %eax,        -228(%ebp)#STORER
 movl         -228(%ebp),%eax
 movl %eax,        -116(%ebp)#STORER
; #192
 movl  $    54,         -120(%ebp)
; #193
 lea       -144(%ebp),%eax
 pushl %eax
 pushl         -120(%ebp)
 lea       -108(%ebp),%eax
 pushl %eax
 lea       -148(%ebp),%eax
 pushl %eax
.ifndef definedblockread
definedblockread=1
.extern 	 blockread
.endif
 call blockread#imported
 add  $16,%esp
; #215
 lea       -94(%ebp),%eax
 movl %eax,        -232(%ebp)#STORER
; #196
 pushl $     36
 pushl         168(%ebp)
.ifndef definedgetmem
definedgetmem=1
.extern 	 getmem
.endif
 call getmem#imported
 add  $8,%esp
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl  $    0,         4(%eax)
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl  $    2,         8(%eax)
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl  $    0,         16(%eax)
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl         -232(%ebp),%ebx
 movl         8(%ebx),%ebx
 lea       -1(%ebx),%ebx
 movl %ebx,        20(%eax)#STORER
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl  $    0,         28(%eax)
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl         -232(%ebp),%ebx
 movl         4(%ebx),%ebx
 lea       -1(%ebx),%ebx
 movl %ebx,        32(%eax)#STORER
 pushl $     1
 pushl $     3
 pushl         168(%ebp)
.ifndef definedinitvec
definedinitvec=1
.extern 	 initvec
.endif
 call initvec#imported
 add  $12,%esp
; #197
 pushl $     36
 lea       -112(%ebp),%eax
 pushl %eax
.ifndef definedgetmem
definedgetmem=1
.extern 	 getmem
.endif
 call getmem#imported
 add  $8,%esp
 movl         -112(%ebp),%eax
 movl  $    0,         4(%eax)
 movl         -112(%ebp),%eax
 movl         -232(%ebp),%ebx
 movl         8(%ebx),%ebx
 lea       -1(%ebx),%ebx
 movl %ebx,        8(%eax)#STORER
 movl         -112(%ebp),%eax
 movl  $    0,         16(%eax)
 movl         -112(%ebp),%eax
 movl         -232(%ebp),%ebx
 movl         4(%ebx),%ebx
 lea       -1(%ebx),%ebx
 movl %ebx,        20(%eax)#STORER
 movl         -112(%ebp),%eax
 movl  $    0,         28(%eax)
 movl         -112(%ebp),%eax
 movl  $    2,         32(%eax)
 pushl $     1
 pushl $     3
 lea       -112(%ebp),%eax
 pushl %eax
.ifndef definedinitvec
definedinitvec=1
.extern 	 initvec
.endif
 call initvec#imported
 add  $12,%esp
; #212
 movl         -232(%ebp),%eax
 movw         14(%eax),%ax
 movswl %ax,   %eax
  cmpl  $    8,  %eax
 jz   label121f7ffcb34ae6
 movl         -232(%ebp),%eax
 movw         14(%eax),%ax
 movswl %ax,   %eax
  cmpl  $    24,  %eax
 jz   label121f7ffcb37aea
 jmp  label121f7ffcb37aec
 label121f7ffcb37aea:
; #204
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl         8(%eax),%eax
 lea       1(%eax),%eax
 movl         168(%ebp),%ebx
 movl   0(%ebx),%ebx
 movl         32(%ebx),%ebx
 lea       1(%ebx),%ebx
 imull %ebx,%eax
 movl %eax,        -116(%ebp)#STORER
; #205
 pushl $     4
 pushl         -116(%ebp)
 call label121f7ffadca1b0
 add  $8,%esp
 movl %eax,        -260(%ebp)#STORER
  cmpl  $    0,          -260(%ebp)
 jnz   label121f7ffcb3daee
 jmp  label121f7ffcb3daf0
 label121f7ffcb3daee:
 pushl $     4
 pushl         -116(%ebp)
 call label121f7ffadca1b0
 add  $8,%esp
 movl %eax,        -264(%ebp)#STORER
 movl         -116(%ebp),%eax
 lea       4(%eax),%eax
 movl         -264(%ebp),%ebx
 subl %ebx,%eax
 movl %eax,        -116(%ebp)#STORER
 label121f7ffcb3daf0:
; #208
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl         20(%eax),%eax
 movl %eax,        -268(%ebp)#STORER
 xorl %eax,%eax
 cmpl          -268(%ebp),  %eax
 jle   label121f7ffcb48af2
 jmp  label121f7ffcb48af4
 label121f7ffcb48af2:
 movl  $    0,         -120(%ebp)
 label121f7ffc9c5aca:
  cmpl  $    0,          -120(%ebp)
 jl   label121f7ffcb49af6
 movl         -120(%ebp),%eax
 movl         -112(%ebp),%ebx
 cmpl          8(%ebx),  %eax
 jg   label121f7ffcb49af6
 jmp  label121f7ffcb49af8
 label121f7ffcb49af6:
 int $    5
 label121f7ffcb49af8:
 xorl %eax,%eax
 movl         -112(%ebp),%ebx
 cmpl          20(%ebx),  %eax
 jg   label121f7ffcb4aafa
 jmp  label121f7ffcb4aafc
 label121f7ffcb4aafa:
 int $    5
 label121f7ffcb4aafc:
 xorl %eax,%eax
 movl         -112(%ebp),%ebx
 cmpl          32(%ebx),  %eax
 jg   label121f7ffcb4aafe
 jmp  label121f7ffcb4ab00
 label121f7ffcb4aafe:
 int $    5
 label121f7ffcb4ab00:
 lea       -144(%ebp),%eax
 pushl %eax
 pushl         -116(%ebp)
 movl         -120(%ebp),%eax
 movl         -112(%ebp),%ebx
 imull         12(%ebx),%eax
 movl         -112(%ebp),%ebx
 movl   0(%ebx),%edi
 lea  0(%eax,%edi,1),%eax
 pushl %eax
 lea       -148(%ebp),%eax
 pushl %eax
.ifndef definedblockread
definedblockread=1
.extern 	 blockread
.endif
 call blockread#imported
 add  $16,%esp
 movl         -120(%ebp),%eax
 cmpl          -268(%ebp),  %eax
 jz   label121f7ffc9c5ac8
 incl         -120(%ebp)
 jmp  label121f7ffc9c5aca
 label121f7ffc9c5ac8:
 label121f7ffcb48af4:
; #209
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl         8(%eax),%eax
 movl %eax,        -424(%ebp)#STORER
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl         20(%eax),%eax
 movl %eax,        -420(%ebp)#STORER
 movl         168(%ebp),%eax
 movl   0(%eax),%eax
 movl         32(%eax),%eax
 movl %eax,        -416(%ebp)#STORER
 movl  $    0,         -320(%ebp)
 label121f7ffcb53b04:
 movl         -320(%ebp),%eax
 cmpl          -424(%ebp),  %eax
 jg   label121f7ffcb53b06
 movl  $    0,         -324(%ebp)
 label121f7ffcb55b08:
 movl         -324(%ebp),%eax
 cmpl          -420(%ebp),  %eax
 jg   label121f7ffcb55b0a
 movl  $    0,         -328(%ebp)
 label121f7ffcb5cb0c:
 movl         -328(%ebp),%eax
 cmpl          -416(%ebp),  %eax
 jg   label121f7ffcb5cb0e
 movl         -112(%ebp),%eax
 movl         8(%eax),%eax
 cmpl         -324(%ebp),  %eax
 jl   label121f7ffcb5db10
 jmp  label121f7ffcb5db12
 label121f7ffcb5db10:
 int $    5
 label121f7ffcb5db12:
 movl         -112(%ebp),%eax
 movl         20(%eax),%eax
 cmpl         -328(%ebp),  %eax
 jl   label121f7ffcb5eb14
 jmp  label121f7ffcb5eb16
 label121f7ffcb5eb14:
 int $    5
 label121f7ffcb5eb16:
 movl         -112(%ebp),%eax
 movl         32(%eax),%eax
 cmpl         -320(%ebp),  %eax
 jl   label121f7ffcb5fb18
 jmp  label121f7ffcb5fb1a
 label121f7ffcb5fb18:
 int $    5
 label121f7ffcb5fb1a:
 movl         -320(%ebp),%eax
 movl         168(%ebp),%ebx
 movl   0(%ebx),%ebx
 imull         12(%ebx),%eax
 movl         -324(%ebp),%ebx
 movl         168(%ebp),%edi
 movl   0(%edi),%edi
 imull         24(%edi),%ebx
 movl         -328(%ebp),%edi
 lea  0(%ebx,%edi,1),%edi
 lea  0(%eax,%edi,1),%eax
 movl         168(%ebp),%ebx
 movl   0(%ebx),%ebx
 movl   0(%ebx),%edi
 lea  0(%eax,%edi,1),%eax
 movl %eax,        -432(%ebp)#STORER
 movl         -324(%ebp),%eax
 movl         -112(%ebp),%ebx
 imull         12(%ebx),%eax
 movl         -328(%ebp),%ebx
 movl         -112(%ebp),%edi
 imull         24(%edi),%ebx
 movl         -320(%ebp),%edi
 lea  0(%ebx,%edi,1),%edi
 lea  0(%eax,%edi,1),%eax
 movl         -112(%ebp),%ebx
 movl   0(%ebx),%edi
 movb    0(%eax,%edi,1),%bh
 movzx %bh,   %bx
 movswl %bx,   %eax
 lea       -128(%eax),%ebx
 movb %bl,        -425(%ebp)
 movl         -432(%ebp),%eax
 movb         -425(%ebp),%bl
 movb %bl,  0(%eax)
 incl         -328(%ebp)
 jmp  label121f7ffcb5cb0c
 label121f7ffcb5cb0e:
 incl         -324(%ebp)
 jmp  label121f7ffcb55b08
 label121f7ffcb55b0a:
 incl         -320(%ebp)
 jmp  label121f7ffcb53b04
 label121f7ffcb53b06:
; #211
 movb  $ -1,         -5(%ebp)
; #212
 label121f7ffcb37aec:
 jmp  label121f7ffcb34ae8
 label121f7ffcb34ae6:
; #199
 movb  $ 0,         -5(%ebp)
; #200
 pushl $ label121f7ffc9c1ac6
.ifndef definedlength
definedlength=1
.extern 	 length
.endif
 call length#imported
 add  $4,%esp
 movl %eax,        -256(%ebp)#STORER
 pushl $     5
 pushl         -256(%ebp)
 pushl $ label121f7ffc9c1ac6
 pushl     unit$system$base+    -24
.ifndef definedprintstring
definedprintstring=1
.extern 	 printstring
.endif
 call printstring#imported
 add  $16,%esp
 pushl     unit$system$base+    -24
.ifndef definedprintln
definedprintln=1
.extern 	 println
.endif
 call println#imported
 add  $4,%esp
; #201
 label121f7ffcb34ae8:
; #213
 pushl $     36
 movl         -112(%ebp),%eax
 pushl %eax
.ifndef definedfreemem
definedfreemem=1
.extern 	 freemem
.endif
 call freemem#imported
 add  $8,%esp
; #214
 lea       -148(%ebp),%eax
 pushl %eax
.ifndef definedpasclose
definedpasclose=1
.extern 	 pasclose
.endif
 call pasclose#imported
 add  $4,%esp
; #215
; #216
 jmp  label121f7ffcb19ad8
 label121f7ffcb19ad6:
; #185
 movb  $ 0,         -5(%ebp)
; #186
 pushl $ label121f7ffc99bac4
.ifndef definedlength
definedlength=1
.extern 	 length
.endif
 call length#imported
 add  $4,%esp
 movl %eax,        -176(%ebp)#STORER
 lea       8(%ebp),%eax
 pushl %eax
.ifndef definedlength
definedlength=1
.extern 	 length
.endif
 call length#imported
 add  $4,%esp
 movl %eax,        -200(%ebp)#STORER
.ifndef definedioresult
definedioresult=1
.extern 	 ioresult
.endif
 call ioresult#imported
 movl %eax,        -224(%ebp)#STORER
 pushl $     5
 pushl         -176(%ebp)
 pushl $ label121f7ffc99bac4
 pushl     unit$system$base+    -24
.ifndef definedprintstring
definedprintstring=1
.extern 	 printstring
.endif
 call printstring#imported
 add  $16,%esp
 pushl $     5
 pushl         -200(%ebp)
 lea       8(%ebp),%eax
 pushl %eax
 pushl     unit$system$base+    -24
.ifndef definedprintstring
definedprintstring=1
.extern 	 printstring
.endif
 call printstring#imported
 add  $16,%esp
 pushl $     5
 pushl $     12
 pushl         -224(%ebp)
 pushl     unit$system$base+    -24
.ifndef definedprintint
definedprintint=1
.extern 	 printint
.endif
 call printint#imported
 add  $16,%esp
 pushl     unit$system$base+    -24
.ifndef definedprintln
definedprintln=1
.extern 	 println
.endif
 call println#imported
 add  $4,%esp
; #187
 label121f7ffcb19ad8:
; #217
 label121f7ffc999ac2:
 xorl %eax,%eax
 movb         -5(%ebp),%al
spaceforloadbmpfilel107 = 432
loadbmpfilel107exit:
	pop %edi
	pop %esi
	pop %ebx
	leave
 	ret $0
.section .text  
; #procedure generated by code generator class ilcg.tree.gnuP4CG
label121f7ffc8f0a8e:
#	 storebmpfile
# entering a procedure at lexical level 1
	enter   $0,$1
	sub $spaceforstorebmpfilel108+  0,%esp
	push %ebx
	push %esi
	push %edi
; #151
 lea       8(%ebp),%eax
 pushl %eax
 lea       -144(%ebp),%eax
 pushl %eax
.ifndef definedassign
definedassign=1
.extern 	 assign
.endif
 call assign#imported
 add  $8,%esp
; #152
 lea       -144(%ebp),%eax
 pushl %eax
.ifndef definedrewrite
definedrewrite=1
.extern 	 rewrite
.endif
 call rewrite#imported
 add  $4,%esp
; #154
 pushl         1032(%ebp)
 lea       -108(%ebp),%eax
 pushl %eax
 call label121f7ffc8f4a9a
 add  $8,%esp
; #155
 lea       -140(%ebp),%eax
 pushl %eax
 pushl $     54
 lea       -108(%ebp),%eax
 pushl %eax
 lea       -144(%ebp),%eax
 pushl %eax
.ifndef definedblockwrite
definedblockwrite=1
.extern 	 blockwrite
.endif
 call blockwrite#imported
 add  $16,%esp
; #156
 pushl $     36
 lea       -12(%ebp),%eax
 pushl %eax
.ifndef definedgetmem
definedgetmem=1
.extern 	 getmem
.endif
 call getmem#imported
 add  $8,%esp
 movl         -12(%ebp),%eax
 movl  $    0,         4(%eax)
 movl         -12(%ebp),%eax
 movl         1032(%ebp),%ebx
 movl         20(%ebx),%ebx
 movl %ebx,        8(%eax)#STORER
 movl         -12(%ebp),%eax
 movl  $    0,         16(%eax)
 movl         -12(%ebp),%eax
 movl         1032(%ebp),%ebx
 movl         32(%ebx),%ebx
 movl %ebx,        20(%eax)#STORER
 movl         -12(%ebp),%eax
 movl  $    0,         28(%eax)
 movl         -12(%ebp),%eax
 movl         1032(%ebp),%ebx
 movl         8(%ebx),%ebx
 movl %ebx,        32(%eax)#STORER
 pushl $     1
 pushl $     3
 lea       -12(%ebp),%eax
 pushl %eax
.ifndef definedinitvec
definedinitvec=1
.extern 	 initvec
.endif
 call initvec#imported
 add  $12,%esp
; #160
 movl         -12(%ebp),%eax
 movl         8(%eax),%eax
 movl %eax,        -256(%ebp)#STORER
 movl         -12(%ebp),%eax
 movl         20(%eax),%eax
 movl %eax,        -252(%ebp)#STORER
 movl         -12(%ebp),%eax
 movl         32(%eax),%eax
 movl %eax,        -248(%ebp)#STORER
 movl  $    0,         -148(%ebp)
 label121f7ffcbb0b3c:
 movl         -148(%ebp),%eax
 cmpl          -256(%ebp),  %eax
 jg   label121f7ffcbb0b3e
 movl  $    0,         -152(%ebp)
 label121f7ffcbb2b40:
 movl         -152(%ebp),%eax
 cmpl          -252(%ebp),  %eax
 jg   label121f7ffcbb2b42
 movl  $    0,         -156(%ebp)
 label121f7ffcbb4b44:
 movl         -156(%ebp),%eax
 cmpl          -248(%ebp),  %eax
 jg   label121f7ffcbb4b46
 movl         1032(%ebp),%eax
 movl         8(%eax),%eax
 cmpl         -156(%ebp),  %eax
 jl   label121f7ffcbb6b48
 jmp  label121f7ffcbb6b4a
 label121f7ffcbb6b48:
 int $    5
 label121f7ffcbb6b4a:
 movl         1032(%ebp),%eax
 movl         20(%eax),%eax
 cmpl         -148(%ebp),  %eax
 jl   label121f7ffcbb7b4c
 jmp  label121f7ffcbb7b4e
 label121f7ffcbb7b4c:
 int $    5
 label121f7ffcbb7b4e:
 movl         1032(%ebp),%eax
 movl         32(%eax),%eax
 cmpl         -152(%ebp),  %eax
 jl   label121f7ffcbb7b50
 jmp  label121f7ffcbb7b52
 label121f7ffcbb7b50:
 int $    5
 label121f7ffcbb7b52:
 movl         -148(%ebp),%eax
 movl         -12(%ebp),%ebx
 imull         12(%ebx),%eax
 movl         -152(%ebp),%ebx
 movl         -12(%ebp),%edi
 imull         24(%edi),%ebx
 movl         -156(%ebp),%edi
 lea  0(%ebx,%edi,1),%edi
 lea  0(%eax,%edi,1),%eax
 movl         -12(%ebp),%ebx
 movl   0(%ebx),%edi
 lea  0(%eax,%edi,1),%eax
 movl %eax,        -324(%ebp)#STORER
 movl         -156(%ebp),%eax
 movl         1032(%ebp),%ebx
 imull         12(%ebx),%eax
 movl         -148(%ebp),%ebx
 movl         1032(%ebp),%edi
 imull         24(%edi),%ebx
 movl         -152(%ebp),%edi
 lea  0(%ebx,%edi,1),%edi
 lea  0(%eax,%edi,1),%eax
 movl         1032(%ebp),%ebx
 movl   0(%ebx),%edi
 movb    0(%eax,%edi,1),%bl
 addb  $  -128,%bl
 movb %bl,        -317(%ebp)
 movl         -324(%ebp),%eax
 movb         -317(%ebp),%bh
 movb %bh,  0(%eax)
 incl         -156(%ebp)
 jmp  label121f7ffcbb4b44
 label121f7ffcbb4b46:
 incl         -152(%ebp)
 jmp  label121f7ffcbb2b40
 label121f7ffcbb2b42:
 incl         -148(%ebp)
 jmp  label121f7ffcbb0b3c
 label121f7ffcbb0b3e:
; #164
 movl         1032(%ebp),%eax
 movl         8(%eax),%eax
 lea       1(%eax),%eax
 movl         1032(%ebp),%ebx
 movl         32(%ebx),%ebx
 lea       1(%ebx),%ebx
 imull %ebx,%eax
 movl %eax,        -112(%ebp)#STORER
; #165
 pushl $     4
 pushl         -112(%ebp)
 call label121f7ffadca1b0
 add  $8,%esp
 movl %eax,        -260(%ebp)#STORER
  cmpl  $    0,          -260(%ebp)
 jnz   label121f7ffcbf1b54
 jmp  label121f7ffcbf1b56
 label121f7ffcbf1b54:
 pushl $     4
 pushl         -112(%ebp)
 call label121f7ffadca1b0
 add  $8,%esp
 movl %eax,        -264(%ebp)#STORER
 movl         -112(%ebp),%eax
 lea       4(%eax),%eax
 movl         -264(%ebp),%ebx
 subl %ebx,%eax
 movl %eax,        -112(%ebp)#STORER
 label121f7ffcbf1b56:
; #168
 movl         1032(%ebp),%eax
 movl         20(%eax),%eax
 movl %eax,        -268(%ebp)#STORER
 xorl %eax,%eax
 cmpl          -268(%ebp),  %eax
 jle   label121f7ffcbfcb58
 jmp  label121f7ffcbfcb5a
 label121f7ffcbfcb58:
 movl  $    0,         -116(%ebp)
 label121f7ffc993aba:
  cmpl  $    0,          -116(%ebp)
 jl   label121f7ffcbfcb5c
 movl         -116(%ebp),%eax
 movl         -12(%ebp),%ebx
 cmpl          8(%ebx),  %eax
 jg   label121f7ffcbfcb5c
 jmp  label121f7ffcbfcb5e
 label121f7ffcbfcb5c:
 int $    5
 label121f7ffcbfcb5e:
 xorl %eax,%eax
 movl         -12(%ebp),%ebx
 cmpl          20(%ebx),  %eax
 jg   label121f7ffcbfdb60
 jmp  label121f7ffcbfdb62
 label121f7ffcbfdb60:
 int $    5
 label121f7ffcbfdb62:
 xorl %eax,%eax
 movl         -12(%ebp),%ebx
 cmpl          32(%ebx),  %eax
 jg   label121f7ffcbfeb64
 jmp  label121f7ffcbfeb66
 label121f7ffcbfeb64:
 int $    5
 label121f7ffcbfeb66:
 lea       -140(%ebp),%eax
 pushl %eax
 pushl         -112(%ebp)
 movl         -116(%ebp),%eax
 movl         -12(%ebp),%ebx
 imull         12(%ebx),%eax
 movl         -12(%ebp),%ebx
 movl   0(%ebx),%edi
 lea  0(%eax,%edi,1),%eax
 pushl %eax
 lea       -144(%ebp),%eax
 pushl %eax
.ifndef definedblockwrite
definedblockwrite=1
.extern 	 blockwrite
.endif
 call blockwrite#imported
 add  $16,%esp
 movl         -116(%ebp),%eax
 cmpl          -268(%ebp),  %eax
 jz   label121f7ffc993ab8
 incl         -116(%ebp)
 jmp  label121f7ffc993aba
 label121f7ffc993ab8:
 label121f7ffcbfcb5a:
; #171
 pushl $     36
 movl         -12(%ebp),%eax
 pushl %eax
.ifndef definedfreemem
definedfreemem=1
.extern 	 freemem
.endif
 call freemem#imported
 add  $8,%esp
; #172
 lea       -144(%ebp),%eax
 pushl %eax
.ifndef definedpasclose
definedpasclose=1
.extern 	 pasclose
.endif
 call pasclose#imported
 add  $4,%esp
; #174
 label121f7ffc965ab6:
spaceforstorebmpfilel108 = 324
storebmpfilel108exit:
	pop %edi
	pop %esi
	pop %ebx
	leave
 	ret $0
.section .text  
; #procedure generated by code generator class ilcg.tree.gnuP4CG
label121f7ffc8f4a9a:
#	 initbmpheader
# entering a procedure at lexical level 1
	enter $spaceforinitbmpheaderl109-4*1,$1
	push %ebx
	push %esi
	push %edi
; #91
 movl         8(%ebp),%eax
 movb  $ 66,   0(%eax)
; #92
 movl         8(%ebp),%eax
 movb  $ 77,         1(%eax)
; #96
 movl         8(%ebp),%eax
 movl         12(%ebp),%ebx
 movl         32(%ebx),%ebx
 lea       1(%ebx),%ebx
 movl         12(%ebp),%edi
 movl         8(%edi),%edi
 lea       1(%edi),%edi
 imull %edi,%ebx
 movl         12(%ebp),%edi
 movl         20(%edi),%edi
 lea       1(%edi),%edi
 imull %edi,%ebx
 lea       54(%ebx),%ebx
 movl %ebx,        2(%eax)#STORER
; #97
 movl  $    0,         -8(%ebp)
 label121f7ffcc13b6e:
  cmpl  $    3,          -8(%ebp)
 jg   label121f7ffcc13b70
 movl         8(%ebp),%eax
 movl         -8(%ebp),%edi
 movb  $ 0,         6(%eax,%edi ,1)
 incl         -8(%ebp)
 jmp  label121f7ffcc13b6e
 label121f7ffcc13b70:
; #98
 movl         8(%ebp),%eax
 movl  $    54,         10(%eax)
; #138
 movl         8(%ebp),%eax
 lea       14(%eax),%eax
 movl %eax,        -32(%ebp)#STORER
; #128
 movl         -32(%ebp),%eax
 movl  $    40,   0(%eax)
; #129
 movl         -32(%ebp),%eax
 movl         12(%ebp),%ebx
 movl         32(%ebx),%ebx
 lea       1(%ebx),%ebx
 movl %ebx,        4(%eax)#STORER
; #130
 movl         -32(%ebp),%eax
 movl         12(%ebp),%ebx
 movl         20(%ebx),%ebx
 lea       1(%ebx),%ebx
 movl %ebx,        8(%eax)#STORER
; #131
 movl         -32(%ebp),%eax
 movw  $  1,         12(%eax)
; #132
 movl         -32(%ebp),%eax
 movl         12(%ebp),%ebx
 movl         8(%ebx),%ebx
 lea       1(%ebx),%ebx
 imull $    8, %ebx,%ebx
 movw %bx,        14(%eax)#STOREWR
; #133
 movl         -32(%ebp),%eax
 movl  $    0,         16(%eax)
; #134
 movl         -32(%ebp),%eax
 movl  $    3780,         24(%eax)
; #135
 movl         -32(%ebp),%eax
 movl  $    3780,         28(%eax)
; #136
 movl         -32(%ebp),%eax
 movl  $    0,         32(%eax)
; #137
 movl         -32(%ebp),%eax
 movl  $    0,         36(%eax)
; #138
; #141
 label121f7ffc8f5a9e:
spaceforinitbmpheaderl109 = 32
initbmpheaderl109exit:
	pop %edi
	pop %esi
	pop %ebx
	leave
 	ret $0
.section .text  
; #procedure generated by code generator class ilcg.tree.gnuP4CG
label121f7ffca57acc:
#	 unit$graphio
# entering a unit at lexical level 0
unit$graphio:
 enter  $0,$0
	push %ebx
	push %esi
	push %edi
 call unit$system
cmpb $1,unit$graphioready
 jnz unit$graphioinit
 jmp unit$graphiol110exit
unit$graphioinit:movb $1, unit$graphioready
 label121f7ffc8f1a96:
spaceforunit$graphiol110 = 0
unit$graphiol110exit:
	pop %edi
	pop %esi
	pop %ebx
	leave
 	ret $0
	.section .bss
	.align 4
	.space 0
	.align 4
 unit$graphio$base:
	.section .data
unit$graphioready: .byte  0
 label121f7ffc8fbaae:
 .byte  0
 label121f7ffc8fbaac:
 .byte  0
 label121f7ffc8fbaaa:
 .byte  0
 label121f7ffc8fbaa8:
 .byte  0
 label121f7ffc8fbaa6:
 .byte  0
 label121f7ffc8fbaa4:
 .byte  0
 label121f7ffc8fbaa2:
 .byte  0
 label121f7ffc8fbaa0:
 .byte  0
 label121f7ffc99bac4:
 .short   10
 .short   99
 .short   97
 .short   110
 .short   116
 .short   32
 .short   111
 .short   112
 .short   101
 .short   110
 .short   32
 label121f7ffc9c1ac6:
 .short   30
 .short   32
 .short   56
 .short   32
 .short   98
 .short   105
 .short   116
 .short   32
 .short   98
 .short   109
 .short   112
 .short   32
 .short   102
 .short   105
 .short   108
 .short   101
 .short   115
 .short   32
 .short   110
 .short   111
 .short   116
 .short   32
 .short   115
 .short   117
 .short   112
 .short   112
 .short   111
 .short   114
 .short   116
 .short   101
 .short   100
.include "/users/staff/wpc/src/VectorPascal/mmpc/systemgnuP4.asm"
.endif
