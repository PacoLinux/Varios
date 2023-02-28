Unit ppm;
 interface
(* This is a library to read in plain ppm files, that is to say ones that
are in ascii format with magic numbers P3 or P2 *)
const cannotopen=1;
      badmagicnumber=2;
      badrowscolsOrDepth=3;
type 
      image(maxplane,maxrow,maxcol:integer)=
        array[0..maxplane,0..maxrow,0..maxcol]of pixel;
      pimage=^image;
	  filename = string[79];

   var errorcode:integer;
   
procedure storeppmfile(s:filename;var im:image) ; 
procedure storeppmtostream(var f:text;var im : image); 

function loadppmfile(s:filename;var im:pimage):boolean ;

implementation
procedure storeppmfile(s:filename;var im:image);
var f:text; 
begin
	assign(f,s); 
	rewrite(f);
	storeppmtostream(f,im);
end;
procedure storeppmtostream(var f:text;var im: image);
var i,j:integer;
begin
	if im.maxplane=0 then
	begin
		writeln(f, 'P2');
		writeln(f,im.maxcol+1,'  ',im.maxrow+1);
		writeln(f,255);
		for i:=  im.maxrow downto 0 do
		for j:=0 to im.maxcol do
		begin
			writeln(f,pixel2byte(im[0,i,j]):4);
			 
		end;
		close(f);
	end;	
	if im.maxplane=2 then
	begin
		writeln(f, 'P3');
		writeln(f,im.maxcol+1,'  ',im.maxrow+1);
		writeln(f,255);
		for i:=  im.maxrow downto 0 do
		for j:=0 to im.maxcol do
		begin
			write(f,pixel2byte(im[2,i,j]):4,pixel2byte(im[1,i,j]):4,pixel2byte(im[0,i,j]):4);
			if( j rem 8 )=7 then writeln(f);
		end;
		close(f);
	end;		
end;
function loadppmfile(s:filename;var im:pimage):boolean ;
const nl=10;
type  
     symbol=string[24]; 
var f:file of byte; 
    rows,cols,depth,i,j,k:integer; 
	c:byte;
	 
	thesymbol:symbol;
	 procedure check;
	 var i:integer;
	 begin
	    i:=ioresult;
		if i  <> 0 then
		begin 
		writeln('io error on file read ', i);
		halt(i);
		end
	end;
	procedure nextsymbol(var s:symbol);
	var b:byte;
	 procedure skipcomment;
	 begin
	    while b<>nl do read(f,b)  ;
	    read(f,b);
	 end;
	
			
	begin
	   s:='';
	   read(f,b);check;
	   while b=nl do read(f,b);check;
	   while b=ord('#') do skipcomment;check;
	   while b=ord(' ') do read(f,b);check;
	   while (b >=ord('0') ) and (b<=ord('9')) do 
	   begin
		s:=s+ chr(b);
		read(f,b);check;
	   end;
	 end;  
	 function nextinteger:integer;
	 var I ,code :integer;
	 begin
		nextsymbol(thesymbol);
		Val (thesymbol,I,Code);
	    If Code<>0 then
	        nextinteger:= -1
	    else
	        nextinteger:=I;
	    
	  end;
	  function getparams:boolean;
	  begin
	     getparams:=true;
	     cols:=nextinteger;
	     if cols<=0 then getparams:=false;
	     rows:=nextinteger;
	     if rows<=0 then getparams:=false;
	     
	     depth:=nextinteger;
	     if depth<> 255 then getparams:=false;
	   end;
begin
        loadppmfile:=false; 
        assign(f,s);        
	    reset(f);        
        if ioresult <>0 then 
        begin   	
			 
			errorcode:=cannotopen;
	    end
	    else 
	    begin 
				read(f,c);check;
				if c=ord('P') then { first letter of magic number }
				begin
					read(f,c);check;
				    if c=ord('2') then { greyscale }
				    begin
				      if getparams then
				      begin
					      { monochrome image }
					      new(im,0,rows-1,cols-1);
					      for i:=  rows downto 1 do
					      for j:=1 to cols do
					      begin
					        c:=nextinteger;
					        im^[0,i-1,j-1]:=byte2pixel(c);
					      end;
					      loadppmfile:=true;
				      end else errorcode:=badrowscolsOrDepth
				    end
				    else if c=ord('3') then { colour }
				    begin
				      if getparams then
				      begin
					        { rgb image }				        
					        new(im,2,rows-1,cols-1);
					        for i:=rows downto 1 do
					        for j:=1 to cols do
					        for k:=2 downto 0 do
					        begin
					          c:=nextinteger;
					          im^[k,i-1,j-1]:=byte2pixel(c);
					        end;
					        loadppmfile:=true;
				      end else errorcode:=badrowscolsOrDepth
				    end
				    else if c=ord('5') then { grey
				     binary }
				    begin
				      if getparams then
				      begin
					        { grey image }				        
					        new(im,0,rows-1,cols-1);
					        for i:=rows downto 1 do
					        for j:=1 to cols do
					        
					        begin
					          read(f,c);
					          im^[0,i-1,j-1]:=byte2pixel(c);
					        end;
					        loadppmfile:=true;
				      end
				      end 
				    else if c=ord('6') then { colour binary }
				    begin
				      if getparams then
				      begin
					        { rgb image }				        
					        new(im,2,rows-1,cols-1);
					        for i:=rows downto 1 do
					        for j:=1 to cols do
					        for k:=2 downto 0 do
					        begin
					          read(f,c);
					          im^[k,i-1,j-1]:=byte2pixel(c);
					        end;
					        loadppmfile:=true;
				      end else errorcode:=badrowscolsOrDepth
				    end
				    else 
				    errorcode:=badmagicnumber;
				 end;
				 close(f);
		end;
end; {of loadppmfile }   
	    
		

begin
end.
