program acceptunary;
var fail:boolean;
 
 

 type textline=string [80];
function  failon:boolean;
begin
   fail:=true;
   write('FAIL comparison ');
   failon:= false;
end; 
 var r,r2,z,p:real;dr,dp:double;
     line:textline;
     i:integer;
     b:boolean;
     j:0..1000;
begin
        fail:=false;
        r:=-2.0;
        z:=0.0;	r2:=0.0;
	i:=round(r);
        j:=5;
        b:= r<z;
     
        if r<0.0 then begin end  else writeln(failon,' < ',r,'>=0');
        if r<z then begin end  else writeln(failon,' < ',r,'>=0') ;
        if r>0.0 then writeln(failon,' > ',r,'>=0') else 
        if r<=0.0 then begin end  else  writeln(failon,' <= ',r,'>=0') ;

        if r>=0.0 then  writeln(failon,' >= ',r,'>=0')  else  
        if r>z then  writeln(failon,' > ',r,'>=0')  else 
        if r<=z then begin end else  writeln(failon,' <= ',r,'>=0') ;
        if r>=z then  writeln(failon,' > ',r,'>=0')  else  
 
        if r2<0.0 then  writeln(failon,' < ',r2,'>=0')  else  
        if r2<z then writeln(failon,' < ',r2,'>=0') else  
        if r2>0.0 then writeln(failon,' > ',r2,'=0') else 
        if r2<=0.0 then begin end else writeln(failon,' <= ',r2,'=0') ; 

        if r2>=0.0 then begin end else writeln(r,'<0');
        if r2>z then writeln(failon,' > ',r2,'=0') else  
        if r2<=z then begin end else writeln(failon,' <= ',r2,'=0');
        if r2>=z then begin end else writeln(failon,' > ',r2,'=0');


    if not fail then writeln('PASS test of 32 bit real comparisons ');

	r:=2.0; 
        if r<0.0 then writeln(failon,' < ',r,'>=0') else  
        if r<z then writeln(failon,' < ',r2,'>=0')else  
        if r>0.0 then begin end  else writeln(failon,' < ',r2,'>=0');
        if r<=0.0 then writeln(failon,' <= ',r2,'>=0') else  
        if r>=0.0 then  begin end else writeln(failon,'>=',r,'>=0') ;
         
        if r>z then begin end else writeln(failon,'>>',r,'<=z');
        if r<=z then writeln(failon,'<=',r,'<=z') else  
        if r>=z then begin end else writeln(failon ,'>=',r,'<z');

         
        if j<0 then writeln(failon, '<',j,'<0') else  
        if j<z then writeln(failon ,'<','<z') else  
        if j>0 then begin end  else writeln(failon, '>',j,'<=0');
        if j<=0 then writeln(failon, '<=',j,'<=0') else  
        if j>=0 then  begin end  else writeln(failon,'>=',j,'<0');
        if j>z then  begin end else writeln(failon,'>',j,'<=',z);
        if j<=z then writeln(failon,'<=',j,'<=',z) else  
        if j>=z then begin end  else writeln(failon,'>=',j,'<',z)  ;

        

    if not fail then writeln('PASS test of 16 bit unsigned integer comparisons ');{i= -2}
        if i<0 then begin end  else writeln(failon,'<',i,'<0') ; 
        if i<z then begin end else writeln(failon, '<',i,'<',z) ;
        if i>0 then   writeln(failon,'>',i,'<=0');
        if i<=0 then begin end else writeln(failon, '<=',i,'<=0') ; 
        if i>=0 then   writeln(failon ,'>=',i,'<0');
        if i>z then   writeln(failon,'>',i,'<=',z);
        if i<=z then begin end else writeln(failon,'<=',i,'<=',z);
        if i>=z then   writeln(failon, '>=',i,'<',z);

    if not fail then writeln('PASS test of 32 bit integer comparisons ');

 
end.
 
