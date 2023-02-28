{$O+}{$F+}{$r-
   PASCAL  SYNTAX ANALYSIS

----------------------------------------------------------------
Module      : PAsyn
Used in     : Compiler toolbox
Author      : W P Cockshott
Date        : 15 Oct 1986
Version     : 2
Function    : To parse pascal programs
Changes     : derived from file sasyn.cmp on 9-2-89
            : derived from file sasyn.pas starting november 89
Copyright (C) WP Cockshott & P Balch
Conditional compilation flags
   synext   : supports dynamic syntax extensions
   persistent: persistent pascal extenstions
----------------------------------------------------------------}
{$s+}
  UNIT PASYN ;
INTERFACE USES
  {overlay, }
  bufdecls,
  errors,
   lists, ilcp,
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
  stacks
  {pretty,}


{$ifdef synext}
 , synext
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

const calloverhead = 16 ; { the minimum extra space on the stack after
                            the params have been pushed and before the
                            return address made up of
                            16 bytes of procedure closure}
      sloffset     = 20 ; { offset from bp to static link }
      closureoffset= 12 ; { offset from bp to closure }

var list:boolean;  unitname:textline;
    bp:pilcgnode;
procedure synver;
begin
     writeln ('Vector Pascal Syntax analyser in Pascal, version 1.0');

end;
type symcell = object(cell)
               lex:lextoken ;
               constructor newsym(l:lextoken);
               destructor destroy;virtual;
               end;
     symcellp=^symcell;

constructor symcell.newsym;begin cell.newcell;lex:=l end;
destructor  symcell.destroy;begin cell.destroy end;

type
 stackcellp= ^stackcell;
    stackcell = object(cell)
                  thenode:pilcgnode;

                  procedure show(var listing:text);virtual;
                  constructor newstackcell(p:pilcgnode);

                  function toilcg:pilcgnode;
                end;
var sm:^stack;
procedure push(p:pilcgnode);
var c:stackcellp;
begin
     new( c,newstackcell(p));
     sm^.push(c);
end;
function ppop:pilcgnode;
 var c:cellpntr;
begin
     if not sm^.pop(c)then error('stack underflow');
     ppop:=stackcellp(c)^.thenode;
     dispose(c);
end;
procedure stackcell.show;
begin
    printtree(thenode,listing);
    writeln(listing);
end;
function stackcell.toilcg:pilcgnode;
var p:pilcgnode;
begin
          p:=(thenode);
        if verbose then begin
        write(' converted to ');
        printtree(p,output);     writeln;
        end;
        toilcg:=p

end;

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
PROCEDURE     EXPRESSION(VAR t:TYPEREC); FORWARD;
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
      if  syndebug then begin writeln(listfile,s) end;
end;
procedure writetype(var t:typerec); var s:textline;
begin
     if syndebug then begin s:=ptype(t);writeln(listfile,'<',s,'>');flush(listfile)  end;
end;
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

{------------------------- STD_PROC ---------------------------------}
procedure std_proc(var t:typerec);
var sym:lexeme;
begin
     sym:=lexsymbol;
     case lexsymbol of
     ord_sy: begin next_symbol(the_buffer);expression(t);t:=int_type;end;
     chr_sy: begin next_symbol(the_buffer);expression(t);coerce(t,int_type);t:=char_type;end;
 {    b_and_sy,b_or_sy,
     shift_l_sy,shift_r_sy:prefixop(t);
     read_sy,readi_sy,readr_sy,readb_sy,
     reads_sy,peek_sy,read_a_line_sy,readp_sy,
     read_byte_sy:begin
                              next_symbol(the_buffer);
                              must(brace_sy);
                              if not got(rbrace_sy) then begin
                                 expression(t);match(t,file_type);
                                 must(rbrace_sy);
                              end else
                              begin
                              end;
                         end;
     lwb_sy,upb_sy :begin
              next_symbol(the_buffer);
              must(brace_sy);
              expression(t);
              must(rbrace_sy);
              if not isvector(t) then
                    error('vector expected');
              t:=int_type;
           end;   }
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
               if n= nulid then
                  errormsg('Undeclared variable <'+psym(sym)+'>',the_buffer);
               checkid := n
          end;

    procedure checkvar(t:typerec);
    begin
       if not isvariable(t) then error('not a variable:'+ptype(t));
    end;

procedure load_addr(n: namedesc);
{ load the address of variable n onto the symbolic stack }
var lexdiff:integer;p:pilcgnode;
begin
    with scopelist[n] ^ do
      begin
          if name_type=constant then begin
                 push(lab)
                 end else

                  begin { other }
                    { compute how far down the static chain to
                      chase
                    }
                    lexdiff:=lexical_level - lex_level ;
                    push(bp);
                    while lexdiff >0 do begin
                        { stack top now holds start of a frame }
                        push(new_intlit(sloffset,fint));
                        p:=new_deref(new_memref(new_dyad(ppop,'+',ppop),faddr));
                        { top of stack now holds address of static link }
                       push(p);
                       { the static link itself is now on top of stack }
                       lexdiff:=lexdiff-1;
                    end;
                    { top of stack now holds the base of the
                      frame containing the variable
                      Add the offset to it to find the address
                      of the variable
                    }
                    push(new_dyad(ppop,'+',new_intlit(offset,fint)));
                  end;
        end;
   end;

procedure loadindir(t:typerec);
begin
push(new_deref( new_memref(ppop,type2format(t)));
end;

procedure lvalue(var t:typerec;n:namedesc);
var finished:boolean;
    t1,t0:typerec;
    size:integer;
    f:namedesc;
begin
     typeof(symbol,t0);
     writetype(t0);debug('identifier');
     load_addr(n);
     t:=addressof(t0);
     writetype(t);
     if isvarparam(t0)then loadindir(t);

     finished:=false;
     next_symbol(the_buffer);
     repeat
        { t0:=rangeof(t);  }

         case lexsymbol of
         up_arrow_sy:begin loadindir(t); next_symbol(the_buffer) end;
         dot_sy:begin
                      next_symbol(the_buffer);
                      typeof(symbol,t);
                      f:=checkid(symbol);
                      if not isfield(f) then error('field expected');
                      addoffset(f);
                      t:=addressof(t);
                      must(identifier);
                 end;
         bra_sy:begin
                              next_symbol(the_buffer);
                              write(listfile, 't');writetype(t);
                              if not isvector(rangeof(t) ) then
                                 error('Not an array');
                              { it is assumed that array variables
                                hold  arrays not pointers to them
                                as in algol}
                              { pointer to array now on stack }
                              expression(t1);
                              coerce(t1,int_type);

                              t:=rangeof(t);
                              write(listfile,'after rangeof t=');writetype(t);
                              t:=addressof(rangeof(t));
                              
                              write(listfile,'after addressof rangeof t=');writetype(t);
                              size:=stackspace(t);
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
             if isvarparam (argv[i]) then
             begin lvalue(t,checkid(symbol));
                   match(t,{pointerto(rangeof(}argv[i]{))})
             end
             else begin
                  expression(t);
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
    node:pilcgnode;
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

                   if isproc(t) then begin
                      matchandcall(t)
                    end
                    else begin
                         n:=checkid(symbol);
                         if iscompiletimeliteral(n) then
                         begin
                              getconst(symbol,node,t);
                              next_symbol(the_buffer);
                              ll_node(node);
                         end
                         else begin
                              lvalue(t,n);loadindir(t)
                              end;
                         end;
                 end;
   brace_sy    : begin next_symbol(the_buffer);expression(t);must(RBRACE_sy);end;
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
    {$ifdef synext}m:matchtype;{$endif}
begin
     debug(' exp4 ');
     adop:=noadop;
     if got(plus_sy) then adop:=plus;
     if got(minus_sy) then adop:=minus;
     {$ifdef synext}
     m:=extensions(t,insertion[exp4rule].rulestart,false);
     if m= none then{$endif} exp5(t);
     {$ifdef synext}
     if m<>total then {$endif}begin
     sym:=lexsymbol;
     if adop= minus then {negop(t)};
     continue:=true;
     if adop<>noadop then if not eq(t,int_type) then  match(t,real_type);
     repeat
           sym:=lexsymbol;
           case lexsymbol of
           star_sy        : begin
                                 next_symbol(the_buffer);exp5(t1);
                                 balance(t,t1);
                                 binaryop(star_sy,t);
                                 end  ;
           slash_sy       : begin
                                 next_symbol(the_buffer);
                                 balance(real_type,t);
                                 exp5(t1);
                                 balance(real_type,t1);
                                 binaryop(slash_sy,t);
                                 end   ;
           div_sy,rem_sy  : begin
                                 next_symbol(the_buffer);
                                 coerce(t,int_type);
                                 exp5(t1);
                                 coerce(int_type,t1);
                                 binaryop(sym,t);
                                 end    ;
           dplus_sy       : begin
                                 next_symbol(the_buffer);
                                 exp5(t1);
                                 match(t,t1);
                                 binaryop(sym,t);
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
var t1:typerec; sym:lexeme;{$ifdef synext} m:matchtype;{$endif}
begin
     debug(' exp3 ');
     {$ifdef synext}
     m:=extensions(t,insertion[exp3rule].rulestart,false);
     if m= none then{$endif} exp4 (t);
     sym:=lexsymbol;
     {$ifdef synext}
     if m<>total then{$endif}
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
var neg:boolean;t1:typerec; sym:lexeme;{$ifdef synext}m:matchtype;{$endif}
begin

   debug(' exp2 ');
   neg:=got(TILDE_SY);
   {$ifdef synext}
   m:=extensions(t,insertion[exp2rule].rulestart,false);

   if m= none then{$endif} exp3 (t);
   if neg then begin match(t,bool_type); end;
   sym:=lexsymbol;
   {$ifdef synext}
   if m<>total then {$endif}
   case lexsymbol of
   {$ifndef ispascal}
   is_sy,isnt_sy  :
         begin
             match(t,pntr_type);
             next_symbol(the_buffer);
             exp3(t);
             match(t,structure_type) ;

             binaryop(sym,t);
             t:=condition_type;
         end;
    {$endif}
   eq_sy,neq_sy,ge_sy,gt_sy,le_sy,lt_sy:
         begin
              next_symbol(the_buffer);
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
var ok,fail,l2, part2:labl;{$ifdef synext}m:matchtype;{$endif}
begin
     debug(' exp 1 ');
     {$ifdef synext}
     m:=extensions(t,insertion[exp1rule].rulestart,false);
     if m= none then{$endif} exp2 (t);
     {$ifdef synext}
     if m<>total then{$endif}
     if got(AND_SY) then
     begin
          condify(t)   ;
          fail:=newlab;
          jumpf(fail);
          exp1(t); condify(t);ok:=newlab;jumpt(ok);
          plant(fail); ll_int(falseval);l2:=newlab;jumpop(l2);  { the and has failed }
          forget(int_size);               { we only return a single value }
          plant(ok);ll_int(trueval);plant(l2); { the and has succeded }
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
    {$ifdef synext}
    m:matchtype;   {$endif}
begin
     debug(' expression ');
     sym := lexsymbol;
     {$ifdef synext}
     m:=extensions(t,insertion[expressionrule].rulestart,false);
     if m= none then{$endif}
     exp1 (t);
     {$ifdef synext}
     if m<>total then {$endif}
     if  got(OR_SY) then
     begin


         condify(t);
         ok:=newlab;fail:=newlab;ok2:=newlab;
         jumpf(ok2);jumpop(ok);plant (ok2);
         expression(t);condify(t);jumpt(ok);
         ll_int(falseval); jumpop(fail);
         forget(int_size);               { we only return a single value }
         plant(ok);ll_int(trueval);
         plant(fail);
         t:=bool_type;


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
            expression (t1);
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
     expression(t);
     condify(t);
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
procedure io_clause;
var t:typerec;   oldsp:integer;sym:lexeme;mbrace:boolean;
    i:integer;
begin
     sym:=lexsymbol;
     must(sym);
     if got(brace_sy) then begin
       I:=0;
       repeat
           expression (t); boolify(t);i:=i+1;
           if got (colon_sy) then expression(t) else
           begin
              the_integer:=0;
           end;
       until not got(comma_sy);
       must(rbrace_sy);
       while i>1 do begin
          i:=i-1;
       end;
       { this will now be the final writeln statement }

       if sym<>write_sy then begin
       end;

     end;

end;
{ -------------------------------------------------------------- }

{ -------------------------------------------------------------- }
procedure for_clause;
var t,t1,t2:typerec;l1,l2:labl;id:lextoken;
    i,start,limit,step,os:namedesc;

    complex:boolean;
begin
     enterscope(os);
     l1:=newlab;l2:=newlab;
     next_symbol(the_buffer);
     id:=symbol;
     i:=checkid(id);
     load_addr(i);
     must(identifier);
     must(assign_sy);

     expression(t);
     typeof(id,t1);
     t2:=addressof(t1);
     match(t,t1);
     t1:=t2;
     assindir(t1);
     must(to_sy);
     expression(t);coerce(t,t1);
     plant(l1);
     limit:=newid(ord(to_sy),int_type,false);

     must(do_sy);
     load(i);load(limit);binaryop(le_sy,int_type);
     jumpf(l2);
     clause(t);match(t,VOID);
     load_addr(i);
     load(i);ll_int(1);binaryop(plus_sy,int_type);
     t1:=t2;
     assindir(t1);
     jumpop(l1);plant(l2);
     exitblock(os,VOID);
     dispose(t2);
end;


{ -------------------------------------------------------------- }
procedure repeat_clause;
var t:typerec;
    l1,l2,l3:labl;
begin
     l1:=newlab;l2:=newlab;l3:=newlab;
     next_symbol(the_buffer);
     plant(l1);
     sequence(t); match(t,VOID);
     if got(while_sy) then begin
        expression (t); condify(t);
        jumpt(l3);jumpop(l2);plant(l3);
        if got (do_sy) then
        begin clause(t); match(t,VOID); end;
     end else begin
          must(until_sy);
          expression(t);condify(t);
          jumpt(l2);
     end;
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
     must(while_sy); expression (t); condify(t); jumpt(l3);jumpop(l2);
     plant(l3);
     if got (do_sy) then
     begin clause(t); match(t,VOID); end;
     jumpop(l1);plant(l2);
end;


{ -------------------------------------------------------------- }
procedure case_clause (var t:typerec);
var t1,t2:typerec; first:boolean; l1,l2,l3:labl;os,n:namedesc;
begin
   enterscope(os);
   next_symbol(the_buffer);
   clause(t1);
   n:=newid(tokenof('..cv'),t1,false);
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
         forget(sizeof(t)) ;
         t2:=t; first:=false;
            
         jumpop(l3);  plant(l2);
   end;
   must(colon_sy); clause(t); match(t,t2);plant(l3);
   exitblock(os,t2);
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
                        incodeseg:boolean; var litval:pilcgnode) ;
  var j,k:longint;
      reallitval:double;
      mult:integer;
      s1,s2:string;
      temp:record
      case c:char of
      'i':(i:integer;);
      'r':(r:real;);
      end;
  begin
   mult:=1;
   if got(minus_sy) then mult:=-1;
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
                       k:=the_integer*mult;
                       if incodeseg then begin
                          j:=newconst(id,t);
                          defconst(j,k);
                          getconst(id,litval,t);
                       end  else
                       litval:=int2ilcg(k);
                       next_symbol(the_buffer)
                  end;

   REAL_LIT     : begin t:=(real_type);
                       reallitval:=the_real*mult;
                       if incodeseg then begin
                          j:=newconst(id,t);
                          defilcgconst(j,new_reallit(the_real,fieee64));
                          getconst(id,litval,t);
                       end  ;
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
                          getconst(id,litval,t);
                       end else litval:=new_intlit(trueval,fint);
                       next_symbol(the_buffer);
                 end;
   FALSE_SY    : begin t:=(bool_type);
                       if incodeseg then begin
                          j:=newconst(id,t);  defconst(j,falseval);
                          getconst(id,litval,t);
                       end else litval:=new_intlit(falseval,fint);
                       next_symbol(the_buffer);
                 end;
   else errormsg('Literal expected',the_buffer);
   end;
  end;
{ -------------------------------------------------------- }
{   FIELDLIST                                              }
{ -------------------------------------------------------- }
procedure fieldlist(start:integer;var t:typerec);
var
    argv            : typearray;
    argc            : integer;
    n1              : idref;
    c1,c2,offs      : integer;
    idnumber,
    n               : namedesc;
    id              : lextoken;
    names           : array[1..20]of lextoken;
    namenum,namec   : 0..20;
    selector        : typerec;
    label     39 ;
        procedure caseheader(var t:typerec);
        var nom:lextoken;
              begin
                   nom:=symbol;
                   if got(identifier) then begin
                    if got(colon_sy) then begin
                      type1(t);
                      fieldoffset:=offs;
                      idnumber:=newname(nom,t,field,n1);
                      offs:=fieldoffset;
                      argc:=argc+1;argv[argc]:=t;
                    end else typeof(nom,t);
                   end else type1(t);
                   must(of_sy);
              end;

   procedure variantpart (var t:typerec); { handle the case part of a record }
   var   argv            : typearray;
         argc            : integer;
         procedure variant;
                  procedure caselabellist;
                  var t1:typerec; i:pilcgnode; r:double;
                  begin
                       literal(t1,0,false, i);
                       match(t1,selector);
                       if got(comma_sy) then caselabellist;
                  end;
         begin
                   caselabellist;must(colon_sy);
                   argc:=argc+1;
                   must(brace_sy);fieldlist(offs,argv[argc]);
                   must(rbrace_sy);
         end;
    begin
         caseheader(selector);
         argc:=0;
         repeat variant until not got(semicolon_sy) ;
         t:=mk_union(false,argv,argc);
    end;

    begin
          offs:=start; argc:=0;
          repeat
             namenum:=0;
             repeat
                namenum:=succ(namenum);
                if lexsymbol=(end_sy) then goto 39;
                if got(case_sy) then begin
                   variantpart(t);
                   argc:=argc+1;argv[argc]:=t;
                   goto 39;
                end;
                names[namenum]:=symbol;
                must(identifier);
             until not got(comma_sy) or( namenum=19);

             must(colon_sy);  type1(t);
             for namec:=1 to namenum do begin
                   fieldoffset:=offs;
                   idnumber:=newname(names[namec],t,field,n1);
                   offs:=fieldoffset;
                   argc:=argc+1;  argv[argc]:=t;
             end;
          until not got(semicolon_sy);

        39:t:=mk_cart(false,argv,argc);
     end;


{ -------------------------------------------------------------- }
{   RECOGNISES                                                   }
{      tab                                                       }
{          clause : clause                                       }
{          clause : clause                                       }
{          ....                                                  }
{      end                                                       }
{ -------------------------------------------------------------- }
{$ifndef ispascal}
procedure tab_clause (var t:typerec);
var t1,t2:typerec;
    pairs:integer;os,n:namedesc;
    procedure singleval;
    begin
         must(colon_sy);
         expression(t);
         match(t1,t);
   end;
begin
   next_symbol(the_buffer);
   type1(t1);
   must(of_sy);
   pairs:=0;
      
   while not got(default_sy) and errorfree do begin
         expression (t);match(t,string_type);
         singleval;
         pairs:=pairs+1;
            
   end;
   { all pairs now on the stack }
   singleval;
   { default on the stack }
   { empty table on the stack }
   while errorfree and( pairs>0) do begin
         pairs:=pairs-1;
   end;
   { initialised table on the stack }
   t:=tableof(t1);

end;
{$endif}
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
{ -------------------------------------------------------------- }
procedure constlist;
var id:lextoken;J:integer;r:double;
    t: typerec;l:labl;
begin
      l:=newlab;jumpop(l);
      while lexsymbol=identifier do begin
        id:=symbol;must(identifier);
        must(eq_sy);
        expression(t);{literal(t,id,true,j,r);       }
        defilcgconst(newconst(id,t),popIlcg);
        must(semicolon_sy);
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
      if got(var_sy) then varlist else
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
    procname        :textline;
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
          repeat
             vars:=got(var_sy);
             namenum:=0;
             repeat
                namenum:=succ(namenum);
                names[namenum]:=symbol;
                must(identifier);
             until not got(comma_sy) or( namenum=19);
             if not vars then begin
                must(colon_sy);
                type1(t);
             end
             else
             begin
                  if got(colon_sy) then type1(t)
                  else t:=void
             end;
             if vars then t:=addressof(t);
             for namec:=1 to namenum do begin
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
          until not got(semicolon_sy);
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
          a jump to the start of the real procedure }
        procname:=name;
        if got(external_sy) then
        begin
        if got (name_sy) then
        begin
              must(string_lit);
              procname:=the_string;
        end;
        must (semicolon_sy);aliencall(procname)
        end
        else
        aliencall(   unitname + name );


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
    c1,c2           : longint;
    r               : real;
    n1,n2           : pilcgnode;
begin
   if istype(symbol)
   then begin  typeof(symbol,t);

   {$ifdef debug}
     writeln('type1 ',psym(symbol),'=',ptype(t));
   {$endif}
               next_symbol(the_buffer);
        end
   else if got(array_sy) then begin
        must(bra_sy);
        type1(t1);
        must(ket_sy);
        must(of_sy);
        type1(t2);
        t:=vectorise(false,t1,t2);
   end
   else if got(record_sy) then begin
         fieldlist(0,t);            must(end_sy);
   end
   else if got(set_sy) then begin
        must(of_sy);type1(t1);
        t:=mk_set(false,t1);
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
   else if got(up_arrow_sy) then begin
           type1(t); t:=pointerto(t);
        end
   else if got(string_sy) then begin
           if got(bra_sy) then begin
              literal(t1,ord(undefined),false,n2);
              must(ket_sy);
              match(t1,int_type);
              c2:=get_intValue(N2);
           end else  c2:=255;
           t2:=mk_range(0,c2);
           t:=vectorise(false,t2,char_type);
        end
   else { it should be a subrange }
       begin
            literal(t1,ord(undefined),false,n1);
            must(ddot_sy);
            literal(t2,ord(undefined),false,n2);
            match(t1,t2);

            c1:=get_intValue(n1);
            c2:=get_intValue(n2);
            t:=mk_range(c1,c2);
       end;
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

     must(segment_sy);
     clause(t2);
     match(t2,string_type);
     bindop;
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
     repeat_sy   :repeat_clause;
     while_sy    :while_clause;
     function_sy     :procedure_clause('NONAME',function_sy,n,t,[]);
     import_sy   :import_clause(t);
     for_sy      :for_clause;
     case_sy     :case_clause(t);
     abort_sy    :next_symbol(the_buffer);
     read_sy,
     readln_sy,
     writeln_sy,
     write_sy    :io_clause;{$ifndef ispascal}
     tab_sy      :tab_clause(t);{$endif}
     identifier  :begin
                      assignmentorproc;t:=void;
                 end;
     else errormsg('Statement expected',the_buffer);
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
        if mklibrary in options then error('no let decls in segment');

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
procedure do_unit;forward;
{ ------------------------------------------------------------------ }
{  loadunit                                                          }
{ load and compile a unit given its name                             }
{ ------------------------------------------------------------------ }
procedure loadunit(name:textline);
var       t:typerec;b:textbuffer;
    lex:lexeme;
    oldname:textline;
begin
     oldname:=unitname;
     unitname:=name;
     b:=the_buffer;
     if openbuffer(the_buffer,name,(name+'.pas'),{list,} pascallanguage) then
     begin
          lex:=lexsymbol;
          next_symbol(the_buffer);
          must(segment_sy);
          must(identifier);must(semicolon_sy);
          must(interface_sy);
          if got(uses_sy) then
          begin
                repeat
                     do_unit
                until not got(comma_sy);
                must(semicolon_sy);
          end;
          decls([procs_allowed,uselist,vars_allowed]);
          must(implementation_sy);
          debug('implementation');
           freebuffer(the_buffer);
          lexsymbol:=lex;
     end else error('can not open '+name+'.p');
     the_buffer:=b;
     unitname:=oldname;
end;

procedure do_unit;
var name:textline;
begin
     name:=currentid(the_buffer);
     debug(name);
     must(identifier);
     loadunit(name);
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
           liston_sy   :begin next_symbol(the_buffer);list:=true;end;
           listoff_sy  :begin next_symbol(the_buffer);list:=false;end;
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
     new(sm,newstack);
     bp:=new_register(fp);
     list:=false;
     {$ifdef debug}list:=true;{$endif}
   {  incompiler:=true;trace:=true;    }
    { mark(p); }
     symbols.newstack;
     initlexanal;
     initsymtab;
     enterscope(scope);
     statements:=0;
     {$ifdef synext}toprule:=0;
     defineinsertions;{$endif}
     if mklibrary in options then options := options - [mklibrary];
     the_buffer.list:=true;
     next_symbol(the_buffer);
     if got (segment_sy) then options := options +[mklibrary];
     init_cgen(segment,classof);
     if not( mklibrary in options )then
     begin

          start_program;
          std_decls;
          loadunit('system');
          if got(program_sy) then begin
             must(identifier);
             if got(brace_sy) then begin
                must(identifier);
                if got(comma_sy) then begin
                must(identifier);
                end;
                must(rbrace_sy);
             end;
             must(semicolon_sy);
          end;


               decls([vars_allowed,procs_allowed]);
               must(begin_sy);
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
          if got(uses_sy) then
          begin
            repeat
              do_unit
            until not got(comma_sy);
            must(semicolon_sy);
          end;
          decls([procs_allowed,interfacepart,vars_allowed]);
          must(implementation_sy);
          decls([procs_allowed,implementationpart,vars_allowed]);
          must(begin_sy);
          start_libmain;
          sequence(t);
          must(end_sy); must(dot_sy);
          exitblock(scope,VOID);
          end_library(segment);
          end;
     match(VOID,t);

     finalise_cgen;
    { release(p);   }

end;

end.