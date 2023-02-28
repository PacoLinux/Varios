/* {PowerPC floating-Point instructions} */



pattern 	bfaddrmode 		means	[maddrmode];  
pattern 	hfaddrmode 		means	[maddrmode];
pattern 	wfaddrmode 		means	[maddrmode];
pattern 	qfaddrmode 		means	[maddrmode];


/* instructions for extending with zero's to 64-bits */

instruction pattern WMOVZXB(reg r, bfaddrmode rm, wordupto64 t)
	means [r := EXTEND((uint8)^(rm))]
	assembles ['lbz ' r ',' rm];


instruction pattern WMOVZXHW(reg r, hfaddrmode rm, wordupto64 t)
	means [r := EXTEND((uint16)^(rm))]
	assembles ['lhz 'r','rm];
	
instruction pattern PLANTLABEL( label l) 
	means[loc l] 
	assembles[ '.quad ' l];

pattern FLN(anyfreg f1,anyfreg f2,real t)
	means[(ref t) f1:=(t)LN((t)f2)] 
	assembles['nop'];

instruction pattern INTABS(anyreg r)
        means[ r:=ABS(^(r))]
		assembles['cmpwi ' r ',0'
				  '\n bge  1f' 
 				  '\n neg	' r ',' r
 				  '\n 2: nop'];


