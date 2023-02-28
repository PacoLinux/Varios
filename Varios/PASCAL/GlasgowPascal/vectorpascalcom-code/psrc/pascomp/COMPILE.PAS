{ --------------------------------- }
{   COMPILER  DRIVER                }
{ --------------------------------- }
{$F+}    { Far calls}
{$R+}    {Range checking off}
{$B+}    {Boolean short circuiting off}
{$S+}    {Stack checking on}
{$N-}    {No numeric coprocessor}
{$O+}    {Overlays}
unit compile;

interface

Uses


  BufDecls,

  {$ifdef pretext}
  lines,
  streams,
  fsmpret,
  {$endif}

  errors,




{$ifdef ispascal}
  pasyn,
{$endif}
{$ifdef isadpl}
  adpsyn,
{$endif}

{$ifndef assembler}
  {$ifndef i80386}assemble,{$endif}
  sagen
{$endif}
  ;


const CtrlZ = #26;



procedure compile_prog(Text: TextStack; var cursor: word;
    var ErrMsg: TextLine);

function batchcompileit(filename:textline):boolean;
Implementation

var comstr,filestem,fullfile:string[70];
    compiled: boolean;
    codefile:file;
    stoponline: integer; {0 means don't stop}
(*procedure transtext(var B:textbuffer;  ts:textstack);
var f:file of byte; i:integer; c:byte;
    bp:textstream;
begin

 new(bp,open(ts));
 if openbuffer(b,'compile buffer',bp,
    false,
 {$ifdef ispascal}pascallanguage{$endif}
 {$ifdef isadpl}pascallanguage{$endif}
 {$ifdef issalgol}salgollanguage{$endif}
 ) then ;
{$endif}
end;        *)

procedure pause;
        begin
            writeln;

        end;

procedure ping(freq:integer);
begin

                    writeln(chr(ord('G')-32));
end;

   function objectfile:textline;
    var f:textline;
    begin

         objectfile:=shortname;
     end;

    function batchcompileit(filename:textline):boolean;
                   var ErrNum: integer;
                   var ErrMsg: TextLine;
                   var fs :textstream;

                   var b :textbuffer;
    begin

              codever;
           clear_errors;

           if openbuffer(b,'compile buffer',filename,{false,}pascallanguage) then
           {if open_buffer(b,filename) then        }
           begin

           rewind(b);

           batchcompileit:=TRUE;
           prog(b);
           if NOT ERRORFREE then begin
              batchCOMPILEit:=FALSE;

           end ;
           freebuffer(b);
           end else
           begin
                error('can not open '+filename);
                 batchcompileit:=false;
           end;
        end;


procedure compile_prog(Text: TextStack; var cursor: word;
    var ErrMsg: TextLine);
  var errnum: integer;the_buffer:textbuffer;
  const listfileopen:boolean=false;
begin
           ErrMsg:='';

   synver;

              codever;
              write('Copyright (C) Paul Cockshott 1989');
              write('Copyright (C) University of Glasgow 2003');
              write('Line :');

           clear_errors;
           rewind(the_buffer);
           assign(listfile,'s.lis');
           rewrite(listfile); listfileopen:=true;


           if CompilerError=0 then
           begin         {
                transtext(THE_BUFFER,text);      }

                prog(the_buffer);
           end;
             if compilererror<>0 then begin
                errmsg:=compilermsg;

             end;

           if listfileopen then begin
              close(listfile);
              listfileopen:=false;
           end;
           freebuffer(the_buffer);
end;



begin
compiled:=false;
stoponline:=0;
end.

