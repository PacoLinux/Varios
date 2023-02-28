{$r-
-----------------------------------------------------------------
Program     : ADPL Compiler
Uses        : Compiler toolbox
Author      : W P Cockshott
Date        : 28 feb 91
Version     : 1

Copyright (C) P Cockshott
----------------------------------------------------------------
}
{$F+}
{$O+}
{$R-}    {Range checking off}
{$B-}    {Boolean short circuiting off}
{$S+}    {Stack checking on}
{$I-}    {I/O checking off}
{$N-}    {No numeric coprocessor}
program adpl;
{$define isadpl}
 Uses
{$ifdef small}
  pcinit,
  {$endif}
  editdecl,
  errors,

  fsmpret,
  dlbpret,
  idtypes,
         {$ifdef i80386}  riscasm,{$endif}

  sagen,

  symtab,
  stacks,
  symstk,
  adpsyn,
  dir,
  menu,
  mouse,
  control,
  editor,

  compile;
  { OVERLAY DEFINITIONS }
  {$ifdef small}
  {$O editor}
  {$O pasyn}
  {$O sagen}
  {$O symtab}
  {$O riscasm}
  {$O dlbpret}
  {$O idtypes}
  {$O dir}
  {$O menu}
  {$O mouse}
  {$O control}
  {$O stacks}
  {$O symstk}
  {$endif}
var comstr,filestem,fullfile:string[70];
    parameter : integer;

   begin
   synver;
   compilererror:=0;options:=[];
   initsymtab;

{$ifdef assembler}
   assign(asmfile,ASM);
   rewrite(asmfile);

{$endif}
   filestem:='';
   if paramcount >= 1 then
     filestem:=paramstr(1);

     for parameter := 2 to paramcount do begin
         if paramstr(parameter)='+b' then options:=options+[batch];
         if paramstr(parameter)='+l' then options:=options+[listing];
        end;
     listprog := listing in options;
     fullfile:=filestem+'.p';
     if not( batch in options) then edit
     else begin
        FileName := fullfile;
        if batchcompileit(fullfile) then writeln('Compilation ok')
        else begin
          writeln;
          writeln('Errors in compilation');
          halt(1);
        end;
     end;
end.
