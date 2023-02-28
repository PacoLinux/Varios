{  Vector Pascal Acceptance Test    }
{ file conf523                      }
{:Tests  that dimensioned types are allowed }
program conf523;
type
	kms =(mass,distance,time    );
	meter=real     of distance;
	kilo=real    of mass;
	second=real     of time;
	newton=real     of mass * distance * time POW -2;
	meterpersecond     = real of distance *time POW -1;
        acc =real of distance * time POW -2;
const
	meters		:meter=1.0;
	kilograms	:kilo=1.0;
        seconds		:second=1.0;
	grams		:kilo=0.001;
        hours		:second=3600.0;
var force:newton;
    speed:meterpersecond;
    acceleration:acc;
begin
	acceleration:=(12 *meters/hours)/seconds;
        speed:= 5*seconds * acceleration;
	force:= 3*grams*acceleration;
        writeln('PASS CONF523 section 2.3.1 dimensioned types');
end.
