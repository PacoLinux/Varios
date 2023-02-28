program secttest;
uses lines,sections,streams;
var sec,sec2:section;t:textstream;l:textline;v:boolean;
begin
 new(sec,open('test5',true));
 sec^.addpart('Pascal',openfilestream('secttest.pas'));
 t:=sec^.part('Pascal');
 while  not t^.atendofstream do begin
        if t^.getline(l) then
        writeln(l);
        end;
 sec^.createsection('chapter 1');
 sec2:=sec^.subsection('chapter 1', v);
 writeln(v);
 dispose(t,freestream);
 t:=sec2^.part('The Index');
 while  not t^.atendofstream do begin
        if t^.getline(l) then
        writeln(l);
        end;
 
end.
               name:textline;
               constructor open(n:textline);
               destructor  freesection;virtual;
               function subsection(n:textline;var valid:boolean):section;
                        virtual;
               function part(n:textline):textstream;virtual;
               function owner:section;virtual;
               procedure addpart(n:textline; body:textstream);virtual;
               procedure createsection(n:textline);virtual;