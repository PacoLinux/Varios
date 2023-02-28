unit Testunary;
interface
{uses math;}
procedure unaries;
implementation

procedure unaries;

 type textline=string [80];

 var r,z,p:real;dr,dp:double;
     line:textline;
     i:integer;
     b:boolean;
     j:0..1000;
begin

        r:=-2.0;
        z:=0.0;	
	i:=round(r);
        j:=5;
        b:= r<z;
        writeln('test real comparisons');
        if r<0.0 then writeln(r ,'<0') else writeln(r,'>=0');
        if r<z then writeln(r,'<z') else writeln(r,'>=z');
        if r>0.0 then writeln(r,'>0') else writeln(r,'<=0');
        if r<=0.0 then writeln(r,'<=0') else writeln(r,'>0');

        if r>=0.0 then writeln(r,'>=0') else writeln(r,'<0');
        if r>z then writeln(r,'>z') else writeln(r,'<=z');
        if r<=z then writeln(r,'<=z') else writeln(r,'>z');
        if r>=z then write(r,'>=z') else write(r,'<z');
r:=0.0;writeln;
 writeln('r=',r,'z=',z);
        if r<0.0 then writeln(r,'<0') else writeln(r,'>=0');
        if r<z then writeln(r,'<z') else writeln(r,'>=z');
        if r>0.0 then writeln(r,'>0') else writeln(r,'<=0');
        if r<=0.0 then writeln(r,'<=0') else writeln(r,'>0');

        if r>=0.0 then writeln(r,'>=0') else writeln(r,'<0');
        if r>z then writeln(r,'>z') else writeln(r,'<=z');
        if r<=z then writeln(r,'<=z') else writeln(r,'>z');
        if r>=z then write(r,'>=z') else write(r,'<z');


	r:=2.0;writeln;
 writeln('r=',r,'z=',z);
        if r<0.0 then writeln(r,'<0') else writeln(r,'>=0');
        if r<z then writeln(r,'<z') else writeln(r,'>=z');
        if r>0.0 then writeln(r,'>0') else writeln(r,'<=0');
        if r<=0.0 then writeln(r,'<=0') else writeln(r,'>0');

        if r>=0.0 then writeln(r,'>=0') else writeln(r,'<0');
        if r>z then writeln(r,'>z') else writeln(r,'<=z');
        if r<=z then writeln(r,'<=z') else writeln(r,'>z');
        if r>=z then write(r,'>=z') else write(r,'<z');

         writeln('test unsigned 16 bit comparisons');
        if j<0 then writeln(j,'<0') else writeln(j,'>=0');
        if j<z then writeln(j,'<z') else writeln(j,'>=z');
        if j>0 then writeln(j,'>0') else writeln(j,'<=0');
        if j<=0 then writeln(j,'<=0') else writeln(j,'>0');
        if j>=0 then writeln(j,'>=0') else writeln(j,'<0');
        if j>z then writeln(j,'>z') else writeln(j,'<=z');
        if j<=z then writeln(j,'<=z') else writeln(j,'>z');
        if j>=z then write(j,'>=z') else write(j,'<z');

        writeln('test signed comparisons');
        if i<0 then writeln(i,'<0') else writeln(i,'>=0');
        if i<z then writeln(i,'<z') else writeln(i,'>=z');
        if i>0 then writeln(i,'>0') else writeln(i,'<=0');
        if i<=0 then writeln(i,'<=0') else writeln(i,'>0');
        if i>=0 then writeln(i,'>=0') else writeln(i,'<0');
        if i>z then writeln(i,'>z') else writeln(i,'<=z');
        if i<=z then writeln(i,'<=z') else writeln(i,'>z');
        if i>=z then write(i,'>=z') else write(i,'<z');

 	
	writeln('12.34,trunc(12.34),trunc(-12.34)');
	writeln(12.34,trunc(12.34),trunc(-12.34)) ;
	writeln('12.34,round(12.34),round(-12.34)');
	writeln(12.34,round(12.34),round(-12.34));   
	writeln('12.34,int(12.34),int(-12.34)');
	writeln(12.34,int(12.34),int(-12.34));{}
	r:=12.34; 
        writeln('r,trunc(r),trunc(-r)'); {}
	writeln(r,trunc(r),trunc(-r)) ;{} 
	writeln('r,round(r),round(-r)');
	writeln(r,round(r),round(-r));
	writeln('r,int(r),int(-r)');
	writeln(r,int(r),int(-r));    {}
	
	writeln('12.34,ln(12.34) ');
	writeln(12.34,ln(12.34) ) ;
	writeln('12.34,sqrt(12.34) ');
	writeln(12.34,sqrt(12.34) );
	writeln('12,sqrt(12) ');
	writeln(12,sqrt(12) );
	writeln('12.34,sin(12.34),sin(-12.34)');
	writeln(12.34,sin(12.34),sin(-12.34));{}
        writeln('r,ln(r),ln(-r)'); {}
	writeln(r,ln(r),ln(-r)) ;{}
	writeln('r,sqrt(r),sqrt(-r)');
	writeln(r,sqrt(r),sqrt(-r));
	writeln('r,sin(r),sin(-r)');
	writeln(r,sin(r),sin(-r));    {}
	
 
	writeln('12.34,abs(12.34),abs(-12.34)');{}
	writeln(12.34,abs(12.34),abs(-12.34)) ;{}
	writeln('12.34,sqr(12.34),sqr(-12.34)');
	writeln(12.34,sqr(12.34),sqr(-12.34));
	writeln('12.34,cos(12.34),cos(-12.34)');
	writeln(12.34,cos(12.34),cos(-12.34));{}
        writeln('r,abs(r),abs(-r)'); {}
	writeln(r,abs(r),abs(-r)) ;{}
	 writeln('i,abs(i),abs(-i)'); {}
	writeln(i,abs(i),abs(-i)) ;{}
	writeln('r,sqr(r),sqr(-r)');
	writeln(r,sqr(r),sqr(-r));
	writeln('r,cos(r),cos(-r)');
	writeln(r,cos(r),cos(-r));    {}
	writeln('test 32 bit real arithmetic ');
	r:=2.0;
	p:=3.1;
	writeln('p op r  for p=',p,' r=',r);
	writeln('+ ','- ', '* ', '/ ','max','min');
	writeln(p+r,p-r,p*r,p/r,p max r, p min r);
	writeln('p op 1000000.1  for p=',p);
	writeln('+ ':18:8,'- ':18:8, '* ':18:8, '/ ':1:8);
	writeln(p+1000000.1:18:8,p-1000000.1:18:8,p*1000000.1:18:8,p/1000000.1:18:8);

 {       writeln('test 64 bit real arithmetic ');
	dr:=2.0;
	dp:=3.1;
	writeln('p op r  for p=',p,' r=',r);
	writeln('+ ','- ', '* ', '/ ','max','min');
	writeln(dp+dr,dp-dr,dp*dr,dp/dr,dp max dr, dp min dr);
	writeln('p op 1000000.1  for p=',dp);
	writeln('+ ':18,'- ':18, '* ':18, '/ ':18);
	writeln(dp+1000000.1:18:8,dp-1000000.1:18:8,dp*1000000.1:18:8,dp/1000000.1:18:8);
  }

end;
begin
end.
 
