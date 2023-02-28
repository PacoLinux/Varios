
/* ------------------------------------------------------------------------------------------------------
                                          tree transformation rules 
   ------------------------------------------------------------------------------------------------------*/
transformer pattern repscalar ( any i,any v)
        /* this specifies that any scalar must be replicated Rvec times in the parallel version */
		means[(ieee32) v]
		returns[rep( v.in,Rvec)] 
		precondition [ NOT( CONTAINS(v.in, i.in))];
transformer pattern indbare(any i)means[^(i)]returns[^(i.in)];
transformer pattern ind64 (any i, indbare ib)means[EXTEND(ib[i])] returns[EXTEND(ib.out)];
pattern optext means[indbare|ind64];
transformer pattern bscaledindex(any i,optext b)
	means[*(b[i],4)]
	returns[*(b.in,4)];
transformer pattern escaledindex(any i, bscaledindex b)
	means[EXTEND(b[i])]
	returns[EXTEND(b.in)]; 
pattern vscaledindex; /* declared forward here */
transformer pattern indexplusreg(any i,any r, vscaledindex j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[+( j[i],r)]
        returns[+(  j.in,r.in)]
        precondition [ NOT( CONTAINS(r.in, i.in))];
pattern vscaledindex means[escaledindex|bscaledindex|indexplusreg|optext]/*|revindexdyad]*/;
transformer pattern vecdestr(any i,any r, vscaledindex j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[(ref ieee32)mem((addrtype)+(r, j[i]))]
        returns[mem(+(  j.in,r.in),  ieee32 vector(Rvec))]
        precondition [ NOT( CONTAINS(r.in, i.in))];
transformer pattern vecdesti(any i,any r, vscaledindex j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[(ref int32)mem((addrtype)+(r, j[i]))]
        returns[mem(+(  j.in,r.in),  int32 vector(Rvec))]
        precondition [ NOT( CONTAINS(r.in, i.in))];       
transformer pattern vecdestc(any i,any r, vscaledindex j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[(ref int8)mem((addrtype)+( j[i],r))]
        returns[mem(+(  j.in,r.in),  int8 vector(Rvec))]
        precondition [ NOT( CONTAINS(r.in, i.in))];    
pattern vecdest means [vecdestr |vecdesti|vecdestc]; 
transformer pattern  vecsrcr(any i,vecdest d)
	means[(ieee32)^(d[i])]
	returns [(ieee32 vector (Rvec))^(d.out)];
transformer pattern  vecsrci(any i,vecdest d)
	means[(int32)^(d[i])]
	returns [(int32 vector (Rvec))^(d.out)];
transformer pattern  vecsrcc(any i,vecdest d)
	means[(int8)^(d[i])]
	returns [(int8 vector (Rvec))^(d.out)];
pattern vecsrc means [vecsrcr |vecsrci|vecsrcc];

transformer pattern vectorisablalternatives;
operation subs means -: assembles[ 'subs'];
operation adds means +: assembles[ 'adds'];
pattern aoperator means[operator|adds|subs];
transformer pattern vectorisabledyad(any i,vectorisablalternatives a,vectorisablalternatives b,aoperator op)
	means[op(a[i],b[i])]
	returns [op.in(a.out,b.out)];
transformer pattern vectorisablemonad(any i,vectorisablalternatives a, operator op)
	means[function op(a[i])]
	returns [function op.in(a.out)];
 
transformer pattern castalternativer(any i, vectorisabledyad a)
	means[(ieee32) a[i]]
	returns [(ieee32 vector (Rvec))a.out];
transformer pattern castalternativei(any i, vectorisabledyad a)
	means[(int32) a[i]]
	returns [(int32 vector (Rvec))a.out];
transformer pattern castalternativec(any i, vectorisabledyad a)
	means[(int8) a[i]]
	returns [(int8 vector (Rvec))a.out];

pattern castalternative means[castalternativer | castalternativei | castalternativec];
pattern vectorisablalternatives means[ vecsrc|vectorisabledyad|castalternative|vectorisablemonad|repscalar];
transformer pattern vectorisablefor ( any i, any  start, any   finish,   vecdest lhs,vectorisablalternatives rhs)
	means[for (ref int32)i:=start to finish step 1 do
              lhs[  i   ] := rhs[ i ] ]
    returns[statement(for i.in:=  +(+(-(*(div(+(1,-(finish.in,start.in)), Rvec), Rvec  ),1), start.in),1)  
                      to finish.in step 1 do lhs.in := rhs.in ,
                for i.in:= start.in to +(-(*(div(+(1,-(finish.in,start.in)), Rvec), Rvec  ),1), start.in) step Rvec do
                lhs.out:=rhs.out 
             )]; 

transformer [vectorisablefor]; 
