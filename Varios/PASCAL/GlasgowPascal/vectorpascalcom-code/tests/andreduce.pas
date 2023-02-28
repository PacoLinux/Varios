program andreduce;
const
	s:array[1..4] of string[8]=('dog','fish','bee','beans');
    i:array[1..4] of integer=(1,2,3,4);
    r:array[1..4] of real=(0.5,1.0,2.0,4.0);
	b:array[1..4] of boolean=(false,true,false,true);
 
begin
	 
	{write (b,i and b, r and b);}
	write(s:12, (s and b):12 );
	 
end.
	
