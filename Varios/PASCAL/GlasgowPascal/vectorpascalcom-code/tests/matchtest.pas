program matchtest;
uses bmp,pyrlib,matchlib;
var name:string[40];
    saved:text;
    dog,mono:boolean;
    piml,pimr,temp,warped:pimage;i,j:integer;
    ppyr,ppyl,matched:pimpyr;starttime,finaltime,duration:double;
    quality:real;
    FUNCTION matchquality:double;
    var i,j:integer; quality:double;
        n:string[3];

    BEGIN
    writeln('about to match');
       matched:=match(ppyl,ppyr);
       writeln('warp by disparity');
       warpAbyDisparity(pimr^,warped^,matched^[1]^);

       freepyramid(matched);
       n:='s00';
       n[2]:=chr(ord('0')+maxiter);
       n[3]:=chr(ord('0')+maxsmooth);
       writeln(n);
	   storebmpfile('warped'+n+'.bmp',warped^ ) ;
       quality:=0;

       quality:=\+ \+ \+  (piml^ -warped^)*(piml^ -warped^);
       matchquality:= 1 -quality/(pimr^.maxrow*pimr^.maxcol*3);
    END ;
    PROCEDURE  setbias(epsilon, ybias:real);
    BEGIN
      biases[above..below]:=epsilon;
      biases[moveleft..moveright]:=ybias;
    END ;
    PROCEDURE  optimisebiases;
    var best,bestepsilon,bestybias,epsilon,ybias,q:real;
        bestiter,i,j,bestsmooth:integer;
    BEGIN
       best:=0;
       bestiter:=1;bestsmooth:=1;


				for j:= 1 to 2 do
                for i :=1 to 2 do
					BEGIN
	                    maxiter:=i;
	                    maxsmooth:=j;

						write( maxiter,maxsmooth);
						q:=matchquality;
						writeln(' ->',q);
						if q>best then
						BEGIN
						  best:=q;
						   bestsmooth:=j;
						  bestiter:=i;
						END ;
					END ;


       maxiter:=bestiter;maxsmooth:=bestsmooth;
       writeln('optimal biases',biases);writeln(' maxiter ', maxiter,'maxsmooth',maxsmooth);

     END ;
BEGIN
dog:= (paramstr(3)='DOG' );
mono:= paramstr(3)='MONO';
 name:=paramstr(1);
 writeln(name);

 if loadbmpfile(name, piml) then begin
	 name:=paramstr(2);
	 writeln(name);

	 if loadbmpfile(name, pimr) then begin
	     if mono then begin
	       new(temp,0,pimr^.maxrow,pimr^.maxcol);
	       temp^:= pimr^;
	       pimr:=temp;
	       new(temp,0,pimr^.maxrow,pimr^.maxcol);
	       temp^:= piml^;
	       piml:=temp;
	     end;
		 new(warped, pimr^.maxplane,pimr^.maxrow,pimr^.maxcol);
		 starttime:=secs;
		 if dog then
		 begin
		  ppyl:=createDifferenceOfGaussianPyramidFromImage(piml^);
		  ppyr:=createDifferenceOfGaussianPyramidFromImage(pimr^);
		 end
		 else
		 begin
		  ppyl:=createGaussianPyramidFromImage(piml^);
		  ppyr:=createGaussianPyramidFromImage(pimr^);
		 end;
		  {optimisebiases;
		   starttime:=secs;{}
		 matched:=match(ppyl,ppyr);

		finaltime:=secs;

		 writeln('for image of ',piml^.maxplane+1,' planes ', piml^.maxrow+1,' rows and',
		          piml^.maxcol+1,' columns and a pyramid depth of ', octaves,
		          'a kernel size of ', kernel_size,' it took ',
		          finaltime - starttime,' seconds to do match   ' );
		 if enablepolynomials then write('polynomial interpolation was enabled ');
		 if integerposition then write(' warping to integer positions only ');
		 if usema5 then write(' using optimal multiply accumulate');
		 writeln( 'cache size assumed to be ',cachesize);
		 writeln;
		 warpAbyDisparity(pimr^,warped^,matched^[1]^);
		  storebmpfile('warped.bmp',warped^ ) ;
		warped^:=piml^-warped^;
		  storebmpfile('diff.bmp',warped^);

		{
		  for i:= 1 to octaves do BEGIN
		  name:='l0';

		  name[2]:=chr(ord('A')+i);
		   storebmpfile(name+'left.bmp', ppyl^[i]^);
		    storebmpfile(name+'right.bmp', ppyr^[i]^);
		    new(temp, 2,ppyl^[I]^.MAXROW,PPYl^[i]^.maxcol);
		    temp^:= ppyl^[i]^-ppyr^[i]^;
		    storebmpfile(name+'difflr.bmp',temp^);
		    warpAbyDisparity(ppyr^[i]^,temp^,matched^[i]^);
		    storebmpfile(name+'warped.bmp',temp^);
		   temp^:= ppyl^[i]^-temp^;
		    storebmpfile(name+'diff.bmp',temp^);
		   outputgrey(name+'xdisparity.bmp',matched^[i]^,xplane,4.0/matched^[i]^.maxcol);
		    outputgrey(name+'ydisparity.bmp',matched^[i]^,yplane,4.0/matched^[i]^.maxrow);
		    outputgrey(name+'confidence.bmp', matched^[i]^,confidenceplane,1.0);



		    END ;{}
		    freepyramid(matched);
	  end;
  end;
END .
