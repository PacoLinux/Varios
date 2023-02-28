PROGRAM metricunits;
TYPE measure   = ( matter, space, time);
     distance  = REAL OF space;
     interval  = REAL OF time;
     mass      = REAL OF matter;   
     acceleration = REAL OF space * time POW -2;
     velocity  = REAL OF space * time POW -1;
     force     = REAL OF matter * space * time POW -2;
CONST
{ -- measures of space }
  cmlen        = 0.01;
  inchlen      = 2.54*cmlen;
  footlen      = 12*inchlen;
  kilometerlen = 1000;
  milelen      = 1760*3 * footlen;
  mtrs :distance = 1.0;
  cms  :distance = cmlen;
  ins  :distance = inchlen;
  ft   :distance = footlen;
  kms  :distance = kilometerlen;
  miles:distance = milelen;
{ -- measures of time }
  minutelen      = 60.0;
  hourlen        = 60*minutelen;
  daylen         = 24*hourlen;
  yearlen        = 365.25* daylen;
  secs :interval = 1.0;
  mins :interval = minutelen;
  hrs  :interval = hourlen;
  yrs  :interval = yearlen;
{ -- measures of velocity }
  metersPerSecond :velocity = 1;
  milesPerHour    :velocity = milelen/hourlen;



FUNCTION compD(a:acceleration; t:interval):distance;
BEGIN
	compD:= (a * (t POW 2))/2.0;
END;

begin
write(compd(9.8 * metersPerSecond/secs,3 * hrs)/miles,'miles');
writeln(compd(2* miles /(hrs*hrs), 1*mins)/mtrs,'meters');
end.
