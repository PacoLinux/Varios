program vectests;{$r-}
const veclen =2048; maxpix=255;
      repeats = 95000;
type    vecrange = 0..veclen-1;


const permv:array[0..3] of integer=(3,1,2,0);
 type short=-1..10000;
        bytevec = array[vecrange] of byte;
        realvec= array [vecrange] of real;
        intvec = array[vecrange] of integer;
	shortvec= array[vecrange]of short;
	pixvec=array[vecrange]of pixel;
        dvec =array[vecrange] of double;
 tplain = array[0..maxpix ,0..maxpix] of pixel;

var


     m1:array[1..3,0..4] of integer;
     m2:array[0..4,1..3] of integer;
     rev:intvec;
     procedure transpose;
     var i,j:integer;
         v1:array[1..3]of integer;
	 v2:array[0..4]of integer;
 	 m0:array[0..10] of integer;

	 ma:array[0..3] of integer;
	 ra: array[0..7] of real;
	 r:real;
     begin

                v1:=iota 0;

		m0:= (iota 0)+1;
		writeln('m0');for j:=0 to 3 do write(m0[j]);writeln;
                writeln('v1');
                for i:=1 to 3 do write( v1[i]);
                writeln;
                v2:=iota 0 *2;
                writeln('v2');
                for i:=0 to 4 do write(v2[i]);
                writeln;

		m1:= (trans v1)*v2;
		writeln('(trans v1)*v2');
                for i:=1 to 3 do begin

		for j:=0 to 4 do write(m1[i,j]);
		writeln;
		end;
		m2 := trans m1;
		writeln('transpose 1..3,0..4 matrix');
                for i:=0 to 4 do begin

		for j:=1 to 3 do write(m2[i,j]);
		writeln;
		end;
		m2:= iota 0 +2*iota 1;
		writeln('m2:= iota 0 +2*iota 1 ');
                for i:=0 to 4 do begin

		for j:=1 to 3 do write(m2[i,j]);
		writeln;
		end;

		ma:=m0[permv];
                writeln('perm=');for j:=0 to 3 do write(permv[j]);writeln;
		writeln('ma:=m0[perm]');for j:=0 to 3 do write(ma[j]);writeln;
                ra:= iota 0;
		writeln('ra=');for j:= 0 to 7 do write(ra[j]);writeln;
		r:= \+ ra;
		writeln('\+ ra =',r);

     end;
(*
procedure dovectest;
var    r1,r2,r3:realvec;
       i1,i2,i3:intvec;
       b1,b2,b3:bytevec;
       s1,s2,s3:shortvec;
	p1,p2,p3:pixvec;
	d1,d2,d3:dvec;
 	oldtime,ops:double;

	procedure initialise;
	var i:integer;
	begin
	
		b3:= iota 0;
		b2 := 1+ iota 0;
		 
			p3:=iota 0;
			 p2:=p3 -0.3;
			r3:=iota 0; 
			r2:=1 +iota 0;
			I2:=iota 0;
			I3:=1+ iota 0;
			S2:=i2;
			S3:=i3;
		{	B2[I]:=2*I;
			B3[I]:=3*I;}
		 
	end;

 procedure showtime;
	var sec,duration,rate:double;
	begin
		sec:=secs;
		duration:=sec-oldtime;
               write(sec, oldtime,duration,'  ');{ }
		rate :=ops/duration;
		write( rate/1000000,'M ops per sec');
		oldtime:=sec;
	end;
	procedure vpixmul;
       var i:integer;
       begin
		for i:=1 to repeats do
			p1:=p2*p3;
       end;
       procedure vpixadd;
       var i:integer;
       begin
		for i:=1 to repeats do
			p1:=p2+p3;
       end;
       procedure vbyteadd;
       var i:integer;
       begin
		for i:=1 to repeats do
			b1:=b2+b3;
       end;
       procedure satvbyteadd;
       var i:integer;
       begin     for i:=1 to repeats do
			b1:=b2+:b3;
       end;
       procedure vshortadd;
       var i:integer;
       begin     for i:=1 to repeats do s1:=s2+s3;
       end;
       procedure vintadd;
       var i:integer;
       begin     for i:=1 to repeats do i1:=i2+i3;
       end;
       procedure vdadd(var d1,d2,d3:dvec);
       var i:integer;
       begin     for i:=1 to repeats do d1:=d2+d3;
       end;
 procedure vrealadd;
       var i:integer;
       begin     for i:=1 to repeats do r1:=r2+r3;
       end;
       procedure vrealdp;
       var i:integer;r:real;
       begin     for i:=1 to repeats do r:=\+ r2*r3;
       end;
 procedure vddp;
       var i:integer;r:double;
       begin     for i:=1 to repeats do r:=\+ d2*d3;
       end;
 procedure vintdp;
       var i:integer;r:integer;
       begin     for i:=1 to repeats do r:=\+ i2*i3;
       end;
procedure vshortdp;
       var i:integer;r:integer;
       begin     for i:=1 to repeats do r:=\+ s2*s3;
       end;

 procedure vseprealdp;
       var i:integer;r:real;
       begin     for i:=1 to repeats do begin r1:= r2*r3;
       r:=\+r1; end
       end;
procedure vsepddp;
       var i:integer;r:double;
       begin     for i:=1 to repeats do begin d1:= d2*d3;
       r:=\+d1; end
       end;
var i:integer;
    start,finish:real;
 begin
        ops:=veclen*repeats;
	transpose;initialise;
 	oldtime:=secs;start:=oldtime;
	writeln(' start testing',ops,' vector operations');;

	 vbyteadd;
	 showtime;
	 writeln(' byte additions ');
         satvbyteadd;{ }
	showtime;
	writeln(' saturated byte additions');
	vintadd;
	showtime;
	writeln(' int additions');
	vshortadd;
	showtime;
	 initialise;writeln('shortint additions ');
 	vdadd(d1,d2,d3);
	showtime;
	 writeln('double precision real additions ');    {  }
	 vrealadd;
	showtime;
	 writeln('real additions ');    {  }
	vpixadd;
	 showtime;
	 writeln(' pixel additions ');
         vpixmul;
	 showtime;
	 writeln(' pixel multiplications ');
	ops:=ops*2.0;
	 vrealdp;
	showtime;initialise;
	 writeln('real dot product multiply accumulates ');
	vddp;
	showtime;
	 writeln('double precision real dot product multiply accumulates ');
	 vintdp;
	showtime;
	 writeln('integer dot product multiply accumulates ');
         vshortdp;
	showtime;
	 writeln('short dot product multiply accumulates ');
	 vseprealdp;
	showtime;
	 writeln('real dot product multiply accumulates done as 2 stages ');
 	vsepddp;
	showtime;
	 writeln('double precision real dot product multiply accumulates done as 2 stages ');
	 finish:=secs;
        writeln(finish-start,'secs');
end;*)

var    r1,r2,r3:realvec;
       i1,i2,i3:intvec;
       b1,b2,b3:bytevec;
       s1,s2,s3:shortvec;
	p1,p2,p3:pixvec;
	d1,d2,d3:dvec;
 	oldtime,ops:double;

	procedure initialise;
	var i:integer;
	begin
		for i:=0 to veclen -1 do begin
			p3[i]:=i;
            p2[i]:=2*i -7;
			r3[i]:=p3[i];
			r2[i]:=p2[i];
			I2[I]:=P2[I];
			I3[I]:=P3[I];
			S2[I]:=i2[I];
			S3[I]:=i3[I];
			B2[I]:=2*I;
			B3[I]:=3*I;

		end;
	end;

 procedure showtime;
	var sec,duration,rate:double;
	begin
		sec:=secs;
		duration:=sec-oldtime;
		write( duration,' '); {  }
		rate :=ops/duration;
		write(rate,' ', rate*0.000001,'M ops per sec');
		oldtime:=sec;
	end;
	procedure vpixmul;
       var i:integer;
       begin
       {$par}
		for i:=1 to repeats do
			p1:=p2*p3;
       end;
       procedure vpixadd;
       var i:integer;
       begin
       {$par}
		for i:=1 to repeats do
			p1:=p2+p3;
       end;
       procedure vbyteadd;
       var i:integer;
       begin
       {$par}
		for i:=1 to repeats do
			b1:=b2+b3;
       end;
       procedure satvbyteadd;
       var i:integer;
       begin  
       {$par}
          for i:=1 to repeats do
			b1:=b2+:b3;
       end;
       procedure vshortadd;
       var i:integer;
       begin 
       {$par}
           for i:=1 to repeats do s1:=s2+s3;
       end;
       procedure vintadd;
       var i:integer;
       begin     for i:=1 to repeats do i1:=i2+i3;
       end;
       procedure vdadd;
       var i:integer;
       begin  
       {$par}   
       for i:=1 to repeats do d1:=d2+d3;
       end;
 procedure vrealadd;
       var i:integer;
       begin     
       for i:=1 to repeats do 
       r1:=r2+r3;
       end;
procedure vrealrev;
       var i:integer;r:real;
       begin  
       {$par}
          for i:=1 to repeats do 
       r1:=r2[rev];
       end;
procedure vrealsqrt;
       var i:integer;r:real;
       begin  
       {$par}
          for i:=1 to repeats do r1:=sqrt(r2 );
       end;
procedure vrealdp;
       var i:integer;r:real;
       begin     for i:=1 to repeats do r:=\+ r2*r3;
       end;
 procedure vddp;
       var i:integer;r:double;
       begin 
       {$par}
           for i:=1 to repeats do r:=\+ d2*d3;
       end;
 procedure vintdp;
       var i:integer;r:integer;
       begin     for i:=1 to repeats do r:=\+ i2*i3;
       end;
procedure vshortdp;
       var i:integer;r:integer;
       begin 
       {$par}
           for i:=1 to repeats do r:=\+ s2*s3;
       end;

 procedure vseprealdp;
       var i:integer;r:real;
       begin    
       {$par}
        for i:=1 to repeats do 
       begin 
       r1:= r2*r3;
       r:=\+r1;
        end
       end;
procedure vsepddp;
       var i:integer;r:double;
       begin   
       {$par}
         for i:=1 to repeats do begin d1:= d2*d3;r:=\+d1; end
       end;
var i:integer;
    start,finish:double;
 begin
    rev:=veclen-iota[0]-1;
   { writeln(rev);}
        ops:=veclen*repeats*1.0;
	transpose;
	writeln('transpose done');
    initialise;
	writeln('initialise done');
 	oldtime:=secs;
    start:=oldtime;
	writeln('start at',start);
	writeln(' start testing',ops:9:4,' vector operations global vars');;

	vbyteadd;	 showtime;	 writeln(' byte additions ');
    satvbyteadd;{ }	showtime;	writeln(' saturated byte additions');
	vintadd;	showtime;	writeln(' int additions');
	vshortadd;	showtime;	 writeln('shortint additions ');
 	vdadd;showtime;writeln('double precision real additions '); 
	vrealrev;showtime;writeln('real vector reverse ');
 
	vrealadd;showtime; writeln(' real additions ');     
    vrealsqrt;showtime; writeln(' real sqrt ');     
	vpixadd;showtime;writeln(' pixel additions ');
    vpixmul;showtime;writeln(' pixel multiplications ');
	ops:=ops*2;
	vrealdp;	showtime;	 writeln(' real dot product multiply accumulates ');
	vddp;	showtime;	 writeln(' double precision real dot product multiply accumulates ');
	vintdp;	showtime;	 writeln(' integer dot product multiply accumulates ');
    vshortdp;	showtime;	 writeln('short dot product multiply accumulates ');
	vseprealdp;	showtime;	 writeln('real dot product multiply accumulates done as 2 stages ');
 	vsepddp;	showtime;	 writeln('double precision real dot product multiply accumulates done as 2 stages ');
	 finish:=secs;
        writeln(finish-start,'secs');

 {writeln('vector performance with stack vars');
 dovectest;{}
 end.
