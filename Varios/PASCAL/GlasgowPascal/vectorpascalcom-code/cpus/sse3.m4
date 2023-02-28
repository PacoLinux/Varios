/* sse3 intsuctions */
instruction  pattern LDDQU( smaddrmode rm,xmreg r1)
        means[   r1 := ^(rm)]
    	assembles['lddqu  '    r1', ' rm];
    	
    	
define(sse3codes,LDDQU)

