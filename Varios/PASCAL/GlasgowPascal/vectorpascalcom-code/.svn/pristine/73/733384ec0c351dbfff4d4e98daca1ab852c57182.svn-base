program nameset;

uses personrecs;
type perset= set of person;
var db: perset;


procedure add(id,address,home,mobile:string);
var p:person;
begin
	p.id:=id;
	p.address:=address;
	p.home:=home;
	p.mobile:=mobile;
	db:=db+[p];
end;
procedure get(id:string; var p:person);
var 
    res:perset;
    
begin
	p.id:=id;
	res:= db*[p];
        for p in res do
	begin
	end;
		 
	
end;
var answer:person;	
begin
	db:=[];
	add('Paul','Glagow','330 3125','');
	add('James','Kent','12 1314','');
	get('James',answer);
	writeln(answer.id,answer.address,answer.home,answer.mobile);
end.
