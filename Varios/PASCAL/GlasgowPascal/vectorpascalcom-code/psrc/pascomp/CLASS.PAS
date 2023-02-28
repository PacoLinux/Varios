          
{ -------------------------------------------------------------- }
{ CLASS DECL                                                     }
{ __________  Handles declarations of new classes                }
{             syntax:                                            }
{                    class <identifier> is <type1> and <cbody>   }
{ -------------------------------------------------------------- }
{$ifdef synext}
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
        next_symbol(the_buffer);
    end;
    { ---------------------------------------------------------- }
    { LHS                                                        }
    { --- parses the left hand side of a grammer rule            }
    {     <lt_sy> <type1> - <predefinedproduction> <gt_sy>       }
    { ---------------------------------------------------------- }
    procedure lhs(var t:typerec;var ins:insertions);
    begin
       must(lt_sy);
       type1(t);
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

       must(cur_sy);
       production(t);
          
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
   type1(representation);
   mkalias(self,representation,classid);

   if got(and_sy) then cbody;
end;
{$endif}