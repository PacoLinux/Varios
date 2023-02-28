{ The Computer Language Benchmarks Game

  http://shootout.alioth.debian.org

  contributed by Ian Osgood,

  modified by Florian Klaempfl

  modified by Ales Katona

  modified by Vincent Snijders

}
 
 

program nvpv4;{nbody simulator using array code}
 

const pi = 3.141592653589793;

      solarMass = 4 * pi * pi; 
      daysPerYear = 365.24;
      N=1024;                { this handles far more bodies }
      nbodies=5;
      veclen=4;
	runs =40;

type realt=real; 

type RowVec=array[1..nbodies] of realt;
     vect=array[1..n] of realt;pvect=^vect;
     {matr=array[1..3,1..N] of realt;pmatr=^matr;}
     matr=array[1..3] of vect;pmatr=^matr;

type ColVec=array[1..veclen ] of realt;

type bodyNames=array[1..nbodies] of string;

type mat=array[1..nbodies] of ColVec;



Const b : bodyNames= ('Sun','Jupiter','Saturn','Uranus','Neptune');
Const mass : RowVec = (solarMass,9.54791938424326609e-04*solarMass,2.85885980666130812e-04*solarMass,4.36624404335156298e-05*solarMass,5.15138902046611451e-05*solarMass);

var M : pvect;{ mass vector}
    x:pmatr;{x,y,z coordinates of system}
    v:pmatr;{ x,y,z components of velocity }
    a:pmatr;{ x,y, z compontents of acceleration }
    di:pmatr;{x,y,z components of distance from body i}
    disq: pmatr; { squared version of di }
    sqdi : pvect; { sum square distance}  
    vp : pvect; 
    d : pvect; {   distance}
 function distance(p1,p2 : integer) : realt;
var dv:array[1..3 ,0..0] of realt;
begin

  dv[1..3]:=x^[1..3,p1]-x^[1..3,p2];
  distance:=sqrt(\+ \+ dv*dv);
end;
procedure distance1(i: integer);
var l:realt;
var j:integer;
begin
	for j:=1 to 3 do
	di^[j]:= x^[j] - x^[j,i];
	(*! Next compute the euclidean distances *)
	sqdi ^:= di^[1]*di^[1] +di^[2]*di^[2] +di^[3]*di^[3];
	(*! set the ith component to 1 to prevent divide by zero for the sq distance from self *)
	sqdi^[i]:=1;	 
	d^:=sqrt(sqdi^);
end;
procedure initialise(dump:boolean);
 var t:real;i,j,nin:integer;txt:text;
begin
	new(x );
	new(v );
	new(a );
	new (M );
	new(di );new(disq);
	new(sqdi );
	new(d );
	new(vp);
	assign(txt,'bodies1024.txt');reset(txt);
	writeln('ready to read');
	read  (txt,Nin);
	if nin <> N then
	begin
		writeln(' data file does not include ',n,' bodies');
	end 
	else
	begin
		for i:= 1 to n do
		begin
			read(txt,t);
			M^[i]:=t;
		end;
		for j:=1 to 3 do begin for i:= 1 to n do begin read(txt,t); x^[j,i]:=t; end;end;
		for j:=1 to 3 do begin for i:= 1 to n do begin read(txt,t); v^[j,i]:=t; end; end;
	end;
	close(txt);
end;
 

function energy : realt;
var  i,j : integer;
var en:realt;
begin
	en := 0.0;
	for i := 1 to N do
	begin
      en := en+ 0.5 * M^[i] * (sqr(v^[3,i]) + sqr(v^[1,i]) + sqr(v^[2,i]));
      distance1(i);
      for j := i+1 to N do
		en := en - (M^[i] * M^[j]) / d^[j]; { speed up 8x using 2 SPEs}
        {en := en - (M^[i] * M^[j]) / distance(i,j);}
	end;
    energy:=en;
    writeln(en:19:14);
end;





procedure advance(dt : realt);
var i,j,k :integer;t:real;
    row:array[1..3]of realt;
    px,py,pz:vect;
    var l,eps:real; 
begin
	{$r-}
	eps:=0.01;
	for i:= 1 to N do 
	begin
		(*! Compute the displacement vector between each planet and planet i.*)
		for j:=1 to 3 do
			di^[j]:= x^[j] - x^[j,i];
		{di^:=x^-x^[iota 0,i];}
			(*! Next compute the euclidean distances *)
		 
		sqdi ^:= sqrt(di^[1]*di^[1] +di^[2]*di^[2] +di^[3]*di^[3])+eps;
		(*! set the ith component to 1 to prevent divide by zero for the sq distance from self *)
		sqdi^[i]:=1;	 
		(*! Now compute the acceleration vectors *)
		d^:=dt*m^/(sqdi^*sqdi^*sqdi^);
		{for j:= 1 to 3 do 
		   a^[j]:=di^[j]*d^;}
		 
		a^:=di^*d^;
		for j:= 1 to 3 do 
		   v^[j,i]:=v^[j,i]+ (\+ a^[j]); 
{		for j:= 1 to 3 do 
		begin
			l:=redpf(a^[j,1],N);
			v^[j,i]:=v^[j,i]+ l;  
		end;   }
	end;

	(*! Finally update positions. *)
	for j:= 1 to 3 do 
		x^[j] := x^[j] + v^[j] *dt;
end;
var i:integer;t1,delay:double;  
begin
     {t1:=secs;}
      initialise(paramstr(1)='D');
      {delay:=(secs-t1);
      writeln('time Intialize :', delay);
      t1:=secs;}
      energy;
      {delay:=(secs-t1);
      writeln('time energy (Before):', delay);}
      t1:=secs;
      for i:=1 to runs do
            advance(0.001);
      delay:=(secs-t1)/runs;
      writeln('time per iteration :', delay);
{       t1:=secs;}
      energy;
      {delay:=(secs-t1);
      writeln('time energy (after):', delay);}
 end.

