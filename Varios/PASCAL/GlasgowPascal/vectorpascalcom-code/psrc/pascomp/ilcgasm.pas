
{   UNIT ILCGASM
    ------------

    Derived from RISCASM

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
    -- 32 bit Reals and long pointers

 Copyright (c) University of Strathclyde
 Author Paul Cockshott
 Modified 2005 by Paul Cockshott to use ILCG retargetable code generator
}


unit ilcgasm;
interface   uses sysutils,lists,files,ilcp,
{$ifdef intel}
p4,
{$endif}
rollback,errors;
const
      firstreg=0;
      lastreg=maxreg;

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
     
    labels= pilcgnode;

    condition=pilcgnode;
    bytestring=string[bytestringlen];
    {

    The assembler procedures fall into the following groups:
    -- Control transfer. These are divided into CALL,CALLBYNAME,JUMP
       and return instructions. The call is always
       registerNumber indirect.
    -- Load, load immediate and store. Note that load immediat
       can either take a constant or a label as a parameter.
    -- Arithmetic instructions. These all take 4 parameters
       -- Is the addressing mode immediate or register to register.
       -- The destination register.
       -- The source  operand.


    }
const bytespercoderec=8;
      outcode=1;
      
      len2form:array[1..8] of integer=
      (fint8,fint16,fvoid,fint32,
       fvoid,fvoid,fvoid,fint64);
      { ---------- Sizes of stack values ----------- }

      int_size       = 4 ; { size of integer in bytees }
      real_size      = 4 ; { size of real in bytes }
      address_size   = 4 ; { we assume that all addresses are long and }


type
    instruction =(noop,plantop,dl,db,dw,dr,jumpop,
                  calllong16op,callop,
                  retop,loadop,loadimmop,
                  storeop, popop,
                  bxorop,pushop,imulop,idivop,
                  imodop, addimmop, addop,subop,
                  borop,bandop,
                  equal,lessthan,greaterthan,
                             le,ge,nz);

 
  const
  condops:array[equal..nz] of string[12]=(ilcpeq,ilcplt,ilcpgt,
                             ilcpleq,ilcpgeq,ilcpneq);

    { We here declare the  object class assemblersession
      which has the actual datastructures associated with an assembly
      session. Note that the unit has no private variables. The unit is
      pure code, all data is stored in the session objects.
      These have two datastructures: a list of labels and a list
      of instructions. The instruction list has both head and tail pointers,
      to allow it to have new instructions added at the tail.

      These data structures are used to build up code until it is output.

    }
type
    assemblersessionp=^assemblersession;
    assemblersession = object(cell)
                     buf:rollbackbuffer;
                     constructor  startpass1;
                     destructor destroy;virtual;
                     procedure startpass2(
                            var objcode:text
                            ); virtual;
                     procedure show(var listing:text);virtual;
                     function   mklabel:labels;virtual;
                     procedure  plantlabel( lab:labels);virtual;
                     procedure  plantbytes(bytes:bytestring); virtual;
                     procedure  plantreal(r:real);virtual;
                     procedure  plantword(w:longint);virtual;
                     procedure jump(cond:condition;dest:labels);virtual;
                     procedure branch(dest:labels);virtual;
                     procedure calllong(dest:labels);virtual;
                     procedure call(base:registerNumber;offset:longint); virtual;
                     procedure return(discard:integer);virtual;
                     procedure addimm(dest:registerNumber;offset:longint);
                     procedure loadimm(dest:registerNumber;offset:longint); virtual;
                     procedure loadlab(dest:registerNumber;offset:labels);virtual;
                     procedure load(
                               dest:registerNumber;
                               base:registerNumber;
                               offset:longint;
                               len:byte
                               );virtual;
                     procedure store(src:registerNumber;

                               base:registerNumber;
                               offset:longint;
                               len:byte
                               );          virtual;

                     procedure add(  dest,src:registerNumber);virtual;
                     procedure sub(  dest,src:registerNumber); virtual;
                     procedure bor(  dest,src:registerNumber);virtual;
                     procedure band(  dest,src:registerNumber);virtual;
                     procedure bxor(  dest,src:registerNumber);virtual;
                     procedure imul(dest,src:registerNumber);virtual;
                     procedure imod(dest,src:registerNumber);virtual;
                     procedure idiv(dest,src:registerNumber);virtual;
                     procedure push(src:registerNumber
                               );virtual;
                     procedure pop(dest:registerNumber);virtual;

                     end;
 {- end of interface - }
 var mainstack,unconditional:pilcgnode;
 implementation
 procedure error(s:string);
 begin
      errors.error('Code gen:'+s);
 end;

procedure safedispose(p:pointer);
begin
     try dispose (p);
     except
     on   EInvalidPointer do begin end;
     end
end;
{ LABELS }

function assemblersession.mklabel:labels;
var l:labels;sl:list;
begin
      mklabel:=new_label;
end;


{ SESSIONS }
destructor assemblersession.destroy;
begin
     freebuf(buf);
end;
constructor assemblersession.startpass1;
begin cell.newcell;
      initbuf(buf,maxrollback);
end;
procedure assemblersession.startpass2(    var objcode:text );
begin
     writerollback(buf,objcode);
end;
procedure assemblersession.show(var listing:text);
begin
     writerollback(buf,listing);
end;
procedure  assemblersession.plantlabel( lab:labels);
begin
     if not match(lab,buf) then error('could not generate code for label');
end;
procedure  assemblersession.plantbytes(bytes:bytestring);
var p,q:pilcgnode;  i:integer;
begin
     for i:= 1 to length(BYTES) do
     begin
          q:=new_intlit(ord(bytes[i]),foctet);
          p:=new_location(q);
          if not match(p,buf)then error('can not plant '+bytes);
          safedispose(q);
          safedispose(p);
     end;
end;
procedure  assemblersession.plantreal(r:real);
var p,q:pilcgnode;
begin
     q:=new_reallit(r,fieee32);
     p:=new_location(q);
     if not match(p,buf)then error('can not plant real constant');
     safedispose(q);
     safedispose(p);
end;
procedure  assemblersession.plantword(w:longint);
var p,q:pilcgnode;
begin
     q:=new_intlit(w,fint32);
     p:=new_location(q);
    if not  match(p,buf) then error('cant plant integer literal');
     safedispose(q);
     safedispose(p);
end;
procedure assemblersession.jump(cond:condition;dest:labels);
var p:pilcgnode;
begin
     p:=new_if(cond,new_goto(dest),nil);
     if not match(p,buf) then
     error('cant plant conditional jump');
     safedispose(p);
end;
procedure assemblersession.branch(dest:labels);
var p:pilcgnode;
begin
     p:=new_goto(dest);
     if not match(p,buf) then error('cant plant jump');
     safedispose(p);
end;
{-------------------------------------------------------}
{ Call long this procedure directly generates assembler }
{ and has to be guarded by ifdefs to make sure it is    }
{ coherent                                              }
{ The same applies to Return(x)                         }
{ When producing new versions of the code generator     }
{ these functions have to be updated                    }
{-------------------------------------------------------}
{$ifdef intel}
procedure assemblersession.calllong(dest:pilcgnode);
var s:string;r:integer;rr,a,d:pilcgnode;
begin

     case dest^.tag of
     labelnode:
               begin
                    str(dest^.index,s);
                    appendstr(buf,'call l'+s);
               end;
     extlabel:
                   appendstr(buf,'call '+dest^.opname);

     reg:
                   appendstr(buf,'call '+registers[dest^.index].printsas);

     memref:
              begin
                 r:=findfreereg(fint32);
                 if r<0 then error(' no free registers to evaluate call');
                 rr:=new_register(r);
                 d:=new_deref(dest);
                 a:=new_assign(rr,d);
                 if not match(a,buf) then error('can not generate call address');
                 safedispose(rr);safedispose(d);  safedispose(a);
              end;
     else begin
                 r:=findfreereg(fint32);
                 if r<0 then error(' no free registers to evaluate call');
                 rr:=new_register(r);
                 a:=new_assign(rr,dest);
                 if not match(a,buf) then error('can not generate call address');
                 safedispose(rr);  safedispose(a);
          end;
     end;
end;
procedure assemblersession.return(discard:integer);
var s:string;
begin
     str(discard,s);
     appendstr(buf,'ret '+s);
end;

{$endif}

procedure assemblersession.call(base:registerNumber;offset:longint);
var p,q,r,d:pilcgnode;
begin
     p:= new_intlit(offset,fint32);
     r:= new_register(base);
     d:= new_deref(R);
     q:= new_dyad(P,ilcpplus,D);
     calllong(q);
     safedispose(p);safedispose(r);safedispose(d);safedispose(q);
end;
procedure assemblersession.addimm(dest:registerNumber;offset:longint);
var a,b,c,d,e:pilcgnode;
begin
    a:=new_intlit(offset,fint32);
    b:=new_register(dest);
    d:=new_deref(b);
    c:=new_dyad(d,ilcpplus,a);
    e:=new_assign(b ,c);
    if not match(e,buf) then error('can not generate add immediate');
    safedispose(a);safedispose(b);safedispose(c);safedispose(d);safedispose(e);
end;
procedure assemblersession.loadimm(dest:registerNumber;offset:longint); var a,b,e:pilcgnode;
begin
    a:=new_intlit(offset,fint32);
    b:=new_register(dest);
    e:=new_assign(b ,a);
    if not match(e,buf) then error('can not generate load immediate');
    safedispose(a);safedispose(b);safedispose(e);
end;
procedure assemblersession.loadlab(dest:registerNumber;offset:labels);var b,e:pilcgnode;
begin
    b:=new_register(dest);
    e:=new_assign(b ,offset);
    if not match(e,buf) then error('can not generate add immediate');
    safedispose(b);safedispose(e);
end;

procedure assemblersession.load(dest,base:registerNumber;offset:longint;len:byte);
var a,b,c,d,e,f,h,i,j:pilcgnode; form:integer; cast:boolean;
begin
    a:=new_intlit(offset,fint32);
    b:=new_register(base);
    d:=new_deref(b);
    c:=new_dyad(d,ilcpplus,a);
    h:=new_memref(c,len2form[len]);
    i:=new_deref(h);
    cast:= formatderef(registers[dest].format) <> len2form[len];
    if cast then j:= new_typecast(formatderef(registers[dest].format),i) else j:=i;
    f:=new_register(dest);
    e:=new_assign(f,j);
    if not match(e,buf) then error('can not generate load');
    safedispose(a);
    safedispose(b);
    safedispose(d);
    safedispose(c);
    safedispose(e);
    safedispose(f);
    safedispose(h);
    safedispose(i);
    if cast then safedispose (j);
end;
procedure assemblersession.store(src,base:registerNumber; offset:longint;len:byte);
var a,b,c,d,e,f,h,i,j:pilcgnode; form:integer; cast:boolean;
begin
    a:=new_intlit(offset,fint32);
    b:=new_register(base);
    d:=new_deref(b);
    c:=new_dyad(d,ilcpplus,a);
    h:=new_memref(c,len2form[len]);
    f:=new_register(src);
    i:=new_deref(f);
    cast:= registers[src].format <> len2form[len];
    if cast then j:= new_typecast(len2form[len],i) else j:=i;
    e:=new_assign(h ,j);
    if not match(e,buf) then error('can not generate store');
    safedispose(a);safedispose(b);safedispose(c);safedispose(d);safedispose(e);
    safedispose(f);safedispose(h);safedispose(i);
    if cast then safedispose (j);
end;
procedure rr(  dest,src:registerNumber;op:string;var buf:rollbackbuffer);
var a,b,c,d,e,f:pilcgnode;
begin
    a:=new_register(src);
    b:=new_register(dest);
    d:=new_deref(b);
    f:=new_deref(a);
    c:=new_dyad(d,op,f);
    e:=new_assign(b ,c);
    if not match(e,buf) then error('can not generate r1:= r1'+op+'r2 ');
    safedispose(a);safedispose(b);safedispose(c);safedispose(d);safedispose(e);safedispose(f);
end;
procedure assemblersession.sub(  dest,src:registerNumber);
begin
  rr(dest,src,ilcpminus,buf);
end;
procedure assemblersession.add(  dest,src:registerNumber);
begin
  rr(dest,src,ilcpplus,buf);
end;
procedure assemblersession.bor(  dest,src:registerNumber);
begin
     rr(dest,src,ilcpor,buf);
end;
procedure assemblersession.band(  dest,src:registerNumber);
begin
     rr(dest,src,ilcpand,buf);
end;
procedure assemblersession.bxor(  dest,src:registerNumber);
begin
     rr(dest,src,ilcpxor,buf);
end;
procedure assemblersession.imul(dest,src:registerNumber);
begin
     rr(dest,src,ilcptimes,buf);
end;
procedure assemblersession.idiv(dest,src:registerNumber);
begin
     rr(dest,src,ilcpdivide,buf);
end;
procedure assemblersession.imod(dest,src:registerNumber);
begin
     rr(dest,src,ilcpremainder,buf);
end;
procedure assemblersession.push(src:registerNumber);
var a,b,c:pilcgnode;
begin
     a:=new_register(src);
     b:=new_deref(a);
     c:=new_dyad(mainstack,ilcppush,b);
     if not match (c,buf) then error('can not push '+registers[src].printsas);
     safedispose(a);safedispose(b);safedispose(c);
end;
procedure assemblersession.pop(dest:registerNumber);  
var a,b,c,d:pilcgnode;
begin
     a:= new_register(dest);
     b:= new_monad(ilcppop,mainstack);
     d:= new_typecast(formatderef(registers[dest].format),b);
     c:= new_assign(a,d);
     if not match (c,buf) then error('can not pop '+registers[dest].printsas);
     safedispose(a);safedispose(b);safedispose(c); safedispose(d);
end;


begin
     mainstack:=patmainstack_stack^.meaning;
     unconditional:=new_intlit(-1,fint8);
end.
 {---- end of ilcgasm ----- }




