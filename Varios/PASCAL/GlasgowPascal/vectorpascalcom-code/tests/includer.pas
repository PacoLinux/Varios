program includer;
{$DEFINE ok}
type
{$IFDEF ok} 
	r=real; 
{$ELSE}
	r=integer;  (* 99 *)

{$ENDIF}
var i:r;
begin
  i:=2;
  write(i);

  write(i AND true, i AND false, 7 AND true, 7 AND false);
end


.




.

