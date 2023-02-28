unit mattests;
interface
const veclen =64; maxpix=255;
      repeats = 100000;
type    vecrange = 0..veclen-1; 
 
       
const permv:array[0..3] of integer=(3,1,2,0);
 type short=-1..10000; 
        bytevec = array[vecrange] of byte;	bytemat = array[vecrange]of bytevec;
        realvec= array [vecrange] of real;	realmat = array[vecrange]of realvec;
        intvec = array[vecrange] of integer;	intmat = array[vecrange]of intvec;
	shortvec= array[vecrange]of short;	shortmat = array[vecrange]of shortvec;
	pixvec=array[vecrange]of pixel;		pixmat = array[vecrange]of pixvec;
        dvec =array[vecrange] of double;	dmat = array[vecrange]of dvec;
        
 tplain = array[0..maxpix ,0..maxpix] of pixel;

var 

    
     m1:array[1..3,0..4] of integer;
     m2:array[0..4,1..3] of integer;
implementation
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

 
 
var    	r1,r2,r3:realvec;	rm,rm1:realmat;
       	i1,i2,i3:intvec;	im,im1:intmat;
       	b1,b2,b3:bytevec;	bm,bm1:bytemat;
       	s1,s2,s3:shortvec;	sm,sm1:shortmat;
	p1,p2,p3:pixvec;	pm,pm1:pixmat;
	d1,d2,d3:dvec;		dm,dm1:dmat;
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
	rm:=r3;
	rm1:=rm+1;
	im:=i2;
	im1:=im+1;
	sm:=s2;
	sm1:=sm+1;
	pm:=p3;
	pm1:=pm * 0.5;
        bm:=b3;
	bm1:=b2;
	end;

 procedure showtime;
	var sec,duration,rate:double;
	begin
		sec:=secs;
		duration:=sec-oldtime;
		write( duration); {  }
		rate :=ops/duration;
		write( rate/1000000,'M ops per sec');
		oldtime:=sec;
	end;
	procedure vpixmul;
       var i:integer;
       begin     
		for i:=1 to repeats do 
			pm1:=pm*p2 ;
       end;
       procedure vpixadd;
       var i:integer;
       begin     
		for i:=1 to repeats do 
			pm1:=pm+p3;
       end;
       procedure vbyteadd;
       var i:integer;
       begin     
		for i:=1 to repeats do 
			bm1:=bm+b3;
       end;
       procedure satvbyteadd;
       var i:integer;
       begin     for i:=1 to repeats do 
			bm1:=bm+:b3;
       end;
       procedure vshortadd;
       var i:integer;
       begin     for i:=1 to repeats do sm1:=sm+s3;
       end;
       procedure vintadd;
       var i:integer;
       begin     for i:=1 to repeats do im1:=im+i3;
       end;
       procedure vdadd;
       var i:integer;
       begin     for i:=1 to repeats do dm1:=dm+d3;
       end;
 procedure vrealadd;
       var i:integer;
       begin     for i:=1 to repeats do rm1:=r2+r3;
       end;
       procedure vrealdp;
       var i:integer;r:real;
       begin     for i:=1 to repeats do r1:=\+ rm*r3;
       end;
 procedure vddp;
       var i,j:integer;r:double;
       begin     for i:=1 to repeats do 
		for j:=0 to veclen-1 do d1[j]:=\+ dm[j]*d3;
       end;
 procedure vintdp;
       var i:integer;r:integer;
       begin     for i:=1 to repeats do i1:=\+ im*i3;
       end;
procedure vshortdp;
       var i:integer;r:integer;
       begin     for i:=1 to repeats do s1:=\+ sm*s3;
       end;
 
 procedure vseprealdp;
       var i:integer;r:real;
       begin     for i:=1 to repeats do begin rm1:= rm*r3;r1:=\+rm1; end
       end;
procedure vsepddp;
       var i:integer;r:double;
       begin     for i:=1 to repeats do begin dm1:= dm*d3;d1:=\+dm1; end
       end;
var i:integer;
    start,finish:double;
 begin
        ops:=veclen*veclen*repeats;
	transpose;
	writeln('transpose done');
    initialise;
	writeln('initialise done');
 	oldtime:=secs;
    start:=oldtime;
	writeln('start at',start);
	writeln(' start testing',ops:9:4,' vector operations global vars');;

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
	 writeln('shortint additions ');
 	vdadd;
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
	ops:=ops*2;
	 vrealdp;
	showtime;
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

 {writeln('vector performance with stack vars');
 dovectest;{}
 end.
