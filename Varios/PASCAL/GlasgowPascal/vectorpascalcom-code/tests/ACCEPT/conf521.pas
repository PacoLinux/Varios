{  Vector Pascal Acceptance Test
 vec021 tests  the existence of the predefined constants }
program vec021;
var f:text;
begin
   assign(f,'predefined');
   rewrite(f);
   writeln(f,'maxint':12,'pi':12,'maxchar':12,'maxstring':12);
   writeln(f,maxint:12,pi:12,maxchar:12,maxstring:12);
   writeln(f,'maxreal':12,'minreal':12,'epsreal':12,'maxdouble':12);
   writeln(f,maxreal:12,minreal:12,epsreal:12,maxdouble:12);
   writeln(f,'mindouble':12,'complexzero':12,'complexone':12);
   writeln(f,mindouble:12,complexzero:12,complexone:12);
   if (1.0<>(1.0+epsreal))  then
	writeln('PASS VEC021 section 2.1.2')
   else writeln('FAIL VEC021 section 2.1.2 epsreal');
         
end.
