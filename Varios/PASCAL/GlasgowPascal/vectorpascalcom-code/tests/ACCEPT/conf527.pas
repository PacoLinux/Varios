{  Vector Pascal Acceptance Test    }
{ file  conf527 }
{:tests  that extended set types work }
program conf527;
type wordset = set of word;
     realset = set of real;
     stringset = set of string[20];
 var  
     rs:realset;
     r:real;
     ss:stringset;
    s :string[20];
begin
       
	r:=1.1;
	rs:=[r,r+1,r+2.2]*[r];
        RS:=RS*[r];
 	s:='boy';
        ss:=[s];
	s:='home';
	ss:=ss+[s];
        ss:=ss*['boy'];
        
	if   ( r in rs) and not (3.3 in rs)
           and ('boy' in ss) and not ('home' in ss)  
	then
        writeln('PASS CONF527 section 2.3.2 extended set implementation') 
	else
	begin
        	writeln('FAIL CONF527 section 2.3.2 extended set implementation');
	 
	end
end.
