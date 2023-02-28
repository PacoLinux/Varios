{$r-
   COMPILER BUILDER

----------------------------------------------------------------
Module      : BUILDER
Used in     : Compiler toolbox
Uses        : dlb.cmp, sasym.cmp
Author      : W P Cockshott
Date        : 15 sept  1986
Version     : 1
Function    : To build the definition files for a compiler
Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------}
{$s+}
UNIT builder;
INTERFACE USES
  editdecl,
  errors,fsm,
  reader,
  dlb,
  IDTYPES,
  symtab,extend;

{


}

PROCEDURE PROG;
PROCEDURE synVER;
IMPLEMENTATION
const
   version='{Compiler builder version 1 }';
procedure synver;
begin
     writeln (version);

end;


const syndebug = false;



type

    lineptr=^line;
    procedurerec= record
                  id:idref;
                  end;

    opparmtype=(byteparam,wordparam,bytelabel,wordlabel);
    opcoderec= record
               id:idref;
               p1,p2:opparmtype;
               paramcount:0..2;
               lines:lineptr;
               end;
    basetyperec =record
                id:idref;
                onstack,onheap:byte;
                end;
    line=record
               s:textline;
               nextline:lineptr;
               end;
    predefrange=1..200;

var
     pcount,ocount,bcount:predefrange;
     procs:array[predefrange] of procedurerec;
     opcodes:array[predefrange] of opcoderec;
     bases:array[predefrange]of basetyperec;
     byteparam_sy,wordparam_sy,bytelabel_sy,wordlabel_sy:lextoken;

procedure appendproc(p:procedurerec);
begin
     procs[pcount]:=p;
     pcount:=succ(pcount);
end;

procedure appendopcode(p:opcoderec)  ;
begin
     opcodes[ocount]:=p;
     ocount:=succ(ocount);
end;

procedure appendbasetype(p:basetyperec);
begin
     bases[bcount]:=p;
     bcount:=succ(bcount);
end;

procedure intialisecounts;
begin
     ocount:=1;pcount:=1;bcount:=1;
     byteparam_sy:=tokenof('byte');
     wordparam_sy:=tokenof('word');
     bytelabel_sy:=tokenof('bytelabel');
     wordlabel_sy:=tokenof('wordlabel');
end;
{ -------------------------------------------------------------- }
{          FORWARD DECLARATIONS FOR RECURSIVE PRODUCTIONS        }
{ -------------------------------------------------------------- }
PROCEDURE     SEQUENCE(VAR t:TYPEREC);   FORWARD;
PROCEDURE     TYPE1(VAR t:TYPEREC);                 FORWARD;
PROCEDURE     TYPE0(VAR t:TYPEREC);                 FORWARD;
{ -------------------------------------------------------------- }
{         SKIP NEWLINES                                          }
{ -------------------------------------------------------------- }
procedure skipnl;begin if have(newline_sy) then skipnl end;
{ -------------------------------------------------------------- }
{         MAIN PARSING PROCEDURES ONE PER GRAMMER RULE           }
{ -------------------------------------------------------------- }
procedure debug( s:textline);
begin if trace then begin writeln(listfile,s) end; end;
procedure conwritetype(var t:typerec); var s:textline;
begin  if trace then begin s:=ptype(t);write(listfile,s)  end;end;

{ -------------------------------------------------------------- }
function newid(id:lextoken; t:typerec):namedesc;
var i:idref;
begin
 if lexical_level = global_level then newid:=newname(id,t,global,i)
     else newid:=newname(id,t,local,i);
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
    id              :lextoken;
    oldsp           :integer;
    idnumber,
    resultloc,
    oldscope        :namedesc;
    n1              :idref;
    n               :namedesc;
       procedure get_result;
       begin
            type0(restype);
            resultloc:=newname(ord(undefined),restype,param,n1);
            setresult(proctype,n1);
       end  ;
       procedure voidproc;
       begin
                      resultloc:=newname(ord(undefined),restype,param,n1);
                      setresult(proctype,n1);
       end;
begin
     if procclass = proc_sy then mustbe(proc_sy);
     proctype:=void;restype:=void;proctype.typeid:=procedure_sy;
     proctype.aliasid:=ord(procedure_sy);
     if not extern then
     if procclass = proc_sy then begin
     end;
     if have(brace_sy) then begin
       { Declare the Parameters }
       if   have (rbrace_sy) then voidproc else begin
        if   have (arrow_sy) then get_result
        else begin
          repeat
             type1(t);
             repeat
                   id:=symbol;
                   mustbe( IDENTIFIER);
                   idnumber:=newname(id,t,param,n1);
                   appendparam(proctype,n1);
             until not have(comma_sy);
          until not have(newline_sy);
          if have(arrow_sy) then   { put the result on the list }
             get_result
          else voidproc;
        end;
        mustbe(rbrace_sy);
       end;
     end else voidproc;
     fixup_params(proctype);    { assign addresses to the params }
     { plant type check info }

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
    name:textline;
    p:procedurerec;
begin
     mustbe(procedure_sy);
     name:=currentid;
     id:=symbol;
     mustbe(identifier);
     begin
          proctype:=void;
          if lexical_level =global_level then n:=newname(id,proctype,global,n1)
          else n:=newname(id,proctype,local,n1);

          procedure_clause(procedure_sy,n1,scopelist[n]^.typeinfo,false);
     end;
     p.id:=n1;
     appendproc(p);
end;


{ -------------------------------------------------------------- }
{    OPCODE_DECL                                                 }
{    --------------                                              }
{                  handles
{          opcode <cur>p1[,p2]{ley><procheading> declarations    }
{ -------------------------------------------------------------- }
procedure opcode_decl;
var t,restype,proctype:typerec;  id:lextoken; n:namedesc;
    n1:idref;
    name:textline;
    o:opcoderec;
    procedure parm(var o:opcoderec);
    var p:opparmtype;
    begin
     with o do
     begin
        if symbol=byteparam_sy then    p:=byteparam else
        if symbol=wordparam_sy then    p:=wordparam else
        if symbol=bytelabel_sy then    p:=bytelabel else
        if symbol=wordlabel_sy then    p:=wordlabel else
        error('unknown operand type');
        paramcount:=paramcount+1;
        case paramcount of
        1:p1:=p;
        2:p2:=p;
        end;
        mustbe(identifier);
     end;
    end;
    procedure assemcode(var l:lineptr);
    var st:textline;
    begin
       skipnl;
       st:=the_string;
       if have(string_lit) then
       begin
            new(l);
            l^.s:=st;
            assemcode(l^.nextline);
       end else l:=nil;
    end;

begin
     o.paramcount:=0;
     mustbe(opcode_sy);
     name:=currentid;
     id:=symbol;
     mustbe(identifier);
     if have(cur_sy) then begin
       parm(o);
       if have(comma_sy) then parm(o);
     end;
     mustbe(ley_sy);

          proctype:=void;
          if lexical_level =global_level then n:=newname(id,proctype,global,n1)
          else n:=newname(id,proctype,local,n1);

          procedure_clause(procedure_sy,n1,scopelist[n]^.typeinfo,false);


     o.id:=n1;
     mustbe(begin_sy);
     assemcode(o.lines);
     mustbe(end_sy);
     appendopcode(o);
end;

{ -------------------------------------------------------------- }
{    BASETYPE_DECL                                               }
{    --------------                                              }
{                  handles
{                  BASETYPE <identifier>=<intlit>,<intlit>       }
{ -------------------------------------------------------------- }
procedure basetype_decl;
var t,restype,proctype:typerec;  id:lextoken; n:namedesc;
    n1:idref;
    name:textline;
    b:basetyperec;
begin
     mustbe(opcode_sy);
     name:=currentid;
     id:=symbol;
     mkalias(proctype,void,id,false);
     n:=newname(id,proctype,local,b.id);

     mustbe(identifier);
     mustbe(eq_sy);
     b.onstack:=the_integer;
     mustbe(int_lit);
     mustbe(comma_sy);
     b.onheap:=the_integer;
     appendbasetype(b);
end;

{ -------------------------------------------------------------- }
{          DO_INCLUSION                                          }
{            include <stringlit>                                 }
{ -------------------------------------------------------------- }
procedure do_inclusion;
var name:textline;   t:typerec;
begin
     mustbe(include_sy);
     mustbe(string_lit);name:=the_string;
     if push_buffer then loadtext(the_buffer,name,false)
     else error('Depth of Includes too great');

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
    { ---------- check that we have a valid production label     }
    { ---------------------------------------------------------- }
    procedure predefined(var lins:insertions);

    begin
        lins:=findinsertion(symbol);
        if lins=norule then error('rule id expected');
        next_symbol;
    end;
    { ---------------------------------------------------------- }
    { LHS                                                        }
    { --- parses the left hand side of a grammer rule            }
    {     <lt_sy> <type0> - <predefinedproduction> <gt_sy>       }
    { ---------------------------------------------------------- }
    procedure lhs(var t:typerec;var ins:insertions);
    begin
       mustbe(lt_sy);
       type0(t);

       mustbe(minus_sy);
       predefined(ins);
       mustbe(gt_sy);
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
       if have(string_lit) then
       begin
             r:=nextrule;
             with rules[r] do begin
                  sort:= compulsory;
                  mustbesym:=tokenof(s);
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
        p:domainref;
        r,q,u:rulerange;
    begin
       mustbe(cur_sy);
       u:=nextrule;
       rhs:=u;
       with rules[u] do begin
          head:=pattern(t);
          sort:=binding;
       end;
       mustbe(ley_sy);
       mustbe(eq_sy);
       meaning:=symbol;
       mustbe(identifier);
       if lookup(meaning)>0 then begin
        typeof(meaning,t);
        { t should be the type of a procedure that implements the }
        { sematics of this grammer rule we must check to see if   }
        { the grammer rule put the right types on the stack for   }
        { what the procedure expects                              }
        if t.typeid <> procedure_sy then error('should be procedure');
        r:=nextrule;
        q:=r;
        with rules[r] do begin
                  sort:= semantics;
                  id:=meaning;
                  tail:=nullrule;
             end;
        p:=t.domain;
        coerce(prodyields,t.range^.typeinfo);
        r:=rules[u].head;
        while (p <> nil) and errorfree do begin
          while rules[r].sort = compulsory do
          begin
                r:=rules[r].tail;
          end;
          if rules[r].sort<>subrule then begin
             error('wrong number of arguments')
          end
          else begin

               coerce(rules[r].prodtype,p^.paramname^.typeinfo);
               p:= p^.next;
               r:=rules[r].tail;
          end;

        end;
        rules[u].tail:=q;{ attach semantics to the binding }
       end else error('undeclared procedure');
    end;



    begin  { production }
         skipnl;
         lhs(prodyields,ins);
         mustbe(is_sy);
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
       mustbe(cur_sy);
       production(t);
       skipnl;
       while have (or_sy) and errorfree do
       begin production(t);skipnl end;
       mustbe(ley_sy);
    end;
begin
   mustbe(class_sy);
   classid :=symbol;
   mustbe(identifier);
   isconst:=have(eq_sy);
   if not isconst then mustbe(is_sy);
   type0(representation);
   mkalias(self,representation,classid,false);

   if have(and_sy) then cbody;
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
                  match(t,VOID);
                 end;
           end;
           case lexsymbol of
           end_sy,ley_sy,
           newline_sy  : begin end;
           opcode_sy   : opcode_decl;
           class_sy    :class_decl;
           basetype_sy :basetype_decl;
           include_sy  :do_inclusion;
           traceon_sy  :begin next_symbol;trace:=true;end;
           traceoff_sy :begin next_symbol;trace:=false;end;
           liston_sy   :begin next_symbol;listprog:=true;end;
           listoff_sy  :begin next_symbol;listprog:=false;end;
           procedure_sy:procedure_decl;
           end;
           statements:=statements+1;
     until (not have(newline_sy)) or(not( errorfree or (batch in options)));
end;
{ -------------------------------------------------------------- }
{    TYPE0                                                       }
{    -----                                                       }
{         handles declaration of base types                      }
{ -------------------------------------------------------------- }
procedure type0 ;
begin
   if istype(symbol)
   then begin  findtype(symbol,t);
               next_symbol;
        end
   else if have(star_sy) then begin
           type0(t); vectorise(t);
        end
   else if have(dollar_sy) then begin
           type0(t); tableof(t,t);
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
    n               :namedesc;
       procedure get_result;
       begin
            type0(restype);
            resultloc:=newdummy(ord(begin_sy),restype,param,n1);
            setresult(proctype,n1);
       end  ;
       procedure voidproc;
       begin
                      resultloc:=newdummy(ord(begin_sy),restype,param,n1);
                      setresult(proctype,n1);
       end;

begin

     proctype:=void;restype:=void;proctype.typeid:=procedure_sy;
     proctype.aliasid:=ord(procedure_sy);
           case lexsymbol of
           proc_sy: begin
                      next_symbol;
                      if have(brace_sy) then begin
                   {   enterscope(oldsp);}
                       if have (rbrace_sy) then voidproc
                       else begin
                        if not  have (arrow_sy) then begin
                         repeat
                          type1(t1);
                          id:=ord(end_sy);
                          idnumber:=newdummy(id,t1,local,n1);
                          appendparam(proctype,n1)
                         until not have(comma_sy);
                         if have(arrow_sy) then begin
                            get_result;
                         end else voidproc;
                        end
                        else get_result;
                        mustbe(rbrace_sy);
                       end;
                      end else voidproc;
                      t:=proctype;

                       { assign addresses to the params }
{                     exit_proc(oldsp);   }
             end;
          { structure_sy:structure_decl; }
           else type0(t)
           end;
end;

{ -------------------------------------------------------------- }
{   PROG                                                         }
{   ----                                                         }
{ -------------------------------------------------------------- }
procedure prog;
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
     intialisecounts;
     next_symbol;
               sequence(t);
     match(VOID,t);
     mustbe(question_sy);
     exitblock(scope,VOID);

     release(p);
     close(listfile);
     incompiler:=false;
end;
begin

end.