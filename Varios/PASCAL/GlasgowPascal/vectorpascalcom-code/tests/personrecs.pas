unit personrecs;
interface
type person = record
	id:string[80];
	address:string;
	home,mobile:string[40];
	end;
function personeq(p1,p2:person):boolean;
function personlt(p1,p2:person):boolean;
operator = = personeq;
operator < = personlt;

implementation


function personeq(p1,p2:person):boolean;
begin
	personeq:= p1.id = p2.id;
end;
function personlt(p1,p2:person):boolean;
begin
	personlt:= p1.id < p2.id;
end;
begin
end.

