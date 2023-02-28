{$r+ switch of bounds checking using r- for perfomance, when debugging enable this with r+}

UNIT   pyrlib;
interface
uses bmp;
const
  octaves=10;
  kernel_size=5;
  cachesize=2000000;
  scalefactor =1.414;
  useMA5 = true; {MA5 is an optimised convolution for 5 element kernels }
 (*!
  An image pyramid is basically an array of pointers to images
   in which the successive images inthe array are smaller, thus
   if $p$ is a pyramid $p_1$ will be the base of the pyramid,
   ie, the biggest image.
 * *)
 type
        impyr = array[1..octaves] of pimage;
        pimpyr = ^ impyr;
        kernel=array[1..kernel_size] of real;
  PROCEDURE  pconv(VAR im:image;VAR kerr:kernel);
  FUNCTION createGaussianPyramidFromImage(VAR im:image):pimpyr;
  FUNCTION createDifferenceOfGaussianPyramidFromImage(VAR im:image):pimpyr;
  FUNCTION createEmptyPyramid(planes,rows,cols:integer):pimpyr;
  PROCEDURE  freepyramid(VAR p:pimpyr);
  PROCEDURE  interpolateAOntoB(A,B:pimage);
   (*! Perform linear interpolation of image A onto image B *)
implementation

const
 sigma=2;
  pi=3.1415926;
  useflatimages=false;
  VAR kern:kernel;



  FUNCTION createDifferenceOfGaussianPyramidFromImage(VAR im:image):pimpyr;
  const identity:kernel=(0.0,0.0,1.0,0.0,0.0);
  VAR k2:kernel;
      p:pimpyr;
      i:integer;
  BEGIN
	k2:= identity - kern;
	p:= createGaussianPyramidFromImage( im);
	for i:= octaves -1 downto 1 do pconv(p^[i]^,k2);
	createDifferenceOfGaussianPyramidFromImage:=p;
  END  ;
  PROCEDURE  freepyramid(VAR p:pimpyr);
  (*! free all the memory used by a pyramid *)
  VAR i:integer;
  BEGIN
	for i:= 1 to octaves do dispose(p^[i]);
	dispose(p);
  END  ;
  FUNCTION createEmptyPyramid(planes,rows,cols:integer):pimpyr;
  VAR p:pimpyr;i:integer;pi:pimage;
  BEGIN
	new (p);
	for i:= 1 to octaves do
	BEGIN
	  new(pi,planes -1,rows-1,cols-1);
	  p^[i]:=pi;
	  cols := trunc(cols / scalefactor);
	  rows := trunc(rows / scalefactor);
	END  ;
	createEmptyPyramid:=p;
  END  ;

PROCEDURE  pconv(VAR im:image;VAR kerr:kernel);
(*!

Convolution of an image by a matrix of real numbers can be used to
smooth or sharpen an image, depEND  ing on the matrix used.
If $A$ is an output image, $K$ a convolution matrix, then
if $B$ is the convolved  image
$$B_{y,x}=\sum_i\sum_j A_{y+i,x+j}K_{i,j}$$

A separable convolution kernel is a vector of real numbers that can be
applied indepEND  ently to the rows and columns of an image to provide filtering.
It is a specialisation of the more general
convolution matrix, but is algorithmically more efficient to implement.

If {\bf k} is a convolution vector, then the corresponding matrix $K$ is
such that $K_{i,j}={\bf k}_i {\bf k}_j$.

Given a starting image $A$ as a two dimensional array of pixels, and a
three element kernel $ c_1, c_2, c_3$, the algorithm first forms a temporary
array $T$ whose whose elements are the
weighted sum of adjacent rows $T_{y,x}=c_1A_{y-1,x}+c_2A_{y,x}+c_3A_{y+1,x}$.
Then in a second phase it sets the original image to be the weighted sum
of the columns of the temporary array:
$A_{y,x}=c_1T_{y,x-1}+c_2T_{y,x}+c_3T{y,x+1}$.

Clearly the outer edges of the image are a special case, since the convolution
is defined over the neighbours of the pixel, and the pixels along the boundaries
a missing one neighbour. A number of solutions are available for this, but
for simplicity we will perform only vertical convolutions on the left and right
edges and horizontal convolutions on the top and bottom lines of the image.


*)
TYPE plane(rows,cols:integer)=ARRAY[0..rows,0..cols] OF real;

VAR T,l:^plane;


    i,middle,margin:integer;
    PROCEDURE  multacc(VAR acc,term:plane;factor:real; add:boolean);
    (*! this adds term*factor to acc if add is true otherwise sets acc to term*factor *)
    BEGIN
       if add then begin
		acc:=acc+term*factor;
	   end
	   else acc:=term*factor;
	END  ;
    PROCEDURE MA5(VAR acc,  p1,p2,p3,p4,p5:plane;k:kernel);
    BEGIN
        if k[1]=0 and k[5]=0 then // if the effective width is 3 ignore the other terms
        acc:=  p2*k[2] +p3*k[3] +p4*k[4]
        else
		acc:= p1* k[1] +p2*k[2] +p3*k[3] +p4*k[4]+p5*k[5];
	END;
	FUNCTION area(var p:plane):integer;
	BEGIN
		area:= p.rows*p.cols;
	END;
    PROCEDURE  convp(VAR p,T:plane; writetop,writebottom:boolean);
    (*! This convolves a plane by applying the vertical 
     and horizontal convolutions in turn. It recurses to prevent
     using too much cache, the writetop and writebottom flags indicate
     if the top and bottom margins are to be written or ignored.
     *)
	VAR r,c,k,i,lo,hi,bm,tm,mid:integer;
    BEGIN   (*! This sequence performs a vertical convolution of the rows
        of the plane p and places the result in the temporary plane $T$.
        It uses the lines of pixels {\sf l[i]} as convolution weights.
        Use of lines of pixels rather than the floating point numbers for the
        kernel weights allows the computation to proceed 8 pixels at a time
        in parallel.
        *)
        
	 margin:=(kernel_size div 2);
	     (*! margin specifies how many rows at top and bottom are left out *)
	 r:=p.rows; lo := margin; hi:=r-margin;
     if 8*area(p) < cachesize then
     (*! We only run this if both p and t will fit in the cache *)
     BEGIN
		 if hi>=lo then begin
			 if usema5 then MA5(T [lo..hi],p[0..hi-lo+0],p[1..hi-lo+1],p[2..hi-lo+2],p[3..hi-lo+3],p[4..hi-lo+4],kerr)
			 else  for k:=0 to kernel_size-1 do
			   multacc( T [lo..hi],p[k..hi-lo+k],kerr[k+1],k<>0);
		 end;
		 for k:=0 to margin-1 do BEGIN
		   T[k]:=p[k];
		   T[r-k]:=p[r-k];
		 END  ;
		 p:=T;
	     (*! Now perform a horizontal convolution of the plane $T$ and
	       place the result in p. *)
	     c:=p.cols;  hi:= c-margin;
	     bm:=0;tm:=r;
	     if not writetop then bm:=margin;
	     if not writebottom then tm:=r-margin;
	     if hi >=lo then begin
			 if usema5 then MA5(p [bm..tm,lo..hi],t[bm..tm,0..hi-lo+0],t[bm..tm,1..hi-lo+1],t[bm..tm,2..hi-lo+2],t[bm..tm,3..hi-lo+3],t[bm..tm,4..hi-lo+4],kerr)
			 else
		      for k:=0 to kernel_size-1 do
			    multacc( p [bm..tm,lo..hi],T[bm..tm,k..hi-lo+k],kerr[k+1],k<>0);
		 end;
		 for k:=0 to margin-1 do BEGIN
		  p[bm..tm,k]:=T[bm..tm,k];
	      p[bm..tm,c-k]:=T[bm..tm,c-k];
		 END  ;
	 END else{cache too small recursively split }
	 BEGIN
	    mid:= r div 2;
	    convp(p[0..mid+margin],t[0..mid+margin],writetop,false);
	    convp(p[mid-margin..r],t[mid-margin..r],false,writebottom);
	 END;

    END  ;


BEGIN
	new(T,im.maxrow,im.maxcol);
     (*! Perform convolution on each of the planes of the image. This has to
         be done with an explicit loop as array maps only works with FUNCTIONs not
        with PROCEDURE s.  *)
        FOR i:=0 to im.maxplane DO
            convp(im[i],T^,true,true);

    (*! This sequence frees the temporary buffers used in the convolution process. *)
       dispose(T);
END  ;

PROCEDURE  blurImage(VAR im:image);
BEGIN
	pconv(im,kern);
END  ;
FUNCTION clone(VAR im:image):pimage;
VAR t:pimage;
BEGIN
	new(t,im.maxplane, im.maxrow, im.maxcol);
	t^:=im;
	clone:=t;
END  ;
(*! The FUNCTION to create a subsampled image does only that,
    it creates an image of half the size in which derived from
    every second pixel in the source image.
    * *)

FUNCTION createsubsampledimage(  VAR pi:image ):pimage;
   type line(top:integer)=array[0..top] of real;
   PROCEDURE  subsampleline(VAR dest:line; VAR src:line);
   VAR i:integer;
	BEGIN

	   for i:=0 to dest.top do
	     dest[i]:=src[trunc(scalefactor*i)];
	END  ;
VAR po:pimage;
    z,xi,yj:integer;

BEGIN
      xi:= pi.maxcol+1; yj:= pi.maxrow+1;
      new(po,pi.maxplane,trunc(yj / scalefactor)-1,trunc(xi / scalefactor)-1);
      for z:= 0 to po^.maxplane do
			for yj:=0 to po^.maxrow do
			   subsampleline(po^[z][yj], pi[z][trunc(scalefactor*yj)]);
      createsubsampledimage:=po;
END  ;
(*! this creates a subsampled version of a blurred version of the input *)
FUNCTION createBlurredSubSampledImage(VAR im:image):pimage;
VAR t,r:pimage;
BEGIN
	t:=clone(im);
	blurImage(t^);
	r:= createsubsampledimage(t^);
	dispose(t);
	createBlurredSubSampledImage := r;
END  ;

(*! This creates a double sized image using interpolation *)
FUNCTION createUpSampledImage  (  VAR ri:image;  VAR kernl:kernel):pimage;
VAR rho:pimage;

BEGIN
    new (rho,ri.maxplane,trunc( scalefactor*(ri.maxrow+1 ))  -1, trunc(scalefactor*(ri.maxcol+1))-1);
    rho^ := ri[iota [0],trunc(( iota[1] )/ scalefactor),trunc(( iota [2 ])/ scalefactor)];
    blurImage(rho^);
    createUpSampledImage:= rho;
END  ;


PROCEDURE  performSimpleDoubling(A,B:pimage);
const k:kernel=(0,0.25,0.5,0.25,0);
var i:integer;
BEGIN
for i:=0 to b^.maxplane do
 B^[i]:= A^[i ,  iota[0] div 2, iota[ 1] div 2];
 pconv(B^,k);
END  ;
PROCEDURE  performfractionalinterpolation(A,B:pimage);
VAR dx,dy:real;i:integer;
  procedure planeinterpolate ( var a,b:Plane);
  begin
  B [ 0..B.maxrow-3,0..B.maxcol-3]:=
   (A[ trunc( iota[0] *dy), trunc( iota[1] *dx)]*(1-( iota[1] *dx-trunc( iota[1] *dx)))+
    A[ trunc( iota[0] *dy), trunc( iota[1] *dx)+1]*( iota[1] *dx-trunc( iota[1] *dx)))*(1-(iota 0 *dy-trunc(iota 0 *dy)))+
   (A[ trunc( iota[0] *dy)+1, trunc( iota[1] *dx)]*(1-( iota[1] *dx-trunc( iota[1] *dx)))+
    A[ trunc( iota[0] *dy)+1, trunc( iota[1] *dx)+1]*( iota[1] *dx-trunc( iota[1] *dx)))*((iota 0 *dy-trunc(iota 0 *dy)));

  end;
BEGIN
 dy:=(a^.maxrow+1)/(b^.maxrow+1);
 dx:=(a^.maxcol+1)/(b^.maxcol+1);

 for i:= 0 to B^.maxplane do planeinterpolate (A^[i],B^[i]);
 END  ;

PROCEDURE  interpolateAOntoB(A,B:pimage);
BEGIN
  if( b^.maxrow+1 = 2*(a^.maxrow+1)) AND ( b^.maxcol+1 = 2*(a^.maxcol+1)) then
  BEGIN
    performSimpleDoubling(A,B);
  END
  else
  BEGIN
    performfractionalInterpolation(A,B);
  END  ;
END  ;

(*! This is the main initialisation FUNCTION of the library *)
PROCEDURE  initialisePyrlib;
VAR mid,i1,x:integer;
  sum,square:real;
const k:kernel=(0.08164,0.2185,0.30328,0.2185,0.08164);
BEGIN
    sum:=0;
(*! Initialise the   kernel *)
    mid := (kernel_size div 2) +1;
    kern:=k/ (\+ k);


    {write(kern:8);}
END  ;

 FUNCTION createGaussianPyramidFromImage(VAR im:image):pimpyr;
 VAR tp : pimpyr;
     level:integer;
 BEGIN
  (*! First allocate a new pyramid array and set tp to point to it. *)
  new(tp);
  (*! Allocate a clone of the original image as the base *)
  tp^[1]:= clone (im);
  (*! go up the pyramid creating subsampled versions*)
  for level:= 2 to octaves do
    tp^[level]:=createBlurredSubSampledImage(tp^[level-1]^);
  createGaussianPyramidFromImage:= tp;
 END  ;


BEGIN
  initialisePyrlib;
END  .
