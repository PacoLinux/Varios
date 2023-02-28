unit vpparse;

interface  uses lexlib,yacclib,lists,dlbvp;


implementation 
         
type lextoken=integer;
var dlbtoken:lextoken;
procedure translate( tree:cell); forward ;
function dyad(left,op,right:cell):cell; forward;
function monad(op,right:cell):cell;forward;
    {$i vps.pas}
    {$i vplex.pas}
    {i vps.pas}
var filename:string[80];
begin
    filename := paramStr(1);
  if filename='' then
    begin
      write('input file: ');
      readln(filename);
    end;
  assign(yyinput, filename);
  reset(yyinput);
  if yyparse=0 then writeln('successful parse!');
end.    
