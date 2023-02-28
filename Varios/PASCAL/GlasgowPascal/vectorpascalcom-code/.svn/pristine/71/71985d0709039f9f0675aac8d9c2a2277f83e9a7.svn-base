{ The Computer Language Benchmarks Game

  http://shootout.alioth.debian.org

  contributed by Ian Osgood,

  modified by Florian Klaempfl

  modified by Ales Katona

  modified by Vincent Snijders

}



program V11;{$r- nbody simulator using record code}


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
     matr=array[1..3,1..N] of realt;pmatr=^matr;
      planet= record
        x, y, z:realt;
       vx, vy, vz:realt;
       mass:realt;
      end;
      pplanet=^planet;
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
var M : vect;{ mass vector}
    x:pmatr;{x,y,z coordinates of system}
    v:pmatr;{ x,y,z components of velocity }

    d : pvect; {   distance}
    planets:array[1..n] of pplanet;
  procedure copyin;
  var i:integer;
  begin
   for i:=1 to n do
   begin
     new(planets[i]);
     planets[i]^.x:=x^[1,i];
     planets[i]^.y:= x^[2,i];
     planets[i]^.z:= x^[3,i];
     with planets[i]^ do
     begin
		vx:= v^[1,i];vy:=v^[2,i];vz:=v^[3,i];mass:=m[i];
     end;
   end
  end;
  procedure radvance(   dt:real);
  var
   i, j:integer;dx,dy,dz,distance,mag:realt;
   b,b2:pplanet;
  begin
    for i:=1 to n do begin
     b := planets[i];
    for j := i + 1to n do begin
      b2 := (planets[j]);
       dx := b^.x - b2^.x;
       dy := b^.y - b2^.y;
       dz := b^.z - b2^.z;
       distance := sqrt(dx * dx + dy * dy + dz * dz);
       mag := dt / (distance * distance * distance);
       b^.vx :=b^.vx- dx * b2^.mass * mag;
       b^.vy := b^.vy -dy * b2^.mass * mag;
       b^.vz :=b^.vz - dz * b2^.mass * mag;
       b2^.vx := b2^.vx +dx * b^.mass * mag;
       b2^.vy := b2^.vy +dy * b^.mass * mag;
       b2^.vz := b2^.vz +dz * b^.mass * mag;
    end
  end
  end;

function distance(p1,p2 : integer) : realt;
var dv:array[1..3 ,0..0] of realt;
begin

  dv[1..3]:=x^[1..3,p1]-x^[1..3,p2];
  distance:=sqrt(\+ \+ dv*dv);
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
	{new(a );}
	{new (M );
	{new(di );{new(disq);
	new(sqdi );}
	new(d );
	offsetMomentum;

	x^[1..3,1..nbodies]:=trans pmat[1..nbodies,1..3];
	v^[1..3,1..nbodies]:=trans vmat[1..nbodies,1..3];

	M[1..nbodies] := mass[1..nbodies];

	(*! give all other bodies velocity of neptune and positions going out in line from it. *)


        for i:=1 to 3 do for j:=nbodies+1 to N do
        begin
		     x^[i,j]:= x^[i,nbodies ] + j* 1.0/N;
	         v^[i,j]:= v^[i,nbodies ];
	    end;

	M[nbodies+1..N]:= M[nbodies-1]*0.01;
	if dump then
	begin
		assign(txt,'bodies.txt');rewrite(txt);
		write(txt,N);
		for i:= 1 to n do begin

		  write(txt, M[i]:19:14);
		end;
		{readln;}

		for j:=1 to 3 do begin for i:= 1 to n do write(txt, x^[j,i]:19:14); ;end;


		for j:=1 to 3 do begin for i:= 1 to n do write(txt, v^[j,i]:19:14); end;
		  close(txt);
	end else
	begin
		assign(txt,'bodies.txt');reset(txt);
		{writeln('ready to read');}
		read  (txt,Nin);
		if nin <> N then begin
			writeln(' data file does not include ',n,' bodies');
		end else
		begin
		for i:= 1 to n do begin
		 read(txt,t);
		  M[i]:=t;
		end;


		for j:=1 to 3 do begin for i:= 1 to n do begin read(txt,t); x^[j,i]:=t; end;end;


		for j:=1 to 3 do begin for i:= 1 to n do begin read(txt,t); v^[j,i]:=t; end; end;

		end;
		 close(txt);{writeln('file read');}
	end;

end;


function energy : realt;
var  i,j : integer;
var en:realt;
begin
  en := 0.0;
  for i := 1 to N do
   begin
      en := en+ 0.5 * M[i] * (sqr(v^[3,i]) + sqr(v^[1,i]) + sqr(v^[2,i]));
      for j := i+1 to N do
        en := en - (M[i] * M[j]) / distance(i,j);
    end;
    energy:=en;
    writeln(en:19:14);
end;



procedure advance(dt : realt);
var i,j,k :integer;t:real;
    row:array[1..3]of real;
    distance,mag,temp:vect;di :matr;
    xp,yp,zp:^vect;
    const epsilon=0.00000001;
begin{$r-}
	for i:= 1 to N-1 do
	begin
		row:=x^[iota 0,i];
		(*! Compute the displacement vector between each planet and planet i.*)
		di:=  row[iota[0]]- x^;
		(*! Next compute the euclidean distances *)
		xp:=@ di[1,1];yp:=@di[2,1];zp:=@di[3,1];
		distance:= sqrt(xp^*xp^+ yp^*yp^+ zp^*zp^)+epsilon;
		mag:=dt/(distance *distance*distance );
		mag[1..i]:=0;
		for j:= 1 to 3 do begin
		   temp:= (m*mag*di[j,iota[0]]);
		   v^[j,i]:=v^[j,i] -\+temp ;

		end;
		 v^:=v^+m*mag*di;

	end;
	(*! Finally update positions. *)
	x^ := x^ + v^ *dt;
end;
var i:integer;t1,delay:double;
begin

      initialise(paramstr(1)='D');

     { energy;}
	t1:=secs;
      for i:=1 to runs do
            advance(0.001);
      delay:=(secs-t1)/runs;
      writeln('time per iteration :', delay);
  {    energy;}
      copyin;
      t1:=secs;
       for i:=1 to runs do
            radvance(0.001);
      delay:=(secs-t1)/runs;
      writeln('time per iteration records :', delay);
end.

