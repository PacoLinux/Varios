.ifndef PPCmacros
.set PPCmacros,YES
.set r0,0
.set r1,1
.set r2,2
.set r3,3
.set r4,4
.set r5,5
.set r6,6
.set r7,7
.set r8,8
.set r9,9
.set r10,10
.set r11,11
.set r12,12
.set r13,13
.set r14,14
.set r15,15
.set r16,16
.set r17,17
.set r18,18
.set r19,19
.set r20,20
.set r21,21
.set r22,22
.set r23,23
.set r24,24
.set r25,25
.set r26,26
.set r27,27
.set r28,28
.set r29,29
.set r30,30
.set r31,31
.set LR , 0
.set SP , 1
.set TMPREG , 30
.set FP , 31
.set f0,0
.set f1,1
.set f2,2
.set f3,3
.set f4,4
.set f5,5
.set f6,6
.set f7,7
.set f8,8
.set f9,9
.set f10,10
.set f11,11
.set f12,12
.set f13,13
.set f14,14
.set f15,15
.set f16,16
.set f17,17
.set f18,18
.set f19,19
.set f20,20
.set f21,21
.set f22,22
.set f23,23
.set f24,24
.set f25,25
.set f26,26
.set f27,27
.set f28,28
.set f29,29
.set f30,30
.set f31,31
.macro floadr v
.section .data
1: .double \v
.section .text
lis 28,1b@ha
la 27,1b@l(28)
lfd 30,0(27)
#fmr \f,9
.endm

.macro loadint v
.section .data
2: .long \v
.section .text
lis 28,2b@ha
la 27,2b@l(28)
lwz 30,0(27)
.endm

.macro loadintr r,v
.section .data
2: .long \v
.section .text
lis 28,2b@ha
la 27,2b@l(28)
lwa \r,0(27)
#lwz 30,0(27)
#mr \r,30
.endm

.macro loadd v
.section .data
2: .long long \v
.section .text
lis 28,2b@ha
la 27,2b@l(28)
ld 30,0(27)
.endm

.macro loads v
.section .data
2: .short \v
.section .text
lis 28,2b@ha
la 27,2b@l(28)
lhz 30,0(27)
.endm

.macro fload v
.section .data
2: .float \v
.section .text
lis 28,2b@ha
la 27,2b@l(28)
lfs 4,0(27)
.endm

.macro dloadr f,v  
.section .data
3: .double \v
.section .text
lis 28,3b@ha
la 27,3b@l(28)
lfd \f,0(27)
#lfd 29,0(27)
#fmr \f,29
.endm

.macro sloadr f,v  
.section .data
3: .float \v
.section .text
lis 28,3b@ha
la 27,3b@l(28)
lfs \f,0(27)
#lfs 29,0(27)
#fmr \f,29
.endm

.macro iload v r  
.section .data
4: .long \v
.section .text
lis 28,4b@ha
la 27,4b@l(28)
ld 9,0(27)
fmr \r,9
.endm

.macro fsins f
.section .text
fmr 1,\f
bl sin
#fmr \f1,1
.endm

#.macro fsins s
#.section .data
#5: .float \s
#.section .text
#lis 9,5b@ha
#la 10,5b@l(9)
#lfs 1,0(10)
#bl sin
##fmr \f1,1
#.endm

.macro fcoss v
.section .data
6: .double \v
.section .text
lis 9,6b@ha
la 10,6b@l(9)
lfd 1,0(10)
bl cos
#fmr 0,1
.endm
.macro ftans f
.section .data
7: .double \v
.section .text
lis 9,7b@ha
la 10,7b@l(9)
lfd 1,0(10)
bl tan
#fmr 0,1
.endm

.macro unalignload reg base offset
.section .text
	.if ( \offset & 3) != 0
		li 30,\offset
		andi. 30,30,3
		neg 30,30
		addi 30,30,4
		addi 30,30,\offset
		#neg 30,30
		add 30,30,\base
		lwz \reg,0(30)
	.else
		lwz \reg,\offset(\base)
	.endif
.endm
.macro unalignstore reg base offset
.section .text
	.if ( \offset & 3) != 0
		li 30,\offset
		andi. 30,30,3
		neg 30,30
		addi 30,30,4
		addi 30,30,\offset
		#neg 30,30
		add 30,30,\base
		stw \reg,0(30)
	.else
		stw \reg,\offset(\base)
	.endif
.endm
.endif
