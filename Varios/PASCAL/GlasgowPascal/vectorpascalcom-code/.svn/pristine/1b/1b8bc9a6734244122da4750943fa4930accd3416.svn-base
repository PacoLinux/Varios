{ The Computer Language Benchmarks Game

  http://shootout.alioth.debian.org

 

  contributed by Ian Osgood,

  modified by Florian Klaempfl

  modified by Ales Katona

  modified by Vincent Snijders

}

 

program n_body;

{$r-} 

{uses math;}

 

 

const pi = 3.141592653589793;

      solarMass = 4 * pi * pi;

      daysPerYear = 365.24;

      nobodies=5;

type realt=real;

type RowVec=array[1..nobodies] of realt;

type ColVec=array[1..3] of realt;

type bodyNames=array[1..nobodies] of string;

type mat=array[1..nobodies] of ColVec;

Const pmatinit : mat = ((0.0,0.0,0.0),

                        (4.84143144246472090e+00,-1.16032004402742839e+00,-1.03622044471123109e-01),

                        (8.34336671824457987e+00,4.12479856412430479e+00,-4.03523417114321381e-01),

                        (1.28943695621391310e+01,-1.51111514016986312e+01, -2.23307578892655734e-01),

                        (1.53796971148509165e+01,-2.59193146099879641e+01,1.79258772950371181e-01));

Const vmatinit:mat =((0.0,0.0,0.0),

                        (1.66007664274403694e-03 * daysPerYear,7.69901118419740425e-03 * daysPerYear,-6.90460016972063023e-05 * daysPerYear),

                        (-2.76742510726862411e-03 * daysPerYear,4.99852801234917238e-03 * daysPerYear, 2.30417297573763929e-05 * daysPerYear),

                        (2.96460137564761618e-03 * daysPerYear,2.37847173959480950e-03 * daysPerYear,  -2.96589568540237556e-05 * daysPerYear),

                        (2.68067772490389322e-03 * daysPerYear,1.62824170038242295e-03 * daysPerYear,-9.51592254519715870e-05 * daysPerYear));

 

Const b : bodyNames= ('Sun','Jupiter','Saturn','Uranus','Neptune');

Const mass : RowVec = (solarMass,9.54791938424326609e-04*solarMass,2.85885980666130812e-04*solarMass,4.36624404335156298e-05*solarMass,5.15138902046611451e-05*solarMass);
var pmat,vmat:mat;
 

procedure offsetMomentum;

var mv:ColVec;

i : integer;

begin
  mv:=0.0;
  for i := 1 to nobodies do
       mv:=mv-(vmat[i]*mass[i]);
  vmat[1]:=mv/solarMass;
end;

 

function distance(p1,p2 : integer) : realt;
var dv:ColVec;
begin
  dv:=pmat[p1]-pmat[p2];
  distance:=sqrt(\+ dv*dv);
end;

function energy : realt;

var  i,j : integer;

var en:realt;

begin

  en := 0.0;

  for i := 1 to nobodies do

   begin

      en := en+ 0.5 * mass[i] * (sqr(vmat[i,1]) + sqr(vmat[i,2]) + sqr(vmat[i,3]));

      for j := i+1 to nobodies do

        en := en - (mass[i] * mass[j]) / distance(i,j);

    end;

    energy:=en;

    writeln(en);

end;

 

procedure advance(dt : realt);
 const version=2;

 var v1,v2,v3:ColVec;

 var mag,dis : realt;
     dist:array[1..nobodies,1..nobodies] of realt;
     mati,matj,vmati,massi,vmatj,massj:^colvec;
     tpos:colvec;

 var i,j : integer;
begin
 
  for i := 1 to nobodies do
  begin
     
      for j := i+1 to nobodies do
      begin
            if version=1 then begin
	      dis:=sqrt(\+(  (pmat[i] -pmat[j])* (pmat[i] -pmat[j]) ));
              mag:=dt/(dis*dis*dis);
              v1:= mag*(pmat[i]-pmat[j]);{}
              vmat[i]:=vmat[i]-(mass[j]*v1);
              vmat[j]:=vmat[j]+(mass[i]*v1);
            end else
            begin { version 2 is a bit faster due to having a temporary vector tpos }
              tpos:=pmat[i]-pmat[j];
              dis:=sqrt( tpos.tpos);
              {mag:=dt/(dis*dis*dis);
              v1:= mag*(tpos); }
              v1:= tpos*dt/(dis*dis*dis);
              vmat[i]:=vmat[i]-(mass[j]*v1);
              vmat[j]:=vmat[j]+(mass[i]*v1);
            end;
      end;
  end;
  pmat:= pmat+vmat * dt;

end;

var i:integer;  


begin
	  pmat:=pmatinit;
	  vmat:=vmatinit;
      offsetMomentum;
      energy;
      for i:=1 to 1000000 do
            advance(0.01);

      energy;
end.

