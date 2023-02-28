{
File       : error.cmp
Part of    : Compiler Tool Box
Author     : W P Cockshott, & P Balch
Date       : 21 -9- 88
Function   : To provide error reporting mechanism to be used
             in the compiler
}
UNIT errors;
INTERFACE
   USES
     {editdecl,  }
    { edit_err,         }
     bufdecls,
     fsm;

var CompilerError:byte;
    Compilermsg: textline;
    CompilerCursor:word;
    ErrorCursor: word;
    options : set of (islibrary, batch,listing);
    erroraddr:longint;
    exitcode:integer;
procedure Error(msg: textline);
function errorfree:boolean;
procedure clear_errors;

Function digit(I:integer): char;
Function int2str(i:integer): string;
IMPLEMENTATION

const safety = 500;
var execute : boolean;
    parameter : integer;
Function digit(I:integer): char;
Begin
  digit := chr(ord('0')+(i Mod  10))
End;
Function int_2_string(i:integer): string;

Var s: string;
  n: boolean;
Begin

  s := '';
  If i<0 Then
    Begin
      n := true;
      i := - i;
    End
  Else n := false;
  While i>0 Do
    Begin
      s := digit(i Mod 10)+s;
      i := i Div 10;
    End;
  If n Then int_2_string := '-'+s
  Else int_2_string := s;
End;
Function int2str(i:integer):string;
begin
    int2str:=int_2_string(i);
end;
procedure Error(msg: textline);
const leadin='<***';leadout='***>';
begin
{ if batch in options then} writeln(leadin,msg,leadout);
{ writeln(listfile,leadin,msg,leadout);}
 if CompilerError = 0 then 
 begin
  CompilerError:=220;
  errorcursor:=CompilerCursor;
  CompilerMsg:=msg;
  halt(CompilerError);{was ErrorReturn;    }
 end;

end;

function errorfree:boolean;
begin
 {    if Maxavail < safety then error('Memory low');     }
     errorfree:=compilererror=0;
end;

{$f+}
function heaperrortrap(size:word):integer;
begin
  if incompiler then
  begin
    error('out of memory');
    heaperrortrap:=1;
  end else
    heaperrortrap:=0;
end;

var oldexitproc:pointer;

function MessageNum(Mno: byte): TextLine;
{ converts an Error number into an Error message }
var
  St: TextLine;
begin
  case Mno of
      { DOS meessages }
      1: MessageNum:='  cannot find/create file';
      2: MessageNum:='  File not found';
      3: MessageNum:='  Path not found';
      4: MessageNum:='  Too many files open';
      5: MessageNum:='  File access denied';
      6: MessageNum:='  Invalid file handle';
      7: MessageNum:='  Memory control blocks destroyed';
      8: MessageNum:='  Insufficient memory';
      9: MessageNum:='  Invalid memory block address';
     10: MessageNum:='  Invalid environment';
     11: MessageNum:='  Invalid format';
     12: MessageNum:='  Invalid access code';
     13: MessageNum:='  Data Invalid';
     15: MessageNum:='  Invalid drive number';
     16: MessageNum:='  Cannot remove current directory';
     17: MessageNum:='  Cannot rename across drives';
     18: MessageNum:='  No more files';
     19: MessageNum:='  Disk write protected';
     20: MessageNum:='  Unknown unit ID';
     21: MessageNum:='  Drive not ready';
     22: MessageNum:='  Unknown command error';
     23: MessageNum:='  Disk data error';
     24: MessageNum:='  Bad request structure';
     25: MessageNum:='  Seek error';
     26: MessageNum:='  Unknown medium error';
     27: MessageNum:='  Disc sector not found';
     28: MessageNum:='  Printer out of paper';
     29: MessageNum:='  Write error';
     30: MessageNum:='  Read error';
     31: MessageNum:='  General failure';
     32: MessageNum:='  File sharing violation';
     33: MessageNum:='  File locking violation';
     34: MessageNum:='  Improper disk change';
     35: MessageNum:='  FCB not available error';
     40: MessageNum:='  File too big, file not read'; {my own msg, not DOS}
     80: MessageNum:='  File already exists';
     82: MessageNum:='  Cannot make directory';
     83: MessageNum:='  Fail on critical error interrupt';
    100: MessageNum:='  Disk read error';
    101: MessageNum:='  Disk write error';
    102: MessageNum:='  File not assigned';
    103: MessageNum:='  File not open';
    104: MessageNum:='  File is not open for input';
    105: MessageNum:='  File is not open for output';
    106: MessageNum:='  Invalid numeric format';

    { Turbo messages }
    200: MessageNum:='  Division by zero';
    201: MessageNum:='  Range check';
    202: MessageNum:='  Stack Overflow';
    203: MessageNum:='  Heap Overflow';
    204: MessageNum:='  Invalid pointer';
    205: MessageNum:='  Floating point overflow';
    206: MessageNum:='  Floating point underflow';
    207: MessageNum:='  Invalid floating point';

    {Our message}
    255: MessageNum:='  Unable to read/write to drive';
    else begin
           st:=int2str(mno);
           MessageNum:='  Error ' + St + ' - (Message not found)';
         end
  end;
end;
{$s-}
procedure errorhandler;
begin
  if erroraddr<>0 then
  begin
     write('Run time error ',MessageNum(exitcode));
     if incompiler then
       write(' in compiler: ') else
       write(': ');

     writeln(hextostr(  (erroraddr),16) );
     if exitcode=202 then begin
        writeln('Check your grammer rules they may be left recursive ');
     end;

     erroraddr:=0;exitcode:=0;
  end;
   halt(exitcode);
end;
{$s+}

{$f-}
procedure clear_errors;
begin
    compilererror :=0;exitcode:=0;
    CompilerMsg:='';
    execute:=false;
end;
begin
  incompiler:=false; erroraddr:=0;exitcode:=0;
   
  clear_errors;
end.


