{ ================= DUMMY CODE GENERATOR =====================}
UNIT cgendum;
interface   uses
  crt,
  reals,
  bufdecls,
  errors,
  fsm,
  dlb,
  idtypes;

const
      nillabl=0;
      stride =2;
      int_size = 1;
      long_int_size = 2;
      proc_size = 2;
      real_size = 4;
      pntr_on_stack_size = 8;   { times stride to get bytes }
      heappntr_size = 8;
      codegen_version_number = 1;

type
  labl= integer;

var stack_ptr:integer;
     trace:boolean ;
     segment,class: textline;
     asmfile:text;
     pidreg,line_number:namedesc;


procedure init_cgen(seg,class:textline);
procedure start_library;
procedure start_program;
procedure end_program(seg:textline);

procedure end_library(seg:textline);
procedure finalise_cgen;


{ ---------------------- STACK ADJUSTMENT ----------------------------- }

procedure epilogop(proctype:typerec);
procedure prologop(ll:integer);
procedure decsp(var t:typerec);
function enter_stackframe:integer;
procedure pushpreg;
procedure retractstack(newstack:integer);
procedure expand_to_pntr(t:typerec);
{---------------------- STORE ALLOCATION -------------------------------}

function declare_local(var t:idrec):integer;
procedure discard(var i:idrec;var t:typerec);
procedure discard_param(var i:idrec);
function declare_global(var t:idrec):integer;
function fixup_result(var i:idrec;paramsize:byte):integer;procedure correct_param(var i:idrec;paramsize,resultsize:byte);
function fixup_param(var i:idrec):integer;
procedure floatop;
procedure float2op;
{-------------------------- CONTROL FLOW -------------------------------}
procedure plant(l:labl);
procedure release_label(l:labl);
procedure form_closure(l:labl);
procedure call_proc( i:namedesc);
procedure jumpfar(s:textline);
procedure aliencall(s:textline);
procedure callc(s:textline);
procedure start_external(procname:textline);
procedure end_external(procname:textline);
procedure jumpop(var l:labl);
procedure bjump(l:labl);
procedure jumpt(var l:labl);
procedure form_boolean;
procedure jumpf(var l:labl);
procedure cjump(var l:labl);
procedure forprepop;
function newlab:integer;
procedure forstepop(complex:boolean; l:labl);
procedure fortestop(complex:boolean;var l:labl);

{ ---------------------------------------------------------------- }
{      LOAD OPERATIONS                                             }
{ ---------------------------------------------------------------- }
procedure ll_int(i:integer);
procedure loadtrademark(n:namedesc);
procedure pushfloatreg;
procedure datasegprefix;
procedure datasegpostfix;
procedure ll_real(r:real);
procedure load(n: namedesc);

procedure bindop;
function ll_nil:integer;
procedure assignop( n:namedesc);
procedure load_addr(n:namedesc);
{ ---------------------------------------------------------------- }
{       OPERATIONS ON HEAP OBJECTS                                 }
{ ---------------------------------------------------------------- }
function sizeof(var t:typerec):integer;   { return size in strides }
procedure make_vector;
procedure iliffeop(levels:integer; var t:typerec);
procedure makepntrarray(lower,upper:namedesc);
procedure ll_string(s:textline);

procedure plant_string(s:textline);
procedure declarestructure( class:textline;
                            pntrs,reals,ints:integer;
                            n:namedesc);
procedure formstruct(n:namedesc);
procedure loadstruct(n:namedesc);
procedure subsass(class,field:namedesc;var t:typerec);
procedure subs(class,field:namedesc;var t:typerec);
procedure subsinit(var field:idrec);
procedure substrop;
procedure upbop;
procedure lwbop;
procedure subv(var t:typerec);
procedure subvass(var t:typerec);
procedure mcktab;
procedure inittab;
procedure tab_insert(var t:typerec);
procedure tab_lookup(var t:typerec);
{------------------------ DATA MANIPULATION -----------------------}
procedure binaryop(operation:lexeme;T:typerec);
procedure negop(t:typerec);
procedure notop;
{ ----------------------- INPUT OUTPUT ----------------------------}
procedure readop(s:lexeme;var t:typerec);
procedure writeop(var t:typerec);
procedure end_write;
procedure newlineop;
procedure out_byte_op;
{ ----------------------- Version Control -------------------------}
procedure codever;
IMPLEMENTATION
const

      callform = 'far';
      param_offset = 2;
      stacksize = 1000;
      pstacksize =1000;
      stdout = 1;

var
  next_external,next_label_num,
  psp,param_sp,discard_param_count:integer;
  code_str,comment_str:textline;
  opstack: array [1..100] of lexeme;
  opsp:1..100;
  stringcount:integer;


const
      dynalink:boolean = true;
      debugging:boolean = false;
procedure codever;
begin
     writeln('Macro code generator version ', codegen_version_number);
end;
{ ------------------------------------------------------------------ }
{       PRINTIDREC                                                   }
{------------------------------------------------------------------- }
procedure printidrec(var i:idrec);
var s:string[200];
begin
    with i do begin
         s:=ptype(typeinfo);
         writeln;
          write('ll =',lex_level,' offs =',offset,' id =',ord(identifier));
          write(' ',s);
     end;
end;
{ ------------------------------------------------------------------ }
{       PRINTSYMTAB                                                  }
{ ------------------------------------------------------------------ }
procedure printsymtab;
var i:integer;
begin
{     for i:=nametop-1 downto nulid do
         printidrec(scopelist [i] ^);
         writeln;}
end;
procedure Push(l:lexeme);
begin
     opstack[opsp]:=l; opsp:=opsp+1;
end;
function pop:lexeme;
begin
     opsp:=opsp-1;
     pop := opstack[opsp];
end;


function newlab:integer;
begin
     next_label_num:=next_label_num+1;
     newlab:=next_label_num;
end;
procedure writetype(var t:typerec);
  var s: textline;
begin
  s:=ptype(t);
  writeln (asmfile,'type ',s   );
  end;
function typecode(var t:typerec):char;
  var s:char;
begin
     case t.typeid of
     file_sy,cfile_sy,int_sy,cint_sy,bool_sy,cbool_sy:s:='i';
     UNDEFINED:s:='v';
     real_sy,creal_sy:s:='r';
     procedure_sy:s:='c';
     else s:='p';
     end;
     if t.dimensions > 0 then s:='p';
     typecode:=s;
end;
function ispntr(var t:typerec):boolean;
begin
    ispntr:= typecode(t)='p';
end;
procedure writevar( v:namedesc);
begin
     with scopelist[v] ^ do begin
     writeln(asmfile,typecode(typeinfo),' ',offset)
     end;
end;
function sizeof(var t:typerec):integer;   { return size in strides }
begin
      if (typecode(t )= 'p') then sizeof:=pntr_on_stack_size else
      case t.typeid of
      procedure_sy:sizeof:=proc_size;
      real_sy,creal_sy:sizeof:=real_size;
      int_sy,cint_sy,bool_sy,cbool_sy,file_sy,cfile_sy:sizeof:=int_size;
      else begin
        sizeof:=0;
      end;
    end;
end;
procedure dispsp;
begin
     if debugging then writeln('; sp=',stack_ptr);
end;
procedure incsp(var t:typerec);
var i:integer;
begin
     for i:= 1 to sizeof(t) do
     stack_ptr := stack_ptr -stride;
    dispsp;
end;
procedure decsp(var t:typerec);
var i:integer;
begin
     for i:=1 to sizeof(t) do
     stack_ptr := stack_ptr +stride;
     dispsp;
end;

procedure retractstack(newstack:integer);
begin
     if newstack<>stack_ptr then
        writeln(asmfile,' add sp,',newstack-stack_ptr);
     stack_ptr:=newstack;
     dispsp;
end;

procedure drop(strides:integer);
begin
     retractstack(stack_ptr+strides*stride);
end;
procedure expand_to_pntr(t:typerec);
{ pads this out till it occupies same space as pntr }
begin
    drop(-(sizeof(pntr_type)-sizeof(t)));
end;
procedure pushax;
begin
     writeln(asmfile,' push ax');
     incsp(int_type);
end;
   procedure extrn(t:textline);
   begin

        writeln(asmfile,' extrn ',t,':',callform);
   end;

procedure callc(s:textline);
begin
    if not dynalink then extrn(s);
    writeln(asmfile,'callc ',s);
end;

{------------------------------- assignment -----------------------}
procedure assignop( n:namedesc);
begin
    with scopelist[n]  ^ do
      begin
          decsp(typeinfo);
          if lex_level = global_level then { global }
              begin
                    write (asmfile,'globalass'); writevar(n);
              end else
                  if lex_level = lexical_level then { local }
                  begin
                    write (asmfile,'localass'); writevar(n);
                  end else
                  begin { other }
                  writeln(asmfile,'ass',typecode(typeinfo),' ',lex_level* -stride,
                  ',',offset);
                  end;
        end;
end;

{ -------------------------------------------------------------- }
{            ARITHMETIC                                          }
{ -------------------------------------------------------------- }
procedure notop;
begin
  writeln (asmfile,'not_op');
end;

procedure negop(t:typerec);
begin
  if typecode(t)='r' then callc('_negopr') else writeln(asmfile,'neg_op');
end;
{----------------------------- arithmetic ---------------------------}
procedure binaryop(operation:lexeme;T:typerec);
  var s: textline;
  procedure operror;
  begin
       s:=psym(ord(operation));
       writeln(s);
       s:='illegal operator or bad type '+s;
       error(s);
  end;
  procedure callr(t:textline);{ call real arith subroutine }
  begin
    callc(t);
    retractstack(stack_ptr+(stride*sizeof(real_type)));
  end;
begin
  {s:=psym(operation);}
   if (operation = dplus_sy)and(t.dimensions>0) then begin
                   s:='concat_op';
                   decsp(string_type);
                   writeln (asmfile,' ',s   );

       end
       else
  case t.typeid of
  structure_sy:begin
                    if operation =is_sy then s:='_isop'
                    else s:='_isntop';

                    push(operation);
                    callc(s);
                    retractstaCK(STACK_PTR+(STRIDE*SIZEOF(PNTR_TYPE))
                                 +stride *sizeof(int_type));
                    writeln(asmfile,'cmp ax,1');
               end;
  int_sy,cint_sy,file_sy,cfile_sy:  begin
     case operation of
     plus_sy:s:='plusop';
     minus_sy:s:='minusop';
     star_sy:s:='multop';
     div_sy: s:='divop';
     b_and_sy: s:='band';
     b_or_sy: s:= 'bor';
     shift_l_sy:s:='shiftl';
     shift_r_sy : s:='shiftr';
     rem_sy: s:='remop';
     lt_sy,
     le_sy,
     gt_sy,
     ge_sy,
     eq_sy,
     neq_sy:begin s:=' cmpop'; push(operation);
                  decsp(int_type);             { remove both operands }
                                               { leave result in flags }
                  end;
     else operror;
     end;
     writeln (asmfile,' ',s   );
     decsp(int_type);
  end;
  real_sy,creal_sy:  begin
     case operation of
     plus_sy:callr('_plusr');
     minus_sy:callr('_minusr');
     star_sy:callr('_timesr');
     slash_sy: callr('_divr');
     lt_sy,
     le_sy,
     gt_sy,
     ge_sy,
     eq_sy,
     neq_sy:begin  push(operation);            { to be used in subs jumps }
                   callc('_compopr');
                   retractstack(stack_ptr+2*sizeof(real_type)*stride);
                   writeln(asmfile,' cmp ax,0');
                                               { leave result in flags }
                  end;
     else operror;
     end;
  end;
  string_sy,cstring_sy: begin
     case operation of
     dplus_sy:begin
                   s:='concat_op';
                   decsp(string_type);
                   writeln (asmfile,' ',s   );
              end;
     lt_sy,
     le_sy,
     gt_sy,
     ge_sy,
     eq_sy,
     neq_sy:begin writeln(asmfile,' cmpops'); push(operation);
                  drop(2*pntr_on_stack_size);   { remove both operands }
                  writeln(asmfile,'cmp ax,0');
                  end;
     else operror;
     end;
  end;
  else begin
       if operation in [eq_sy,neq_sy] then begin
           push(operation);
           writeln(asmfile,' cmoppntr');
           drop(2*pntr_on_stack_size);
           writeln(asmfile,'cmp ax,0');
       end
       else operror;
       end;
  end;
end;

{ ---------------------------------------------------------------- }
{      LOAD OPERATIONS                                             }
{ ---------------------------------------------------------------- }
procedure ll_int(i:integer);
begin
  incsp(int_type);
  writeln (asmfile,'llint ',i   )
end;
procedure loadtrademark(n:namedesc);
begin
     { load the address of the trademark record onto the stack }
     incsp(int_type);incsp(int_type);
     writeln(asmfile,'pushfarpntr _st@',scopelist[n]^.offset);

end;

procedure float2op;
begin
     ll_int(0);ll_int(0);ll_int(0);
     callc('_float_lower');
end;
procedure floatop;
begin
     ll_int(0);ll_int(0);ll_int(0);
     callc('_float_top');
end;

procedure bindop;
begin
     callc('_bind');
     drop(3* pntr_on_stack_size - proc_size);
end;

procedure pushfloatreg;
begin
    writeln(asmfile,'pushrreg');
    incsp(real_type);
end;
procedure datasegprefix;
begin
     stringcount:=stringcount+1;
     writeln(asmfile,'jmp ll',stringcount);
     writeln(asmfile,segment,'  ends');
     writeln(asmfile,'_DATA segment word public ''DATA'' ');
     writeln(asmfile,'_s@',stringcount,' label byte');
end;
procedure datasegpostfix;
begin
     writeln(asmfile,'_DATA	ends');
     writeln(asmfile,segment,'	segment	byte public ''',class,''' ');
end;
procedure ll_real(r:real);
var f:ieee;i:integer;
begin
  incsp(real_type);
  datasegprefix;
  realtoieee(r,f);
  for i:=1 to 8 do writeln(asmfile,' db ',f[i]);
  datasegpostfix;

  writeln (asmfile,'ll',stringcount,': llreal_op  _s@',stringcount)
end;



procedure load(n: namedesc);
begin
    with scopelist[n] ^ do
      begin
          incsp(typeinfo);

          if lex_level = global_level then { global }
              begin
                    write (asmfile,'global'); writevar(n);
              end else
                  if lex_level = lexical_level then { local }
                  begin
                    write (asmfile,'local'); writevar(n);
                  end else
                  begin { other }
                    writeln(asmfile,'load',typecode(typeinfo),' ',
                           ( lex_level* -stride),',',offset);
                  end;
        end;
   end;

procedure load_addr(n: namedesc);

   procedure writevar( v:namedesc);
   begin
     with scopelist[v] ^ do begin
     writeln(asmfile,' ',offset)
     end;
   end;
begin
    with scopelist[n] ^ do
      begin
          incsp(int_type); incsp(int_type); { addresses are double word }

          if lex_level = global_level then { global }
              begin
                    write (asmfile,'globaladdr'); writevar(n);
              end else
                  if lex_level = lexical_level then { local }
                  begin
                    write (asmfile,'localaddr'); writevar(n);
                  end else
                  begin { other }
                    writeln(asmfile,'loadaddr',typecode(typeinfo),' ',
                           ( lex_level* -stride),',',offset);
                  end;
        end;
   end;

procedure pushpreg;
begin
     load(pidreg);
end;
function ll_nil:integer;
var i:integer;
begin
    for i:= 1 to pntr_on_stack_size do ll_int(0);
    ll_nil:=stack_ptr;
end;

procedure plant_string(s:textline);
var i :integer;
begin

     writeln(asmfile,' dw ' ,length(s));
     for i:= 1 to length  (s) do
         writeln(asmfile,' db ',ord(s[i]));

end;
{ -------------------------------------------------------------------- }
{         INPUT OPERATIONS                                             }
{ -------------------------------------------------------------------- }
procedure readop(s:lexeme;var t:typerec);
   procedure stringsetup;begin
                  t:=string_type;drop(int_size-sizeof(t));
                end;
begin
     case s of
     {-------------- read pntr ----------------------}
     readp_sy:begin
                   t:=pntr_type;drop(int_size-sizeof(t));
                   callc('_readp');
                   end;
     {--------------- STRING READS ------------------}
     read_sy:begin
                  stringsetup;
                  callc('_read');
             end;
     reads_sy:begin
                  stringsetup;
                  callc('_reads');
             end;
     read_a_line_sy:begin
                  stringsetup;
                  callc('_read_a_line');
             end;
     peek_sy:begin
                  stringsetup;
                  callc('_peek');
             end;
     {------------------ read REAL ---------------------}
     readr_sy:begin
                   t:=real_type;
                   drop(int_size-real_size);
                   callc('_readr');
              end;
     readb_sy:begin
                   t:=bool_type;
                   callc('_readb');
              end;
     eoi_sy:begin
                   t:=bool_type;
                   callc('_eoi');
              end;

     readi_sy:begin
                   t:=int_type;
                   callc('_readi');
              end;
     read_byte_sy:begin
                   t:=int_type;
                   callc('_read_byte');
              end;
     end;
end;

{ -------------------------------------------------------------------- }
{        OUTPUT OPERATIONS                                             }
{ -------------------------------------------------------------------- }

procedure start_write;
begin
  ll_int(stdout);
end;

procedure writeop(var t:typerec);
var s:string[10];
begin
  s:=ptype(t);
  writeln (asmfile,'write',s);
end;

procedure end_write;
begin
  retractstack(stack_ptr +(stride * int_size)) ;                { remove file }
end;

procedure out_byte_op;
begin
     writeln(asmfile,'outbyteop');

end;
{ ----------------------------------------------------------------- }
{      STACK TIDYING OPERATIONS                                     }
{ ----------------------------------------------------------------- }
procedure discard_param(var i:idrec);
begin
     write(asmfile,' ;discard_param');writetype(i.typeinfo);
end;

procedure discard(var i:idrec;var t:typerec);
{ pop tos and assign to i, then make i top of stack }
var newsp,ownsize,dif:integer;tc :string[5];
begin
       tc:=typecode(t);
       ownsize:= stride* sizeof(i.typeinfo);
       newsp := i.offset + ownsize- (stride * sizeof(t));
       if tc<>'v' then begin
          writeln(asmfile,'localmov',tc ,' ',newsp);{ return result of block }
       end;                                        { adjust internal sp }
       retractstack(newsp);
end;
function enter_stackframe:integer;
begin
     param_sp:=6;
     enter_stackframe := 0;
end;
function fixup_param(var i:idrec):integer;
var size:byte;
begin
     size:=stride*sizeof(i.typeinfo);
     i.offset:=param_sp;
     param_sp := size + param_sp;
     fixup_param:=size;
end;
function fixup_result(var i:idrec;paramsize:byte):integer;
var size:byte;
begin
     size:=stride*sizeof(i.typeinfo);
     i.offset:=param_sp - size;
     if size>paramsize then i.offset:=i.offset+size-paramsize;
     param_sp := size + param_sp;
     fixup_result:=size;
end;
procedure correct_param(var i:idrec;paramsize,resultsize:byte);
begin
    writeln(asmfile,';correct param ',paramsize,' ',resultsize);
    if resultsize >paramsize then i.offset:=i.offset +resultsize-paramsize;
end;

{ ----------------------------------------------------------------- }
{             CONTROL FLOW INSTRUCTIONS                             }
{ ----------------------------------------------------------------- }

procedure plant(l:labl);
begin
  writeln (asmfile,'pl',ord(l),':'   )
end;

procedure form_closure(l:labl);
begin
     writeln(asmfile,'formclos pl',l);
     stack_ptr := stack_ptr - 4;
end;
procedure call_proc( i:namedesc);
begin
 with scopelist[i] ^ do begin
     if typeinfo.paramspace<typeinfo.resultspace then  { leave space for result }
        retractstack(stack_ptr+typeinfo.paramspace-typeinfo.resultspace);
     write(asmfile,'call_');
     if lex_level = global_level then { global }
              begin
                    write (asmfile,'glob '); writeln(asmfile,offset);
              end else
                  if lex_level = lexical_level then { local }
                  begin
                    write (asmfile,'loc '); writeln(asmfile,offset);
                  end else
                  begin { other }
                  writeln(asmfile,' ',lex_level * - stride,' , ',offset);
                  end;
     if typeinfo.paramspace > typeinfo.resultspace then
     { forget params  they  have been discarded by the ret instruction }
     stack_ptr:=stack_ptr+typeinfo.paramspace-typeinfo.resultspace;
    end;
end;
procedure jumpfar(s:textline);
begin
     writeln(asmfile,'extrn ',s,':far');
     writeln(asmfile,'db 0eah'); { call far }
     writeln(asmfile,'dw offset  ',s);
     writeln(asmfile,'dw seg ',s);
end;
procedure aliencall(s:textline);
begin
     callc(s);
end;
procedure jumpop(var l:labl);
begin
  if l <=0 then l:=newlab;
  writeln (asmfile,'jmp pl',ord(l)   )
end;
procedure bjump(l:labl);
begin
     writeln(asmfile,'jmp pl',ord(l));
end;
procedure writecond;
  var s:string[5];
begin
  case pop of
  lt_sy:s:='l';
  le_sy:s:='le';
  gt_sy:s:='g';
  ge_sy:s:='ge';
  eq_sy,is_sy:s:='e';
  neq_sy,isnt_sy: s:='nz';
  else error('Unkown comparison operator ');
  end;
  write(asmfile,s);
 end;


procedure jumpt(var l:labl);
begin
  write(asmfile,'j');
  writecond;
  writeln (asmfile,' pl',ord(l)   )
end;
procedure form_boolean;
{ there is a condition code set, convert it to a boolean }
var l1,l2:labl;
begin
     l1:=newlab;l2:=newlab;
     jumpt(l1);ll_int(0);jumpop(l2);decsp(int_type);
     plant(l1);ll_int(1);plant(l2);
end;

procedure jumpf(var l:labl);
var skip:labl;
begin
  skip:=newlab;
  jumpt(skip);jumpop(l);plant(skip);
end;

procedure cjump(var l:labl);
begin
  writeln (asmfile,'cjump pl',ord(l)   )
end;
procedure forprepop;
begin
     writeln(asmfile,'forprep');
end;
procedure forstepop(complex:boolean; l:labl);
begin
  if not complex then write(asmfile,'min');
  writeln (asmfile,'forstep pl',ord(l)   );
  decsp(int_type);decsp(int_type);if complex then decsp(int_type);
end;

procedure fortestop(complex:boolean;var l:labl);
begin
  l:=newlab;
  if not complex then write(asmfile,'min');
  writeln (asmfile,'fortest pl',ord(l)   )
end;


{ ---------------------------------------------------------------- }
{       OPERATIONS ON HEAP OBJECTS                                 }
{ ---------------------------------------------------------------- }
procedure make_vector;
begin
  writeln (asmfile,'makevec_op');
end;

procedure mcktab;
begin
     callc('_mcktab');
end;
procedure inittab;
begin
    callc('_inittab');
    drop(2*sizeof(pntr_type));   { discard all but the table itself }
end;

procedure iliffeop(levels:integer; var t:typerec);
var s:string[7];
begin
  ll_int(sizeof(t)*stride);
  ll_int(levels);
  case t.typeid of
  bool_sy,cbool_sy,
  int_sy,cint_sy:callc('_iliffeint');
  real_sy,creal_sy:callc('_iliffereal');
  else callc('_iliffepntr');
  end;
end;
procedure makepntrarray(lower,upper:namedesc);
var t:typerec;
    j:integer;
begin
     t:=pntr_type;
     load(lower);load(upper);j:=ll_nil;iliffeop(1,t);
end;
procedure ll_string(s:textline);
var i:integer;
begin
     datasegprefix;

     writeln(asmfile,' dw ',length(s));
     for i:= 1 to length  (s) do
         if s[i] in ['a'..'z','A'..'Z','0'..'9',' ']
         then writeln(asmfile,' db ''',s[i],''' ')
         else writeln(asmfile,' db ',ord(s[i]));
     datasegpostfix;
     writeln(asmfile,'ll',stringcount,':	pushfarpntr _s@',stringcount);
     writeln(asmfile,'	callc _llstring');
     writeln(asmfile,' add sp,4'); { discard the address of string }
     pushpreg;
end;
procedure declarestructure( class:textline;
                            pntrs,reals,ints:integer;
                            n:namedesc);
{ this writes information into the datasegment to desscribe a structure class }
{ this information is of the form
       <PID>       will point at an SDESC at run time
       <pntrs>     a 8 bit field holding number of pntrs in class
       <reals>     a 8 bit field holding number of reals in class
       <ints>                             number of integers in class
       <len>       length of the name of the class
       <c>*n       the name itself
}
begin
   with scopelist[n]^ do begin

     datasegprefix;
     offset:=stringcount;
     writeln(asmfile,'_st@',offset,' label byte');
     { plant a nil pid that will be initialised at run time to point to }
     { the sdesc for the structure class                                }
     writeln(asmfile,'db ',pntrs,
                     ', ',reals,
                     ', ',ints);
     writeln(asmfile,'db  ',length(class));
         writeln(asmfile,'db ''',class,'''');
         writeln(asmfile,'dq 0,0,0,0');
     datasegpostfix;
     writeln(asmfile,'ll',stringcount,': pushfarpntr _st@',offset);
     writeln(asmfile,'callc _mksdesc');
     writeln(asmfile,'add sp,4');
   end;
end;
procedure formstruct(n:namedesc);
{ this is used to create an instance of a structure }
begin
     retractstack(stack_ptr - pntr_on_stack_size*stride); { space for result }
     writeln(asmfile,'pushfarpntr _st@',scopelist[n]^.offset);
     writeln(asmfile,'callc _formstruct');
     writeln(asmfile,'add sp,',2*int_size*stride);
end;
procedure loadstruct(n:namedesc);
begin
     writeln(asmfile,'pushfarpntr _st@',scopelist[n]^.offset);
     incsp(int_type);incsp(int_type);
end;

procedure subsass(class,field:namedesc;var t:typerec);
{  pntr, t ->void  }

begin
  with scopelist[field]^do begin
  writeln(asmfile,'mov ax,sp');
  writeln(asmfile,'add ax,',sizeof(typeinfo)*stride);
  writeln(asmfile,'push ss');
  writeln(asmfile,'push ax');            { push address of pid on stack }
  writeln(asmfile,'pushfarpntr _st@',scopelist[class]^.offset);
                                         { push address of trademark }
  writeln(asmfile,'callc _validstruct'); { address of struct in dx:ax }
  writeln(asmfile,'add sp,',8);          { remove params &pntr}

  writeln(asmfile,'mov di,ax');          { get offset }
       case typecode(typeinfo) of
       'i': begin
             writeln(asmfile,'mov es,dx');          { get segment }
             writeln(asmfile,'pop es:[di+',offset,']');
             end;
       'r':  begin
             writeln(asmfile,'add di,',offset);
             writeln(asmfile,'heappopreal');
             end;
        'p': begin
             writeln(asmfile,'add di,',offset,'; offset of pntr field');
             writeln(asmfile,'heappopp');
             end;
        end;
        decsp(typeinfo);
        t:=typeinfo;
        t.field:=false;
  end;
  drop(pntr_on_stack_size);    { throw away the pntr }
end;

procedure subs(class,field:namedesc;var t:typerec);
{  pntr, t ->pntr  }
begin
  writeln(asmfile,'mov ax,sp');
  writeln(asmfile,'push ss');
  writeln(asmfile,'push ax');            { push address of pid on stack }
  incsp(int_type);  incsp(int_type);
  writeln(asmfile,'pushfarpntr _st@',scopelist[class]^.offset);
                                         { push address of trademark }
  incsp(int_type);  incsp(int_type);
  writeln(asmfile,'callc _validstruct'); { address of struct in ax }
  drop(4*int_size+pntr_on_stack_size );   { remove params & pid address}
  writeln(asmfile,'mov si,ax');          { get offset }
  with scopelist[field]^do begin
       t:=typeinfo;
       t.field:=false;
       case typecode(t) of
       'i': begin
             writeln(asmfile,'mov es,dx');          { get segment }
             writeln(asmfile,'push es:[si+',offset,']');
             end;
       'r':  begin
             writeln(asmfile,'add si,',offset);
             writeln(asmfile,'heappushreal');
             end;
        'p': begin
             writeln(asmfile,'add si,',offset,'; offset of pntr field');
             writeln(asmfile,'heappushp');
             end;
        end;
        incsp(t);
   end;
end;

procedure subsinit(var field:idrec);
{  pntr ->t   }
begin
  writeln(asmfile,'; subsinit');
  with field do begin
  writeln(asmfile,'mov ax,sp');
  writeln(asmfile,'add ax,',sizeof(typeinfo)*stride);
  writeln(asmfile,'push ss');
  writeln(asmfile,'push ax');            { push address of pid on stack }
  writeln(asmfile,'callc _wherestruct'); { address of struct in ax }
  writeln(asmfile,'add sp,',4);          { remove  param}
  writeln(asmfile,'mov di,ax');          { get offset }
       case typecode(typeinfo) of
       'i': begin
              writeln(asmfile,'mov es,dx');          { get segment }
              writeln(asmfile,'pop es:[di+',offset,']');
             end;
       'r':  begin
             writeln(asmfile,'add di,',offset);
             writeln(asmfile,'heappopreal');
             end;
        'p': begin
             writeln(asmfile,'add di,',offset);
             writeln(asmfile,'heappopp');
             end;
        end;
        decsp(typeinfo);
    end;
end;

procedure substrop;
begin
  writeln (asmfile,'substr_op');
  drop(2*int_size);
end;

procedure upbop;
begin
     callc('_upbop');
     drop((pntr_on_stack_size));
     pushax;
end;
procedure lwbop;
begin
     callc('_lwbop');
     drop((pntr_on_stack_size));
     pushax
end;
procedure subv(var t:typerec);
var s:string[6];target:integer;
begin
  t.dimensions:=t.dimensions - 1;
  s:=typecode(t);
  target := stack_ptr + (int_size +pntr_on_stack_size - sizeof(t))*stride;
  writeln (asmfile,'subv_op',s);
  retractstack( target );

end;

procedure subvass(var t:typerec);
var s:string[6];
begin
  s:=typecode(t);
  writeln (asmfile,'subvass_op',s);
end;
procedure tab_insert(var t:typerec);
var s:string[6];
begin
     s:=typecode(t);
     callc('_tab_ins'+s);
     drop(sizeof(t)+sizeof(pntr_type)+sizeof(string_type));
end;

procedure tab_lookup(var t:typerec);
var s:string[6];target:integer;
begin
  s:=typecode(t);
  callc('_s_lookup');
  drop( sizeof(pntr_type)+sizeof(string_type)-sizeof(t) );

end;

function declare_global(var t:idrec):integer;
begin
    declare_global := stack_ptr;
     writeln(asmfile,';declare_global ',stack_ptr);
end;

function declare_local(var t:idrec):integer;
begin
    declare_local := stack_ptr;
    writeln(asmfile,';declare_local ',stack_ptr);
end;


procedure release_label(l:integer);
begin
{     writeln(asmfile,'release_label ',l);}
end;
{ external procedures written in c return integer results in ax }
procedure pushres(t:typerec);
begin
    case sizeof(t) of
    int_size:pushax;
    real_size:pushfloatreg;
    else pushpreg;
    end;
end;
procedure declareexternals;
begin  extrn(' _writei');
       extrn(' _writer');
       extrn(' _writes');
       extrn(' _writep');
       extrn(' _lwbop') ;
       extrn(' _upbop');
       extrn(' _makevec');
       extrn(' _iliffeint');
       extrn(' _iliffereal');
       extrn(' _iliffepntr');
       extrn(' _llstring');
       extrn(' _subvassib');
       extrn(' _subvassr');
       extrn(' _subvassp');
       extrn(' _subvib');
       extrn(' _subvr');
       extrn(' _concat');
       extrn(' _divr');
       extrn(' _timesr');
       extrn(' _minusr');
       extrn(' _plusr');
       extrn(' _float_top');
       extrn(' _float_lower');
       extrn(' _compopr');
       extrn(' _subvp');
       extrn(' _substrop');
       extrn(' _compstr');
       extrn(' _comppntr');
       extrn(' _mksdesc');
       extrn(' _formstruct');
       extrn(' _validstruct');
       extrn(' _wherestruct');
       extrn(' _trace');
end;
procedure newlineop;
var i:integer;
begin
     i:=the_line;
     ll_int (i);
     assignop(line_number);
     if (i mod 10)=0 then begin
        gotoxy(10,1);write(i:6);
     end;
     if trace then callc(' _trace');
end;
procedure init_cgen(seg,class:textline);
begin
  stack_ptr:=0;psp:=0; opsp:=1;stringcount:=1;
  writeln (asmfile,' include salib.mac');
  if not dynalink then begin
     writeln(asmfile,seg,' segment byte public ''',class,''' ');
     writeln(asmfile,' assume cs:',seg );
  end;
end;
procedure start_program;
begin
  writeln(asmfile, '_samain proc ',callform);
  if not dynalink then begin
    writeln(asmfile,'public _samain');
    declareexternals;
    writeln(asmfile,' push si');
    writeln(asmfile,' push di');
    writeln(asmfile,'push ds');
    writeln(asmfile,'push es');
    writeln(asmfile,'push bx');
    writeln(asmfile,'push bp');
    writeln(asmfile,'mov ds,_DATA');
  end;
  writeln(asmfile, '  mov bx,sp');
  writeln(asmfile, '  mov bp,sp');
  writeln(asmfile, ' lea ax,endlab');
  writeln(asmfile, ' push ax');
  callc('_defcseg');
  writeln(asmfile, ' pop ax');

end;
procedure start_library;
begin
    jumpop(next_external);
end;

procedure start_external(procname:textline);
begin
{$IFNDEF obj}
     plant(next_external);
     next_external:=newlab;
     jumpop(next_external);
     plant_string(procname);

{$ENDIF}
{$IFDEF obj}
     assem(procname,' proc far ');
     assem( 'public ',procname);
{$ENDIF}
end;
procedure end_external(procname:textline);
begin
{$IFDEF obj}
     assem(procname,'  endp');
{$ENDIF}
end;

procedure end_program(seg:textline);
begin
 if dynalink then begin
   callc('_terminate');
   writeln(asmfile, 'mov ax,4c00h');
   writeln(asmfile, 'int 21h');
 end else
 begin
   writeln(asmfile, '  mov sp,bp');
   writeln(asmfile, 'pop bp');
   writeln(asmfile, 'pop bx');
   writeln(asmfile, ' pop es');
   writeln(asmfile, ' pop ds');
   writeln(asmfile, ' pop di');
   writeln(asmfile, ' pop si');
   writeln(asmfile, '  retf ; return to ');
 end;
 writeln(asmfile, 'endlab:');
 writeln(asmfile, '_samain endp ');
 writeln(asmfile,seg,' ends');
end;

procedure end_library(seg:textline);
begin
{$IFNDEF obj}
   plant(next_external);
   writeln(asmfile, 'mov ax,4c00h');
   writeln(asmfile, 'int 21h');

{$ENDIF}
{$IFDEF obj}
 assem(seg,' ends');
{$ENDIF}
end;
procedure finalise_cgen;
begin
  writeln (asmfile,' end');
end;

procedure prologop(ll:integer);
begin
  writeln (asmfile,'prolog ',ll);stack_ptr:=stack_ptr-ll*stride ;
end;

procedure epilogop(proctype:typerec);
var discard:integer;
begin
  with proctype do begin

          if params = nil then discard:=0
          else
          if resultspace>paramspace then discard:=0
          else discard := paramspace - resultspace;
  end;
  writeln (asmfile,'epilog ',discard);
end;

begin
      trace:=false;

      next_label_num:=1;
end.