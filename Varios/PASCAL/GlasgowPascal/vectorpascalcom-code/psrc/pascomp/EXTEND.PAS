unit extend;
interface uses dlb,idtypes,errors;
{ -------------------------------------------------------------- }
{ types for run time syntactic extensions                        }
{ ---------------------------------------------------------------}
const
      maxrule =350;
      maxnonterm=90;
      norule=0;
type
     matchtype = (none,partial,total);
     rulerange = norule..maxrule;
     insertions= norule..maxnonterm;
     ruletype  = (null,binding,alternative,compulsory,subrule,semantics);
     rule      = record
                   tail:rulerange;
                   prodtype:typerec;
                   case sort      :ruletype of
                   null,binding,
                   alternative    :(head:rulerange);
                   compulsory     :(mustbesym:lextoken);
                   subrule        :(proc:insertions;);
                   semantics      :(id :lextoken);

                 end;

var
     rules     : array [rulerange]of rule;
     nullrule,
     toprule   : rulerange;
     topnonterm: insertions;
     insertion : array[insertions] of record
                   rulestart: rulerange;
                   name     : lextoken ;
                 end;



function nextrule:rulerange;

procedure defineinsertions;
function findinsertion(l:lextoken):insertions;
implementation
     function nextrule:rulerange;

     begin
        toprule:=succ(toprule);
        nextrule:=pred(toprule);
        if toprule=(maxrule-3)then error('grammer too big');
     end;


procedure defineinsertions;
begin
    nullrule:=norule;
    toprule:=norule;
    topnonterm:=norule;
end;
{ -------------------------------------------------------------- }
{ Find insertion                                                 }
{ -------------------------------------------------------------- }
function findinsertion(l:lextoken):insertions;
var i,j:insertions;
begin
      j:=norule;
      for i:=1 to topnonterm do
      if insertion[i].name = l then j:=i;
      findinsertion:=j;
end;
end.