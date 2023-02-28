unit nametab;
{ Part of the compiler toolbox concerned with generating
  an OS/2 exe file
  Author P Cockshott}
{ this is a unit that maintains:
   -- the resident name table of a dll
          the exported procedure names etc of current module
   -- the entry table
          the offsets within segment of
   -- the module reference table

   -- the imported names table

   we will not use the features of the non resident names table

   The exe file format is documented in 'Advanced OS/2 programming' from
   Microsoft Press
}interface

 uses segtab,riscasm,lists,files;
 const
      offset8=0;
      segment16=2;
      farpointer32=3;
      offset16=5;
      farpointer48=11;
      offset32=13;
type
    string80=string[80];
    reloctable =object
               entries:list;           reloccount:integer;
               constructor mkreloctable;
               procedure addentry(reltype:integer;relocoffset:labels;
                                  modref,nameoffs:integer);
               procedure dump(f:bytefileobjp);
               destructor freereloctable;
               end;
    nametable = object
                imports,exports:list;
                exportnum,importnum,exportbytes,
                modulecount,importbytes:integer;
              constructor mknametable;
              procedure exportname(
                        var name:string80;
                            stackwords,segno:longint;
                            offset:labels
                              );
                        { call to export an entry point }

              procedure importname(
                            ismodule:boolean;
                        var name:string80; var token:integer);
                        { call to get a token for the imported name
                          which can be used in reloc table }

              procedure tablesizes(
                        var residentnames,modulereference,
                            importednames,entrytable,
                            nonresidentnames:integer);
                         { call to find out how big the
                           tables will be
                           these sizes are expressed in multiples
                           of unitsize bytes
                           }

              procedure dumptables(f:bytefileobjp);
              destructor freenametable;
              end;





implementation
type  export=object(cell)
              name:string80;
              stackwords,segno:longint;
              offset:labels;
              constructor mkexport(n:string80;w,s:longint;o:labels);
              end;
       relocentry= object(cell)
                   reltype,modnum,nameoffs:integer;
                   relentryoffs:labels;
                   constructor mkrelocentry( rt:integer;
                                             re:labels;
                                             mn,no:integer);
                   end;



       relocentryp=^relocentry;
       exportp=^export;
       import=object(cell)
               name:string80;
               modindex,nameoffs:integer; ismodule:boolean;
              constructor mkimport(ismod:boolean;n:string80;m, o:integer);
              end;
       importp=^import;

       constructor export.mkexport;
       begin
            name:=n;stackwords:=w;segno:=s;offset:=o;
       end;
       constructor import.mkimport;
       begin
          name:=n;nameoffs:=o;ismodule:=ismod;   modindex:=m;
       end;


       destructor nametable.freenametable;
       begin
            if exports<>nil then dispose(exports,destroy);
            if imports<>nil then dispose(imports,destroy);
       end;
       procedure outstring(str:string80;f:bytefileobjp);
       var i :integer;
           b : byte;
       begin
            for i:=0 to length(str) do begin
              b:=ord(str[i]);
              f^.putbyte(b);
            end;
       end;
       procedure outword(w:integer;f:bytefileobjp);
       var b:byte;
       begin
           b:=w and 255;
           f^.putbyte(b);
           b:=w shr 8;
           f^.putbyte(b);
       end;

      procedure reloctable.dump;
          procedure outentry(e:list);
          var rp:relocentryp;b:byte;
          begin
            if e<> nil then with relocentryp(e^.hd)^ do begin
              b:= reltype;f^.putbyte(b);
              b:=2;f^.putbyte(b);
              outword(relentryoffs^.value,f);
              outword(modnum,f);
              outword(nameoffs,f);
              outentry(e^.tl);
            end;
          end;
       begin
            outword(reloccount,f);
            outentry(entries);
       end;
       procedure nametable.dumptables;
        function outrntname(var c:list):integer;
        var num:integer;
        begin if c<>nil then begin
          num:=outrntname(c^.tl);
          outstring(exportp(c^.hd)^.name,f);
          outword(num,f);
          outrntname:=num+1;
        end else outrntname:=0 end;

        procedure outrntentry(var c:list);
        var b:byte;
        begin if c<>nil then begin
          outrntentry(c^.tl);
          b:=1{exported}+(8*exportp(c^.hd)^.stackwords);
          f^.putbyte(b);
          b:=$cd;f^.putbyte(b);
          b:=$3f;f^.putbyte(b);
          b:=exportp(c^.hd)^.segno;f^.putbyte(b);
          outword(exportp(c^.hd)^.offset^.value,f);
        end end;
        procedure outmodentry(var c:list);
        var num:integer;
        begin if c<>nil then begin
          outmodentry(c^.tl);
          if importp(c^.hd)^.ismodule
          then outword(importp(c^.hd)^.nameoffs,f);
        end end;
        procedure outimpnames(var c:list);
        var num:integer;
        begin if c<>nil then begin
          outimpnames(c^.tl);
          outstring(importp(c^.hd)^.name,f);
        end end;

        var        entries,mark:byte;
       begin

          entries:=outrntname(exports);
          mark:=0;
          f^.putbyte(mark);{ end of resident name table marker }
          outmodentry(imports);
          outimpnames(imports);
          f^.putbyte(entries);
          entries:=$ff;
          f^.putbyte(entries);
          outrntentry(exports);
       end;

       procedure nametable.tablesizes(
                        var residentnames,modulereference,
                            importednames,entrytable,
                            nonresidentnames:integer);
       begin
            residentnames:=(exportbytes+2*exportnum)+1;{ the +1 is for the
                                                         terminating string
                                                         length for the last
                                                         nonexistent string }
            importednames:=importbytes;
            modulereference:=(modulecount-1)*2;
            nonresidentnames:=0;
            entrytable:=exportnum*6 +2;{ assume only one module in file}
       end;
       constructor nametable.mknametable;
       begin
            imports:=nil;exports:=nil;
            exportnum:=0;importnum:=0;
            exportbytes:=0;      modulecount:=1;
            importbytes:=0;
       end;
       constructor reloctable.mkreloctable;
       begin
            entries:=nil ;reloccount:=0;
       end;
       procedure nametable.exportname;
       var e:^export;
       begin
            new(e,mkexport(name,stackwords,segno,offset));
            new(exports,cons(e,exports));
            exportnum:=exportnum+1;
            exportbytes:=length(name)+1+exportbytes;
       end;
       procedure nametable.importname;
       var i:^import;
           l:list;
           add,found:boolean;
       begin
            add:= imports=nil;
            if not add then begin
               l:=imports;
               found:=false;
               while (l<>nil) and not found do begin
                  found:= importp(l^.hd)^.name=name;
                  if found then begin
                     if not ismodule then
                        token:=importp(l^.hd)^.nameoffs
                     else
                        token:=importp(l^.hd)^.modindex;
                  end else
                  l:=l^.tl;
               end;
               add:=not found;
            end;
            if  add then begin
                 if ismodule then token :=modulecount
                 else token:=importbytes;
                 new(i,mkimport(ismodule,name,modulecount,token));
                 l:=imports;
                 new(imports,cons(i,l));
                 importnum:=importnum+1;
                 if ismodule then modulecount:=succ(modulecount);
                 importbytes:=importbytes+1+length(name);
            end;
      end;
      procedure reloctable.addentry;
      var e:^relocentry;
      begin
           new(e,mkrelocentry(reltype,relocoffset,
                                  modref,nameoffs));
           new(entries,cons(e,entries));
           reloccount:=reloccount+1;
      end;
      destructor reloctable.freereloctable;
      begin
           if entries<>nil then entries^.destroy;
      end;
      constructor relocentry.mkrelocentry(rt:integer;re:labels;mn,no:integer);
      begin
           reltype:=rt;relentryoffs:=re;modnum:=mn;nameoffs:=no;
      end;
end.