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
{$M 65500,16384,655360} {Turbo 3 default stack and heap}
{$define assembler}
{$define salgol}
program SAlgol;

Uses 
  bufdecls, 
  fsm,
  errors,
  reader,
  dlb,
  idtypes,
  reals,
  ilcp,
  sagen64, 
  symtab,
  sasyn; 

var comstr,filestem,fullfile:string ;
    parameter : integer;
const
    ObjectFileSuffix = '';
function objectfile:textline;
        var f:string;
        begin
             f:=FileName;
             delete (f,length(f)-1,2);    { remove the S from the file.S }

             objectfile:=f;
         end;
function assembler
    (Var errnum:integer;var errmsg:textline):boolean;

    { this runs the assembler as a  daughter process }
    type paramlist=array[0..10] of pchar;
    var return_code,exerr: word;
        params:paramlist;
        asmf,fn :array[1..80] of ascii;
        i:integer;
        
    begin
       for i:=1 to length(asmfn) do asmf[i]:=ord(asmfn[i]);
       asmf[length(asmfn)+1]:=0;{ create null terminated c string };
       params[1]:= @asmf;
       for i:=1 to length(pass2prog) do fn[i]:=ord(pass2prog[i]);
       pass2prog[length(pass2prog)+1]:=0;{ create null terminated c string };
       params[0]:= @fn;
       params[2]:=nil; {must be null terminated vector }
    
       return_code :=exec(params[0],params); 
        assembler:=true;

       if return_code <> 0 then begin
          errnum:=250;
          errmsg:='Error during assembly';
          assembler:=false;
       end;
  
    end;

var ErrNum: integer;
    ErrMsg: TextLine;

function batchcompileit:boolean;

    begin
         synver;
         codever;
           clear_errors;
            rewind;
            
           batchcompileit:=TRUE;
            prog;
           writeln('parsed');
           if NOT ERRORFREE then begin
              batchCOMPILEit:=FALSE;
               
           end ;
         
           if errorfree  then
           batchcompileit:=assembler(errnum,errmsg);

        end;

begin
   compilererror:=0;options:=[batch];
   initsymtab;
 
   filestem:='';
   if paramcount >= 1 then
     filestem:=paramstr(1);

     for parameter := 2 to paramcount do begin
         if paramstr(parameter)='+b' then options:=options+[batch];
         if paramstr(parameter)='+l' then options:=options+[listing];
        end;
     listprog := listing in options;
     fullfile:=filestem+'.s';
    { if not( batch in options) then edit
     else}             { for now editor is disabled }
     begin
        loadtext(the_buffer,fullfile,true);

        FileName := fullfile;
        if batchcompileit then writeln('Compilation ok')
        else begin
          writeln;
          writeln('Errors in compilation:',errnum,', ', errmsg);
          halt(errnum);
        end;
     end;
end.
 



