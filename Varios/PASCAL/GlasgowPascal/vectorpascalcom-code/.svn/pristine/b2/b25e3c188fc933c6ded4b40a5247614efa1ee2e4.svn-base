{$O+}{$F+}
UNIT sagen;
interface   uses
  {crt,   }
  reals,
  bufdecls,
  errors,
  {$ifndef pretext}
  fsmpret,
  dlbpret,
  fio,
  {$endif}
  {$ifdef pretext} fio,
  fsmpret,dlbpret,  lines,
  {$endif}
  idtypes
  {$ifdef i8086}
  ,

  opcodes,assemble
  {$endif}
  {$ifdef i80386}
  ,riscasm
  ,lists
  ,files
  ,stacks
  ,symstk
  {$ifdef os2},linkstk{$endif}


  {$endif};

const
      nillabl=0;

      Trueval = -1;
      falseval=0;
      codegen_version_number ={$ifdef i80386} 4.1
                              {$endif}
                              {$ifndef i80386} 3.2
                              {$endif};


var
     segment,classification: textline;
     asmfile:text;
     pidreg,line_number:namedesc;


procedure init_cgen(seg,classification:textline);

procedure start_program;
procedure end_program(seg:textline);
procedure start_library;
procedure start_libmain;
procedure end_library(seg:textline);
procedure finalise_cgen;


{ ---------------------- STACK ADJUSTMENT ----------------------------- }
procedure duplicate(t:typerec);
procedure epilogop(proctype:typerec;oldoffs:integer);
procedure prologop(ll:integer);
function stack_ptr:integer;
procedure enter_stackframe;
procedure claimstack(t:typerec);
procedure forget(bytes:integer);
procedure discard(var i:idrec; t:typerec);
{---------------------- STORE ALLOCATION -------------------------------}
function codeorigin:longint;
function declare_local(var t:idrec):integer;
function declare_global(var t:idrec):integer;
function fixupresult(var i:idrec;paramsize:word):integer;
procedure correct_param(var i:idrec;paramsize,resultsize:word);
function fixup_param(var i:idrec):integer;
procedure floatop;
procedure float2op;

{-------------------------- CONTROL FLOW -------------------------------}
procedure plant(l:labels);
procedure release_label(l:labels);
procedure form_closure(l:labels);
procedure call_proc( i:namedesc);
procedure aliencall(s:textline);
procedure bindop;
procedure start_external(procname:textline);
procedure plant_string(s:textline);
procedure plant_integer(i:longint);
procedure end_external(procname:textline);
procedure jumpop(var l:labels);
procedure jumpt(var l:labels);
procedure form_boolean;
procedure jumpf(var l:labels);
function newlab:labl;

{ ---------------------------------------------------------------- }
{      LOAD OPERATIONS                                             }
{ ---------------------------------------------------------------- }
procedure addoffset(n:namedesc);
procedure ll_int(i:integer);
procedure loadtrademark(n:namedesc);
{procedure pushfloatreg;}
procedure datasegprefix;
procedure ll_real(r:real);
procedure load(n: namedesc);
procedure loadindir(var t:typerec);
procedure assindir(var t:typerec);
procedure ll_nil;
procedure load_addr(n:namedesc);
{ ---------------------------------------------------------------- }
{       OPERATIONS ON HEAP OBJECTS                                 }
{ ---------------------------------------------------------------- }
function runtimesize( t:typerec):integer;   { return size in strides on stack}
function heapsizeof(t:typerec):integer; { return size in strides on heap }
procedure make_vector;
procedure iliffeop(levels:integer; var t:typerec);
procedure makepntrarray(lower,upper:namedesc);
procedure ll_string(s:textline);
procedure declarestructure( classification:textline;
                            pntrs,reals,ints:integer;
                            n:namedesc);
procedure formstruct(n:namedesc);
procedure dup;
{------------------------ DATA MANIPULATION -----------------------}
procedure binaryop(operation:lexeme;T:typerec);
procedure negop(t:typerec);
procedure notop;
{ ----------------------- INPUT OUTPUT ----------------------------}
procedure readop(s:lexeme;var t:typerec);
procedure writeop(var t:typerec);
procedure end_write;
procedure out_byte_op;
procedure newlineop;
{ ----------------------- Version Control -------------------------}
procedure codever;
{$ifdef issalgol}
{ OBSOLETE CALLS }
procedure decsp( t:typerec);
procedure pushpreg;
procedure retractstack(newstack:integer);
procedure expand_to_pntr(t:typerec);
procedure discard_param(var i:idrec);
procedure jumpfar(s:textline);
procedure aliencall(s:textline);
procedure bjump(l:labels);
procedure forprepop;
procedure forstepop(complex:boolean; l:labels);
procedure assignop( n:namedesc);
procedure fortestop(complex:boolean;var l:labels);
procedure loadstruct(n:namedesc);
procedure subsass(field:namedesc;var t:typerec);
procedure subs(field:namedesc;var t:typerec);
procedure substrop;
procedure upbop;
procedure lwbop;
procedure subv(var t:typerec);
procedure subvass(var t:typerec);
procedure mcktab;
procedure inittab;
function tab_insert(var t:typerec):textline;
function tab_lookup(var t:typerec):textline;
procedure mustbeop;

{$endif}

IMPLEMENTATION

{$ifdef i8086}
{$i sagen.cmp}
{$endif}
{$ifdef i80386}
const stdout=1;
var
    SM:{$ifdef os2}linkablep{$endif}
       {$ifndef os2} sstkp{$endif};        { stack machine }
    SMstack:stack;   { a stack of stack machines }
    pc:longint;
    param_sp:integer;{ offset from bp of the parameters }
    bf:bytefileobjp;
    nextexternal,past,stringcount:labels;
    opstack: array [1..60] of lexeme;
    opsp:1..60;
    int18h:string[2];

procedure init_cgen;
begin
     shortfilename;
     new(bf,open(shortname+objectfilesuffix,1));
     {$ifdef os2}
     new(SM,mklinkable(codeorigin));
     {$endif}
     {$ifndef os2}
     new(SM,startsstk(codeorigin));
     {$endif}
     nextexternal:=SM^.mklabel;
     SMstack.newstack;
end;
procedure start_program;
begin
     SM^.push(sp);
     SM^.pop(bp);
end;
procedure end_program;
begin
     if objectfilesuffix='.com' then
     SM^.plantbytes(chr($cd)+chr($20)); {program terminate }
     SM^.return(0);
     SM^.show(listfilehandle);
     SM^.startpass2(bf,pc);
     dispose(SM,destroy);
     bf^.destroy;
end;
procedure start_library;begin SM^.jump(unconditional,nextexternal) end;
procedure start_libmain;begin plant(nextexternal);start_program end;
procedure end_library;
begin
    end_program(segment);
end;
procedure finalise_cgen; begin end;
procedure duplicate;begin SM^.dup end;


procedure prologop(ll:integer);

begin
{ we assume that every procedure has passed to it as param 0 the
  static link thus the stack looks like this before prologop runs
                             HIgh addr
  bp ---> + old frame   +
          + old vars    +
          + returned val+
          + params      +
          + seg of sl   +
          + offset of sl+
          + seg of proc +
          + ofs of proc +
          + seg of ret a+
  sp----->+ ofs of ret a+
                            Low addr

}
{ first push bp  to form dynamic link }
  SM^.push(bp);
{ the stack now looks like

                             HIgh addr
  bp ---> + old frame   +
          + old vars    +
          + returned val+
          + params      +   28
          + seg of sl   +   24
          + ofs of sl   +   20
          + seg of proc +   16
          + offset proc +   12
          + seg of ret a+   8
          + ofs of ret a+   4
  sp----->+ ofs of dl   +
                            Low addr

  we assume that on entry the stack is on a 4 byte address boundary.
  we next want toset the bp to point here to the sp
}
   SM^.push(sp);
   SM^.pop(bp);

{ the stack now looks like

                             HIgh addr
  bp ---> + old frame   +
          + old vars    +
          + returned val+
          + params      +
          + seg of sl   +
          + ofs of sl   +
          + seg of proc +
          + offset proc +
          + seg of ret a+
  bp----->+ ofs of ret a+
                            Low addr
  }
  SM^.sp2bp:=0;
end;
const calloverhead = 16 ; { the minimum extra space on the stack after
                            the params have been pushed and before the
                            return address made up of
                            16 bytes of procedure closure}
      sloffset     = 20 ; { offset from bp to static link }
      closureoffset= 12 ; { offset from bp to closure }
procedure epilogop(proctype:typerec;oldoffs:integer);
var discard:integer;
begin

  with proctype^ do begin

          if domain = nil then discard:=0
          else discard := domainspace ;
  end;

  SM^.push(bp);SM^.pop(sp);SM^.pop(Bp);
  SM^.return(discard+calloverhead);
  SM^.sp2bp:=oldoffs;
end;


procedure enter_stackframe;
begin
     param_sp:=calloverhead+closureoffset;   { offset of first param from stack }
end;


procedure drop(strides:integer);
begin
     SM^.drop(strides);
end;
procedure claimstack(t:typerec);
var s:integer;
begin
     s:=stackspace(t);
     SM^.claim(s);
end;
procedure forget;begin SM^.forget(bytes);end;
function declare_global(var t:idrec):integer;
begin
    declare_global := -SM^.sp2bp;
end;

function declare_local(var t:idrec):integer;
begin
    declare_local := -SM^.sp2bp;
end;


function fixup_param(var i:idrec):integer;
var size:word;
begin
     size:=stackspace(i.typeinfo);
     {$ifdef debug}
     writeln(listfile,ptype(i.typeinfo),' param_sp=',param_sp,'size=',size);
     {$endif}
     i.offset:=param_sp;
     param_sp := size + param_sp;
     {$ifdef debug}
     writeln(listfile,ptype(i.typeinfo),' param_sp=',param_sp,'size=',size);
     {$endif}
     fixup_param:=size;
end;
function fixupresult(var i:idrec;paramsize:word):integer;
var size:byte;
begin
     fixupresult:=fixup_param(i);
end;

procedure correct_param(var i:idrec;paramsize,resultsize:word);
begin
    if resultsize >paramsize then
       i.offset:=i.offset +resultsize-paramsize;
end;
procedure primproc(s:textline;discarding:integer);
begin
     aliencall(s);SM^.forget(discarding);
end;
procedure floatop;begin aliencall('floatop'); end;
procedure float2op;begin aliencall('float2op'); end;
procedure plant; begin SM^.plantlabel(l) end;
procedure release_label; begin end;
procedure form_closure;
var l1,l2,l3:labl;
begin
{
     A closure is a 16 byte structure looking like

            + 32 bit seg of static link    + 12
            + 32 bit offset of static link + 8
            + 32 bit seg of code for proc  + 4
            + 32 bit offset of proc        + 0

     that specifies where a procedure is and what its
     environment is
}
l1:=newlab;l2:=newlab;l3:=newlab;
SM^.plantlabel(l1);

SM^.push(sseg); { seg of static link }
SM^.push(bp);   { offset of static link }
SM^.push(cseg); { seg of code }
SM^.plantlabel(l2);
SM^.pushlab(l); { label specifying code offset }
SM^.plantlabel(l3);
SM^.flushstk;
end;
procedure call_proc;
begin
{    On entry to this procedure it is assumed that the
     parameters have been pushed
     we first load the closure}

 with scopelist[i] ^ do begin
     if name_type = static then begin
     { this is a library procedure with no global environment }
        SM^.pushint(0);
        SM^.pushint(0); { null static chain }
        SM^.push(cseg); { it is in current seg}
        SM^.pushlab(lab);
     end else  load(i);

     SM^.call(sseg,sp,0);         { call the procedure  }
     { forget params  they  have been discarded by the ret instruction }
     SM^.incby(-typeinfo^.domainspace-16);
    end;
end;
procedure aliencall;
begin
     {
     This makes a call using the dynamic linker.
     We do not know what the code address will be,
     or what the appropriate static link is.
     It is assumed that the called procedure expects the stack frame
     to be the same as for a call to an ordinary proc
     thus the stack is advanced to allow for a dummy
     closure plus 2 bytes of padding
     }
     SM^.loadimm(lastworkreg,18); { padding is size of closure +2}
     SM^.sub(sp,lastworkreg); { put in the padding }
     SM^.plantbytes(int18h+s+chr(0));

end;

procedure bindop;
begin
{
     This is a call to the second level dynamic binder
     it expects three strings on the stack giving
     the name ,type, and segment of the procedure to
     be found.
     It returns a closure
     }
     aliencall('bind');
     drop(3* pntr_on_stack_size);
end;

procedure start_external(procname:textline);
begin
     plant(nextexternal);
     nextexternal:=newlab;
     jumpop(nextexternal);
     plant_string(procname);

end;
procedure end_external(procname:textline);
begin
end;

procedure discard(var i:idrec; t:typerec);
{ pop tos and assign to i, then make i top of stack }
var newsp,ownsize,dif:integer;tc :string[5];t1,t2:typerec;
begin
       ownsize:= runtimesize(i.typeinfo);
       newsp := i.offset + ownsize- ( runtimesize(t));
       if not eq(t,VOID )then begin
       { put new address on top of stack }
       SM^.push(sseg);SM^.push(bp);SM^.push(newsp);SM^.arithop(addop);
       { now place address of old top of stack value on top of stack }
       SM^.flushstk;
       SM^.push(sseg);SM^.push(sp);SM^.push(address_size);SM^.arithop(addop);
       t1:=addressof(t);
       t2:=t1;
       loadindir(t2); { load it onto top of stack }
       assindir(t1);  { assign it to new location }
       dispose(t1);
       end;
       SM^.retract(newsp);
end;
procedure plant_integer;begin SM^.plantword(i)end;
procedure plant_string(s:textline);
var i :integer;
begin
     {$ifndef ispascal}
     SM^. plantword (length(s));
     {$endif}

     {$ifdef ispascal}
     SM^. plantbytes(chr(length(s)));
     {$endif}
     SM^.plantbytes(s);

end;
procedure jumpop;begin SM^.jump(unconditional,l) end;

{ ---------- CONDITION STACK ---------------
  conditions are pushed onto the condition stack
  when conditional operators are encountered
  when a true jump has to be performed,
  the result in the status flags is used interpreted
  according to what the last comparison was
}
procedure Push(l:lexeme);
begin
     opstack[opsp]:=l; opsp:=opsp+1;
end;
function pop:lexeme;
begin
     if opsp>1 then opsp:=opsp-1;
     pop := opstack[opsp];
end;


function writecond(invert:boolean):condition;
  var s:condition;
begin
  s:=lessthan;
  case pop of
  lt_sy    :s:=lessthan;
  le_sy    :s:=le;
  gt_sy    :s:=greaterthan;
  ge_sy    :s:=ge;
  eq_sy,
  is_sy    :s:=equal;
  neq_sy,
  isnt_sy  :s:=nz;
  else error('Unkown comparison operator ');
  end;
  if invert then
  case s of
  lessthan      :s:=ge;
  le            :s:=greaterthan;
  greaterthan   :s:=le;
  ge            :s:=lessthan;
  equal         :s:=nz;
  nz            :s:=equal;
  end;
  writecond:=s
 end;


procedure jumpt(var l:labl);
begin
  SM^.jump(writecond(false),l)
end;
procedure form_boolean;
{ there is a condition code set, convert it to a boolean }
var l1,l2:labl;
begin
     l1:=newlab;l2:=newlab;
     jumpt(l1);ll_int(0);jumpop(l2);SM^.forget(runtimesize(int_type));
     plant(l1);ll_int(1);plant(l2);
end;

procedure jumpf(var l:labl);
var skip:labl;
begin
  SM^.jump(writecond(true),l);
end;
function newlab:labl;begin newlab:=SM^.mklabel end;

procedure addoffset(n:namedesc);
begin
     ll_int(scopelist[n]^.offset);
     binaryop(plus_sy,int_type);
end;
procedure ll_int;begin SM^.pushint(i)end;
procedure ll_real;
var conv:record
               case boolean of
               true:(f:real);
               false:(i:array[1..2] of longint);
               end;
begin
     conv.f:=r;
     SM^.pushint(conv.i[2]);
     SM^.pushint(conv.i[1])
end;
procedure loadtrademark(n:namedesc);
begin
     { load the address of the trademark record onto the stack }
	 load(n);

end;

procedure datasegprefix;
begin
     past:=newlab;stringcount:=newlab;
     jumpop(past);plant(stringcount);
end;

procedure load(n: namedesc);
var t,t1:typerec;
begin
    load_addr(n);
    with scopelist[n] ^ do begin
    t:=addressof(typeinfo);t1:=t;loadindir(t1);
    dispose(t)
    end;
end;

procedure loadindir(var t:typerec);
var s:integer;
begin
        t:=rangeof(t);
        s:= runtimesize(t) ;
        if s <=int_size then
            SM^.stackop(loadop,s)
        else
        if s= real_size then begin
                       SM^.ddup;
                       SM^.pushint(4);
                       SM^.arithop(addop);
                       SM^.stackop(loadop,4);
                       SM^.drot;
                       SM^.stackop(loadop,4);
                  end
        else if s =(16) then
             begin


                       SM^.ddup;
                       SM^.pushint(12);
                       SM^.arithop(addop);
                       SM^.stackop(loadop,4);
                       SM^.drot;
                       SM^.ddup;
                       SM^.pushint(8);
                       SM^.arithop(addop);
                       SM^.stackop(loadop,4);
                       SM^.drot;
                       SM^.ddup;
                       SM^.pushint(4);
                       SM^.arithop(addop);
                       SM^.stackop(loadop,4);
                       SM^.drot;
                       SM^.stackop(loadop,4);
             end
             else begin
                       SM^.claim(runtimesize(t)  -address_size);
                       { claim space for the data to go into }
                       SM^.pushint(runtimesize(t));
                       aliencall('load');
                       { the library routine load takes
                         a stack that looks like
                         + seg of object     +
                         + ofs of object     +
                         + space  ......     +
                         + size of object    +
                         and returns a stack that looks like
                         + object            +
                         }
             end;

end;

procedure assindir(var t:typerec);
var s:integer;r1,r2:register;
begin
        t:=rangeof(t);
        s:= runtimesize(t) ;
        if s <=int_size then
            SM^.stackop(storeop,s)
        else
        if s= real_size then begin
                       r1:=SM^.rpop;
                       r2:=SM^.rpop;

                       SM^.ddup;
                       SM^.push(r1);
                       SM^.stackop(storeop,4);

                       SM^.pushint(4);
                       SM^.arithop(addop);
                       SM^.push(r2);
                       SM^.stackop(storeop,4);
                  end
             else begin
                       { claim space for the data to go into }
                       SM^.pushint(runtimesize(t));
                       aliencall('store');
             end;

end;
procedure ll_nil;begin ll_int(0);ll_int(0) end;


procedure load_addr(n: namedesc);
{ load the address of variable n onto the stack }
var lexdiff:integer;
begin
    with scopelist[n] ^ do
      begin
          if name_type=constant then begin
                 SM^.push(cseg);SM^. pushlab(lab)
                 end else

                  begin { other }
                    { compute how far down the static chain to
                      chase
                    }
                    lexdiff:=lexical_level - lex_level ;
                    SM^.push(sseg);SM^.push(bp);
                    while lexdiff >0 do begin
                        { stack top now holds start of a frame }
                        SM^.pushint(sloffset);
                        SM^.arithop(addop);
                        { top of stack now holds address of static link }

                       SM^.ddup;
                       SM^.pushint(int_size);
                       SM^.arithop(addop);
                       SM^.stackop(loadop,int_size);
                       SM^.drot;
                       SM^.stackop(loadop,int_size);
                       { the static link itself is now on top of stack }
                       lexdiff:=lexdiff-1;
                    end;
                    { top of stack now holds the base of the
                      frame containing the variable
                      Add the offset to it to find the address
                      of the variable
                    }
                    SM^.pushint(offset);
                    SM^.arithop(addop);

                  end;
        end;
   end;

function runtimesize( t:typerec):integer;   { return size in bytes }
begin
   runtimesize:=stackspace(t) ;
end;
function heapsizeof( t:typerec):integer;   { return size in bytes }
begin
   heapsizeof:=heapspace(t) ;
end;
procedure make_vector;
begin
{$ifndef ispascal}
  aliencall('makevec');
{$endif}
end;

procedure iliffeop(levels:integer; var t:typerec);
var s:string[7];
    sz:integer;
begin
  sz:=runtimesize(t);
  ll_int(sz);
  ll_int(levels);
  if ispid(t) then  aliencall('_iliffepntr')else
  if sz =int_size then aliencall('_iliffeint') else
  if sz=real_size then aliencall('_iliffereal');

end;

procedure makepntrarray(lower,upper:namedesc);
var t:typerec;
    j:integer;
begin
     t:=pntr_type;
     load(lower);load(upper);ll_nil;iliffeop(1,t);
end;

procedure ll_string(s:textline);
begin
     datasegprefix;
     plant_string(s); plant(past);
     SM^.push(cseg);SM^.pushlab(stringcount);
end;

procedure declarestructure( classification:textline;
                            pntrs,reals,ints:integer;
                            n:namedesc);
{ this writes information into the datasegment to desscribe a structure classification }
{ this information is of the form
       <pntrs>     a 8 bit field holding number of pntrs in classification
       <reals>     a 8 bit field holding number of reals in classification
       <ints>                             number of integers in classification
       <len>       length of the name of the classification
       <c>*n       the name itself padded out to at leat 13 bytes
}
var i:integer;offset:labl;
    s:string[50];
begin

     datasegprefix;
	 offset:=stringcount;
     plant(offset);
     { plant a nil pid that will be initialised at run time to point to }
     { the sdesc for the structure classification                                }
     SM^.plantbytes(chr(pntrs)+chr(reals)+chr(ints)+classification[0]+classification);
     if length(classification)<14 then
        for i:=length(classification) to  14 do SM^.plantbytes(chr(0));
     plant(past);
     SM^.push(cseg);
     SM^.pushlab(offset);
end;
procedure formstruct(n:namedesc);
{ this is used to create an instance of a structure }
begin
     load(n);
     aliencall( '_formstruct');
end;
procedure loadstruct(n:namedesc);
begin
     SM^.push(cseg);SM^.pushlab(scopelist[n]^.lab);
end;
procedure dup;begin SM^.dup end;

{ -------------------------------------------------------------- }
{            ARITHMETIC                                          }
{ -------------------------------------------------------------- }
procedure notop;
begin
  { Perform a not by XORing with all ones  }
  SM^.pushint(trueval);
  SM^.arithop(bxorop);
end;

procedure negop(t:typerec);
begin
    if typecode(t)='r' then aliencall('_negopr') else
  { change sign by subtracting from zero }

  begin SM^.pushint(0);SM^.rot; SM^.arithop(subop); end;
end;
{----------------------------- arithmetic ---------------------------}
procedure binaryop(operation:lexeme;T:typerec);
label realcomp;
  type opcode=instruction;
  var s: textline;op:opcode;
  procedure intop(op:opcode);
  begin
     SM^.arithop(op);
  end;
  procedure intarith(op:opcode;reverse:boolean);
  begin

       if reverse then begin
           SM^.rot
       end;
       intop(op);
  end;
  procedure operror;
  begin
       s:=psym(ord(operation));
       writeln(s);
       s:='illegal operator or bad type '+s;
       error(s);
  end;
  procedure callr(t:textline);{ call real arith subroutine }
  begin
    aliencall(t);
    SM^.forget(runtimesize(real_type));
  end;
begin
  {s:=psym(operation);}
  {$ifdef issalgol}
  if (operation = dplus_sy)and isvector(t) then begin
                   op:=concat_op;
                   decsp(string_type);
                   assem(op,0,0 );


       end
  else
  if eq(t,string_type)or eq(t,cstring_type)
  then begin

     case operation of
     dplus_sy:begin
                   op:=concat_op;
                   decsp(string_type);
                   assem(op,0,0 );
              end;
     lt_sy,
     le_sy,
     gt_sy,
     ge_sy,
     eq_sy,
     neq_sy:begin assem( cmpops,0,0); push(operation);
                  drop(2*pntr_on_stack_size);   { remove both operands }
                  assem(cmp_ax,0,0);
                  end;
     else operror;
     end;
  end else
  {$endif}
  case t^.atomictypeid of
  {$ifdef issalgol}
  structure_sy:begin

                    push(operation);
                    aliencall('_isop');
                    retractstaCK(STACK_PTR+(STRIDE*runtimesize(PNTR_TYPE))
                                 +stride*2 *runtimesize(int_type));

                    assem(cmp_ax,1,0);
               end; {$endif}
  int_sy,cint_sy: begin
  case operation of
  plus_sy:begin intarith(addop,false);
           end;
  star_sy:begin intarith(imulop,false);
           end;
  minus_sy:begin intarith(subop,false);
           end;
  div_sy:begin
          intop(idivop);
           end;
  shift_l_sy: primproc('shiftl',int_size);
  shift_r_sy: primproc('shiftr',int_size);
  b_and_sy:intarith(bandop,false);
  b_or_sy:intarith(borop,false);
  rem_sy:begin
          intop(imodop);
         end;
  lt_sy,
  le_sy,
  gt_sy,
  ge_sy,
  eq_sy,
  neq_sy:begin
                 SM^.arithop(subop);

                 SM^.drop(int_size);

                  push(operation);
                                        { remove both operands }
                                        { leave result in flags }

                  end;
  else operror;
  end;{ of case}
  end; {of begin }
  real_sy,creal_sy:  begin
     case operation of
     plus_sy:callr('plusr');
     minus_sy:callr('minusr');
     star_sy:callr('timesr');
     slash_sy: callr('divr');
     lt_sy,
     le_sy,
     gt_sy,
     ge_sy,
     eq_sy,
     neq_sy:begin
        realcomp:  push(operation);            { to be used in subs jumps }
                   primproc('compopr',2*real_size-int_size);
                   { the above proc leaves an integer on stack }
                   ll_int(0);
                   intop(subop);
                   SM^.drop(int_size);
                                               { leave result in flags }
                  end;
     else operror;
     end;
  end;
  else begin

       if operation in [eq_sy,neq_sy] then begin
           { treat as real comparison }
           goto realcomp;
       end
       {$ifdef issalgol}
       else if (t^.constructr=map) and( t^.maptype=  ord(structure_sy))
       then begin

                    push(operation);
                    aliencall('_isop');
                    retractstaCK(STACK_PTR+(STRIDE*runtimesize(PNTR_TYPE))
                                 +stride*2 *runtimesize(int_type));

                    assem(cmp_ax,1,0);
               end
       {$endif}
       else operror;
       end;
  end;
end;



{ -------------------------------------------------------------------- }
{         INPUT OPERATIONS                                             }
{ -------------------------------------------------------------------- }
procedure readop(s:lexeme;var t:typerec);
   procedure stringsetup;begin
                  t:=string_type;drop(int_size-runtimesize(t));
                end;
begin
     case s of
     {-------------- read pntr ----------------------}
     readp_sy:begin
                   t:=pntr_type;drop(int_size-runtimesize(t));
                   aliencall('_readp');
                   end;
     {--------------- STRING READS ------------------}
     read_sy:begin
                  stringsetup;
                  aliencall('_read');
             end;
     reads_sy:begin
                  stringsetup;
                  aliencall('_reads');
             end;
     read_a_line_sy:begin
                  stringsetup;
                  aliencall('_read_a_line');
             end;
     peek_sy:begin
                  stringsetup;
                  aliencall('_peek');
             end;
     {------------------ read REAL ---------------------}
     readr_sy:begin
                   t:=real_type;
                   drop(int_size-real_size);
                   aliencall('_readr');
              end;
     readb_sy:begin
                   t:=bool_type;
                   aliencall('_readb');
              end;
     eoi_sy:begin
                   t:=bool_type;
                   aliencall('_eoi');
              end;

     readi_sy:begin
                   t:=int_type;
                   aliencall('_readi');
              end;
     read_byte_sy:begin
                   t:=int_type;
                   aliencall('_read_byte');
              end;
     end;
end;

{ -------------------------------------------------------------------- }
{        OUTPUT OPERATIONS                                             }
{ -------------------------------------------------------------------- }

procedure out_byte_op;
begin
  primproc('outbyte',2*int_size);
end;
procedure start_write;
begin
  ll_int(stdout);
end;

procedure writeop(var t:typerec);
var s:string[10];
begin
{$ifdef issalgol}
  if t^.constructr = atomic
  then
  case t^.atomictypeid of
  int_sy,cint_sy:assem(writeint,0,0);
  real_sy,creal_sy:assem(writereal,0,0);
  pntr_sy,cpntr_sy:assem(writepntr,0,0);
  bool_sy,cbool_sy:assem(writebool,0,0);
  else error('cant write');
  end
  else begin
     match(t,string_type);
     assem(writestring,0,0)
  end
{$endif}
end;

procedure end_write;
begin
  drop( int_size) ;                { remove file }
end;

procedure newlineop;
var i:integer;t,t1:typerec;
begin
     i:=the_line;
     t:=addressof(int_type);
     t1:=t;
     load_addr(line_number);
     ll_int (i);
     assindir(t1);
     dispose(t1);
     if (i mod 10)=0 then
     if not(listing in options ) then begin
        if batch in options then write('.') else begin
            write(i:6);
        end;
     end;
     if trace then aliencall('_trace');
end;
procedure codever;
begin
     writeln('80386 optimising code generator version ', codegen_version_number:2:3);
end;
function codeorigin;begin if objectfilesuffix='.com' then
                             codeorigin:=256
                             else codeorigin:=0;
                    end;
function stack_ptr:integer;begin stack_ptr:=sm^.sp2bp end;
begin
  opsp:=1;
  int18h:=chr($cd)+chr($18);
{$endif}


end.