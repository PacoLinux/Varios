program Test;
uses { math,testunary,heaptest,iotest,}vectests{,math};    (*  *)
 type textline=string[80];

 var r,z:real;
     line:textline;
     i:integer;
     b:boolean;

     x1,x2:0..255;
     myfile:file of char;
	
const

  h: Array[0..15] of Char = ( '0', '1', '2', '3', '4', '5', '6', '7',
                              '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
       
type string2=string[2];
	
procedure HexByte( a: Byte);var hb: string2;
b:byte;
Begin
  
  hb := H[ a shr 4 and $f] +  H[ a and $f];
End;   {  }
begin
writeln('test vectors');
 dovectest;
 {doheaptest;
 gctest;  }
 writeln('test scalars');
{ unaries;}
 
end.
 
