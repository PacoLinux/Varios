unit files ;
interface uses lists;
type
    fname=string[80];
    bytefileobjp= ^ bytefileobj ;

    bytefileobj=object(cell)
                bfile:file of byte;
                constructor open(filename:fname;dir:integer);
                            { opens the file for reading if dir =0 }
                            { else for writing }
                function size:integer;virtual;
                procedure putbyte(b:byte);virtual;
                procedure fseek(pos:longint);virtual;
                procedure putword(w:longint);virtual;
                destructor destroy;virtual;
                end;
implementation
function bytefileobj.size;begin size:=filesize(bfile) end;
procedure bytefileobj.putbyte;begin write(bfile,b) end;
procedure bytefileobj.putword;
begin putbyte(w and 255);putbyte((w div 256)and 255) end;
procedure bytefileobj.fseek;begin seek(bfile,pos) end;
constructor bytefileobj.open;
begin
     newcell;
     assign(bfile,filename);
     if dir = 0 then reset(bfile) else rewrite (bfile);
end;
destructor bytefileobj.destroy;
begin
     close(bfile);
     cell.destroy;
end;
end.