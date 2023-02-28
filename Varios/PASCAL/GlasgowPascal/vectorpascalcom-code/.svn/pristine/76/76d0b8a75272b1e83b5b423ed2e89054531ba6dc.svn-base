{$r-
   SALGOL  SYNTAX ANALYSIS

----------------------------------------------------------------
Module      : SAsyn
Used in     : Compiler toolbox
Uses        : dlb.cmp, sasym.cmp
Author      : W P Cockshott
Date        : 15 Oct 1986
Version     : 2
Function    : To parse S-algol programs
Changes     : derived from file sasyn.cmp on 9-2-89
Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------}
{$s+}
UNIT SASYN;
INTERFACE USES
  editdecl,
  errors,
  {$ifndef pretext}
  fsm,
  reader,
  dlb,
  {$endif}
  {$ifdef pretext} lines,fsmpret,dlbpret,{$endif}
  IDTYPES,
{$ifdef assembler}
cgendum,
{$endif }
{$ifndef assembler }
  sagen,
{$endif }
  symtab;

{
  The syntax analyser is a single pass top down recursive analyser.

  It has one procedure for each production rule in the grammer of
  the language. The language chosen in this example is S-algol.
  For a fuller description of the techniques used here you should
  refer to chapter 6 of "Recursive Descent Compiling" by A.J.T Davie
  and Ron Morrison.

  The syntax analyser calls 3 other modules:
      -      the lexical analyser
      -      the symbol table package
      -      the code generator

  The interface to all of these procedures is as specified in the
  book by Davie and Morrison, though the implementations of these
  modules differs from that in the book.


}

procedure prog(var the_buffer:textbuffer);

PROCEDURE SYNVER;
IMPLEMENTATION
procedure synver;
begin
     writeln ('P-salgol Syntax analyser for IBM AT version 2.31');

end;

procedure prog(var the_buffer:textbuffer);

const syndebug = false;
      maxrule =350;
{ -------------------------------------------------------------- }
{ types for run time syntactic extensions                        }
{ ---------------------------------------------------------------}
type insertions= (clauserule,norule,expressionrule,exp1rule,exp2rule,
                  exp3rule,exp4rule,exp5rule,subscriptrule);
     matchtype = (none,partial,total);
     rulerange = 0..maxrule;
     ruletype  = (null,binding,alternative,compulsory,subrule,semantics);
     rule      = record
                   tail:rulerange;
                   prodtype:typerec;
                   case sort      :ruletype of
                   null,binding,
                   alternative    :(head:rulerange);
                   compulsory     :(mustsym:lextoken);
                   subrule        :(proc:insertions;);
                   semantics      :(id :lextoken);

                 end;

var
     rules     : array [rulerange]of rule;
     nullrule,
     toprule   : rulerange;
     insertion : array[insertions] of record
                   rulestart: rulerange;
                   name     : lexeme ;
                 end;
     function nextrule:rulerange;
     begin
        toprule:=succ(toprule);
        nextrule:=pred(toprule);
        if toprule=(maxrule-3)then error('grammer too big');
     end;

{ -------------------------------------------------------------- }
{ Define Insertion Points                                        }
{        These are the grammer rules that can be extended        }
{ -------------------------------------------------------------- }
procedure defineinsertions;
const rulenames:array [insertions] of lexeme=
      ( clause_sy,UNDEFINED,expression_sy,exp1_sy,exp2_sy,exp3_sy,
        exp4_sy,exp5_sy,subscript_sy);
var
    ins :insertions;
    r:rulerange;
begin

    nullrule:=nextrule;
    rules[nullrule].sort:=null;
    for r:=succ(nullrule)to  maxrule do
      with rules[r] do begin
         prodtype:=void;sort:=null;    mustsym:=0;tail:=nullrule;
      end;
    for ins:=clauserule to subscriptrule do
    with insertion[ins] do begin
      rulestart:=nullrule;
      name:=rulenames[ins];
    end;

end;

{ -------------------------------------------------------------- }
{ Find insertion                                                 }
{ -------------------------------------------------------------- }
function findinsertion(l:lexeme):insertions;
var i,j:insertions;
begin
      j:=norule;
      for i:=clauserule to subscriptrule do
      if insertion[i].name = l then j:=i;
      findinsertion:=j;
end;
{ -------------------------------------------------------------- }
{          FORWARD DECLARATIONS FOR RECURSIVE PRODUCTIONS        }
{ -------------------------------------------------------------- }
PROCEDURE     SEQUENCE(VAR t:TYPEREC);   FORWARD;
PROCEDURE     CLAUSE(VAR t:TYPEREC);     FORWARD;
PROCEDURE     TYPE1(VAR t:TYPEREC);                 FORWARD;
PROCEDURE     TYPE0(VAR t:TYPEREC);                 FORWARD;
PROCEDURE     IF_CLAUSE(var t:typerec);             FORWARD;
PROCEDURE     WHILE_CLAUSE;          FORWARD;
FUNCTION     EXTENSIONS(Var t:typerec;r:rulerange;
                            alreadygot:boolean):matchtype; FORWARD;


procedure must(p:lexeme);
begin
     writeln('must ',psym(ord(p)));
     mustbe(p,the_buffer);
end;
function got(l:lexeme):boolean;
begin
     writeln('got ',psym(ord(l)),'?');

     got:= have(l,the_buffer) ;
end;
procedure next;begin next_symbol(the_buffer) end;
{ -------------------------------------------------------------- }
{         SKIP NEWLINES                                          }
{ -------------------------------------------------------------- }
procedure skipnl;begin if got(newline_sy) then skipnl end;
{ -------------------------------------------------------------- }
{         MAIN PARSING PROCEDURES ONE PER GRAMMER RULE           }
{ -------------------------------------------------------------- }
procedure debug( s:textline);
begin if trace then begin writeln(listfile,s) end; end;
procedure conwritetype(var t:typerec); var s:textline;
begin  if trace then begin s:=ptype(t);write(listfile,'<',s,'>')  end;end;
{ -------------------------------------------------------------- }
{            BOOLIFY                                             }
{ -------------------------------------------------------------- }
PROCEDURE BOOLIFY( var t:typerec);
{ converts a condition code into a boolean on the stack }
begin
     if eq(t,condition_type) then begin
        form_boolean;
        new(t);
        t^:=bool_type^;
     end;
end;

PROCEDURE CONDIFY(var t:typerec);
begin
     if not eq(t,condition_type) then begin
        match(t,bool_type);
        ll_int(1);
        binaryop(eq_sy,int_type);
        t:=condition_type;
        end;
end;

{ -------------------------------------------------------------- }
function newid(id:lextoken; t:typerec):namedesc;
var i:idref;
begin
 if lexical_level = global_level then newid:=newname(id,t,global,i)
     else newid:=newname(id,t,local,i);
end;
{----------------------- STD_DECLS-------------------------------}
var s_i,s_o,i_w,s_w,r_w,null_file:namedesc;
procedure std_decls;
var I:integer;scope :namedesc;
{ delare standard identifiers }
begin
     ll_int(0);line_number:=newid(tokenof('line.number'),INT_type);
     i:=ll_nil;pidreg:=newid(tokenof('pid_reg'),PNTR_type);
     i:=stack_ptr;
     load_addr(line_number);
     load_addr(pidreg);
     callc('_defpidreg');
     retractstack(i);

     ll_int(0);s_i:=newid(tokenof('s.i'),FILE_type);
     ll_int(1);s_o:=newid(tokenof('s.o'),FILE_type);
     ll_int(-1);null_file:=newid(tokenof('nullfile'),File_type);
     ll_int(12);i_w:=newid(tokenof('i.w'),INT_type);
     ll_int(2);s_w:=newid(tokenof('s.w'),INT_type);
     ll_int(14);r_w:=newid(tokenof('r.w'),INT_type);
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
                  let a=array(lower,upper-lower+1,sizeof(pntr))
                  for i= lower to upper do a(i):=
                  begin
                       let lower=<lower2>
                       let upper=<upper2>
                       let a=array(lower,upper-lower+1,sizeof(init)
                       for i=lower to upper do a(i):=init
                       a
                  end

                  a
              end
              dim1()

{ -------------------------------------------------------------- }

PROCEDURE MAKEVECTOR(VAR T:TYPEREC);
    procedure inner(var t:typerec);

    var t1,t2:typerec;
        l1,l2:labl;
        oldscope,forscope,lower,upper,A,I:namedesc;
        oldsp,depth:integer;
    begin
     enterscope(oldscope);

              clause(t1); match(t1,int_type);lower:=newid(1,t1);
              must(dcolon_sy);
              clause(t2); match(t2,int_type);upper:=newid(2,t1);
              if  got(comma_sy) then
              begin
                   l1:=newlab;l2:=newlab;
                   t:=pntr_type;oldsp:=stack_ptr;
                   makepntrarray(lower,upper);{ result in preg }
                   retractstack(oldsp);
                   pushpreg;  { pntr to vector on top of stack }
                   A:=newid(3,t);
                   {------------- Begin code of forloop ---------------}
                   enterscope (forscope);
                   load(lower);I:=newid(4,int_type);
                   load(upper);
                   forprepop;
                   plant(l1);fortestop(false,l2);
                   oldsp:=stack_ptr;
                   load(A);load(I);
                   inner(t);     { generate inner vector }
                   subvass(t);
                   retractstack(oldsp);   { remove temps of assignment }
                   forstepop(false,l1);plant(l2);
                   exitblock(forscope,VOID);
                   {--------------- End code of forloop ---------------}
                   load(A);               { result on stack }
              end
              else
              begin

                  must(of_sy);
                  oldsp:=stack_ptr;
                  clause(t);
                  iliffeop(1,t);
                  retractstack(oldsp);  { just leave the lower and upper bounds}
                  pushpreg;
              end;
     exitblock(oldscope,t);
     { this removes all temp variables from the stack }
     t:=vectorise(false,variableof(t));
    end;
begin
     next;
     inner(t);
end;

{------------------------- STD_PROC ---------------------------------}
procedure std_proc(var t:typerec);
var sym:lexeme;
begin
     sym:=lexsymbol;
     case lexsymbol of
     read_sy,readi_sy,readr_sy,readb_sy,
     reads_sy,peek_sy,read_a_line_sy,readp_sy,
     read_byte_sy,eoi_sy:begin
                              next;
                              must(brace_sy);
                              if not got(rbrace_sy) then begin
                                 clause(t);match(t,file_type);
                                 must(rbrace_sy);
                              end else
                              begin
                                   load(s_i);
                              end;
                              readop(sym,t);
                         end;
     length_sy,lwb_sy,upb_sy :begin
              next;
              must(brace_sy);
              clause(t);
              must(rbrace_sy);
              if not isvector(t) then
                    error('vector expected');
              t:=int_type;
              if sym = lwb_sy then lwbop else upbop;
           end;
   else error('standard procedure expected ');
   end;
end;
{ ------------------------------------------------------------- }
{  CALLBYNAME   calls the named procedure, must be in scope     }
{ ------------------------------------------------------------- }

function checkid(sym:lextoken):namedesc;
         var n:namedesc;
          begin
               n:= lookup(sym)   ;
               if n= nulid then error('Undeclared symbol <'+psym(sym)+'>');
               checkid := n
          end;
procedure callbyname(s:textline);
          begin
                call_proc(checkid(tokenof(s)));
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
    the_field,thevar,oldscope:namedesc;
    pendingop:(nothing,subvec,substruct,subtab,simplevar,procval);
    sym,procsym:lextoken;
    i:integer;
    m:matchtype;
    argv:typearray;
    argc:integer;

    procedure checkvar(t:typerec);
    begin
       if not isvariable(t) then error('not a variable '+ptype(t));
    end;
    function fieldid(sym:lextoken):namedesc;
         var n:namedesc;t:typerec;
         begin
              n:=checkid(sym);
              if not isfield(n) then error('field expected');
              fieldid:=n;
         end;
    procedure withdraw; { return stack to starting point }
          begin retractstack(expstartlev); end;
          {
     HANDLE SUBSCRIPTION OPERATIONS
     ------------------------------
  note that if we got a bracket after an expression we must delay
  the subscript operation if any until we got checked if the expression
  is followed by an assignment.
  if it is, then we generate a subscript assign else we generate a
  dereference.
  The variable "pendingop" holds whether or not there is a subscription
  pending or not
 }
          procedure callbyname(s:textline);
          begin
                call_proc(checkid(tokenof(s)));
          end;
procedure SUBSCRIPT(var t:typerec);
          procedure svec; { subscript a vector }
          begin subv(t); end;
          procedure sstruct; { subscript a structure }
                    begin subs(fieldid(sym),t);  end;
          procedure stab; { subscript a table }
          begin tablecontents(t,t);
                callbyname(tab_lookup(t));
          end;
          var rep:typerec;
 begin
    domain:=void;
    proctype:=t;
    argc:=0;
    conwritetype(t);
    if pendingop = simplevar then
    begin
         thevar:=checkid(sym);
         load(thevar)
    end;
    pendingop:=nothing;
      repeat
        representation(t,t);
        if ispntr(t) then begin
           { subscript a pointer }
           sym:=symbol; loadtrademark(classof(sym));mustbeop;
           must(identifier);
           if lexsymbol = comma_sy then    sstruct
           else pendingop:=substruct;
        end else begin
           domain:=domainof(t);
           clause(t1);
           if isvector(t) then begin
              { ARRAY }
              match(t1,int_type);
              if got(bar_sy) then begin
                 { slice operation }
                  clause(t2);match(t2,int_type); substrop;
                  t:=proctype;
              end else  Begin
                if lexsymbol= comma_sy then svec else pendingop:=subvec
              end
           end else
           if istable(t) then   begin
              { TABLE }
              match(t1,string_type);
              if lexsymbol= comma_sy then stab
              else pendingop:=subtab
           end else
           if got(bar_sy) then begin
              { STRING }
              clause(t2);
              match(t1,int_type); match(t1,t2);  match(t,string_type);
              substrop;
           end else  if isproc(proctype) then
           begin
               argc:=succ(argc);argv[argc]:=t1;
           end else
           error(' subscript not allowed here '+ptype(proctype));
        end;
      until (not errorfree) or (not got(comma_sy) );
      must(RBRACE_sy);
      if isproc(proctype) then
      begin
           { check that the parameter types were ok }
           match(mk_cart(false,argv,argc),domain);
           { the identifier in the expression was a procedure }
           call_proc(checkid(sym));
           pendingop:=nothing;
           t:=rangeof(proctype);
           conwritetype(t);
      end;
      if lexsymbol <> assign_sy then
            case pendingop of
                 substruct : sstruct;
                 subvec    : svec;
                 subtab    : stab;
            end;
      if got(brace_sy) then subscript(t);
 end;






begin
   debug(' exp5 '); pendingop:=nothing;
   skipnl;
   expstartlev:=stack_ptr;

   case lexsymbol of
   end_sy,comma_sy,
   rbrace_sy,
   ley_sy,
   question_sy : begin end; (* these are terminators *)
   identifier  : begin
                      typeof(symbol,t); t3:=t;
                      sym:=symbol;
                      conwritetype(t);debug('identifier');

                      next;
                      if not isstruct(t) then begin
                         { it is an L value or R value or a procedure }
                         if not isproc(t) then pendingop:=simplevar
                         else pendingop:=procval;
                       end else
                       begin
                            thevar:=checkid (sym);
                            rewindfields(thevar);
                            argc:=0;
                            if got(brace_sy) then begin

                            { this is a structure literal }
                               formstruct(thevar);
                               repeat
                                  duplicate(pntr_type);
                                  clause(t1);
                                  argc:=argc+1;argv[argc]:=t1;
                                  the_field:=getnextfield;

                                  typeof(the_field,t);
                                  match(t,t1);
                                  subsass(fieldid(the_field),t);
                               until not got(comma_sy);
                               must(rbrace_sy);
                               typeof(sym,t);
                               match(domainof(t),mk_cart(true,argv,argc));
                               t:=pntr_type;
                            end else loadtrademark(thevar) ;
                       end;

                 end;
   cur_SY      : begin next;
                       enterscope(oldscope);
                       sequence(t);
                       exitblock(oldscope,t);
                       must(LEY_SY);
                       end;
   brace_sy    : begin next;clause(t);must(RBRACE_sy);end;
   BEGIN_SY    : begin next;
                       enterscope(oldscope);
                       sequence(t);
                       exitblock(oldscope,t);
                       must(END_SY)
                       end;
   INT_LIT     : begin t:=int_type;ll_int(the_integer);next end;
   REAL_LIT    : begin t:=real_type;ll_real(the_real);next end;
   STRING_LIT  : begin t:=string_type;ll_string(the_string);next end;
   TRUE_SY     : begin t:=bool_type;next; ll_int(1) end;
   FALSE_SY    : begin t:=bool_type;next; ll_int(0) end;
   nil_sy      : begin next;t:=pntr_type;i:=ll_nil; end;
   vector_sy   : makevector(t);
   at_sy       : begin
                     must(at_sy);
                     clause(t);match(int_type,t);
                     must(of_sy);
                     type1(t);
                     must(bra_sy);
                     elems:=0;
                     if not got(ket_sy) then begin
                         repeat clause (t1); match(t,t1) ;
                            elems:=elems+1;
                         until not got(comma_sy);
                         must(ket_sy);
                     end;
                     t:=vectorise(false,t);
                     ll_int(heapsizeof(t1)*stride); { push size of array elems in bytes }
                     ll_int(elems);
                     make_vector;
                     withdraw;
                     pushpreg;
                end;
   bra_sy       : begin
                     ll_int(1);     { lower bound }
                     must(bra_sy);

                     clause (t); elems:=1;
                     if got(comma_sy) then
                     repeat clause (t1);
                            elems:=elems+1;
                            match(t,t1);
                     until not got(comma_sy);
                     must(ket_sy);
                     ll_int(heapsizeof(t)*stride); { push size of array elems in bytes }
                     ll_int(elems);
                     make_vector;
                     t:=vectorise(false,t);
                     withdraw;
                     pushpreg;
                end;
     else std_proc(t);
     end;
 if got(brace_sy) then subscript(t);
 if not got(assign_sy) then
        case pendingop of
                  procval,
                 simplevar : begin
                             thevar:=checkid(sym);
                             load(thevar)
                            end;
        end
 else
 {
      HANDLE ASSIGNEMENT OPERATIONS
      -----------------------------
 }
   begin
            if isproc(t) then
             if not inblock(checkid(sym)) then
               error('no procedure assignments out of blocks');
            { evaluate the RHS }
            clause (t1);
            boolify(t1);

            case pendingop of
                 substruct : subsass(fieldid(sym),t);
                 subvec    : begin
                                  t:=rangeof(t);
                                  subvass(t1);
                             end;
                 subtab    : begin
                                 callbyname(tab_insert(t1));
                                 readln;
                                 tablecontents(t,t);
                             end;
                 else assignop(checkid(sym));
            end;
            match(t,t1);
            checkvar(t);
            withdraw;
            t:=VOID   ;
   end ;
end;
procedure exp5 (var t:typerec);
var
    m:matchtype;
begin

     m:=extensions(t,insertion[exp5rule].rulestart,false);
     if m= none then exp5std(t);
end;

{ -------------------------------------------------------------- }
{     EXP4
          this parses the syntax rules
               <exp4>::=[<addop>]<exp5>[<multop><exp5>]*
               <multop>::=<star>|div|rem|/|++
               <addop>::= +|-
}
{ -------------------------------------------------------------- }
procedure exp4 (var t:typerec);
var continue:boolean; t1:typerec;   sym:lexeme;
    adop:(plus,minus,noadop);
    m:matchtype;
begin
     debug(' exp4 ');
     adop:=noadop;
     if got(plus_sy) then adop:=plus;
     if got(minus_sy) then adop:=minus;

     m:=extensions(t,insertion[exp4rule].rulestart,false);
     if m= none then exp5(t);
     if m<>total then begin
     sym:=lexsymbol;
     if adop= minus then negop(t);
     continue:=true;
     if adop<>noadop then if not eq(t,int_type) then  match(t,real_type);
     repeat
           sym:=lexsymbol;
           case lexsymbol of
           star_sy        : begin
                                 next;exp5(t1);
                                 balance(t,t1);binaryop(sym,t)
                                 end  ;
           slash_sy       : begin
                                 next;
                                 balance(real_type,t);
                                 exp5(t1);
                                 balance(real_type,t1);
                                 binaryop(sym,t)
                                 end   ;
           div_sy,rem_sy  : begin
                                 next;
                                 match(t,int_type);
                                 exp5(t1); match(int_type,t1);
                                 binaryop(sym,t)
                                 end    ;
           dplus_sy       : begin
                                 next;
                                 exp5(t1);
                                 match(t,t1);
                                 binaryop(sym,t)
                                 end     ;
           else continue:=false;
           end;
     until not continue ;
     end;
end;
{ -------------------------------------------------------------- }
{     EXP3
         this parses the rule
              <exp3> ::= <exp4>[<addop><exp4>]*
}
{ -------------------------------------------------------------- }
procedure exp3 (var t:typerec);
var t1:typerec; sym:lexeme; m:matchtype;
begin
     debug(' exp3 ');
     m:=extensions(t,insertion[exp3rule].rulestart,false);
     if m= none then exp4 (t);
     sym:=lexsymbol;
     if m<>total then
     while errorfree and( got(plus_SY) or got(MINUS_SY)) do
     begin
           exp4(t1);
           balance(t,t1);
           binaryop(sym,t);
           sym:=lexsymbol;
     end;
end;
{ -------------------------------------------------------------- }
{     EXP2
         this parses the rules
              <exp2> ::= [~] <exp3> [<relop> <exp3>]
              <relop>::= is|isnt|<|>|>=|<=|~=|=

}
{ -------------------------------------------------------------- }
procedure exp2 (var t:typerec);
var neg:boolean;t1:typerec; sym:lexeme;m:matchtype;
begin
   debug(' exp2 ');
   neg:=got(TILDE_SY);
   m:=extensions(t,insertion[exp2rule].rulestart,false);

   if m= none then exp3 (t);
   if neg then begin match(t,bool_type);notop; end;
   sym:=lexsymbol;
   if m<>total then
   case lexsymbol of
   is_sy,isnt_sy  :
         begin
             match(t,pntr_type);
             next;
             exp3(t);
             {typeof(symbol,t);must(identifier);}
             if not isstruct(t) then error('structure class required') ;
             binaryop(sym,structure_type);
             t:=condition_type;
         end;
   eq_sy,neq_sy,ge_sy,gt_sy,le_sy,lt_sy:
         begin
              next;
              exp3 (t1 );
              balance(t,t1) ;
              binaryop(sym,t);
              t:=condition_type;
         end;
   else begin end;
   end;
end;
{ -------------------------------------------------------------- }
{     EXP1
          this parses the rule
               <exp1> ::= <exp2>[and <exp2>]*

}
{ -------------------------------------------------------------- }
procedure exp1 (var t:typerec);
var ok,fail,l2, part2:labl;m:matchtype;
begin
     debug(' exp 1 ');
     m:=extensions(t,insertion[exp1rule].rulestart,false);
     if m= none then exp2 (t);
     if m<>total then
     if got(AND_SY) then
     begin
          condify(t)   ;
          fail:=newlab;
          jumpf(fail);
          exp1(t); condify(t);ok:=newlab;jumpt(ok);
          plant(fail); ll_int(0);l2:=newlab;jumpop(l2);  { the and has failed }
          decsp(int_type);               { we only return a single value }
          plant(ok);ll_int(1);plant(l2); { the and has succeded }
          t:=bool_type;
          end;
end;
{ -------------------------------------------------------------- }
{     EXPRESSION
                this parses the rule
                     <expression>::= <exp1>[or <exp1>]*

}
{ -------------------------------------------------------------- }
procedure expression (var t:typerec);
var ok,ok2,fail,past:labl;sym:lexeme;
    m:matchtype;
begin
     debug(' expression ');
     sym := lexsymbol;
     m:=extensions(t,insertion[expressionrule].rulestart,false);
     if m= none then exp1 (t);
     if m<>total then
     if  got(OR_SY) then
     begin

         condify(t);
         ok:=newlab;fail:=newlab;ok2:=newlab;
         jumpf(ok2);jumpop(ok);plant (ok2);
         expression(t);condify(t);jumpt(ok);
         ll_int(0); jumpop(fail);
         decsp(int_type);               { we only return a single value }
         plant(ok);ll_int(1);
         plant(fail);
         t:=bool_type;
         end;
end;
{ -------------------------------------------------------------- }
{     IF_CLAUSE
               this parses the rule
               <ifclause> ::= if <clause> do <clause> |
                              if <clause> then <clause> else <clause>

}
{ -------------------------------------------------------------- }
procedure if_clause ;
var t1:typerec;l,l1,l3:labl;
begin
     l1:=newlab; l:=newlab;l3:=newlab;
     next;
     clause(t);  condify(t);
     jumpt(l);jumpop(l3);plant(l);
     if got(do_sy) then begin clause(t);plant(l3); match(t,VOID) end else
     begin
          must(then_sy);
          clause(t1);jumpop(l1);decsp(t1);
          must(else_sy);
          plant(l3);
          clause(t);balance(t,t1); plant(l1); release_label(l1);
     end;
     release_label(l3);
end;
{ -------------------------------------------------------------- }
procedure write_clause;
var t:typerec;   oldsp:integer;
begin
     if got (out_byte_sy) then begin
        load(s_o);
        clause(t);match(t,int_type);must(comma_sy);
        clause(t);match(t,int_type);
        out_byte_op;
     end else
     if got (output_sy) then begin
        clause(t);match(t,file_type);must(comma_sy);
     end else begin
         next;
         load(s_o);
     end;
     repeat
           oldsp:=stack_ptr;
           clause (t); boolify(t);
           if got (colon_sy) then clause(t) else
           begin
              if isreal(t) then load(r_w) else load(i_w);
           end;
           load(s_w);
           writeop(t);
           retractstack(oldsp);
     until not got(comma_sy);
     end_write;
end;
{ -------------------------------------------------------------- }
procedure for_clause;
var t:typerec;l1,l2:labl;id:lextoken; os,   n:namedesc;

    complex:boolean;
begin
     enterscope(os);
     l1:=newlab;l2:=newlab;
     next;
     id:=symbol;
     must(identifier);
     must(eq_sy);
     clause(t);match(t,int_type);
     n:=newid(id,cint_type);
     must(to_sy);
     clause(t);match(t,int_type);
     if got(by_sy) then begin complex:=true; clause(t);match(t,int_type);end
     else complex:=false;
     must(do_sy); if not complex then forprepop;
     plant(l1);fortestop(complex,l2);
     clause(t);match(t,VOID);
     forstepop(complex,l1);plant(l2);
     exitblock(os,VOID);
end;
{ -------------------------------------------------------------- }
procedure repeat_clause;
var t:typerec;
    l1,l2,l3:labl;
begin
     l1:=newlab;l2:=newlab;l3:=newlab;
     next;
     plant(l1);
     clause(t); match(t,VOID);
     must(while_sy); clause (t); condify(t);
     jumpt(l3);jumpop(l2);plant(l3);
     if got (do_sy) then
     begin clause(t); match(t,VOID); end;
     jumpop(l1);plant(l2);
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
     must(while_sy); clause (t); condify(t); jumpt(l3);jumpop(l2);
     plant(l3);
     if got (do_sy) then
     begin clause(t); match(t,VOID); end;
     bjump(l1);plant(l2);
end;
{ -------------------------------------------------------------- }
procedure case_clause (var t:typerec);
var t1,t2:typerec; first:boolean; l1,l2,l3:labl;os,n:namedesc;
begin
   enterscope(os);
   next;
   clause(t1);
   n:=newid(tokenof('..cv'),t1);
   must(of_sy);
   first:=true;
   l3:=newlab;
   while errorfree and not got(default_sy) do begin
     l1:=newlab;;l2:=newlab;
         repeat clause (t);match(t,t1); load(n);binaryop(eq_sy,t);jumpt(l1);
         until not got(comma_sy);
         must(colon_sy);
         jumpop(l2);plant(l1);
         clause(t);
         if not first then begin match(t2,t);end;
         decsp(t) ;
         t2:=t; first:=false;
         skipnl;
         bjump(l3);  plant(l2);
   end;
   must(colon_sy); clause(t); match(t,t2);plant(l3);
   exitblock(os,t2);
end;
{ -------------------------------------------------------------- }
{   RECOGNISES                                                   }
{      tab                                                       }
{          clause : clause                                       }
{          clause : clause                                       }
{          ....                                                  }
{      end                                                       }
{ -------------------------------------------------------------- }
procedure tab_clause (var t:typerec);
var t1,t2:typerec;
    pairs:integer;os,n:namedesc;
    procedure singleval;
    begin
         must(colon_sy);
         clause(t);
         expand_to_pntr(t);
         match(t1,t);
   end;
begin
   next;
   type0(t1);
   must(of_sy);
   pairs:=0;
   skipnl;
   while not got(default_sy) and errorfree do begin
         clause (t);match(t,string_type);
         singleval;
         pairs:=pairs+1;
         skipnl;
   end;
   { all pairs now on the stack }
   singleval;
   { default on the stack }
   callbyname('mcktab' +typecode(t1));
   { empty table on the stack }
   while errorfree and( pairs>0) do begin
         callbyname('tabinit'+typecode(t1));
         pairs:=pairs-1;
   end;
   { initialised table on the stack }
   t:=tableof(t1);

end;
{ -------------------------------------------------------------- }
{    PROCEDURE_CLAUSE                                            }
{    ---------------- handles procedure declarations             }
{      proc(<typelist>-><type>);<body>                           }
{      <body>:== import <string>|alien <string>|<clause>         }
{ -------------------------------------------------------------- }
procedure procedure_clause(procclass:lexeme; pname:idref;
                           var proctype:typerec;extern:boolean);
var t,restype       :typerec;
    domain          :typerec;
    id              :lextoken;
    oldsp           :integer;
    idnumber,
    resultloc,
    oldscope        :namedesc;
    n1              :idref;
    head,tail       :parameterref;
    l,l2            :labl;
    argv            : typearray;
    argc            : integer;
    n               :namedesc;

       procedure get_result;
       begin
            type0(restype);
            resultloc:=newname(ord(undefined),restype,param,n1);
            ;
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
     if not extern then
     if procclass = proc_sy then begin
           form_closure(l2);l:=newlab;jumpop(l);
     end;
     oldsp:=stack_ptr;
     enterlexlevel; enterscope(oldscope); stack_ptr:=enter_stackframe;
     if got(brace_sy) then begin
       { Declare the Parameters }
       if   got (rbrace_sy) then voidproc else begin
        if   got (arrow_sy) then get_result
        else begin
          repeat
             type1(t);
             repeat
                   id:=symbol;
                   must( IDENTIFIER);
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

                   tail^.paramname:=n1;
                   tail^.next:=nil;
                   argc:=argc+1;
                   argv[argc]:=t;
             until not got(comma_sy);
          until not got(newline_sy);
          if got(arrow_sy) then   { put the result on the list }
             get_result
          else voidproc;
        end;
        must(rbrace_sy);
       end;
     end else voidproc;
     proctype:=mk_map(false,ord(procclass),mk_cart(false,argv,argc),restype);
     fixup_params(proctype,head,n1);    { assign addresses to the params }
     { plant type check info }
     if extern then plant_string(ptype(proctype));
     skipnl;
     plant(l2);                 { start of procedure             }
     if extern then   bindlabel(l2,pname);
     if got(alien_sy) then begin
        must(string_lit);
        prologop(1);            { assume all aliens at lex level 1 }
        aliencall(the_string);
        exit_proc(oldscope); exitlexlevel;
        epilogop(proctype);
     end
     else
     begin
        { build actual body of procedure }
        prologop(lexical_level);
        clause(t);
        boolify(t);
        match(t,restype);
        if not eq(t,VOID) then begin
              assignop(resultloc);
              exit_proc(oldscope); exitlexlevel;
              epilogop(proctype);
        end else
        begin
                exit_proc(oldscope); exitlexlevel;
                epilogop(proctype);
        end;
     end;
     stack_ptr := oldsp;
     if not extern then if procclass = proc_sy then
     begin plant(l); release_label(l) end;

end;

{ --------------------------------------------------------------- }
{    IMPORT CLAUSE                                                }
{    -------------                                                }
{                 recognises                                      }
{                 import (<string>) <type1> segment string          }
{ --------------------------------------------------------------- }

procedure import_clause(var t:typerec);
var t2:typerec;
begin
     must(import_sy);
     must(brace_sy);
     expression(t);
     must(rbrace_sy);
     match(t,string_type);
     type1(t);
     ll_string(ptype(t));
     skipnl;
     must(segment_sy);
     clause(t2);
     match(t2,string_type);
     bindop;
end;

{ --------------------------------------------------------------- }
{    PREFIX OP                                                    }
{    ---------   handles bit operations                           }
{ --------------------------------------------------------------- }
procedure prefixop(var t:typerec);
var s:lexeme;  t1:typerec;
begin
     s:=lexsymbol;
     next;
     must(brace_sy);
     clause(t1);
     must(comma_sy);
     clause(t);balance(t,t1); binaryop(s,t);
     must(rbrace_sy);
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
     if none= extensions(t,insertion[clauserule].rulestart,false) then
     case lexsymbol of
     newline_sy  :begin next; clause(t) end;
     if_sy       :if_clause(t);
     repeat_sy   :repeat_clause;
     while_sy    :while_clause;
     proc_sy     :procedure_clause(proc_sy,n,t,false);
     import_sy   :import_clause(t);
     for_sy      :for_clause;
     case_sy     :case_clause(t);
     abort_sy    :next;
     b_and_sy,b_or_sy,shift_l_sy,shift_r_sy:prefixop(t);
     out_byte_sy,
     output_sy,
     write_sy    :write_clause;
     tab_sy      :tab_clause(t);
     else        expression(t)
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
var t,restype,proctype:typerec;  id:lextoken; n:namedesc;
    n1:idref;
    l,l2:labl;
    name:textline;
begin
     must(procedure_sy);
     name:=currentid(the_buffer);
     id:=symbol;
     must(identifier);
     if (library in options) and (lexical_level =global_level) then begin
        proctype:=void;
        start_external(name);
        n:=newname(id,proctype,static,n1);
        procedure_clause(procedure_sy,n1,scopelist[n]^.typeinfo,true);
        end_external(name);
     end
     else
     begin
          proctype:=void;
          l2:=newlab; l:=newlab;
          form_closure(l2);jumpop(l);plant(l2);
          if lexical_level =global_level then n:=newname(id,proctype,global,n1)
          else n:=newname(id,proctype,local,n1);

          procedure_clause(procedure_sy,n1,scopelist[n]^.typeinfo,false);
          plant(l); release_label(l);
     end;
end;

{$ifndef pretext}
{ -------------------------------------------------------------- }
{          DO_INCLUSION                                          }
{            include <stringlit>                                 }
{ -------------------------------------------------------------- }
procedure do_inclusion;
var name:textline;   t:typerec;
begin
     must(include_sy);
     must(string_lit);name:=the_string;
     if push_buffer then loadtext(the_buffer,name,false)
     else error('Depth of Includes too great');

end;
{$endif}

{ -------------------------------------------------------------- }
{    LET_DECL                                                    }
{    --------  handles let <id> [:]= <clause>                    }
{ -------------------------------------------------------------- }
procedure let_decl;
var t:typerec; id:lextoken;constant:boolean;n:namedesc;
begin
     debug(' let_decl ');
     validateGlobals;
     next;
     id:=symbol;
     must(identifier);
     constant:= got (eq_sy);
     if not constant then must(assign_sy);
     clause(t);
     boolify(t);
     if constant then t:=constantof(t) else t:=variableof(t);
     n:=newid(id,t) ;
end;
{ -------------------------------------------------------------- }
{ CLASS DECL                                                     }
{ __________  Handles declarations of new classes                }
{             syntax:                                            }
{                    class <identifier> is <type0> and <cbody>   }
{ -------------------------------------------------------------- }
procedure class_decl;
var classid:lextoken;representation,self:typerec;
    isconst:boolean;
    ins:insertions;
    { ---------------------------------------------------------- }
    { PREDEFINED                                                 }
    { ---------- check that we got a valid production label     }
    { ---------------------------------------------------------- }
    procedure predefined(var lins:insertions);

    begin
        lins:=findinsertion(lexsymbol);
        if lins=norule then error('rule id expected');
        next;
    end;
    { ---------------------------------------------------------- }
    { LHS                                                        }
    { --- parses the left hand side of a grammer rule            }
    {     <lt_sy> <type0> - <predefinedproduction> <gt_sy>       }
    { ---------------------------------------------------------- }
    procedure lhs(var t:typerec;var ins:insertions);
    begin
       must(lt_sy);
       type0(t);
       must(minus_sy);
       predefined(ins);
       must(gt_sy);
    end;
    { ---------------------------------------------------------- }
    { PATTERN                                                    }
    { -------  an alternation of strings and lhses               }
    { ---------------------------------------------------------- }
    function pattern(var t:typerec):rulerange;
    var s:textline;
        r:rulerange;
        ins:insertions;
    begin
       t:=void;
       skipnl;
       s:=the_string;
       if got(string_lit) then
       begin
             r:=nextrule;
             with rules[r] do begin
                  sort:= compulsory;
                  mustsym:=tokenof(s);
                  tail:=pattern(t);
             end;
             pattern:=r;
       end else
       if lexsymbol=lt_sy then
       begin

             lhs(t,ins);
             r:=nextrule;
             with rules[r] do begin
                  sort:= subrule;
                  prodtype:=t;
                  proc:=ins;
             end;
             pattern:=r;
             if errorfree then rules[r].tail:= pattern(t);
       end
       else pattern:=nullrule;

    end;
    { ---------------------------------------------------------- }
    { PRODUCTION                                                 }
    { ---------- Handles <lhs> is <rhs>                          }
    { ---------------------------------------------------------- }
    procedure production(var prodyields:typerec);
    var ins:insertions;r:rulerange;
        function reduce(r:rulerange):rulerange;
        { this dis ambiguates a grammer }
        var secondhead:rulerange;
        begin
          with rules[r] do
          case sort of
          alternative :begin
                         head:= reduce(head);
                         tail:= reduce(tail);
                         if rules[tail].sort = alternative then
                         begin
                            secondhead:=rules[tail].head;
                            if rules[secondhead].sort <>rules[head].sort
                            then error('ambiguous grammer ')
                         end;
                         reduce:=r;
                       end
          else reduce:=r;
          end;
        end;




    { ---------------------------------------------------------- }
    { RHS                                                        }
    { --- parses the right hand side of a grammer rule           }
    {     <cur> <pattern> <ley> = <identifier                    }
    { ---------------------------------------------------------- }
    function rhs:rulerange;
    var t:typerec;
        meaning:lextoken;
        p:typerec;
        r,q,u:rulerange;
        argv:typearray;
        argc:integer;
    begin
       must(cur_sy);
       u:=nextrule;
       rhs:=u;
       with rules[u] do begin
          head:=pattern(t);
          sort:=binding;
       end;
       must(ley_sy);
       must(eq_sy);
       meaning:=symbol;
       must(identifier);
       if lookup(meaning)>0 then begin
        typeof(meaning,t);
        { t should be the type of a procedure that implements the }
        { sematics of this grammer rule we must check to see if   }
        { the grammer rule put the right types on the stack for   }
        { what the procedure expects                              }
        if not isproc(t) then error('should be procedure');
        r:=nextrule;
        q:=r;
        with rules[r] do begin
                  sort:= semantics;
                  id:=meaning;
                  tail:=nullrule;
             end;
        p:= domainof(t);
        coerce(prodyields,rangeof(t));
        r:=rules[u].head;
        argc:=0;
        while (rules[r].sort in [compulsory,subrule]) and errorfree do begin
          if rules[r].sort = subrule then begin
           argc:=succ(argc);
           argv[argc]:=rules[r].prodtype;
          end;
          r:=rules[r].tail;
        end;
        coerce(mk_cart(false,argv,argc),p);
        rules[u].tail:=q;{ attach semantics to the binding }
       end else error('undeclared procedure');
    end;



    begin  { production }
         skipnl;
         lhs(prodyields,ins);
         must(is_sy);
         r:=nextrule;
         with rules[r] do begin
             sort:=alternative;
             prodtype:=prodyields;
             head:=rhs;
             tail:=  insertion[ins].rulestart;
         end;
         insertion[ins].rulestart:= reduce(r);
    end;
    { ---------------------------------------------------------- }
    { CBODY                                                      }
    { -----  Body of class declaration                           }
    {        <cur> <production> [ or <production>] <ley>         }
    { ---------------------------------------------------------- }
    procedure cbody;
    var t:typerec;
    begin
       skipnl;
       must(cur_sy);
       production(t);
       skipnl;
       while got (or_sy) and errorfree do
       begin production(t);skipnl end;
       must(ley_sy);
    end;
begin
   must(class_sy);
   classid :=symbol;
   must(identifier);
   isconst:=got(eq_sy);
   if not isconst then must(is_sy);
   type0(representation);
   mkalias(self,representation,classid);

   if got(and_sy) then cbody;
end;
{ -------------------------------------------------------------- }
{  STRUCTURE_DECL                                                }
{  -------------- handles structure(<typelist>)                  }
{ -------------------------------------------------------------- }
procedure structure_decl;
var structype:typerec;
var t,stype:typerec; id,struct:lextoken;constant:boolean;
    idnumber,n:namedesc;
    class:textline;
    reals,ints,pntrs,argc:integer;
    argv:typearray;
    n1:idref;
    head,tail:parameterref;
begin
     next;
     struct:=symbol;
     class := currentid(the_buffer);
     must(identifier);
     head:=nil;
     must(brace_sy);
     argc:=0;
          repeat
             type0(t);
             repeat
                   id:=symbol;
                   must( IDENTIFIER);
                   idnumber:=newname(id,t,local,n1);
                   n1^.name_type:=field;
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

                   tail^.paramname:=n1;
                   tail^.next:=nil;
                   argc:=argc+1;
                   argv[argc]:=t;
             until not got(comma_sy);
          until not got(newline_sy);

     must(rbrace_sy);
     structype:=mk_map(true,
                       ord(structure_sy),mk_cart(true,argv,argc),pntr_type);

     fixupstruct(head,pntrs,reals,ints);
     declarestructure(class+ptype(domainof(structype)),
                      pntrs,reals,ints,n);
     n:=newid(struct,structype);
end;
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
begin
     t:=VOID;
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
                 newlineop;
                  match(t,VOID);
                 end;
           end;
           case lexsymbol of
           end_sy,ley_sy,
           newline_sy  : begin end;
           let_sy      :let_decl;
           class_sy    :class_decl;
           {$ifndef pretext}
           include_sy  :do_inclusion;
           {$endif}
           traceon_sy  :begin next;trace:=true;end;
           traceoff_sy :begin next;trace:=false;end;
           liston_sy   :begin next;listprog:=true;end;
           listoff_sy  :begin next;listprog:=false;end;
           structure_sy:structure_decl;
           procedure_sy:procedure_decl;
           else clause (t)
           end;
           statements:=statements+1;
     until (not got(newline_sy)) or(not( errorfree or (batch in options)));
end;
{ -------------------------------------------------------------- }
{    TYPE0                                                       }
{    -----                                                       }
{         handles declaration of base types                      }
{ -------------------------------------------------------------- }
procedure type0 ;
begin
   if istype(symbol)
   then begin  typeof(symbol,t);
               next;
        end
   else if got(star_sy) then begin
           type0(t); t:=vectorise(false,t);
        end
   else if got(dollar_sy) then begin
           type0(t); t:=tableof(t);
        end
   else t:=void;
end;
{ -------------------------------------------------------------- }
{    TYPE1                                                       }
{    -----  handles declaration of procedure types               }
{           when used as procedure parameters                    }
{ -------------------------------------------------------------- }
procedure type1 ;

var restype,
    proctype ,t1    :typerec;
    id              :lextoken;
    oldsp           :namedesc;
    os,
    idnumber,
    resultloc       :namedesc;
    n1              :idref;
    l,l2            :labl;
    argv            :typearray;
    argc            :integer;
    head,tail       :parameterref;
    n               :namedesc;
       procedure get_result;
       begin
            type0(restype);
       end  ;
       procedure voidproc;
       begin
       end;

begin
     argc:=0;
     proctype:=void;restype:=void;
           case lexsymbol of
           proc_sy: begin
                      next;
                      head:=nil;
                      if got(brace_sy) then begin
                       if got (rbrace_sy) then voidproc
                       else begin
                        if not  got (arrow_sy) then begin
                         repeat
                          type1(t1);
                          argc:=argc+1;
                          argv[argc]:=t1;
                         until not got(comma_sy);
                         if got(arrow_sy) then begin
                            get_result;
                         end else voidproc;
                        end
                        else get_result;
                        must(rbrace_sy);
                       end;
                      end else voidproc;
                      proctype:=mk_map(false,ord(proc_sy),
                                       mk_cart(false,argv,argc),restype);

                      t:=proctype;

             end;
          { structure_sy:structure_decl; }
           else type0(t)
           end;
end;
{ -------------------------------------------------------------- }
{ EXTENSIONS                                                     }
{      handle dynamic syntax extensions                          }
{ -------------------------------------------------------------- }

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
                    conwritetype(t);
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
                 if symbol = mustsym then begin
                    next;
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
     incompiler:=true;
     mark(p);
     initlexanal;initsymtab;
     enterscope(scope);
     toprule:=0;
     statements:=0;
     defineinsertions;
     if library in options then options := options - [library];
     segment:='_text';class:='code';
     next;
     if got (segment_sy) then options := options +[library];
     if library in options then lib(segment);
     init_cgen(segment,class);
     if not( library in options )then
     begin
          start_program;
          std_decls;
               sequence(t);
          end_program(segment);
          end
     else begin
          start_library;
          std_decls;

          sequence(t);
          end_library(segment);
          end;
     match(VOID,t);
     must(question_sy);
     exitblock(scope,VOID);

     finalise_cgen;
     release(p);
     incompiler:=false;
end;
begin

end.