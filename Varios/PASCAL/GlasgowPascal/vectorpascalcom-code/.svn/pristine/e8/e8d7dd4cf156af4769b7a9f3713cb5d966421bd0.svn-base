{ The Computer Language Benchmarks Game

  http://shootout.alioth.debian.org

  contributed by Ian Osgood,

  modified by Florian Klaempfl

  modified by Ales Katona

  modified by Vincent Snijders
  modified by Paul Cockshott

}
 
 

program nvpv6;{nbody simulator using array code  in array of struct format}
 

const pi = 3.141592653589793;

      solarMass = 4 * pi * pi; 
      daysPerYear = 365.24;
      N=1024;                { this handles far more bodies }
      nbodies=5;
      veclen=4;
	runs =10;

type realt=real; 

type RowVec=array[1..nbodies] of realt;
     vect=array[1..n] of realt;pvect=^vect;
     matr=array[ 1..N,1..veclen] of realt;pmatr=^matr;

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
    v:pmatr;{ x,y,z components of velocity }
   
function distance(p1,p2 : integer) : realt;
var dv:array[1..3 ] of realt;
begin

  dv:=x^[p1]-x^[p2];
  distance:=sqrt( dv[1]*dv[1]+dv[2]*dv[2]+dv[3]*dv[3]);
end;
procedure initialise(dump:boolean);
(*! this copies the parameters of the model from the first five plantes and fills in the rest*) 
 procedure offsetMomentum;
 var mv:ColVec;i : integer;
 begin
  mv:=0.0;
  for i := 1 to nbodies do
       mv:=mv-(vmat[i]*mass[i]);
  vmat[1]:=mv/solarMass;
 end;
 var t:real;i,j,nin:integer;txt:text;
begin
	new(x );
	new(v );
	new (M );
	
	offsetMomentum;
    
	x^[1..nbodies,1..3]:= pmat[1..nbodies,1..3];
	v^[1..nbodies,1..3]:= vmat[1..nbodies,1..3];
	 
	M^[1..nbodies] := mass[1..nbodies];
   
	(*! give all other bodies velocity of neptune and positions going out in line from it. *)
	 
        
        for i:=1 to 3 do for j:=nbodies+1 to N do
        begin
		     x^[j,i]:= x^[nbodies ,i] + j* 1.0/N;
	         v^[j,i]:= v^[nbodies,i ];
	    end;
	    
	M^[nbodies+1..N]:= M^[nbodies-1]*0.01; 
	 if not dump then
	 begin
		assign(txt,'bodies.txt');reset(txt);
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
		x^:=0;v^:=0; 
		 
		for j:=1 to 3 do begin for i:= 1 to n do begin read(txt,t); x^[i,j]:=t; end;end;
		 
		 
		for j:=1 to 3 do begin for i:= 1 to n do begin read(txt,t); v^[i,j]:=t; end; end;
		 
		end;
		 close(txt);writeln('file read');
	end;
 
end;
 

function energy : realt;
var  i,j : integer;
var en:realt;
begin
  en := 0.0;
  for i := 1 to N do
   begin 
      en := en+ 0.5 * M^[i] * (sqr(v^[i,3]) + sqr(v^[i,1]) + sqr(v^[i,2]));
      for j := i+1 to N do
        en := en - (M^[i] * M^[j]) / distance(i,j);
    end;
    energy:=en;
    writeln(en:19:14);
end;

 

procedure advance(dt : realt);
  pure function getnewV(i:integer):colvec;
  type tempstateblock = record
    	a:matr;{ x,y, z compontents of acceleration }
    	di:matr;{x,y,z components of distance from body i}
    	disq: matr; { squared version of di }
    	sqdi : vect; { sum square distance} 
    	d : vect; {   distance}
    	end;
    	
  var  j ,k:integer;t:real;
    row:colvec;
    acc:colvec;
    state :tempstateblock;
	begin
	{new(state);}
	with state   do begin
		row:=x^[i];
		(*! Compute the displacement vector between each planet and planet i.*)
		di:= x^ - row;
		(*! Next compute the euclidean distances *)
		disq := di * di;
		sqdi := \+ disq;
		 
		(*! set the ith component to 1 to prevent divide by zero for the sq distance from self *)
		sqdi[i]:=1;	 
		d:=sqrt(sqdi);
	         
		(*! Now compute the acceleration vectors *)
		a:=(trans  m^) * di/(trans sqdi * trans d);
		 
	 
		  acc:=0;
		  for k:=1 to n do
		   acc:=acc+     a [k]; 
	end;
	{dispose(state );}
	 
	getnewV:=v^[i]+ dt * acc;;
		 
	end;
begin
	(*! compute the new velocities *)
	v^ := getnewV(iota 0);
	(*! Finally update positions. *)
	x^ := x^ + v^ *dt;
end;
var i:integer;t1,delay:double;  
begin
      
      initialise(paramstr(1)='D');
     
      energy;
	t1:=secs;
      for i:=1 to runs do
      begin
            advance(0.001);
      end;
      delay:=(secs-t1)/runs;
      writeln('time per iteration :', delay);
      energy;
end.

