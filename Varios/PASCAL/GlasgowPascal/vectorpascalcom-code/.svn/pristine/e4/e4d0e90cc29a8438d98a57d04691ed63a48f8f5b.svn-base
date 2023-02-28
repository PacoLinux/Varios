{
	Symbolic stack unit
	-------------------


FUNCTION :
	To interface between the ILCGASM unit and
	the code generator. It re-presents the
	ILCGASM unit as a stack based machine
	and in the process performs

	-- Constant folding
	-- Register optimisation
	-- Optimisations of loading and storing

Copyright (c) University of Strathclyde,1990, Author Paul Cockshott
Updated 2005 Paul Cockshott
}
Unit symstk; interface uses ilcp,ilcgasm,lists,stacks,errors;

{
LOGICAL INTERFACE
-----------------

The abstract machine presented looks like a simple FORTH like processor.

Two registers address the stack:
	FP   - the base pointer
	SP   - the stack pointer

A working register

It has a stack onto which values can be pushed and on which operations can be performed.
The operations allowed are:
	-- 	push a constant onto the stack
		this constant may be a label in which case it
		is interpreted to mean the offset field of the
		label.
	--	Push  FP , SP,   onto the stack

	--      Pop these registers from the stack

	--	Replace the qword on top of stack by the d(q)word
 		it points to

	--	Store the d(q)word on top of stack in the address
		given by the qword that is next on stack
		What is stored may be a byte, a dword or a qword.

	--	Perform an arithmetic operation on the top of
		stack

	--	Control operations are inherited from the
		assembler superclass



}
type

      sstkp=^sstk;
      regset=array[registernumber] of integer;
      reglocks = object
                 regs:regset;
                     constructor initialise;
                     function usage(r:registerNumber):integer;
                     procedure freereg(r:registerNumber);
                     { decrement a use count by one }
                     procedure lockreg(r:registerNumber);
                     { decrement a use count by one }
                 end;
      Sstk = object(assemblersession)
                     registersused   : reglocks;
                                     { usage counts for
                                       the registers currently in use
                                     }
                     stackhead       : stack;
                                     { This points to a list of logical
                                       stack cells.
                                     }
                     sp2bp           : integer;
                                     { This holds the difference between
                                       the current values of SP and BP
                                     }

                     stackinfo:sstkp;
                     constructor  startSstk;
                     { inherited from CELL }
                     destructor destroy;virtual;

                     procedure show(var listing:text);virtual;

                     { REPLACEMENTS
                       The followin operations replace those inherited
                       from the assembler since they are used to flush
                       the register cache
                     }
                     procedure plantlabel( lab:labels);virtual;
                     procedure jump(cond:condition;dest:labels);virtual;
                     procedure call(base:registernumber;offset:longint); virtual;
                     procedure return(discard:integer);virtual;
                     procedure push(dest:registernumber);virtual;
                     procedure pop(dest:registernumber);virtual;

                     { NEW OPERATIONS
                       these are enrichments of the assembler type
                     }

                     function newreg(format:integer):registerNumber;
                     { returns a free working register with specified format

                     }

                     procedure pushphys(dest:registernumber);
                     { perform a push onto the physical stack }
                     procedure stackop(op:instruction;len:byte);
                     { this uses the same opcodes as before but interprets
                       them as stack instructions
                       the len field is used only for load and store

                     }
                     procedure arithop(op:instruction);
                     { specialised version of above for arithmetic }
                     procedure flushstk;
                     { this is used to bring the physical stack into
                       conformity with the symbolic stack
                     }
                     procedure pushint(val:longint);
                     { this pushes a literal constant onto the stack
                     }
                     procedure pushlab(l:labels);
                     { this pushes a  label onto the stack }
                     procedure incby(i:integer);
                     { increment the distance from sp 2 bp by i }
                     procedure dup;
                     { duplicate top of stack a,b... a,a,b... }
                     function rpop:registerNumber;
                     { returns the top of stack in a register
                       symbolicly if possible
                     }
                     procedure ddup;
                     { duplicate top 2 elements of stack
                       a,b,c...   a,b,a,b,c...
                     }
                     procedure drot;
                     { a,b,c... -> b,c,a...    }
                     procedure rot;
                     { a,b,c...   b,a,c... }
                     procedure over;
                     { copy second top of stack to top
                       a,b,c...  b,a,b,c...}
                     procedure drop(bytes:integer);
                     { remove bytes from symbolic stack
                       generating code to do the same to the
                       run time stack}
                     procedure retract(offset:integer);
                     { retract  symbolic stack to offset
                       generating code to do the same to the
                       run time stack}
                     function popIlcg:pilcgnode;
                     { pop the symbolic stack and return top
                       as an ilcg node }

                     procedure pushIlcg(Node:pilcgnode);
                     { push an ilcg expression ont the symbolic stack }

                     procedure claim(bytes:integer);
                     { add bytes of space to symbolic stack
                       and generate code to do the same at run time}
                     procedure forget(bytes:integer);
                     { removes bytes from the symbolic stack
                       without generating run time code
                       }
                    end;


implementation

type
    stackcellp= ^stackcell;
    stackcell = object(cell)
                  data : record

                  case celltype : (ilcg,int,reg,lab,loc,addrpair,gap) of
                  ilcg          : (thenode:pilcgnode;);
                  int           : (theint:longint);
                  reg           : (r:registernumber);
                  lab           : (thelabel:labels);
                  gap           : (gapsize:longint);
                  loc           : (loc2bp:longint;bytecount:byte); { offset to BP register }
                  addrpair      : (base:registernumber;negoffset:longint);
                  end;
                  procedure show(var listing:text);virtual;
                  constructor newstackcell;
                  procedure flush( stackinfo:sstkp);
                  function toilcg:pilcgnode;
                end;

{const defaultregs:regset=(0,0,0,0,0,1,1,1,1,1,0,0,0,0);  }

{

STRATEGY
--------

The strategy is to maintain a list that represents the symbolic stack.
When an operation is requested it attempts the following:

1) Attempt to evaluate the operation entirely symbolically.
   This can be done for
	- loading constants
	- arithmetic on constants
	- pushing registers
	- adding a constant to a register to form an address

2) Attempt to evaluate the operation in registers.
   For this purpose the module may dynamically allocate registers
   to the logical top of stack elements.
   This can be done for:
	- other arithmetic operations
	- loads and stores

3) Flush the registers onto the real stack and then perform the operation.
   This is done when :
	- a control operation occurs
	- an attempt is made to load one of the registers BP,
	  SP, CS, SS
	- a label is planted

}
constructor sstk.startsstk;
begin
     assemblersession.startpass1;

     registersused.initialise;
     stackhead.newstack;
     sp2bp:=0;
     stackinfo:=addr(self);
end;
destructor sstk.destroy;
begin

     stackhead.destroy;
     assemblersession.destroy;
end;
procedure sstk.plantlabel;
begin
     flushstk;
     assemblersession.plantlabel(lab);
end;

procedure sstk.jump;
begin
     flushstk;
     assemblersession.jump(cond,dest);
end;
procedure sstk.call;
begin
     flushstk;
     assemblersession.call(base,offset);
end;


procedure sstk.return;
begin
     flushstk;
     assemblersession.return(discard);
end;


procedure sstk.push;
var c:stackcellp;
begin

     new(c,newstackcell);
     stackhead.push(c);
     c^.data.celltype:=reg;
     c^.data.r:= dest;

end;
procedure sstk.pushphys;
begin
     assemblersession.push(dest);
end;

procedure sstk.pop;
var c:cellpntr;
begin
     flushstk;
     assemblersession.pop(dest);
     if stackhead.pop(c) then begin

     if c=nil then begin
        writeln('popped too much from stack ');

     end else begin
             incby(-int_size);
             dispose(stackcellp(c),destroy);
     end;
     end else error('poped too much of stack ');
end;
function sstk.popIlcg:pilcgnode;
var c:stackcellp; node:pilcgnode;s:string[80];
begin
   {  flushstk;  }
     show(output);
     if stackhead.pop(cellpntr(c)) then begin
     if c=nil then
        writeln('popped too much from stack ')
     else begin
             popILcg:=c^.toilcg;
             incby(-lengthinbytes(getformat(node)));
             dispose(stackcellp(c),destroy);
     end;
     end else error('poped too much of stack ');
end;
function sstk.rpop:registerNumber;
var c:stackcellp;n:registerNumber;
begin
    if stackhead.pop(cellpntr(c)) then begin

    case c^.data.celltype of
    reg:
         begin rpop:=c^.data.r;dispose(c,destroy)end   ;

    int:
        begin
         n:=newreg(fint32);
         loadimm( n,c^.data.theint);
         dispose(c,destroy)
         end            ;
    ilcg: begin
         stackhead.push(cellpntr(c));
         n:=newreg(getformat(c^.data.thenode));
         pop(n);
         rpop:=n;
         end;
    else error('dont know how to pop a cell of this sort from stack ');
    end;
    end else error('poped too much from stack ');
end;

procedure sstk.dup;
var c:stackcellp; n:registerNumber;
begin
     if stackhead.pop(cellpntr(c)) then begin
     stackhead.push(cellpntr(c)); {restore stack}
     with c^.data do
     case celltype of
     reg: begin
             { make two symbolic copies of the register
               incrementing the count to prevent reuse }
             lockreg(registersused,r);
             push(r);  { put another copy on stack }
          end;
     int: begin
              { make two symbolic copies }

             pushint(theint);  { put another copy on stack }
          end;
     else begin
          n:=newreg(getformat(c^.data.thenode));
          pop(n);
          push(n);
          push(n);

          lockreg(registersused,n);
          end;
     end;
     end else error(' can not DUP stack here');
end;

procedure sstk.ddup;begin over;over;end;

procedure sstk.over;
var c,c2:stackcellp; n,n1:registerNumber;
begin
     if
     stackhead.pop(cellpntr(c)) and
     stackhead.pop(cellpntr(c2)) then begin
     stackhead.push(cellpntr(c2)); {restore stack}
     stackhead.push(cellpntr(c));
     with c2^.data do
     case celltype of
     addrpair:begin
                 new(c,newstackcell);
                 c^:=c2^;
                lockreg(registersused,c2^.data.base);  {}
                 stackhead.push(c); { this is a purely symbolic operation }
             end;
     reg: begin
             { make two symbolic copies of the register
               incrementing the count to prevent reuse }

             lockreg(registersused,r);
             push(r);  { put another copy on stack }
          end;
     int: begin
             { make two symbolic copies }
             pushint(theint);  { put another copy on stack }
          end;
     else begin
          n:=rpop;
          n1:=rpop;
          push(n1);
          push(n);
          push(n1);
          lockreg(registersused,n);
          end;
     end;
     end else error('can not Ddup stack');
end;
procedure sstk.drot;
var c,c2:stackcellp; n:registerNumber;
begin
     if stackhead.pop(cellpntr(c))and
     stackhead.pop(cellpntr(c2)) then begin
     n:=rpop;
     stackhead.push(cellpntr(c)); {restore stack}
     push(n);
     stackhead.push(cellpntr(c2));
     end else error('can not Drot stack');
end;
procedure sstk.rot;
var c,c2:stackcellp; n:registerNumber;
begin
     if stackhead.pop(cellpntr(c))and
     stackhead.pop(cellpntr(c2)) then begin
     stackhead.push(cellpntr(c)); {restore stack}
     stackhead.push(cellpntr(c2));
     end else error('can not ROT stack');
end;
procedure sstk.drop;

var c:cellpntr;

    i,del:integer;
begin
 if bytes > 0 then begin
    del:=0;
    i:=1;

    while (del<bytes) do begin
        if stackhead.pop(c) then begin
        with stackcellp(c)^.data do
        if celltype = loc then       begin

           incby( - int_size );
           addimm(sp,int_size);           del:=del+int_size
        end
        else
        if celltype = gap then
        begin

        incby( - gapsize );
        addimm(sp,gapsize);              del :=del+gapsize

        end
        else if celltype in[int,lab,reg] then begin
             if celltype=reg then registersused.freereg(r);
             del:=del+int_size
        end;
        dispose(stackcellp(c),destroy);
        end else error('trying to drop too much from stack');
    end;
    if del > bytes then begin claim((del ) - bytes );
                                    del:=bytes;
    end;
 end else begin
          error('error can not drop  bytes from stack');
          end;
end;
procedure sstk.retract; begin drop(sp2bp+offset) end;
procedure sstk.forget;
var c:cellpntr;

    i,del:integer;
begin
 if bytes > 0 then begin
    del:=0;
    i:=1;

    while (del<bytes) do begin
        if stackhead.pop(c) then begin
        with stackcellp(c)^.data do
        if celltype = loc then       begin

           incby( - int_size );
           del:=del+int_size
        end
        else
        if celltype = gap then
        begin

        incby( - gapsize );
        del :=del+gapsize

        end
        else if celltype in[int,lab,reg] then begin
             if celltype=reg then registersused.freereg(r);
             del:=del+int_size
        end;
        dispose(stackcellp(c),destroy);
        end else error('trying to drop too much from stack');
    end;
    if del > bytes then begin claim((del ) - bytes );
                                    del:=bytes;
    end;
 end else begin
          error('error can not drop  bytes from stack');
          end;
end;
procedure sstk.claim;
var c:stackcellp;
begin
     incby(bytes);
     addimm(sp,-bytes);
     new(c,newstackcell);
     c^.data.celltype:=gap;
     c^.data.gapsize:=bytes;
     stackhead.push(cellpntr(c));
end;
procedure reglocks.freereg(r:registerNumber);
    begin
         {$ifdef debug}
                 writeln('free ',registers[r].printsas, regs[r]:8);
         {$endif}
         regs[r]:=regs[r]-1;
         if regs[r]=0 then
         unreserve(r);
    end;

procedure reglocks.lockreg(r:registerNumber);
    begin
    {$ifdef debug}
                 writeln('lock ',registers[r].printsas,regs[r]:8) ;
         {$endif}
         if regs [r]=0 then reserve(r);
         regs[r]:=regs[r]+1;
    end;
procedure sstk.stackop;
var c:array[1..3] of stackcellp;
    i:integer;
    function twoconsts:boolean;
    begin
        twoconsts:=(c[1]^.data.celltype=int) and (c[2]^.data.celltype=int)
    end;
    function symbolic:boolean;
    var p:pilcgnode;
        procedure finishup;
        begin
                   dispose(c[1],destroy);
                   stackhead.push(c[2]);
                   symbolic:=true;
        end;
    begin
        symbolic:=false;
        if twoconsts then
        case op of
        addop:begin
                   c[2]^.data.theint:=c[1]^.data.theint+c[2]^.data.theint;
                   finishup;
              end;

        subop:begin
                   c[2]^.data.theint:=c[2]^.data.theint-c[1]^.data.theint;
                   finishup;
              end;
        bandop:begin
                   c[2]^.data.theint:= c[2]^.data.theint and
                                       c[1]^.data.theint;
                   finishup;
              end;

        borop:begin
                   c[2]^.data.theint:= c[2]^.data.theint or
                                       c[1]^.data.theint;
                   finishup;
              end;
        bxorop:begin
                   c[2]^.data.theint:= c[2]^.data.theint xor
                                       c[1]^.data.theint;
                   finishup;
              end;
        end
        else if (op = addop) and
                (c[1]^.data.celltype = int) and
                (c[2]^.data.celltype = reg)
             then
             begin

                  c[2]^.data.celltype:=addrpair;
                  c[2]^.data.base:=c[2]^.data.r;
                  c[2]^.data.negoffset:= -c[1]^.data.theint;
                  finishup;
             end else if (op = addop) and
                (c[1]^.data.celltype = int) and
                (c[2]^.data.celltype = addrpair)
             then
             begin
                  c[2]^.data.negoffset:= c[2]^.data.negoffset-c[1]^.data.theint;

                  finishup;
             end
        else if op in [  equal .. nz ] then
        begin
            p:=new_dyad((c[2]^).toilcg, condops[op]  , (c[1]^ ).toilcg);
            symbolic:=true;
            c[2]^.data.celltype:=ilcg;
            c[2]^.data.thenode:=p;
            stackhead.push(c[2]);
        end;
    end;
    { at the end of this procedure the cells value will be in aregister }
    procedure regforce(var c:stackcell;{first,last:registerNumber;}maxuse:integer);
    var rn:registerNumber;
    begin
         with c.data do begin
              case celltype of
              int: begin
                        rn:=newreg(fint32);
                        loadimm(rn,theint);
                        r:=rn;
                   end;
              loc: begin
                        rn:=newreg(len2form[bytecount]);
                        if loc2bp = sp2bp then begin
                          assemblersession.pop(rn);
                          incby(-int_size)
                        end
                        else begin
                            load(rn,fp, - loc2bp,bytecount)
                        end;
                        r:=rn;
                   end;
              lab: begin
                        rn:=newreg(faddr);
                        loadlab(rn,thelabel);
                        r:=rn;
                   end;
              reg: if not((registersused.usage(r)<=maxuse) )

                   then
                   begin
                        rn:=newreg(registers[c.data.r].format);
                        assemblersession.push(r);
                        assemblersession.pop(rn);
                        registersused.freereg(r);
                        r:=rn;

                   end;
              gap: begin writeln('gap fround in symbolic stack');
                         halt;
                         end;

              addrpair:begin addimm(base,- negoffset);
                             rn:=base; r:=rn;
                       end;

              end;
              celltype:=reg;
         end;
    end;
    procedure inregisters;
    var i:integer;
        n:registerNumber;
    begin
    case op of
    addop, subop, imulop, bandop, borop,idivop,imodop, bxorop:
           if (op=addop) and(c[1]^.data.celltype=int )
           then  { Add immediate }
           begin
                regforce(c[2]^,1);
                addimm(c[2]^.data.r,c[1]^.data.theint);
                dispose(c[1],destroy);
                stackhead.push(cellpntr(c[2]));
           end
           else
           begin

              if (op =imulop) or (op=idivop)
              or (op=imodop)then
              begin
                 stackhead.push(c[2]);
                 flushstk;
                 regforce(c[1]^,1);
                 if stackhead.pop(cellpntr(c[2])) then
                 regforce(c[2]^,1);
              end;

              if op in [subop,idivop] then i:=2 else i:=1;
              regforce(c[i]^,1);
              regforce(c[3-i]^,2);
              case op of
              addop: add(c[i]^.data.r,c[3-i]^.data.r);
              subop: sub(c[i]^.data.r,c[3-i]^.data.r);
              bandop: band(c[i]^.data.r,c[3-i]^.data.r);
              borop: bor(c[i]^.data.r,c[3-i]^.data.r);
              bxorop: bxor(c[i]^.data.r,c[3-i]^.data.r);
              imulop: imul(c[i]^.data.r,c[3-i]^.data.r);
              imodop: imod( c[i]^.data.r,c[3-i]^.data.r);
              idivop: idiv(c[i]^.data.r,c[3-i]^.data.r);
              else error('unrecognised stack operation');
              end;
              registersused.freereg(c[3-i]^.data.r);
              dispose(c[3-i],destroy);

              stackhead.push(cellpntr(c[i]));
           end;

    loadop:
           if c[1]^.data.celltype=addrpair then begin
              n:=newreg(faddr);
              load(n,c[1]^.data.base,-c[1]^.data.negoffset,len);
              registersused.freereg(c[1]^.data.base);
              c[1]^.data.r:=n;
              stackhead.push(cellpntr(c[1]));
           end else
           begin
              regforce(c[1]^,2); { must be gp reg }
              load(c[1]^.data.r,c[1]^.data.r,0,len);
              stackhead.push(cellpntr(c[1]));
            end;

    storeop:
           if c[2]^.data.celltype=addrpair then begin
                regforce(c[1]^,2);
                store(c[1]^.data.r,
                      c[2]^.data.base,
                     -c[2]^.data.negoffset,len);
                registersused.freereg(c[1]^.data.r);
                registersused.freereg(c[2]^.data.base);
                for i:=2 downto 1 do dispose(c[i],destroy);
           end else
            begin
                regforce(c[1]^,2);
                regforce(c[2]^,2);

                store(c[1]^.data.r,c[2]^.data.r,0,len);
                registersused.freereg(c[1]^.data.r);
                registersused.freereg(c[2]^.data.r);
                for i:=2 downto 1 do dispose(c[i],destroy);
            end
     else error('unrecognised stack operation');
    end;
    end;

var ok:boolean;
begin

     for i:=1 to 2 do ok:= stackhead.pop(cellpntr(c[i]));

     if ok then if not symbolic then inregisters;
end;
procedure act(var c,s:cellpntr; var continue:boolean);
begin
     stackcellp(c)^.flush(sstkp(s));
end;
procedure sstk.flushstk;
var act1:action;
begin
     show(output);
     act1:=act;
     stackhead.map(reversed,cellpntr(stackinfo),act1);
end;
procedure sstk.incby;
begin
     sp2bp:=sp2bp+i;
end;
procedure sstk.pushint;
var c:stackcellp;
begin
   new(c,newstackcell);
   with c^.data do begin
     celltype:=int;
     theint:=val;
   end;
   stackhead.push(c);
end;
procedure sstk.pushIlcg(Node:pilcgnode);
var c:stackcellp;
begin
     new(c,newstackcell);
     with c^.data do begin
     celltype:=ilcg;
     thenode:=node;
     end;
     stackhead.push(c);
end;
procedure sstk.pushlab;
var c:stackcellp;
begin
   new(c,newstackcell);
   with c^.data do begin
     celltype:=lab;
     thelabel:=l;
   end;
   stackhead.push(c);
end;
procedure stackcell.show;
begin
   with data do begin
        case celltype of
        ilcg: printtree(thenode,listing);
        gap: write(listing,'gap ',gapsize);
        lab: write(listing,'l',thelabel^.index);
        int: write(listing,theint);
        reg: write(listing,registers[r].printsas);
        addrpair: write(listing,registers[base].printsas,'+(',-negoffset,')');
        loc: write(listing,'[',-loc2bp,'+',registers[fp].printsas,']');
        end;
        writeln(listing);
   end;
end;
function stackcell.toilcg:pilcgnode;
var p:pilcgnode;
begin
with data do begin
         if verbose then show(output);
        case celltype of
        ilcg: p:=(thenode);
        lab: p:=thelabel;
        int: p:=new_intlit(theint,fint);
        reg: p:=new_register(r);

        loc : p:=new_memref(new_dyad(new_intlit(loc2bp,fint),'+',new_deref(new_register(fp))),vectorof(foctet,bytecount));

        addrpair:p:=new_dyad(new_deref(new_register(base)),'+',new_intlit(-negoffset,fint));
        else error('try to coerce impossible stack cell to ilcg');
        end;
        if verbose then begin
        write(' converted to ');
        printtree(p,output);     writeln;
        end;
        toilcg:=p
   end;
end;
procedure sstk.show;
var i:registerNumber;
begin
     write(listing,'SP to BP displacement =',sp2bp,' Used:');
     for i:=0 to lastreg do
         if  registersused.usage( i)>0 then
           write(listing,' ',registers[i].printsas,registersused.usage(i));
         writeln(listing);
         write(listing,'STACK: ');
         stackhead.show(listing);
         writeln(listing);

         assemblersession.show(listing);
end;
constructor stackcell.newstackcell;
begin
     newcell;
end;
{ FLUSH
       causes a stack cell to save its contents
       the parameter stackinfo gives access to the simulated
       run time stack on which this is to be done
}
procedure stackcell.flush;
var temp:registerNumber;
    working:integer;
begin
     with data do
     case celltype of
     addrpair: begin
                   temp:=stackinfo^.newreg(faddr);
                   stackinfo^.loadimm(temp,-negoffset);
                   stackinfo^.add(temp,base);
                   stackinfo^.pushphys(temp);
                   stackinfo^.incby(int_size);
                   stackinfo^.registersused.freereg(base);
                   celltype:=loc;
                   loc2bp:=stackinfo ^ . sp2bp;

                   stackinfo^.registersused.freereg(temp);
              end;
     int  : begin
               temp:=stackinfo^.newreg(fint);
               stackinfo^.loadimm(temp,theint);
               stackinfo^.pushphys(temp);
               celltype:=loc;
               stackinfo^.incby(int_size);
               loc2bp:=stackinfo^.sp2bp;
               stackinfo^.registersused.freereg(temp);
            end;
     reg  : begin
              stackinfo^.pushphys(r);
              stackinfo^.registersused.freereg(r);
              stackinfo ^.incby(int_size);
              celltype:=loc;
              loc2bp:=stackinfo ^ .sp2bp;
            end;
     lab:   begin
               temp:=stackinfo^.newreg(faddr);
               stackinfo^.loadlab(temp,data.thelabel);
               stackinfo^.pushphys(temp);
               celltype:=loc;
               stackinfo^.incby(int_size);
               loc2bp:=stackinfo^.sp2bp;
            end;
     end;
end;
function sstk.newreg(format:integer):registerNumber;
var I:registerNumber;ok:boolean;

begin
     { search for a free register }
     ok:=false;
     i:=findfreereg(format);
     ok:=i>=0;
     if ok     then begin
        lockreg(registersused,i);
        newreg:=i
     end else begin
         { free up the registers currently in use and try again }
         flushstk;
         newreg:=newreg(format);
     end;
end;
function reglocks.usage(r:registerNumber):integer;
begin

     if regs[r]>0 then usage:=regs[r] else
     if reserved(r) then usage:=1 else usage:=0
end;
constructor reglocks.initialise;
var i:integer;
begin for i:=0 to maxreg do regs[i]:=0 end;
procedure sstk.arithop;begin stackop(op,0); end;
end.

