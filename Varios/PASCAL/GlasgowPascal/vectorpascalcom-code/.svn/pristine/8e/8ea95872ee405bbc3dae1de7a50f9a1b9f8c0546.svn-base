unit linkstk;
{$r+}
{ this unit provides a specialisation of the abstract
  type sstk that provides in addition the facilities
  to support os2 dynamic linking

}
interface uses symstk,nametab,files,riscasm,segtab;

const linkmaj=5;linkmin=1;
type  linkable =object(sstk)
                      rt:reloctable;
                      nt:nametable;
                      dataseglen:word;
                      segname:string[27];
                     constructor mklinkable(org:longint);
                     destructor freelinkable;
                     procedure callbyname(module,proc:string80); virtual;
                     procedure declareEntry(ent:string80;
                                            stackwords:integer);virtual;
                     procedure startpass2(
                            var objcode:bytefileobjp;
                            var finaladdr:longint); virtual;
                     end;
      linkablep = ^linkable;
implementation
const relocsize=8;
      winver=3;
constructor linkable.mklinkable;
begin
     sstk.startsstk(org);
     nt.mknametable;
     segname:='test.exe';
     rt.mkreloctable;
     dataseglen:=8;
end;
destructor linkable.freelinkable;
begin
    nt.freenametable;rt.freereloctable;
    sstk.destroy;
end;
procedure linkable.callbyname;
var mt,pt:integer;
    callstr:bytestring;
    l:labels;
begin
    { obtain tokens for the module and procedure names }
     nt.importname(true,module,mt);
         writeln('module name token=',mt);
     nt.importname(false,proc,pt);
     { plant direct intersegment call using 32bit far pointer }
     callstr:=chr($9a);
     plantbytes(callstr);
     { generate a label refering to the 32 bit pointer of the
       call instruction
     }
     l:=mklabel;plantlabel(l);
     { make an entry into the relocation table }
     rt.addentry(farpointer32,l,mt,pt);
     plantword(0);    { null call address filled in by dynamic linker }
end;
procedure linkable.declareentry;
var mt,pt:integer;
    callstr:bytestring;
    l:labels;
begin
     { generate a label refering to the entry
     }
     l:=mklabel;plantlabel(l);
    { obtain tokens for the module and procedure names }
     nt.exportname(ent,stackwords,codeseg,l);
end;

procedure linkable.startpass2(
                            var objcode:bytefileobjp;
                            var finaladdr:longint);
    const Tempcodefilename='code.tmp';
          stubfilename='stub.def';
    var codestart:integer;
        fsize,stublen,codelen:longint;
 { Old Exe Header }
    procedure OutputTempCodefile;
    var cf:bytefileobjp;
    begin
         new(cf,open(tempcodefilename,1));
         assemblersession.startpass2(cf,finaladdr);
         dispose(cf,destroy);
    end;
    function CopyToOutput(n:string80):longint;
      var b:byte;
          f:file of byte;
          tot:longint;
      begin
          tot:=0;
          assign(f,n);
          reset(f);
          while not eof(f) do begin
             read(f,b);
             tot:=succ(tot);
             objcode^.putbyte(b);
          end;
          close(f);
          CopyToOutput:=tot;
    end;
    Procedure OutputNewExeHeader;
    const Headerlen=$40;
    var header:record
                     case boolean of
                     true:(bytes:array[1..HeaderLen]of byte;);
                     false:(
                            n,e:char;
                            majver,minver:byte;
                            EntryTableOffset,
                            EntryTableLen:integer;
                            crc:longint;
                            modflags,
                            dgroupseg,
                            locheap,
                            StackSize,
                            IP,
                            StartSeg,
                            SP,
                            StackSeg,
                            NumSegs,
                            NumMRTEntries,
                            LenNRNT,
                            SegTabOffset,
                            ResTabOffset,
                            RNTOffset,
                            MRTOffset,
                            INTOffset:integer;
                            NRNTOffset:longint;
                            MovEnts,
                            Unitsize,
                            Numresources,
                            OperatingSystem:integer;);
                     end;
         i,rn,mr,int,et,nrn:integer;
    begin
        nt.tablesizes(rn,mr,int,et,nrn);
        with header do begin
             for i:=1 to headerlen do bytes[i]:=0;
             bytes[headerlen]:=winver;
             n:='N';e:='E';
             majver:=linkmaj;
             minver:=linkmin;
             entrytableoffset:=headerlen+rn+mr+ int+sizeof(segtable);
             entrytablelen:=et;
             crc:=0;
             modflags:=2+   { multiple dgroups }
                       {4+   { instance initialisation }
                       {0+   { real or protected }
                       { $20+ { contains 286 code }
                       { $40+ { contains 386 code }
                       {0+   { contains no 387 code }
                       $300+{ will run in window }
                       $0000{ program not dll };
             dgroupseg:=      dataseg;
             locheap:=        $200;
             stacksize:=      $c00;
             ip:=             0;     { prog starts at first instruction }
             startseg:=       codeseg;
             sp:=             0;
             StackSeg:=       dataseg;
             numsegs:=        maxseg;
             numMRTEntries:=  mr div 2;
             SegTabOffset:=   headerlen;
             ResTabOffset:=   SegTabOffset+sizeof(segtable);
             RNTOffset:=      ResTabOffset+0;
             MRTOffset:=      RNTOffset + rn;
             INTOffset:=      MRTOffset + mr;
             NRNTOffset:=     INTOffset + int+entrytablelen+stublen;
             movents:=        (et -2 ) div 6;
             Unitsize:=       0;   { unit is 2^0 = 1 byte }
             Numresources:=   0;
             OperatingSystem:=2;   { windows }
             codestart:=      NRNTOffset+1+length(segname)+
                              +3 { assume one string one entry and 0 byte};

             lenNRNT:=        codestart-NRNToffset;
             for i:=1 to headerlen do objcode^.putbyte(bytes[i]);

        end;
    end;
    procedure OutputNRNT;
    var i:integer;
    begin
         objcode^.putbyte(length(segname));
         for i:=1 to length(segname) do objcode^.putbyte(ord(segname[i]));
         for i:=1 to 3 do objcode^.putbyte(0);
    end;
    procedure OutputSegmentTable;
    var st:record
           case boolean of
           true :(bytes:array[1..60] of byte;);
           false:(tab:segtable;);
           end;
        i:integer;
    begin
         initsegtab(st.tab,finaladdr,codestart,
                    dataseglen,
                    codestart+finaladdr+
                    (rt.reloccount*relocsize+2){ size of reloctable });
         for i:=1 to sizeof(segtable)
         do objcode^.putbyte(st.bytes[i]);

    end;
    procedure dumpdataseg;
    { create the initialised data }
    var i:word;
    begin
         i:=dataseglen;
         while i>0 do begin
            objcode^.putbyte(0);
            i:=i-1;
         end;
    end;
begin
    stublen:=CopyToOutput(StubFileName);
    OutputTempCodefile;
    OutputNewExeHeader;
    OutputSegmentTable;
    nt.dumptables(objcode);
    OutputNRNT;
    codelen:=CopyToOutput(TempCodefileName);
    rt.dump(objcode);
    dumpdataseg;
    fsize:=objcode^.size;
    { fix up the file size field }
    objcode^.fseek(2);objcode^.putword(fsize mod 512);
    objcode^.putword(1+(fsize div 512));

end;

end.
