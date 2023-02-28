program exefile;
{ Part of the compiler toolbox concerned with generating
  an OS/2 exe file
  Author P Cockshott}
{ this is a program that outputs a new exe file for test purposes

   The exe file format is documented in 'Advanced OS/2 programming' from
   Microsoft Press
}

 uses riscasm,symstk,nametab,files,linkstk;


 const ismodule=true;
       isntmodule=false;
var
    lt:linkablep;
    sp:sstk;
    procedure start;
    begin

       new(lt,mklinkable(0));
       lt^.pushint(3);
    end;
    procedure test;
    var nom:string80;n,mr,r,m,i,e,nr:integer;
        f:bytefileobjp;
        lab:labels;
        endaddr:longint;
    begin
      lt^.declareEntry('test',0);
      lt^.callbyname('DOSCALLS','DosExit');
         new(f,open('test.exe',1));
         linkable(lt^).
         startpass2(f,endaddr);

    end;
    procedure finish;
    begin
         lt^.freelinkable;
    end;
begin
start;
writeln('started');
test;finish;
readln;
end.