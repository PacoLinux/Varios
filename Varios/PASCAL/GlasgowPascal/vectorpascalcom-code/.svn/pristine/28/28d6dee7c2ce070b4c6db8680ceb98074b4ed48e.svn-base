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
      n=1024;
      nbodies=5;
      veclen=4;
	runs =10;

type realt=real; 

type RowVec=array[1..nbodies] of realt;
     vect=array[1..N] of realt;pvect=^vect;
     matr=array[1..3,1..N] of realt;pmatr=^matr;

type ColVec=array[1..veclen ] of realt;

type bodyNames=array[1..nbodies] of string;

type mat=array[1..nbodies] of ColVec;

Const pmat  : mat = ((0.0,0.0,0.0,0.0),
                        (4.84143144246472090e+00,-1.16032004402742839e+00,-1.03622044471123109e-01,0.0),
                        (8.34336671824457987e+00,4.12479856412430479e+00,-4.03523417114321381e-01,0.0),
                        (1.28943695621391310e+01,-1.51111514016986312e+01, -2.23307578892655734e-01,0.0),
                        (1.53796971148509165e+01,-2.59193146099879641e+01,1.79258772950371181e-01,0.0));

Const vmat :mat =((0.0,0.0,0.0,0.0),
                        (1.66007664274403694e-03 * daysPerYear,7.69901118419740425e-03 * daysPerYear,-6.90460016972063023e-05 * daysPerYear,0.0),
                        (-2.76742510726862411e-03 * daysPerYear,4.99852801234917238e-03 * daysPerYear, 2.30417297573763929e-05 * daysPerYear,0.0),
                        (2.96460137564761618e-03 * daysPerYear,2.37847173959480950e-03 * daysPerYear,  -2.96589568540237556e-05 * daysPerYear,0.0),
                        (2.68067772490389322e-03 * daysPerYear,1.62824170038242295e-03 * daysPerYear,-9.51592254519715870e-05 * daysPerYear,0.0));

 

Const b : bodyNames= ('Sun','Jupiter','Saturn','Uranus','Neptune');

Const mass : RowVec = (solarMass,9.54791938424326609e-04*solarMass,2.85885980666130812e-04*solarMass,4.36624404335156298e-05*solarMass,5.15138902046611451e-05*solarMass);
var M : pvect;{ mass vector}
    x:pmatr;{x,y,z coordinates of system}
    v:pmatr;{x,y,z components of velocity }
    a:pmatr;{x,y,z compontents of acceleration }
    di:pmatr;{x,y,z components of distance from body i}
    disq: pmatr; { squared version of di }
    sqdi : pvect; { sum square distance} 
    d : pvect; {   distance}
function distance(p1,p2 : integer) : realt;
var dv:array[1..3  ] of realt;
var tmpdis: realt;
begin
  {$r-}
  dv :=x^[iota 0,p1]-x^[iota 0,p2];
   distance:=sqrt(\+ \+ dv*dv);
  tmpdis := sqrt( dv[1 ]*dv[1 ]+dv[2 ]*dv[2 ]+dv[3 ]*dv[3 ]);
  {write(p1,'   ', p2);writeln(dv);}
 { writeln(tmpdis);}
  {distance:=tmpdis;}
end;
 procedure offsetMomentum;
 var mv:ColVec;i : integer;
 begin
  mv:=0.0;
    for i := 1 to nbodies do
       mv:=mv-(vmat[i]*mass[i]);		// WAS mv:=mv-(vmat...
  vmat[1]:=mv/solarMass;
{  writeln(mv);
  writeln(vmat[1]);}
 end;
 procedure initialise(dump:boolean);
(*! this copies the parameters of the model from the first five plantes and fills in the rest*) 

 var t:real;i,j,nin:integer;txt:text;
begin
	new(x );
	new(v );
	new(a );
	new (M );
	new(di );new(disq);
	new(sqdi );
	new(d );
	
  	assign(txt,'bodiesVPV42.txt');reset(txt);
	writeln('ready to read');
	read  (txt,Nin);
	if nin <> N then begin
		writeln(' data file does not include ',n,' bodies');
	end else
	begin
		for i:= 1 to n do begin
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
      for j := i+1 to N do
        en := en - (M^[i] * M^[j]) / distance(i,j);
    end;
    energy:=en;
    writeln(en:19:14);
end;

 

procedure advance(dt : realt);
var i,j :integer;t:realt;
    row:array[1..3]of realt;
begin
	for i:= 1 to N do 
	begin
		row:=x^[iota 0,i];
		(*! Compute the displacement vector between each planet and planet i.*)
		di^:= x^ -trans row;
		(*! Next compute the euclidean distances *)
		disq ^ := di^ * di^;
		sqdi ^:= di^[1]*di^[1] +di ^[2]*di^[2] +di ^[3] *di^[3];
		(*! set the ith component to 1 to prevent divide by zero for the sq distance from self *)
		sqdi^[i]:=1;	 
		d^:=sqrt(sqdi^);	 
		(*! Now compute the acceleration vectors *)
		a^:= m^ * di^/(sqdi^ * d^);
		for j:= 1 to 3 do 
		   v^[j,i]:=v^[j,i]+ dt* \+ a^[j]; 
	end;
	(*! Finally update positions. *)
	x^ := x^ + v^ *dt;
end;
var i:integer;t1,delay:double;  
begin
      
      initialise(paramstr(1)='D');
     offsetMomentum;
      {for i:=1 to 5 do  writeln(v^[1,i],v^[2,i],v^[3,i]);}
 { writeln(mass);}
      energy;
	t1:=secs;
      for i:=1 to runs do
      begin
            advance(0.001);
		{	writeln(i,energy);      }
            end;
      delay:=(secs-t1)/runs;
      writeln('time per iteration :', delay);
      energy;
end.


