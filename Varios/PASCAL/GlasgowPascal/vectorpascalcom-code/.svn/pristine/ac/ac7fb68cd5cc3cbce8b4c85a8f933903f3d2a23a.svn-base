{ PASTYPES.PAS
  ------------

  Handles pascal type declarations with some extensions to make it
  compatible with ps-algol

  Started : Nov 89
  Author  : W P Cockshottt

}
Unit pastypes;
interface uses dlb,idtypes;


procedure type1(var t:typerec) ;

implementation


{ -------------------------------------------------------------- }
{    TYPE1                                                       }
{    -----                                                       }
{         handles declaration of base types                      }
{ -------------------------------------------------------------- }
procedure type1(var t:typerec) ;
begin
   if istype(symbol)
   then begin  typeof(symbol,t);

   {$ifdef debug}
     writeln('type1 ',psym(symbol),'=',ptype(t));
   {$endif}
               next_symbol;
        end
   {$ifndef ispascal}
   else if have(star_sy) then begin
           type1(t); t:=vectorise(false,t);
        end
   {$endif}
   else if have(dollar_sy) then begin
           type1(t); t:=tableof(t);
        end
   else if have(up_arrow_sy) then begin
           type1(t); t:=pointerto(t);
        end
   else t:=void;
end;


end.