unit bloomfilter;
(*! This unit provides a set of library routines for creating and manipulating
    index-sets for indexing the words in documents. *)
interface
const maxhash=1023;
     bloomdepth=8;
(*! The above constants control overall dimensions of the index-sets. {\sf Maxhash} defines
    highest ordinal number in the set, {\sf bloomdepth} defines how many index sets are
    to be used for each file *)
type hashcode =0..maxhash;
     bloomrange = 1..bloomdepth;
     filter = set of hashcode;
     (*! A {\sf filter} is a single index set, these are then 
         grouped into a :*)
     bloom = array[bloomrange] of filter;
     (*! A lexeme will be hashed to a hash vector, a vector of independently computed
         hash codes *)
     hashvector = array [bloomrange] of integer;
     (*! Each text file is then described by a {\sf filefilter} which encodes information
     about the words in the file along with the filename *)
     filefilter = record
		wordset:bloom;
		filename:string;
     end;
     procedure hashword(var theword:string; var codes:hashvector);
     procedure setfilter(var theword:string; var f:bloom);
     function testfilter(var theword:string; var f:bloom):boolean;
implementation
     
     procedure hashword(var theword:string; var codes:hashvector);
     (*! This procedure performs parallel hashes on {\sf theword} to yield a 
         a vector of hashcodes in {\sf codes}. It uses for this purpose
         the vector of prime numbers: *)
     const primes:array[bloomrange] of integer=(7,11,13,17,19,23,29,31);
     var i,l:integer;j:hashcode;
     begin
	l:=length(theword);
	codes:=0;
	for i:= 1 to l do
	begin
		j:=ord(theword[i]); 
		(*! The following line has the effect of computing the
                polynomials 
		$$c_1p_1^{l-1}+c_2p_1^{l-2}...+c_{l-1}p_1+c_l$$ 
		$$c_1p_2^{l-1}+c_2p_2^{l-2}...+c_{l-1}p_2+c_l$$ 
		$$c_1p_3^{l-1}+c_2p_3^{l-2}...+c_{l-1}p_3+c_l$$
		etc\\ 
		where
                $c_j$ is the $j$th character in the string and
		$p_i$ is the $i$the prime in the vector of primes.
                Where the instructionsets allow it will be computed
		in parallel. *)  
		codes:= codes*primes+j;
	end;
	(*! Constrain the result to be in the appropriate range *)
	codes:= codes and maxhash;
     end;
     procedure setfilter(var theword:string; var f:bloom);
	(*! Compute the hash vector for the word and insert the
            hashed elements into all of the filters in the bloom. *)
     var codes:hashvector;
	i:integer;
     begin
	hashword(theword,codes);  
	f:=f+[codes];
     end;
     function testfilter(var theword:string; var f:bloom):boolean;
    (*! Compute the hash vector for the word and test if the 
        coresponding elements are present in all the filters of the bloom. 
        Note the use of and-reduction on the vector of booleans that
        results from the expression {\sf codes in f}.*)
     var codes:hashvector;
     begin
	hashword(theword,codes);
	testfilter:=\and(codes in f);	
     end;
begin
end. 
    

