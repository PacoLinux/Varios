program bugprog;
uses bugunit;
var
   x:integer;

        type bytearray= array[0..255] of byte;
             pbytearray=^bytearray;

        { Convert strings returned from C into Vector Pascal strings }
	function StrPas(Src: PChar): String;
	var
	  S : String;i,l:integer;
          c: char;
	  b:pbytearray;
          cheat:record 
	        case boolean of
                true:(a:pchar);
                false:(b:pbytearray);
		end;
	begin
	  cheat.a:=src;
	  b:=cheat.b;
          l:=strlen(src);
	  l:= l min 255;
	  S[0]:=l;
          for i:=1 to l do s[i]:= chr(b^[i-1]);
	  StrPas := S;
	end;

begin
   x:=1;
end.
