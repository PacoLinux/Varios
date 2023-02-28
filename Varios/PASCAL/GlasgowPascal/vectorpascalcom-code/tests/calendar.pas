unit calendar;
interface
  type 
   monthname=(
     jan,feb, mar, apr, may, jun,
     jul,aug,sep, oct, nov, dec);
   date =record
	year:integer;
	month:monthname;
	day:1..31;
	end;
function dategt(a,b:date):boolean;
operator > = dategt;
implementation
function dategt(a,b:date):boolean;
begin
	if a.year> b.year then 
		dategt:=true
	else if a.year=b.year then
	begin
                if a.month> b.month then dategt:=true
		else if a.month= b.month then
		     dategt:= a.day>b.day
        end
        else dategt:=false
end;

begin
end.
