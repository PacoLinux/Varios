Unit env;
{ Copied from page 423 of Mastering Turbo Pascal }
{ this looks up a textline in the environment
  of the program
  }
interface

uses bufdecls, fsm;

procedure GetEnvVar(variable:textline;var value:textline);

implementation
 
var s:textline;

  function getenvariable (var name:char):pchar;external;


procedure GetEnvVar(variable:textline;var value:textline);
var loc:string[100];
begin
     loc:=value +chr(0);
     value :=  strPas(getenvariable(loc[1]));
end;
begin
  getenvvar('PSDIR',PSDIR);
  if psdir[length(psdir)]<>'\' then
     if length(psdir) >0 then
        psdir:=psdir+'\';
  MACROLIB := 'salibx64.asm';
  PASS2PROG :=  'nasm -f elf64 ';


end.
