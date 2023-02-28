


/* ------------------------------------------------------------------------------------------------------
                                          tree transformation rules 
   ------------------------------------------------------------------------------------------------------*/
pattern val32 means[int32|ieee32];

pattern scalarint means[int32];

transformer pattern repiota(any i)
	means[(int32)^(i)]
	returns [+(rep(^(i.in),8),RANGE(0,7))];
	
transformer pattern repscalar ( any i,any v, val32 t)
        /* this specifies that any scalar must be replicated 8 times in the parallel version */
		means[(t) v]
		returns[rep( v.in,8)] 
		  /* leave this out for now */
		      precondition [ NOT( CONTAINS(v.in, i.in))]; 
		
transformer pattern indbare(any i)means[^(i)]returns[^(i.in)];

transformer pattern ind64 (any i, indbare ib)means[ ib[i] ] returns[ ib.out ];

pattern optext means[indbare|ind64];

transformer pattern ind32(any i,any a)/* removes extends from any int32s */
		means[ a ] returns[a.in];
	
transformer pattern not4index(any i ,ind32 b, scalarint s)
		means[*(b[i],   s)]
		returns [ *(*((int32 vector(8))+(rep(b.out,8),RANGE(0,7)),(int32 vector(8))rep((int32)div(s.in,4),8)),4)]
		precondition[CONTAINS(b.in,i.in)];
	
transformer pattern bscaledindex(any i,optext b)
		means[*(b[i],4)]
		returns[*(b.in,4)];
	
pattern vscaledindex; /* declared forward here */

transformer pattern indexplusreg(any i,any r, vscaledindex j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[+( j[i],r)]
        returns[+(  j.out,r.in)]
        precondition [ NOT( CONTAINS(r.in, i.in))];
  
pattern vscaledindex means[ bscaledindex|indexplusreg]/*|revindexdyad]*/;

transformer pattern vecdesti(any i,any r, vscaledindex j)
/* this rule recognises addresses that can be readily converted to vector addresses */
		means[(ref int32)mem((int32)+(r, j[i]))]
		returns[mem(+(  j.in,r.in),  int32 vector(8))]
		precondition [ NOT( CONTAINS(r.in, i.in))];
 
transformer pattern vecdestr(any i,any r, vscaledindex j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[(ref ieee32)mem((int32)+(r, j[i]))]
        returns[mem(+(  j.out,r.in),  ieee32 vector(8))]
        precondition [ NOT( CONTAINS(r.in, i.in))];
        
pattern vecdest means[vecdestr  | vecdesti];

pattern gatheralt;

transformer pattern  gatherindex(any i, any r)
		/* this recognises indices that are themselves vectors */
		means[(int32)^(mem((int32)+(r, *( ^(i) ,4))))]
		returns[ ^(mem(+(   *(^(i.in),4),r.in), int32 vector(8)))]
		precondition [ NOT( CONTAINS(r.in, i.in))];
	
transformer pattern gatherdyad(any i,any r, gatheralt j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[+( j[i],(int32)r)]
        returns[+(  j.out,rep(r.in,8))]
        precondition [ NOT( CONTAINS(r.in, i.in))];
        
transformer pattern vectorisablalternatives;

pattern gatheralt means[gatherindex| gatherdyad|vectorisablalternatives ];

transformer pattern gatherreca (any i, gatheralt j)
        means[*((int32) j[i] ,4)]
        returns[*(  j.out ,4)];
        
pattern gatherrecb;

transformer pattern gatherrecc(any i, any r, gatherrecb j)
		means[+(j[i],r)]
		returns[+(j.out,r.in)]
		precondition [ NOT( CONTAINS(r.in, i.in))];
	
pattern gatherrecb means[gatherrecc | gatherreca/*|not4index*/];

transformer pattern gatheredsrcr(any i , any r, gatherrecb j)
        means[(ieee32)^(mem(+(j[i],r)))]
        returns[^(mem(+(r.in,   j.out),ieee32 vector(8)))]
		precondition [ NOT( CONTAINS(r.in, i.in))];
	
transformer pattern gatheredsrcrev(any i , any r, gatherrecb j)
        means[(ieee32)^(mem(+(r,j[i])))]
        returns[^(mem(+(r.in,   j.out),ieee32 vector(8)))]
		precondition [ NOT( CONTAINS(r.in, i.in))];    
		  
transformer pattern gatheredsrci(any i , any r, gatherrecb j)
        means[(int32)^(mem(+(j[i],r)))]
        returns[^(mem(+(r.in,   j.out),int32 vector(8)))]
        precondition [ NOT( CONTAINS(r.in, i.in))];
        
pattern gatheredsrc means[gatheredsrcr|gatheredsrcrev|gatheredsrci];
        
transformer pattern  vecsrcr(any i,vecdest d)
		means[(ieee32)^(d[i])]
		returns [(ieee32 vector (8))^(d.out)];
		
transformer pattern  vecsrci(any i,vecdest d)
        means[(int32)^(d[i])]
        returns [(int32 vector (8))^(d.out)];
        
pattern vecsrc means [vecsrcr |vecsrci];

transformer pattern vectorisabledyad(any i,vectorisablalternatives a,vectorisablalternatives b,operator op)
		means[op(a[i],b[i])]
		returns [op.in(a.out,b.out)];
		
transformer pattern vectorisablemonad(any i,vectorisablalternatives a, operator op)
		means[function op(a[i])]
		returns [function op.in(a.out)];
        
transformer pattern castalternativer(any i, vectorisabledyad a)
        means[(ieee32) a[i]]
        returns [(ieee32 vector (8))a.out];
        
transformer pattern castalternativei(any i, vectorisablalternatives a)
		means[(int32) a[i]]
		returns [(int32 vector (8))a.out];

       
pattern castalternative means[castalternativer | castalternativei];

pattern vectorisablalternatives means[vecsrc|vectorisabledyad|vectorisablemonad|castalternativer|gatheredsrc| repscalar|repiota];

transformer pattern vectorisablefor ( any i, any  start, any   finish,   vecdest lhs,vectorisablalternatives rhs)
		means[for (ref int32)i:=start to finish step 1 do
              lhs[  i   ] := rhs[ i ] ]
		returns[statement(for i.in:=  +(+(-(*(div(+(1,-(finish.in,start.in)), 8), 8  ),1), start.in),1)  
                      to finish.in step 1 do lhs.in := rhs.in ,
                for i.in:= start.in to +(-(*(div(+(1,-(finish.in,start.in)), 8), 8  ),1), start.in) step 8 do
                lhs.out := rhs.out 
		)]; 
  
 
 
transformer [vectorisablefor ]; 
