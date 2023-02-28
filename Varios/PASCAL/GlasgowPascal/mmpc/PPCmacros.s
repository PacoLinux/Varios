.ifndef PPCmacros
.set PPCmacros,YES


.macro fload p1 
.section   .data
	1: .float \p1
.section   .text
  	fmr 1b,\p1
.endm


.macro dload p1 
.section   .data
	1: .double \p1
.section   .text
  	fmr 1b,\p1
.endm

.macro iload p1  
.section   .data
	1: .long \p1
.section   .text
  	mr 1b,\p1
.endm

.macro FSIN r1 p2
.section .data
	1: .float \p2
.section .text
	fmr 1,1b
	bl sin
	fmr r1,1
.endm

.macro FCOS p1 p2
.section .data
	1: .float \p2
.section .text
	fmr 1,1b
	bl cos
	fmr p1,1
.endm

.macro FTAN p1 p2
.section .data
	1: .float \p2
.section .text
	fmr 1,1b
	bl tan
	fmr p1,1
.endm

.macro FFSQRT p1 p2
.section .data
	1: .float \p2
.section .text
	fmr 1,1b
	bl fsqrts
	fmr p1,1
.endm

.macro FDSQRT p1 p2
.section .data
	1: .float \p2
.section .text
	fmr 1,1b
	bl fsqrt
	fmr p1,1
.endm

.macro ABSF p1 p2
.section .data
	1: .float \p2
.section .text
	fmr 1,1b
	bl fabs
	fmr p1,1
.endm

.macro loadl p1 p2
.section .data'
	 1: .long \p2
.section .text'
	 ld p1,1
.endm
	 
.endif
