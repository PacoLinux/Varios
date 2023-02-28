unit vpcg;
{ translate pascal syntax trees to ilcg }
interface  uses lists;

procedure translate(c:cell);

implementation
procedure translate(c:cell);
begin
     writeln('translate(',c,')');
end;

end.
 