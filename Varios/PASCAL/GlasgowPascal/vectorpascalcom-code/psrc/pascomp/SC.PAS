{$r-
-----------------------------------------------------------------
Program     : Salgol Compiler
Uses        : Compiler toolbox
Author      : W P Cockshott
Date        : 3 Oct 1986
Version     : 2

Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------
}

{$R-}    {Range checking off}
{$B-}    {Boolean short circuiting off}
{$S+}    {Stack checking on}
{$I-}    {I/O checking off}
{$N-}    {No numeric coprocessor}
{$M 65500,16384,655360} {Turbo 3 default stack and heap}

program SAlgol;
{$define issalgol}
Uses
    editdecl,
  errors,

  fsmpret,
  dlbpret,
  idtypes,
{$ifdef assembler}
  cgendum,

{$endif}
{$ifndef assembler}
  opcodes,
  assemble,
  sagen,

{$endif}
  symtab,
  stacks,
  sasyn,
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
  {$O opcodes}
  {$O assemble}
  {$O idtypes}
  {$O dir}
  {$O menu}
  {$O mouse}
  {$O control}
  {$O stacks}
  {$endif}


var comstr,filestem,fullfile:string[70];
    parameter : integer;
begin
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
     fullfile:=filestem+'.s';
     if not( batch in options) then edit
     else begin



        {$ifndef pretext}
        loadtext(the_buffer,fullfile,true);
        {$endif}
        FileName := fullfile;
        if batchcompileit (FileName)then writeln('Compilation ok')
        else begin
          writeln;
          writeln('Errors in compilation');
          halt(1);
        end;
     end;
end.

begin
  Edit;

end.

program salgol(input,output);
{$i classtab.cmp}                   { define the character classes }
{$i fsm.cmp}                        { first level lexical anlysis  }
procedure postfsm;begin end;
type string80 = string[80];
     textline = string80;{}
{ --------------------------------- }
{  UTILITIES                        }
{ --------------------------------- }

var CompilerError,ErrorCursor: integer;
    Compilermsg: textline;
    execute : boolean;
    options : set of (library);
    parameter : integer;
procedure ReportError(num: integer; msg: textline);
begin
 if CompilerError = 0 then begin
  ErrorCursor:=the_buffer.start;
  CompilerError:=num;
  CompilerMsg:=msg;
 end;
  writeln(msg);
end;
function errorfree:boolean;
begin
     errorfree:=compilererror=0;
end;
procedure error(m:string80);
begin
     ReportError(1,m);
end;
{ --------------------------------- }
{  INCLUDE FILES                    }
{ --------------------------------- }
{$i read.cmp}                       { reads files into buffer      }
{$i symbols.cmp}                    { enumerated type for symbols  }
{$i dlb.cmp}                        { converts lexemes to tokens   }
procedure postdlb;begin end;
{$I idtypes.cmp}
{$I real.cmp   }                    { convert real to ieee format }
{ assmcode.cmp }
{ I rtl.cmp    }
{ I addr.cmp   }
{$I cgendum.cmp}                   { code generator               }
{$I symtab.cmp }                   { identifier to type table     }
procedure postcgen;begin end;
{$u+}

{$i ed.cmp}                         { screen editor                }
overlay procedure posted;begin end;
{$I sasyn.cmp}                      { parses salgol                }

procedure postsasyn;begin end;

procedure compiler{(var cmd: Textline;
                       text: textstack;
                   var SyntaxOK: boolean;
                   var ErrNum: integer;
                   var ErrMsg: textline
                   )};
begin
end;

const ASM='s.asm';
var comstr,filestem,fullfile:string[70];
begin
   execute:=false;compilererror:=0;options:=[];
   synver;codever;
   initlexanal;
   declare_types;
   initsymtab;
   assign(asmfile,ASM);
   rewrite(asmfile);
   if paramcount >= 1 then begin
     filestem:=paramstr(1);
     fullfile:=filestem+'.s';
     if paramstr(2)='-edit' then editor
     else begin
        loadtext(the_buffer,fullfile,true);
        for parameter := 2 to paramcount do begin
         if paramstr(parameter)='-lib' then options:=options+[library];
        end;
        prog;
     end;
   end else writeln('usage sc <sourcefile> <options>');
   if not errorfree then begin
      close(asmfile);
      assign(asmfile,ASM);
      rewrite(asmfile) ;
      writeln(asmfile,' errors during compilation');
   end;
   close(asmfile);
   close(output);

end.



     if not( batch in options) then edit(mainBuffer,undobuffer,true)
    undobuffer,
    mainBuffer: textstack ;
