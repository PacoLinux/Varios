unit segtab;
{ This unit is part of the compiler toolbox and
  is responsible for generating a segment table
  for a new microsoft .exe file
  The model addopted is that each dll will have only
  2 segments one for code and one for data

  Copyright (c) University of Strathclyde
  Author Paul Cockshott
}
interface
const maxseg=2;
      codeseg=1;
      dataseg=2;
type
    segentry=record
             offset,len,flags,allocation:word;
             end;
     segtable=record
               segs:array[1..maxseg]of segentry;
            end;
     procedure initsegtab(var s:segtable;
                              codelen,codeoffs,datalen,dataoffs:longint);


implementation

const data=1;
      iterated=8;
      moveable=16;
      pure=32;
      preload=64;
      executeonly=128;
      reloc=256;
      conforming=512;
      privlev=  3072 ;{ assume user priv }
      discardable=4096;
      code386=8192;
      procedure initsegtab;
      begin
           with s do begin
              with segs[codeseg] do begin
              offset:=codeoffs;len:=codelen;
              allocation:=codelen;
              flags:=preload+discardable+
                     moveable+pure+reloc+conforming+privlev;
              end;
              with segs[dataseg] do begin
              offset:=dataoffs;len:=datalen;
              allocation:=datalen;
              flags:=data+moveable+privlev;
              end;
           end;
      end;
end.
