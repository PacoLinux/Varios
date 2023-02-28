program iocheck;
var phi:text;
    s:string;
begin
	assign(phi,'message');
	reset(phi);
	if ioresult=0 then
	begin { file exists }
		read(phi,s);
		write('Message is:',s);
	end
	else  { error in opening file}
		write('Could not open message file');
end.
	      
	
