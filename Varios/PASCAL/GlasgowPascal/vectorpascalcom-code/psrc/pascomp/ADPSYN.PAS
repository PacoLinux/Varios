{$O+}{$F+}{$r-
   ADPL  SYNTAX ANALYSIS

----------------------------------------------------------------
Module      : ADPsyn
Used in     : Compiler toolbox
Author      : W P Cockshott
Date        : 15 Oct 1986
Version     : 2
Function    : To parse adpl programs
Changes     : derived from file sasyn.cmp on 9-2-89
            : derived from file sasyn.pas starting november 89
            : defived from file pasyn.pas startin Feb 91
Copyright (C) WP Cockshott & P Balch
Conditional compilation flags
----------------------------------------------------------------}
{$s+}
  UNIT adpSYN ;
INTERFACE USES
  overlay,
  editdecl,
  errors,
  {$ifndef pretext}
  fsm,
  reader,
  dlb,
  {$endif}
  {$ifdef pretext}
  lines,streams,
  fsmpret,
  dlbpret,
  {$endif}
  IDTYPES,
  symtab,
  stacks,
  {pretty,}
{$ifndef assembler}
  {$ifndef i80386}  opcodes,  assemble, {$endif}
  {$ifdef i80386}lists, riscasm,{$endif}
  sagen

{$endif}


{$ifdef synext}
  ,synext
{$endif}

;

{
  The syntax analyser is a single pass top down recursive analyser.

  It has one procedure for each production rule in the grammer of
  the language. The language chosen in this example is S-algol.
  For a fuller description of the techniques used here you should
  refer to chapter 6 of "Recursive Descent Compiling" by A.J.T Davie
  and Ron Morrison.

  Its function is to construct a parse tree of the program on the
  heap which is then available to a variety of other modules

}


 PROCEDURE PROG(var the_buffer:textbuffer);
PROCEDURE SYNVER;
IMPLEMENTATION
var list:boolean;
procedure synver;
begin
     writeln ('Pascal Syntax analyser for IBM AT version 1.0');

end;
type symcell = object(cell)
               lex:lextoken ;
               constructor newsym(l:lextoken);
               destructor destroy;virtual;
               end;
     symcellp=^symcell;
constructor symcell.newsym;begin cell.newcell;lex:=l end;
destructor  symcell.destroy;begin cell.destroy end;

procedure prog;

{$ifndef debug}
const syndebug = false;
{$endif}
{$ifdef debug}
 const syndebug = true;
{$endif}
{ this specifies the contexts in which declarations occur }
type declmodes =(procs_allowed,uselist,interfacepart,implementationpart,
                 vars_allowed);
     declset= set of declmodes;
{ -------------------------------------------------------------- }
{          FORWARD DECLARATIONS FOR RECURSIVE PRODUCTIONS        }
{ -------------------------------------------------------------- }
PROCEDURE     SEQUENCE(VAR t:TYPEREC);   FORWARD;
PROCEDURE     CLAUSE(VAR t:TYPEREC);     FORWARD;
PROCEDURE     EXP(VAR t:TYPEREC);        FORWARD;
PROCEDURE     IF_CLAUSE(var t:typerec);  FORWARD;
PROCEDURE     WHILE_CLAUSE;              FORWARD;
PROCEDURE     procedure_decl(mode:declset);FORWARD;
PROCEDURE     TYPE1(var t:typerec) ;     FORWARD;
{$ifdef synext}
FUNCTION     EXTENSIONS(Var t:typerec;r:rulerange;
                            alreadygot:boolean):matchtype; FORWARD;

{$endif}
{ -------------- SYMBOL STACK ---------------------------------- }
var symbols:stack;
procedure tpushname(l:lextoken);
var n:symcellp;
begin
     new(n,newsym(l));symbols.push (n);
end;
procedure tpushlexical(l:lexeme);
begin
tpushNAME (ord(L));
end;
function tpopname:lextoken;
var n:symcellp;
begin
     if symbols.pop(cellpntr(n))then
     begin tpopname:=n^.lex;
     dispose(n,destroy);
     end;
end;
{ -------------------------------------------------------------- }
{         MAIN PARSING PROCEDURES ONE PER GRAMMER RULE           }
{ -------------------------------------------------------------- }
procedure debug( s:textline);
begin
      if trace or syndebug then begin writeln(listfile,s) end;
end;
procedure writetype(var t:typerec); var s:textline;
begin  if syndebug then begin s:=ptype(t);write(listfile,'<',s,'>')  end;end;
{ -------------------------------------------------------------- }
{            BOOLIFY                                             }
{ -------------------------------------------------------------- }
PROCEDURE BOOLIFY( var t:typerec);
{ converts a condition code into a boolean on the stack }
begin
     if eq(t,condition_type) then begin
        new(t);
        t^:=bool_type^;
     end;
end;

PROCEDURE CONDIFY(var t:typerec);
begin
     if not eq(t,condition_type) then begin
        match(t,bool_type);
        end;
end;
procedure must(p:lexeme);
begin

     mustbe(p,the_buffer);
end;
function got(l:lexeme):boolean;
begin

     got:= have(l,the_buffer) ;
end;
{ -------------------------------------------------------------- }
function newid(id:lextoken; t:typerec;inrecord:boolean):namedesc;
var i:idref;
begin
 if inrecord then newid:=newname(id,t,field,i) else
 if lexical_level = global_level then newid:=newname(id,t,global,i)
     else newid:=newname(id,t,local,i);
end;
{----------------------- STD_DECLS-------------------------------}
var s_i,s_o,i_w,s_w,r_w,null_file:namedesc;
procedure std_decls;
var I:integer;scope :namedesc;
{ delare standard identifiers }
begin
end;

{ -------------------------------------------------------------- }
{            MAKEVECTOR                                          }
{            This parses the syntax
             vector <lower>::<upper>[,<lower>::<upper>] of init
             it generates the same code as if the above is a shorthand
             for :
             begin
                  let lower = <lower>
                  let upper = <upper>
                  let a=array(lower,upper-lower+1,runtimesize(pntr))
                  for i= lower to upper do a(i):=
                  begin
                       let lower=<lower2>
                       let upper=<upper2>
                       let a=array(lower,upper-lower+1,runtimesize(init)
                       for i=lower to upper do a(i):=init
                       a
                  end

                  a
              end
              dim1()

{ -------------------------------------------------------------- }
{$ifdef persistent}

PROCEDURE MAKEVECTOR(VAR T:TYPEREC);
    procedure inner(var t:typerec);

    var t1,t2:typerec;
        l1,l2:labl;
        forscope,lower,upper,A,I:namedesc;
        oldsp,depth:integer;
    begin
     enterscope(oldscope);

              expression(t1); match(t1,int_type);lower:=newid(1,t1);
              must(dcolon_sy);
              expression(t2); match(t2,int_type);upper:=newid(2,t1);
              if  got(comma_sy) then
              begin
                   t:=pntr_type;
                   A:=newid(3,t);
                   {------------- Begin code of forloop ---------------}
                   enterscope (forscope);
                   I:=newid(4,int_type);
                   inner(t);     { generate inner vector }
                   exitblock(forscope,VOID);
                   {--------------- End code of forloop ---------------}
              end
              else
              begin

                  must(of_sy);
                  clause(t);
              end;
     exitblock(oldscope,t);
     { this removes all temp variables from the stack }
    end;
begin
     next_symbol(the_buffer);
     inner(t);
     t:=vectorise(false,t);
end;

{$endif}

{ --------------------------------------------------------------- }
{    PREFIX OP                                                    }
{    ---------   handles bit operations                           }
{ --------------------------------------------------------------- }
procedure prefixop(var t:typerec);
var s:lexeme;  t1:typerec;
begin
     s:=lexsymbol;
     next_symbol(the_buffer);
     mustbe(brace_sy,the_buffer);
     exp(t1);

     coerce(t1,int_type);
     mustbe(comma_sy,the_buffer);
     exp(t);coerce(t,t1);
     mustbe(rbrace_sy,the_buffer);
     if s<>ptr_sy then binaryop(s,t)
     else   { a pointer just leaves  arguments on stack }
     t:=address_type;
end;
{------------------------- STD_PROC ---------------------------------}
procedure std_proc(var t:typerec);
var sym:lexeme;
begin
     sym:=lexsymbol;
     case lexsymbol of
     ord_sy: begin next_symbol(the_buffer);exp(t);t:=int_type;end;
     chr_sy: begin next_symbol(the_buffer);exp(t);coerce(t,int_type);t:=char_type;end;
     b_and_sy,b_or_sy, ptr_sy,
     shift_l_sy,shift_r_sy:prefixop(t);
     read_sy,readi_sy,readr_sy,readb_sy,
     reads_sy,peek_sy,read_a_line_sy,readp_sy,
     read_byte_sy,eoi_sy:begin
                              next_symbol(the_buffer);
                              must(brace_sy);
                              if not got(rbrace_sy) then begin
                                 exp(t);match(t,file_type);
                                 must(rbrace_sy);
                              end else
                              begin
                              end;
                         end;
     length_sy,lwb_sy,upb_sy :begin
              next_symbol(the_buffer);
              must(brace_sy);
              exp(t);              must(rbrace_sy);
              if not isvector(t) then
                    error('vector expected');
              t:=int_type;
           end;
   else error('standard procedure expected ');
   end;
end;
{ -------------------------------------------------------------- }
{     LVALUE
      this parses the lhs of an assignment or a procedure name
  -------------------------------------------------------------- }

    function checkid(sym:lextoken):namedesc;
         var n:namedesc;
          begin
               n:= lookup(sym)   ;
               if n= nulid then error('Undeclared variable <'+psym(sym)+'>');
               checkid := n
          end;

    procedure checkvar(t:typerec);
    begin
       if not isvariable(t) then error('not a variable:'+ptype(t));
    end;


procedure lvalue(var t:typerec;n:namedesc);
var finished:boolean;
    t1,t0:typerec;
    size:integer;
    f:namedesc;
begin
     typeof(symbol,t0);
     writetype(t0);debug('identifier');
     load_addr(n);t:=addressof(t0);


     finished:=false;
     next_symbol(the_buffer);
     repeat
         t0:=rangeof(t);
         case lexsymbol of
         bra_sy:begin
                              next_symbol(the_buffer);
                              if not isvector(t0 ) then
                                 error('Not an array');
                              { it is assumed that array variables
                                hold  arrays not pointers to them
                                as in algol}
                              { pointer to array now on stack }
                              exp(t1);
                              coerce(t1,int_type);
                              t:=t0;
                              size:=stackspace(rangeof(t0));
                              if size>1 then begin
                                 ll_int(size);
                                 binaryop(star_sy,t1);
                              end;
                              { now got   seg
                                           offset
                                           scaled index
                                on stack }
                              binaryop(plus_sy,t1);
                              must(ket_sy);
                end;
         else finished:=true;
         end
    until finished;
end;
{------------------ Matchandcall -------------------------------}
procedure matchandcall(var t:typerec);
var argv:typearray;
    argc,i:integer;
    sym:lextoken;
    range,domain:typerec;
   begin
          sym:=symbol;
          domain:=domainof(t);range:=rangeof(t);
          { create space for result }
          claimstack(range);
          unmk_cart(argv,argc,domain);
          next_symbol(the_buffer);
          if argc>0 then begin
           must(brace_sy);
           for i:=1 to argc do begin
                  begin
                  exp(t);
                  coerce(t,argv[i]);
                  end;
             if not got(comma_sy) then must(rbrace_sy);
           end;
          end;

           { the identifier in the expression was a procedure }
           call_proc(checkid(sym));
           t:=range;
   end;

{ -------------------------------------------------------------- }
{     EXP5
      this parses the syntax rule
           <exp5>::= <name >|
                     <literal>|
                     (<clause>)|
                     <cur> <sequence> <ley>|
                     begin <sequence> end |
                     <name> (<clause><bar><clause>)|
                     @<clause> of <type1><bra><clauselist<ket>|
                     vector<bounds> of <clause>

      it takes one var parameter that is used to return the
      type of the value yielded by the expression
}
{ -------------------------------------------------------------- }
procedure exp5std(var t:typerec);
var t1,t2,t3,proctype:typerec;
    os,elems, pntr_pos,expstartlev:integer;
    vec_lev:byte;
    domain:typerec;
    n,the_field,thevar,oldscope:namedesc;
    sym,procsym:lextoken;
    i:integer;
    argv:typearray;
    argc:integer;

    {$ifdef synext}
    m:matchtype;
    {$endif}
    function fieldid:namedesc;
         var n:namedesc;t:typerec;
         begin
              n:=checkid(sym);
              if not isfield(n) then error('field expected');
              fieldid:=n;
         end;



begin
   debug(' exp5 ');


   case lexsymbol of
   end_sy,comma_sy, rbrace_sy, ket_sy,
   ley_sy      : begin end; (* these are terminators *)
   identifier  : begin
                   typeof(symbol,t);

                   if  not isproc(t) then begin
                         n:=checkid(symbol);
                         if iscompiletimeliteral(n) then
                         begin
                              getconst(symbol,i,t);
                              next_symbol(the_buffer);
                              ll_int(i);
                         end
                         else begin
                              lvalue(t,n);loadindir(t)
                              end;
                         end;
                 end;
   brace_sy    : begin next_symbol(the_buffer);exp(t);must(RBRACE_sy);end;
   INT_LIT     : begin ll_int(the_integer);
                       t:=int_type;next_symbol(the_buffer) end;

   REAL_LIT    : begin ll_real(the_real);t:=real_type;next_symbol(the_buffer) end;
   STRING_LIT  : begin ll_string(the_string);t:=string_type;next_symbol(the_buffer) end;
   TRUE_SY     : begin t:=bool_type;next_symbol(the_buffer);ll_int(trueval)  end;
   FALSE_SY    : begin t:=bool_type;next_symbol(the_buffer);ll_int(falseval)  end;
   nil_sy      : begin next_symbol(the_buffer);t:=pntr_type;ll_nil; end;
     else std_proc(t);
     end;
end;
procedure exp5 (var t:typerec);

    {$ifdef synext}
var m:matchtype;
    {$endif}
begin
     {$ifdef synext}
     m:=extensions(t,insertion[exp5rule].rulestart,false);
     if m= none then{$endif} exp5std(t);

end;

{ -------------------------------------------------------------- }
{     EXP
          this parses the syntax rules
               <exp>::=[<addop>]<exp5>[<multop><exp5>]*
               <multop>::=<star>|div|rem|/|++
               <addop>::= +|-
}
{ -------------------------------------------------------------- }
procedure exp (var t:typerec);
var continue:boolean; t1:typerec;   sym:lexeme;toK:lextoken;
    adop:(plus,minus,noadop);
    {$ifdef synext}m:matchtype;{$endif}
begin
     debug(' exp4 ');
     adop:=noadop;
     if got(plus_sy) then adop:=plus;
     if got(minus_sy) then adop:=minus;
     {$ifdef synext}
     m:=extensions(t,insertion[expressionrule].rulestart,false);
     if m= none then{$endif} exp5(t);
     {$ifdef synext}
     if m<>total then {$endif}begin
        sym:=lexsymbol;
        tok:=symbol;
        if adop= minus then {negop(t)};
        continue:=true;
        if adop<>noadop then if not eq(t,int_type) then  match(t,real_type);
        if sym in [identifier,plus_sy,minus_sy,div_sy] then
        begin
            next_symbol(the_buffer);
            exp(t1);
        end;
     end;
end;
 {
      HANDLE ASSIGNEMENT OPERATIONS
      -----------------------------
 }
 procedure assignmentorproc;
 var t,t1,tr:typerec;

   begin

       typeof(symbol,t);
       if not isproc(t) then begin
            lvalue(t,checkid(symbol));
            must(assign_sy);
            {$ifdef persistent}
            if isproc(t) then
             if not inblock(checkid) then
               error('no procedure assignments out of blocks');
            {$endif}
            { evaluate the RHS }
            exp (t1);
            boolify(t1);
            tr:=rangeof(t);
            coerce(t1,tr);
            assindir(t);
       end else matchandcall(t); { procedure call }

   end ;
{ -------------------------------------------------------------- }
{     IF_CLAUSE
               this parses the rule
               <ifclause> ::= if <clause> then <clause> |
                              if <clause> then <clause> else <clause>

}
{ -------------------------------------------------------------- }
procedure if_clause ;
var t1:typerec;l,l1,l3:labl;
begin

     l1:=newlab; l:=newlab;l3:=newlab;
     next_symbol(the_buffer);
     exp(t);  condify(t);
     jumpf(l3);
     begin
          must(then_sy);
          clause(t1);
          if got (else_sy) then begin

             jumpop(l1);
             plant(l3);
             clause(t);balance(t,t1);
          end else plant(l3);
          plant(l1); release_label(l1);
     end;
     match(void,t1);
     release_label(l3);
     t:=void;

end;
{ -------------------------------------------------------------- }
{       WHILE CLAUSE                                             }
{             recognises: while <bool> do <void>                 }
{ -------------------------------------------------------------- }
procedure while_clause;
var t:typerec;
    l1,l2,l3:labl;
begin
     l1:=newlab; l3:=newlab;l2:=newlab;
     plant(l1);
     must(while_sy); exp (t); condify(t); jumpt(l3);jumpop(l2);
     plant(l3);
     if got (do_sy) then
     begin clause(t); match(t,VOID); end;
     jumpop(l1);plant(l2);
end;



{ ------------------------------------------------------------------- }
function newconst(id:lextoken; t:typerec):namedesc;
var i:idref;
begin
      newconst:=newname(id,t,constant,i);
end;

{ ------------------------------------------------------------------ }
{ LITERAL                                                            }
{        recognises a compile time literal                           }
{        if the flag INCODESEG is true then the                      }
{        constant is planted in the code segment and                 }
{        a constant is declared with name ID                         }
{ ------------------------------------------------------------------ }
  procedure LITERAL(var t:typerec; id:lextoken;
                        incodeseg:boolean; var litval:integer);
  var j:integer;
  begin
   case  lexsymbol of
   identifier  : begin

                        if incodeseg then begin
                            make_idalias(symbol,id,t);
                        end else begin
                            getconst(symbol,litval,t);
                        end;
                        next_symbol(the_buffer);
                 end;
   INT_LIT     : begin t:=(int_type);
                       if incodeseg then begin
                          j:=newconst(id,t);defconst(j,the_integer);
                          plant_integer(the_integer);
                       end else litval:=the_integer;
                       next_symbol(the_buffer)
                  end;

   STRING_LIT  : begin t:=(string_type);
                       if incodeseg then begin
                       j:=newconst(id,t);plant_string(the_string);
                       end else error('string not allowed');
                       next_symbol(the_buffer)
                  end;
   TRUE_SY     : begin t:=(bool_type);
                       if incodeseg then begin
                          j:=newconst(id,t); defconst(j,trueval);
                          plant_integer(trueval);
                       end else litval:=trueval;
                       next_symbol(the_buffer);
                 end;
   FALSE_SY    : begin t:=(bool_type);
                       if incodeseg then begin
                          j:=newconst(id,t);  defconst(j,falseval);
                          plant_integer(falseval);
                       end else litval:=falseval;
                       next_symbol(the_buffer);
                 end;
   else error('Literal expected');
   end;
  end;
{ -------------------------------------------------------------- }
{ VARLIST  Parses a list of pascal variables                     }
{ -------------------------------------------------------------- }
procedure varlist;
var id:lextoken;
    t: typerec;
    i,j:integer;
    n1:idref;
begin
  repeat
   i:=0;
   repeat
      tpushname(symbol);
      must(identifier);i:=i+1;
   until not got(comma_sy);
   must(colon_sy);
   type1(t);
   for j:=1 to i do
   begin   { pull names off the compile stack,
             build up a list of names on top }
            claimstack(t);
            {$ifdef debug}
            writeln(listfile,'type =',ptype(t));
            {$endif}
      { compile stack = id id id ....}
            id:=newid(tpopname,t,false);
   end;
      
   must(semicolon_sy);
      
 until lexsymbol <> identifier ;
end;
{ -------------------------------------------------------------- }
{ CONSTLIST  Parses a list of pascal constants                   }
{ in addition to making the declarations it stores the intialise }
{ code for the constants                                         }
{ constants are stored in the code in pascal fashion and can     }
{ not be evaluated at run time                                   }
{ -------------------------------------------------------------- }
procedure constlist;
var id:lextoken;J:integer;
    t: typerec;l:labl;
begin
      l:=newlab;jumpop(l);
      while lexsymbol=identifier do begin
        id:=symbol;must(identifier);
        must(eq_sy);
        literal(t,id,true,j);


        must(semicolon_sy);
        writeln(psym(symbol));
      end;
      plant(l);
end;


{ -------------------------------------------------------------- }
{ TYPELIST  Parses a list of pascal type decls                   }
{ -------------------------------------------------------------- }
procedure typelist;
var id:lextoken;
    self,t: typerec;
begin

      id:=symbol;must(identifier);
      must(eq_sy);
      type1(t);mkalias(self,t,id);

      must(semicolon_sy);

      if lexsymbol = identifier then
      begin typelist; end;
end;


{ -------------------------------------------------------------- }
{ DECLS  handles a list of declarations                          }
{ The sorts of declarations allowed are controled by the mode    }
{ set of flags.                                                  }
{ the procs_allowed flag controls whether procedure              }
{ declarations are allowed in the context                        }
{ the forwd flag controls whether all procedure declarations     }
{ are to be treated as forward declarations                      }
{ the external flag  controls whether procedure headings         }
{ are to be treated as specifications of external routines       }
{ the vars_allowed flag controls whether variables are allowed   }
{   In a UNIT the declaration in the interface part are treated  }
{ as forwards. If it is a unit in the USE list of another UNIT   }
{ then they are also externals                                   }
{ -------------------------------------------------------------- }

procedure decls(mode:declset);
begin
   debug('decls');
   if got(const_sy) then constlist ;

   while (lexsymbol in [  type_sy,const_sy]) or
        ( (lexsymbol=var_sy)and (vars_allowed in mode)) or
        ( (lexsymbol in[function_sy,procedure_sy]) and
          (procs_allowed in mode)) do begin
      if got(const_sy) then  constlist  else
      if got(type_sy) then typelist else
      if (lexsymbol=procedure_sy) or (lexsymbol=function_sy) then begin
            procedure_decl( mode)
      end;


   end;
end;
{ -------------------------------------------------------------- }
{    PROCEDURE_CLAUSE                                            }
{    ---------------- handles procedure declarations             }
{      proc(<typelist>-><type>);<body>                           }
{      <body>:== import <string>|alien <string>|<clause>         }
{ -------------------------------------------------------------- }
procedure procedure_clause(name:textline;
                           procclass:lexeme; pname:idref;
                           var proctype:typerec;
                           context:declset);
var t,restype       :typerec;
    domain          :typerec;
    id              :lextoken;
    oldsp           :integer;
    idnumber,
    resultloc,
    oldscope        :namedesc;
    n1              : idref;
    argv            : typearray;
    argc            : integer;
    names           : array[1..20]of lextoken;
    namenum,namec   : 0..20;
    vars            :boolean;
    head,tail       :parameterref;
    l,l2            :labl;
       procedure get_result;
       begin
            type1(restype);
            resultloc:=newname(pname^.identifier,restype,result,n1);
       end  ;
       procedure voidproc;
       begin
            resultloc:=newname(ord(undefined),restype,param,n1);
       end;
begin
     argc:=0;
     restype:=void;
     head:=nil;
     if procclass = proc_sy then must(proc_sy);
     l2:=newlab;                   { starting address of proc }
     if (context *[interfacepart,implementationpart,uselist] )=[]
        then { we are a nested procedure }
          begin
           form_closure(l2);l:=newlab;jumpop(l);
          end;
     oldsp:=stack_ptr;
     enterlexlevel; enterscope(oldscope);enter_stackframe;
     if got(brace_sy) then begin
       { Declare the Parameters }
        begin
          namenum:=0;

          repeat
             vars:=false;
                namenum:=succ(namenum);
                names[namenum]:=symbol;
                must(identifier);
             must(colon_sy);
             type1(t);
             if vars then t:=addressof(t);
             namec:= namenum ;
             begin
                   id:=names[namec];
                   idnumber:=newname(id,t,param,n1);
                   { build up a list of parameters }
                   if head=nil then begin
                      new(head);
                      tail:=head;
                   end
                   else
                   begin
                        new(tail^.next);
                        tail:=tail^.next;
                   end;
                   tail^.paramname:=n1; tail^.next:=nil;
                   argc:=argc+1; argv[argc]:=t;
             end;
          until not got(semicolon_sy) or (namenum=2);
        end;
        must(rbrace_sy);
       end;
       if got(colon_sy) then   { put the result on the list }
             get_result
       else voidproc;

     proctype:=mk_map(false,ord(procedure_sy),mk_cart(false,argv,argc),restype);
     fixup_params(proctype,head,n1);    { assign addresses to the params }
                                        { plant type check info }
     if     (implementationpart in context)
     then   start_external(name+':'+ptype(proctype));
     { main procedures are marked as public }


     plant(l2);                 { start of procedure             }
     must(semicolon_sy);
     if (context *[implementationpart,uselist] )<>[]
     then  { we do not create closures in these cases }
           { instead we call procedures useing their labels }
        bindlabel(l2,pname);
     if (context *[uselist] )<>[] then begin
        { procedures in the with list are stubs which contain a
          call to the dynamic linker to set up a jump to the
          start of the real procedure }

        aliencall('plantjump');
        plant_string(name+':'+ptype(proctype));

     end
     else   if not(interfacepart in context) then
     begin
        { build actual body of procedure }
        prologop(lexical_level);
        decls([procs_allowed,vars_allowed]);
        clause(t);match(t,VOID);
        begin
                exit_proc(oldscope); exitlexlevel;
                epilogop(proctype,oldsp);
        end;
        if (implementationpart in context) then
        end_external(name+':'+ptype(proctype));

     end;
     if (context *[interfacepart,implementationpart,uselist] )=[] then
     begin plant(l); release_label(l) end;

end;
{ -------------------------------------------------------------- }
{    TYPE1                                                       }
{    -----                                                       }
{         handles declaration of  types                          }
{ -------------------------------------------------------------- }
procedure type1(var t:typerec) ;
var
    t1,t2           : typerec;
    c1,c2           : integer;
begin
   if istype(symbol)
   then begin  typeof(symbol,t);

   {$ifdef debug}
     writeln('type1 ',psym(symbol),'=',ptype(t));
   {$endif}
               next_symbol(the_buffer);
        end
   else if got(procedure_sy) then
        procedure_clause('NONAME',procedure_sy,nil,t,[interfacepart])
   else if got(function_sy) then
        procedure_clause('NONAME',function_sy,nil,t,[interfacepart])
   else if got(brace_sy) then begin
        t:=mk_enumtype;
        repeat

              append_element(t,symbol);
              must(identifier);
        until not got(comma_sy);
        must(rbrace_sy);
   end
   {$ifndef ispascal}
   else if got(star_sy) then begin
           type1(t); t:=vectorise(false,t);
        end
   {$endif}
   else if got(dollar_sy) then begin
           type1(t); t:=tableof(t);
        end
   else { it should be a subrange }
       begin
            literal(t1,ord(undefined),false,c1);
            must(ddot_sy);
            literal(t2,ord(undefined),false,c2);
            match(t1,t2);
            t:=mk_range(c1,c2);
       end;
end;

{ -------------------------------------------------------------- }
{     CLAUSE                                                     }
{     ------                                                     }
{            handles                                             }
{            if ....                                             }
{            repeat ...                                          }
{            while ...                                           }
{            procedure ...                                       }
{            for ...                                             }
{            case ...                                            }
{            abort ...                                           }
{            bit operations                                      }
{            write ...                                           }
{            output ...                                          }
{            tab ...                                             }
{ -------------------------------------------------------------- }
procedure clause ;
var i:integer;
    n:idref;
begin
     debug(' clause ');
     t:=void;
     {$ifdef synext}
     if none= extensions(t,insertion[clauserule].rulestart,false) then
     {$endif}
     case lexsymbol of

     newline_sy  :begin next_symbol(the_buffer); clause(t) end;
     BEGIN_SY    : begin next_symbol(the_buffer);
                       sequence(t);
                       must(END_SY)
                       end;
     if_sy       :if_clause(t);
     while_sy    :while_clause;
     proc_sy     :procedure_clause('NONAME',proc_sy,n,t,[]);
     abort_sy    :next_symbol(the_buffer);
     out_byte_sy,
     output_sy,
     identifier  :begin
                      assignmentorproc;t:=void;
                 end;
     else error('Statement expected');
     end;
end;
{----------------------------------------------------------------}
{  prevent global declarations                                   }
{  a library segment must be pure code we must not allow any     }
{  stack data to be declared at gloabl level                     }
{  the exception to this are the std decls known to all procs    }
{----------------------------------------------------------------}
procedure validateGlobals;
begin
     if lexical_level = global_level then
        if library in options then error('no let decls in segment');

end;
{ -------------------------------------------------------------- }
{    PROCEDURE_DECL                                              }
{    --------------                                              }
{                  handle salgol style procedure declarations    }
{ -------------------------------------------------------------- }
procedure procedure_decl;
var t,restype,proctype:typerec; procorfn:lexeme;
    id:lextoken; n:namedesc;
    n1:idref;
    l,l2:labl;
    name:textline;
begin
     procorfn:=lexsymbol;
     next_symbol(the_buffer);
     name:=currentid(the_buffer);
     id:=symbol;
     must(identifier);
     if (mode*[interfacepart,implementationpart,uselist])<>[]
     then begin
        proctype:=void;
        n:=newname(id,proctype,static,n1);
        procedure_clause(name,  procorfn,n1,scopelist[n]^.typeinfo,mode);
     end
     else
     begin
          proctype:=void;
          if lexical_level =global_level
          then n:=newname(id,proctype,global,n1)
          else n:=newname(id,proctype,local,n1);
          procedure_clause(name, procorfn,n1,scopelist[n]^.typeinfo,mode);
     end;
end;


{ -------------------------------------------------------------- }
{          DO_INCLUSION                                          }
{            include <stringlit>                                 }
{ -------------------------------------------------------------- }
procedure do_inclusion;
var name:textline;   t:typerec;
b:textbuffer;
begin
     must(include_sy);
     must(string_lit);name:=the_string;
{     if push_buffer then loadtext(the_buffer,name,false)
     else error('Depth of Includes too great');
 }
end;
procedure do_unit;
var name:textline;   t:typerec;b:textbuffer;
    lex:lexeme;
begin
     name:=currentid(the_buffer);
     must(identifier);
     b:=the_buffer;
     if openbuffer(the_buffer,name,openfilestream(name+'.p'),list,
                   pascallanguage) then
     begin
          lex:=lexsymbol;
          next_symbol(the_buffer);
          must(segment_sy);
          must(identifier);must(semicolon_sy);
          must(interface_sy);
          if got(uses_sy) then repeat
              do_unit
          until not got(comma_sy);
          must(semicolon_sy);
          decls([procs_allowed,uselist]);
          must(implementation_sy);
     freebuffer(the_buffer);
          lexsymbol:=lex;
     end else error('can not open '+name+'.p');
     the_buffer:=b;
end;


{ -------------------------------------------------------------- }
{    LET_DECL                                                    }
{    --------  handles let <id> [:]= <clause>                    }
{ -------------------------------------------------------------- }
procedure let_decl;
var t:typerec; id:lextoken;constant:boolean;n:namedesc;
begin
     debug(' let_decl ');
     validateGlobals;
     next_symbol(the_buffer);
     id:=symbol;
     must(identifier);
     constant:= got (eq_sy);
     if not constant then must(assign_sy);
     exp(t);
     boolify(t);
     if constant then t:=constantof(t) else t:=variableof(t);
     n:=newid(id,t,false) ;
end;


{$i class.pas}
{ -------------------------------------------------------------- }
{  SEQUENCE                                                      }
{  -------- handles                                              }
{                 let ...                                        }
{                 include ...                                    }
{                 <clause>                                       }
{                 structure ...                                  }
{                 procedure ...                                  }
{                 TRACEON ...                                    }
{                 TRACEOFF ...                                   }
{                 export ...                                     }
{ -------------------------------------------------------------- }
var statements:integer;
procedure sequence;
var first:boolean;
begin
     t:=VOID;first:=true;
     repeat  debug('sequence');

           { it is necessary to distinguish between the case where we
             are at the end of a sequence and the where there is another
             statement in the sequence yet to come.
             If we find that there is another statement to come,
             then we must make sure that the last statement left a void
             result on the stack
             }
           case lexsymbol of
            newline_sy,end_sy,ley_sy:begin end;
            else begin
                  match(t,VOID);
                 end;
           end;
           case lexsymbol of
           semicolon_sy:begin next_symbol(the_buffer);t:=void end;
           until_sy,end_sy,
           newline_sy  : begin end;{$ifdef synext}
           class_sy    :class_decl;{$endif}
           include_sy  :do_inclusion;

           let_sy      :let_decl;
           type_sy     :decls([ ]);
           liston_sy   :begin next_symbol(the_buffer);listprog:=true;end;
           listoff_sy  :begin next_symbol(the_buffer);listprog:=false;end;
           function_sy,
           procedure_sy:procedure_decl([procs_allowed]);
           else clause (t)
           end;
           if not first then begin
              tpushlexical(newline_sy);
           end;
           first:=false;
           statements:=statements+1;
     until (not (got(semicolon_sy) or got(newline_sy)))
         or(not (errorfree or        (batch in options)))   ;
end;
{ -------------------------------------------------------------- }
{ EXTENSIONS                                                     }
{      handle dynamic syntax extensions                          }
{ -------------------------------------------------------------- }
{$ifdef synext}
FUNCTION     EXTENSIONS{(Var t:typrec;r:rulerange); FORWARD};
var t2:typerec;
    n:namedesc;
    comp:rulerange;
    try:matchtype;

label 2;
BEGIN
     extensions:=none;
     with rules[r] do
     case sort of
     null:begin t:=void; extensions:=none;end;
     binding  : begin
                try:= extensions(t,head,alreadygot);
                if try =total then
                extensions:= extensions(t2,tail,alreadygot)
                else extensions:=try;

                end;
     semantics: begin
               n:= lookup(id)   ;
               if n= nulid then error('Semantic function out of scope');
               call_proc(n);
               extensions:=total;
                end;

     subrule : begin
                    if not alreadygot then
                    case proc of
                    clauserule:clause(t);
                    expressionrule:expression(t);
                    exp1rule:exp1(t);
                    exp2rule:exp2(t);
                    exp3rule:exp3(t);
                    exp4rule:exp4(t);
                    exp5rule:exp5(t);
                    end;
                    t2:=prodtype;
                    {if alreadygot then begin
                    writetype(t);
                    end;}
                    { for a clause the type is compulsory }
                    if eq(t,t2) then
                    { we should take this alternative }
                    begin
                     2:  try:=extensions(t,tail,false);
                       if try = none then begin
                            try:=partial
                       end;
                       extensions:=try;
                    end
                    else if eq(t,int_type) and eq(t2,real_type) then
                    begin
                        floatop;goto 2;
                    end
                    else extensions:=partial;
              end;
     compulsory: begin
                 if symbol = mustbesym then begin
                    next_symbol(the_buffer);
                    extensions:= extensions(t,tail,alreadygot);
                    extensions:=total;     { by this point we can not back out }
                   end else extensions:=none;
                 end;
     alternative:
                 begin
                    { head points at a bind }
                    { head of the bind may be compulsory }

                    case extensions(t,head,alreadygot) of
                    none : try:=extensions(t,tail,alreadygot);
                    total: begin
                                try:=total;
                                t:=prodtype;

                           end;
                    partial:begin
                                  t2:=t;
                                  try:=extensions(t2,tail,true);
                                  if try=none then
                                  begin

                                     try:=partial
                                  end
                                  else if try = total then t:=t2;

                            end;
                    end;
                    extensions:=try;
                end;
     end;

END;
{$endif}
{ -------------------------------------------------------------- }
{               LIB                                              }
{               this parses the production                       }
{               segment <string lit> class <string lit >         }
{ -------------------------------------------------------------- }
procedure lib(var segname:textline);
begin

     must(string_lit); segname:=the_string;
end;

{ -------------------------------------------------------------- }
{   PROG                                                         }
{   ----                                                         }
{ -------------------------------------------------------------- }
{procedure prog;                                                 }
var t:typerec;scope:namedesc;
    p:^integer;
begin
     debug('prog');
     list:=false;
     {$ifdef debug}list:=true;{$endif}
     incompiler:=true;trace:=true;
     mark(p);symbols.newstack;
     initlexanal;initsymtab;
     enterscope(scope);
     statements:=0;
     {$ifdef synext}toprule:=0;
     defineinsertions;{$endif}
     if library in options then options := options - [library];
     next_symbol(the_buffer);
     if got (segment_sy) then options := options +[library];
     init_cgen(segment,class);
     if not( library in options )then
     begin

          start_program;
          std_decls;


               sequence(t);
               must(end_sy);must(dot_sy);
               exitblock(scope,VOID);
               end_program(segment);
          end
     else begin

          start_library;
          std_decls;
          must(identifier);must(semicolon_sy);
          must(interface_sy);
          if got(uses_sy) then repeat
              do_unit
          until not got(comma_sy);
          must(semicolon_sy);
          decls([procs_allowed,interfacepart]);
          must(implementation_sy);
          decls([procs_allowed,implementationpart]);
          must(begin_sy);
          start_libmain;
          sequence(t);
          must(end_sy); must(dot_sy);
          exitblock(scope,VOID);
          end_library(segment);
          end;
     match(VOID,t);

     finalise_cgen;
     release(p);
     incompiler:=false;
end;

end.