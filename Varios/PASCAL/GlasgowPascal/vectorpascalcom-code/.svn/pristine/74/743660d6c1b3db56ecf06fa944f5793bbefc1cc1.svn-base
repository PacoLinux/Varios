{$O+}{$F+}
unit assemble;
{ this assembles the PS-algol abstract machine code into machine code }
{ it builds up an abstract program first then in a second pass it outputs }
{ this to a comfile }
interface uses errors,opcodes,editdecl;
const labmax =2000;

type codefile=file ;

procedure pass2(var comfile:codefile);
procedure assem(op:opcode;p1:integer;p2 : integer);
function wordat(l:integer):integer;
procedure initassem;
var      pntr_on_stack_size:integer;   { times stride to get bytes }
      heappntr_size :integer;
      real_size:integer;
      stride,int_size :integer;
      address_size:integer;
implementation
const pcmax = {$ifdef small}1000; {$endif}
              {$ifdef big}6000;{$endif}
      start =256;

type pseudo = record      { abstract instruction }
             operator:opcode;
             parm2:integer;
             parm1:integer;
             end;
     codevec =array[0..pcmax]of pseudo;
Var pc:word;
    pseudocode :^codevec;

function wordat(l:integer):integer;
var i:0..pcmax;
label 99;
begin
     for i:=pc downto 0 do
          with pseudocode^[i] do
               if (operator=plant_label) and (parm1=l) then  begin
                  wordat:=pseudocode^[i+1].parm1;
                  goto 99
               end;
 99:
 end;
procedure initassem;
begin
     pc:=0;
     new(pseudocode);
end;
procedure pass2(var comfile:codefile);
const bufsize =511;
var machinepc,trav:word;
    labels:array[0..labmax]of word;
    buff:array[0..bufsize] of byte;
    procedure flush;
    var w:word;
    begin

              blockwrite(comfile,buff,bufsize+1,w);
    end;
    procedure fixlabels;
      var i:word;
      begin
           machinepc:=start;
           for i:=0 to pc do
               with pseudocode^[i] do begin
                    if operator=plant_label then labels[parm1]:=machinepc;
                    machinepc:=machinepc+codelen[operator];
               end
       end;
     procedure emitcode(c:word);
     var i,p1,p2,offs:integer;dest:word;
         w :word;
         procedure emitbyte(b:byte);
         begin
              buff[(machinepc-start) and bufsize]:=b;
              machinepc:=machinepc+1;
              if(( machinepc-start) and bufsize)=0 then flush;
              i:=i+1;
         end;
         procedure advance;
         var b:integer;
         begin
             b:=codelib[i+offs];
             emitbyte(codelib[i+offs]);
         end;
         procedure emitword(w:integer);
         var r:record
                case boolean of
                true:(ww:integer);
                false:(b:array[0..1] of byte)
                end;
         begin
              r.ww:=w;
              emitbyte(r.b[0]);emitbyte(r.b[1]);

         end;

var conv:record case boolean of
         true:(pw:word);
         false:(pi:integer);
         end;

     begin

         with pseudocode^[c] do   begin
           offs:=codeoffset[operator];
           p1:=param1[operator]; p2:=param2[operator];
           i:=0 ;
           while i< codelen[operator] do begin
             if (i=p1) or (i =p2) then
             case codeparams[operator] of
             relative: if i=p1 then begin
                          dest:=labels[parm1]-2-machinepc;
                          conv.pw:=dest;
                          emitword(conv.pi);
                       end else advance;
             byterel: if i=p1 then begin
                          dest:=labels[parm1]-1-machinepc;
                          emitbyte(dest);
                       end else advance;
             abslabel: if i = p1 then emitword(labels[parm1] )
                       else advance;
             nonadic:advance;
             dyadic: if p1 = i then emitword(parm1)
                     else emitword( parm2);
             byteadic: if p1= i then emitbyte(parm1) else advance;
             monadic : if p1=i then
                        emitword(parm1)
                       else advance;
             end
             else advance;
           end;
         end;
     end;

begin
    pc:=pc-1;    { pc pointed at next free instruction so pull back 1 }
    fixlabels;
    machinepc:=start;
    for trav:=0 to pc do emitcode(trav);
    flush;
end;
function optimise:boolean;
{ performs peephole optimisation
  returns true if any was done

}
  var hi,lo,mid:integer;
      t1,t2:integer;
  function gt(i:integer):boolean;
  { true if i th optimistation gt than current pattern }
  begin
     with optimisations[i] do begin
         gt:=(pattern[1]>  pseudocode^[pc-2].operator) or
             ((pattern[1]=  pseudocode^[pc-2].operator) and
             (pattern[2]>  pseudocode^[pc-1].operator))
     end;
  end;

  function eq(i:integer):boolean;
  { true if i th optimistation eq current pattern }
  begin
     with optimisations[i] do begin
         eq:=
             ((pattern[1]=  pseudocode^[pc-2].operator) and
             (pattern[2]=  pseudocode^[pc-1].operator))
     end;
  end;
  function sel(i:integer):integer; { select the ith param }
  begin
       case i of
       1: sel:=pseudocode^[pc-2].parm1;
       2: sel:=pseudocode^[pc-2].parm2;
       3: sel:=pseudocode^[pc-1].parm1;
       4: sel:=pseudocode^[pc-1].parm2;
       end
  end;
  var ok:boolean;
begin
   lo:=0;
   hi:=lastopt;
   { perform a binary search }
   while (hi-lo)>3 do begin
     mid:=((hi -lo) div 2)+lo;
     if gt(mid) then hi:=mid-1 else lo:=mid
   end;
   { now do linear search }
   repeat
         ok:=eq(lo);
         lo:=lo+1;
   until ok or (hi<lo);
   if ok then { found a pattern }
   begin
     optimise:=true;
     with pseudocode^[pc-2] do with optimisations[lo-1] do begin
        operator:=pattern[3];
        t1:=sel(p1);
        t2:=sel(p2);
        parm1:=t1;
        parm2:=t2;
     end;
     pc:=pc-1;
   end else optimise:=false
end;
procedure assem(op:opcode;p1:integer;p2:integer);
var conv:record case boolean of
         true:(pw:word);
         false:(pi:integer);
         end;
begin
     with pseudocode^ [pc] do begin
          parm1:=p1;
          operator:=op;
          parm2:=p2;
     end;
     if trace then begin
       write(listfile,'     ',
                        pc:4,' ',codelits[op],' ',p1,',',p2:6);
       if( 1<p1) and (p1<128) then writeln(listfile,' ',chr(p1))
       else writeln(listfile);
     end;

     pc:=pc+1;
     if pc>2 then
     while optimise do begin
     if trace then
       with pseudocode^[pc-1]  do begin
            writeln(listfile,' ->  ',
                        pc-1:4,' ',codelits[operator],' ',parm1,',',parm2:6);
       end;

     end ;
     if pc>pcmax then begin
       pc:=pcmax;
       error('code to large');
     end;

end;

begin
      pntr_on_stack_size:=codelib[codeoffset[stackpntr]];   { times stride to get bytes }
      heappntr_size :=codelib[codeoffset[heappntr]];

      int_size :=codelib[codeoffset[intsize]];
      real_size :=codelib[codeoffset[realsize]];
      stride:=codelib[codeoffset[stridesize]];
      address_size:=codelib[codeoffset[addresssize]];
end.