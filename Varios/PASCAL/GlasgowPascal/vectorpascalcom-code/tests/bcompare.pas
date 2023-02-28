program bcompare;
const a:array[boolean,boolean] of boolean=
           ((true,true),(false,false));
      b:array[boolean,boolean] of boolean=
           ((true,false),(true,false));
begin
	writeln('boolean operations  between ',a,' and ',b);
	
	write('<>',  a<>b);
	write('= ',  a=b);	
	write('< ',  a<b);
	write('> ',  a>b);
	write('<=',  a<=b);
	write('>=',  a>=b);
	write('AND', a AND b);
	write('OR ', a OR B);
end.

