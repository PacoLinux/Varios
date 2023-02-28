{  Vector Pascal Acceptance Test    }
{ file  conf556 }
{:tests  that word set types work }
program conf556;
type wordset = set of word;
      
 var ws:wordset;
     w1,w2:word;
     
begin
        w1:=1;w2:=600;
	ws:=[w1..w2];
	 
        ws:=ws-[3..498];
       
	if (499 in ws) and not (300 in ws)   
	then
        writeln('PASS CONF556 section 2.3.2  word set implementation') 
	else
	begin
        	writeln('FAIL CONF556 section 2.3.2   word set implementation');
	 
	end
end.
