
{   UNIT RISCASM
    ------------


This is a module designed to provide an assembler whose call interface
looks like a simple risc. The output end of the assembler generates
the instructions for a particular machine. In this case the 80386.
It is designed to be a module in the compiler toolbox.

The essential idea is that we should have a machine that shares the
following features of a risc

  - A load store architecture. This means that we allow only a
    simple base + offset addressing mode for loads and stores.
    This is modified for running on a segmented architecture by assuming
    that all load and store instructions also specify a segment register.

  - All arithmetic takes place in registers. We allow arbitary
    register to register arithmetic. Conceptually the machine has a
    collection of numbered registers $R_0,R_1,..,R_n$ which are
    entirely general purpose.

  - A simple set of arithmetic operations:

    -- Add
    -- Subtract
    -- And
    -- Or
    -- Xor
    Appart from these and a simple set of jump, call and return instructions
    more complex operations are carried out by subroutines.

  - A simple collection of data types. These are
    -- 8 bit Bytes
    -- 32 bit Words
    -- 64 bit Reals and long pointers

 Copyright (c) University of Strathclyde
 Author Paul Cockshott
}


unit riscasm;
interface   uses lists,files;
const
      firstreg=0;
      lastreg=7;
      stackpointer=7;
      firstsegreg=8;
      lastsegreg=13;
      codesegreg=8;
      stacksegreg=9;
      pointerflag = $70;
      bytestringlen=127;

      {
The assembler provides the code generator with
      -- A specification of the number of registers.
      -- A specification of which register is to be used as the
         stack pointer, codesegment register and stacksegment registers.
      -- A means of planting labels.
      -- A means of assigning constants to labels.
      -- A collection of procedures for planting instructions.
      -- A procedure for planting data.
      -- A collection of procedures to control the passes of the
         assembler.
All of these procedures operate in an object oriented fashion,
being operations of  an assembler session. This is a data structure
that holds all of the information about the assembly process.
Because we want to protect this information from access outside
of the unit, we declare a dummy object type of assemblersession
in the interface part and make all of the methods virtual. In the
implementation part we will declare a real object class with data
fields that can be accessed by the methods. This class ( unnamed
at the interface level) will take assemblersession as a superclass.


      }
type
    register =firstreg..lastsegreg;
    segregister= firstsegreg..lastsegreg;
    labels= ^labobj;
    labobj= object(cell)
            defined:boolean;
            value:longint;
            constructor newlabel;
            procedure  equ( val:longint);
            procedure  show(var listing:text);virtual;
            end;
    condition=(unconditional,equal,lessthan,greaterthan,
                             le,ge,nz);
    bytestring=string[bytestringlen];
    {

    The assembler procedures fall into the following groups:
    -- Control transfer. These are divided into CALL,CALLBYNAME,JUMP
       and return instructions. The call is always
       register indirect.
    -- Load, load immediate and store. Note that load immediat
       can either take a constant or a label as a parameter.
    -- Arithmetic instructions. These all take 4 parameters
       -- Is the addressing mode immediate or register to register.
       -- The destination register.
       -- The source  operand.


    }
const bytespercoderec=8;
      outcode=1;
      rmnem : array [ register ] of string [3]=(
              'eax','ebx','ecx','edx','esi','edi','ebp','esp',
              'cs','ss','ds','es','fs','gs');
      cseg=8;sseg=9;dseg=10;es=11;fs=12;gs=13;
      bp=6;sp=7;lastworkreg=5;edx=3; eax=0;
      conditions:array[condition]of string[3]=(
      ' ','=', '<', '>', '<=', '>=', '<>0');
      { ---------- Sizes of stack values ----------- }

      int_size       = 4 ; { size of integer in bytees }
      real_size      = 8 ; { size of real in bytes }
      address_size   = 8 ; { we assume that all addresses are long and }
                           { that the top 16 bits of an address are    }
                           { filled with padding }

type
    instruction =(noop,plantop,dl,db,dw,dr,jumpop,
                  calllong16op,callop,
                  retop,loadop,loadimmop,addimmop,
                  storeop,addop,subop,borop,bandop,
                  bxorop,pushop,popop,imulop,idivop,imodop);

    { We here declare the  object class assemblersession
      which has the actual datastructures associated with an assembly
      session. Note that the unit has no private variables. The unit is
      pure code, all data is stored in the session objects.
      These have two datastructures: a list of labels and a list
      of instructions. The instruction list has both head and tail pointers,
      to allow it to have new instructions added at the tail.

      These data structures are used to build up code until it is output.

    }

    assemblersessionp=^assemblersession;
    assemblersession = object(cell)
                     symtab:list;
                     firstcode,lastcode:list;
                     pc:longint;
                     constructor  startpass1(org:longint);
                     destructor destroy;virtual;
                     procedure startpass2(
                            var objcode:bytefileobjp;
                            var finaladdr:longint); virtual;
                     procedure show(var listing:text);virtual;
                     function   mklabel:labels;virtual;
                     procedure  plantlabel( lab:labels);virtual;
                     procedure  plantbytes(bytes:bytestring); virtual;
                     procedure  plantreal(r:real);virtual;
                     procedure  plantword(w:longint);virtual;
                     procedure jump(cond:condition;dest:labels);virtual;
                     procedure calllong16(sel,offset:longint);virtual;
                     procedure call(seg:segregister;base:register;offset:longint); virtual;
                     procedure return(discard:integer);virtual;


                     procedure addimm(dest:register;offset:longint);
                     procedure loadimm(dest:register;offset:longint); virtual;
                     procedure loadlab(dest:register;offset:labels);virtual;
                     procedure load(
                               dest:register;
                               seg:segregister;
                               base:register;
                               offset:longint;
                               len:byte
                               );virtual;
                     procedure store(src:register;
                               seg:segregister;
                               base:register;
                               offset:longint;
                               len:byte
                               );          virtual;
                     procedure add(  dest,src:register);virtual;
                     procedure sub(  dest,src:register); virtual;
                     procedure bor(  dest,src:register);virtual;
                     procedure band(  dest,src:register);virtual;
                     procedure bxor(  dest,src:register);virtual;
                     procedure imul(dest,src:register);virtual;
                     procedure idiv(dest,src:register);virtual;
                    procedure push(dest:register
                               );virtual;
                    procedure pop(dest:register);virtual;
                     procedure appendcode;
                     {Code has to be appended to the opcode list by all of the
                      instructions. This procedure creates a new codecons record
                      and adds it to the list of instructions.

                     }
                     procedure advancepc;
                     end;
 {- end of interface - }
 implementation
 type
    { An instruction is represented by a heap record that describes the
      instruction. These basically store all of the parameters plus the
      opcode in an abstract form.
      They are chained together to form a linked list
      The constant fields in the instructions are denoted by
      intexp records that allow the constant to be built up of some
      kind of constant expresssion. This facility will be used by
      the optimiser to fold constants.

    }

    intexptype=(literal,symbol,expression);
    intexpref=^intexp;
    intexp=object
                 data:record
                 case expsort:intexptype of
                 literal:(value:longint);
                 symbol:(lab:labels);
                 expression:(
                             opcode:instruction;
                             left,right:intexpref;
                            );
                 end;
                 procedure show(var listing:text);
                 destructor destroy;
                 function eval:longint;
                 function length:integer;
                 function isliteral:boolean;
           end;

    codecellp = ^codecell;
    codecell  = object(cell)
               data:record
               length:byte;
               case opcode:instruction of
                db:(thebytes:string[bytespercoderec]);
               dr:(thereal:real);
               jumpop:(branchcond:condition;target:labels;
                       pc:longint);
               calllong16op:(destsel,destoff:longint);
               plantop:(thelabel:labels);
               addimmop,
               loadimmop,
                dw,
                retop,
               callop,
                pushop,
                popop,
                loadop,
                storeop
                :(dest,seg,base:register;offset:intexp;bytecount:byte);
                imulop, idivop,
               addop,
                subop,
                borop,
                bandop,
                bxorop:(r1,r2:register);
               end;
               constructor newcode;
               procedure show(var listing:text);virtual;
               procedure binary(var code:bytestring);
               procedure assemble(var f:bytefileobjp);
               destructor destroy;virtual;
               end;


{ LABELS }
constructor labobj.newlabel;begin cell.newcell;defined:=false end;
procedure labobj.equ(val:longint);begin value:=val;defined:=true end;
function assemblersession.mklabel:labels;
var l:labels;sl:list;
begin
     new(l,newlabel); mklabel:=l;
     new(sl,cons(l,symtab));
     symtab:=sl;
end;
procedure labobj.show(var listing:text);
begin
  {write(listing,'(L',seg(self):0,ofs(self):0);  }
  if defined then write(listing,' = ',value:5)
  else write(listing,' undefined ');
  write(listing,') ');

end;
{ INTEXP }
destructor intexp.destroy;
begin
     if data.expsort=expression then begin
        if data.left <>nil then dispose(data.left,destroy);
        if data.right <>nil then dispose(data.right,destroy);
     end;
end;
function intexp.eval:longint;
begin
   if self.isliteral then
   case data.expsort of
   expression: case data.opcode of
               addop:eval:=data.left^.eval+data.right^.eval;
               subop:eval:=data.left^.eval-data.right^.eval;
               else eval:=0;
               end;
   literal:eval:=data.value;
   symbol:eval:=data.lab^.value;

   end else eval:=maxint;
end;

function intexp.length:integer;
var i:longint;
begin
   if self.isliteral then begin
    i:=self.eval;
    if ((i>0) and (i<63)) or ((i<0) and (i> -63)) then length:=1
    else if i=0 then length:=0
    else length:=4
   end else length:=4
end;
function intexp.isliteral:boolean;
begin
   case data.expsort of
   expression: isliteral:=data.left^.isliteral and data.right^.isliteral;
   literal:isliteral:=true;
   symbol:isliteral:=data.lab^.defined;

   end
end;

procedure mnem(i:instruction;var listing:text);
begin

                     case i of
                     idivop:write(listing,'DIV');
                     imulop:write(listing,'MUL');
                     addimmop,
                     addop:write(listing,'ADD');
                     subop:write(listing,'SUB');
                     noop:write(listing,'NOP');
                     popop:write(listing,'POP');
                     pushop:write(listing,'PUSH');
                     dl:write(listing,'PLANT');
                     db:write(listing,'DB');
                     dw:write(listing,'DW');

                     dr:write(listing,'DR');

                     jumpop:write(listing,'J');
                     callop,        calllong16op:write(listing,'CALL');
                     storeop:write(listing,'STORE');
                     loadimmop,
                     loadop:write(listing,'LOAD');
                     borop:write(listing,'OR');
                     bandop:write(listing,'AND');
                     bxorop:write(listing,'XOR');
                     retop:write(listing,'RET');
                     else write(listing,' ');
                     end;
end;
procedure intexp.show(var listing :text );
begin
     case data.expsort of
     symbol:data.lab^.show(listing);
     literal:write(listing,data.value);
     expression:begin
                     data.left^.show(listing);
                     mnem(data.opcode,listing);
                     data.right^.show(listing);
                end;
     end;
end;
{ CODEREC }
constructor codecell.newcode;
begin
     cell.newcell;
     data.opcode:=noop;
end;
destructor codecell.destroy;
begin
     case data.opcode of
     loadimmop,dw:data.offset.destroy;
     callop,
     loadop,
     storeop
     :data.offset.destroy;
     end;
end;

procedure codecell.binary(var code:bytestring);
const segpref:array[segregister] of integer=($2e,$36,$3e,$26,$64,$65);
      rm:array[0..7]of integer=(0,3,1,2,6,7,5,4);
type converter=                 record case boolean of
            true:(offint:longint);
            false:(offchars:array[1..4] of char);
            end;
var i,offlen,modfield,R,reg,base,ss,index:longint;
    relative:longint; short:boolean;
    offval:    converter;
    procedure chradd(c:integer);
    begin
         code:=code+chr(c);
    end;
    procedure intout(l:longint;len:integer);
    var longval:converter;
        i:integer;
    begin
         longval.offint:=l;
         for i:=1 to len do chradd(ord(longval.offchars[i]));
    end;
    procedure longoperand;
    begin
         chradd($66);
    end;
begin
 code:='';
 case data.opcode of
 db:code:=data.thebytes;

 storeop,callop,
 loadop:begin

       offval.offint:=data.offset.eval;
       offlen:=data.offset.length;
       { evaluate the mod field of the instruction }
       if (offval.offint=0) and (offlen=1) then modfield:=0
       else if offlen = 1 then modfield:=1
       else modfield:=2;
       if data.opcode<>callop then begin
          reg:=rm[data.dest];
       end;
       R:=rm[data.base];
       chradd($67);{32 bit address }
       if not((data.opcode=storeop) and (data.bytecount=2))
          then longoperand;{32 bit data}
       if (data.seg=sseg) and (data.base=bp) then { }
       else begin
         chradd(segpref[data.seg]);
       end;
       case data.opcode of
       loadop:case data.bytecount of
                   4:chradd($8b);{MOV r32,r/m32}
                   2:begin chradd($f);chradd($bf);end;
                   1:begin chradd($f);chradd($be);end;
                   end;
       storeop:case data.bytecount of
               4,2:chradd($89);{MOV r/m32,r32}
               1:chradd($88);
               end;
       callop:begin
                chradd($ff);{CALL interseg indirect}
                reg:=3;   { pseudo reg field for call instr }
              end;
       end;
       chradd(modfield *64+reg*8+R);
       if R=4 then { SP is the base use SIB }
       begin
          chradd(4*8 + 4);
       end ;
       if modfield = 1 then
       begin chradd(ord(offval.offchars[1]));
       END else if modfield =2 then
       begin for i:=1 to 4 do chradd(ord(offval.offchars[i]));
       end;
      end;
 loadimmop:begin

       offval.offint:=data.offset.eval;
       offlen:=data.offset.length;
       longoperand;{32 bit data}
       begin
             chradd($b8+rm[data.dest]);
             for i:=1 to 4 do chradd(ord(offval.offchars[i]));
       end
      end;
 addimmop:begin

       offval.offint:=data.offset.eval;
       offlen:=data.offset.length;
       longoperand;{32 bit data}
                              { this leads to discrepancies
                                between pass 1 and 2
       if (offval.offint > -126) and (offval.offint <127) then
       begin
            chradd($83);     chradd($c0 + rm[data.dest]);
            chradd(ord(offval.offchars[1]));
       end else                }
       begin
             chradd($81)     ;chradd($c0 + rm[data.dest]);
             for i:=1 to 4 do chradd(ord(offval.offchars[i]));
       end
      end;
 pushop,popop: begin
                   if data.r1 <firstsegreg then begin
                       longoperand;
                       if data.opcode=popop then chradd($58+rm[data.r1])
                       else chradd($50+rm[data.r1]);

                    end else begin
                          if data.opcode= popop then longoperand;
                          case data.r1 of
                          cseg: begin chradd($e) ;end;
                          dseg: begin chradd($1e);end;
                          es: begin chradd($6);end;
                          sseg: begin chradd($16);end;
                          fs: begin
                                    chradd($f);chradd($a0);
                              end;
                          gs: begin chradd($f);chradd($a8);
                              end;
                         end;
                         if data.opcode=popop then begin
                            code[length(code)]:=chr(1+ord(code[length(code)]));
                            if data.r1=cseg then begin
                               writeln('can not pop cs');
                            end;
                         end;
                       { when pushing and poping segments we push or pop }
                       { a 32 bit quantity }
                       { for pushing we push the constant $70 first }
                         if data.opcode= pushop then
                         code:=chr($6a)+chr(pointerflag)+code
                    end;
               end;
 calllong16op: begin

                  chradd($9a);
                  intout(data.destoff,2);
                  intout(data.destsel,2);
               end;
 jumpop:begin
        relative:=data.target^.value-data.pc;
           case data.branchcond of
           unconditional: begin

                           chradd($e9);
                           chradd(relative and $ff);
                           chradd((relative shr 8) and $ff);
                       end;
           equal:begin

                           chradd($0f);chradd($84);

                           chradd(relative and $ff);
                           chradd((relative shr 8) and $ff);
              end;
           nz:begin

                           chradd($0f);chradd($85);

                           chradd(relative and $ff);
                           chradd((relative shr 8) and $ff);
              end;
           le:begin

                           chradd($0f);chradd($8e);

                           chradd(relative and $ff);
                           chradd((relative shr 8) and $ff);
              end;
           ge:begin

                           chradd($0f);chradd($8d);

                           chradd(relative and $ff);
                           chradd((relative shr 8) and $ff);
              end;
           lessthan:begin
                           chradd($0f);chradd($8c);

                           chradd(relative and $ff);
                           chradd((relative shr 8) and $ff);
                 end;
           greaterthan:begin
                           chradd($0f);chradd($8f);

                           chradd(relative and $ff);
                           chradd((relative shr 8) and $ff);
                   end;
           end
        end;
 imulop:begin
        longoperand;
        chradd($f7);
        chradd($e0    +rm[data.r2]);
      end;
 idivop:begin
        longoperand;
        chradd($f7);
        chradd($f0    +rm[data.r2]);
      end;
 addop,subop,bandop,borop,bxorop:begin
       longoperand;{ 32 bit operation }
       { select registers }
       { the instructions are differentiated by the 2nd byte }
       case data.opcode of
       addop:chradd(3);
       subop:chradd($2b);
       bandop:chradd($23);
       borop:chradd($b);
       bxorop:chradd($33);
       end;
       chradd($c0+rm[(data.r1 and 7)]*8+rm[(data.r2 and 7 )]);
       end;
 retop:begin
            offval.offint:=data.offset.eval;
            longoperand;chradd($ca);{ 32 bit far return }
            chradd(ord(offval.offchars[1]));
            chradd(ord(offval.offchars[2]));
       end;
 dw,dr:begin
       for i:=0 to 7 do code[i+1]:=data.thebytes[i];
       if data.opcode= dw then code[0]:=chr(4 )else code[0]:=chr(8);
       end;
 end;
end;
procedure codecell.assemble;
var b:bytestring;
    bt,i:byte;
begin
     binary(b);
     for i:=1 to length(b) do begin
       bt:=ord(b[i]);
       f^.putbyte(bt);
     end;
end;
procedure codecell.show(var listing :text );
begin

     mnem(data.opcode,listing);
     write(listing,' ');
                     case data.opcode of
                     popop,
                     pushop:write(listing,rmnem[data.r1]);
                     addop,bxorop,bandop,borop,imulop,idivop,
                     subop:begin
                                write(listing,
                                rmnem[data.r1],',',rmnem[data.r2]);
                           end;
                     db:write(listing,data.thebytes);
                     callop:begin
                          write(listing,
                          rmnem[data.seg]);
                          write(listing,':',
                          rmnem[data.base]);
                          write(listing,'[');
                          data.offset.show(listing);
                          write(listing,']');
                          end;
                     loadop,storeop:begin
                          write(listing,
                          rmnem[data.dest],
                          ',');
                          case data.bytecount of
                          1: write(listing,'byte pntr ');
                          2: write(listing,'word pntr ');
                          4: write(listing,'dword pntr ');
                          end;
                          write(listing, rmnem[data.seg]);
                          write(listing,':',
                          rmnem[data.base]);
                          write(listing,'[');
                          data.offset.show(listing);
                          write(listing,']');
                          end;
                     addimmop,
                     loadimmop:begin

                             write(listing,' ',rmnem[data.dest],',');
                          data.offset.show(listing);
                          end;
                     dw:  data.offset.show(listing);
                     jumpop :begin
                          data.target^.show(listing);
                          write(listing,conditions[data.branchcond],' ');
                          write(listing,' @',data.pc);
                          end;
                     dl:begin
                         write(listing,' ');
                         data.thelabel^.show(listing);
                         end;
                     else write(listing,' ');
                     end;

     writeln(listing);
end;
{ SESSIONS }
destructor assemblersession.destroy;
begin
     if symtab<>nil then dispose(symtab,destroy);
     if firstcode<>nil then dispose(firstcode,destroy);
end;



Procedure assemblersession.appendcode;
var temp:list;
    cw:codecellp;
begin
     new(cw,newcode);
     if firstcode=nil then begin

        new(temp,cons(cw,nil));
        firstcode:=temp;
        lastcode:=firstcode;
     end else begin
        new(temp,cons(cw,lastcode^.tl));
        lastcode^.tl:=temp;
        lastcode:=lastcode^.tl;

     end;
 end;
 { }



procedure  assemblersession.plantlabel( lab:labels);
begin
     self.appendcode;
     with codecellp(lastcode^.hd)^.data do begin
     opcode:=dl;
     thelabel:=lab;
     end ;
     lab^.value:=pc;
     lab^.defined:=true;
end;
{}



constructor assemblersession.startpass1;
begin cell.newcell;
 firstcode:=nil;lastcode:=nil;symtab:=nil;pc:=org;
end;
{ }



procedure act(var c,s:cellpntr;var continue:boolean);
            { this action will be applied to every codecell }
            begin
                 codecellp(c)^.assemble(bytefileobjp(s));
                 continue:=true;
            end;

procedure assemblersession.startpass2;
          var act1:action;
          begin
               act1:=act;
               finaladdr:=pc;
               firstcode^.map(normal,cellpntr(objcode),act1);
          end;
{ }




procedure  assemblersession.plantbytes(bytes:bytestring);
{There is a limit to the number of bytes that we can encode in an
coderec itself bytespercoderec, for longer strings we
may need several. We loop round choping of the head of the string
and storing it.
}
begin  while length(bytes)>0 do begin
         self.appendcode;
         with codecellp(lastcode^.hd)^.data do begin

              thebytes:=copy(bytes,1,bytespercoderec);
              bytes:=copy(bytes,bytespercoderec,255);
               { - 8 bytes stuck on - }

;
            opcode:=db;
         end;
       advancepc;
       end;
end;
procedure  assemblersession.plantreal(r:real);
begin self.appendcode;
      with codecellp(lastcode^.hd)^.data do begin
      opcode:=dr; thereal:=r;
      end;
      advancepc;
      end;
procedure  assemblersession.plantword(w:longint);
begin self.appendcode;
      with codecellp(lastcode^.hd)^.data do begin
      opcode:=dw; offset.data.value:=w;offset.data.expsort:=literal;
      end;
      advancepc;
      end;
{ }



procedure assemblersession.jump(cond:condition;dest:labels);
begin
self.appendcode;
with codecellp(lastcode^.hd)^ do begin
     data.opcode:=jumpop;data.branchcond:=cond;
     data.target:=dest;

     advancepc;
     data.pc:=pc;
end;

 end;
procedure assemblersession.call(
seg:segregister;base:register;offset:longint
);begin
       self.appendcode;
       with codecellp(lastcode^.hd)^ do begin
            data.opcode:=callop;data.seg:=seg;data.base:=base;
            data.offset.data.expsort:=literal;data.offset.data.value:=offset;
       end;
       advancepc;
 end;
procedure assemblersession.return(discard:integer);
begin
     self.appendcode;
     with codecellp(lastcode^.hd)^.data do begin opcode:=retop;
          offset.data.value:=discard;
          offset.data.expsort:=literal;
     end;
     advancepc;
end;



procedure assemblersession.loadimm(dest:register;offset:longint);
begin self.appendcode;
      with codecellp(lastcode^.hd)^ do
      begin
           data.opcode:=loadimmop;
           data.dest:=dest;
           data.offset.data.expsort:=literal;
           data.offset.data.value:=offset;
      end;
      advancepc;
end;

procedure assemblersession.calllong16;
begin self.appendcode;
      with codecellp(lastcode^.hd)^ do
      begin
           data.opcode:=calllong16op;
           data.destsel:=sel;
           data.destoff:=offset;
      end;
      advancepc;
end;

procedure assemblersession.addimm(dest:register;offset:longint);
begin
      if (lastcode<>nil)and
         (codecellp(lastcode^.hd)^.data.opcode=addimmop)and
         (codecellp(lastcode^.hd)^.data.dest=dest)
      then
           { optimise this instruction out }
          with codecellp(lastcode^.hd)^do begin
               data.offset.data.value:=offset+data .offset.data.value;
      end
      else begin
           self.appendcode;
           with codecellp(lastcode^.hd)^ do
           begin
                data.opcode:=addimmop;
                data.dest:=dest;
                data.offset.data.expsort:=literal;
                data.offset.data.value:=offset;
           end;
           advancepc;
      end;

end;
procedure assemblersession.loadlab(dest:register;offset:labels);
begin self.appendcode;
      with codecellp(lastcode^.hd)^ do
      begin
           data.opcode:=loadimmop;
           data.dest:=dest;
           data.offset.data.expsort:=symbol;
           data.offset.data.lab:=offset;
      end;
      advancepc;
      end;
procedure assemblersession.load(
dest:register;seg:segregister;base:register;offset:longint;len:byte);
begin self.appendcode;
      with codecellp(lastcode^.hd)^ do
      begin
           data.opcode:=loadop;
           data.bytecount:=len;
           data.seg:=seg;
           data.dest:=dest;
           data.base:=base;
           data.offset.data.value:=offset;
           data.offset.data.expsort:=literal;
      end;
      advancepc;
      end;
procedure assemblersession.store(
src:register;seg:segregister;base:register;offset:longint;len :byte);
begin self.appendcode;
      with codecellp(lastcode^.hd)^ do
      begin
           data.opcode:=storeop;
           data.bytecount:=len;
           data.seg:=seg;
           data.dest:=src;
           data.base:=base;
           data.offset.data.value:=offset;
           data.offset.data.expsort:=literal;
      end;
      advancepc;
 end;

procedure assemblersession.pop;
begin  self.appendcode;
       with codecellp(lastcode^.hd)^ do begin
            data.opcode:=popop;
            data.r1:=dest;
       end;
       advancepc;
end;
procedure assemblersession.push;
begin  self.appendcode;
       with codecellp(lastcode^.hd)^ do begin
            data.opcode:=pushop;
            data.r1:=dest;
       end;
       advancepc;
end;

procedure assemblersession.imul;
begin  self.appendcode;
       with codecellp(lastcode^.hd)^ do begin
            data.opcode:=imulop;
            data.r1:=dest;data.r2:=src;
       end;
       advancepc;
end;

procedure assemblersession.idiv;
begin  self.appendcode;
       with codecellp(lastcode^.hd)^ do begin
            data.opcode:=idivop;
            data.r1:=dest;data.r2:=src;
       end;
       advancepc;
end;
procedure assemblersession.add;
begin  self.appendcode;
       with codecellp(lastcode^.hd)^ do begin
            data.opcode:=addop;
            data.r1:=dest;data.r2:=src;
       end;
       advancepc;
end;
procedure assemblersession.sub;
begin self.appendcode;
      with codecellp(lastcode^.hd)^ do begin
      data.opcode:=subop;
      data.r1:=dest;data.r2:=src;
      end;
      advancepc;
      end;
procedure assemblersession.bor;
begin self.appendcode;
      with codecellp(lastcode^.hd)^ do begin
      data.opcode:=borop;
      data.r1:=dest;data.r2:=src;
      end;
      advancepc;
      end;
procedure assemblersession.band;
begin self.appendcode;
      with codecellp(lastcode^.hd)^ do begin
           data.opcode:=bandop;
           data.r1:=dest;data.r2:=src;
      end;
      advancepc;
      end;
procedure assemblersession.bxor;
begin self.appendcode;
      with codecellp(lastcode^.hd)^ do begin
      data.opcode:=bxorop;
      data.r1:=dest;data.r2:=src;
      end;
      advancepc;
      end;
procedure assemblersession.show(var listing:text);
begin
  if firstcode<>nil then firstcode^.show(listing);
  writeln(listing);writeln(listing,'Labels');
  if symtab<>nil then symtab^.show(listing)
end;
procedure assemblersession.advancepc;
var b:bytestring;
begin
     codecellp(lastcode^.hd)^.binary(b);
     pc:=pc+length(b);
end;
 { - }


begin
  end.
 {---- end of riscasm ----- }

