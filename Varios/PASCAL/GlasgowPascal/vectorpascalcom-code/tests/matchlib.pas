{$r+ }
UNIT   matchlib;
interface uses bmp,pyrlib;
const xplane=0;yplane=1;confidenceplane=2;
  enablepolynomials = true; {  fit polynomials to the x, y disparities }
  debug=false;
  integerposition=false;

  epsilon = 0.00125;
  type direction =(center,above,below ,moveleft,moveright );
   (*! The type direction indices one of 5 possible moves in the plane, the
     type shirt encodes the movement in terms of x and y coordinates. *)
      comparison =(correlation, mse);
      (*! the package can either optimise on mean squared error or on correlation *)
      shift= array[0..1] of integer;

const
  biasesinit: array[direction ] of real=(0,epsilon*2,epsilon*2, epsilon,epsilon );
  comp=mse;
  averagefilter:kernel=(0.2,0.2,0.2,0.2,0.2);
  (*! says which optimisation method to use *)
var
     maxiter,maxsmooth: integer;
     (*! Number of iteratations at each level and the number of smooths per iteration *)
     biases: array[direction ] of real;
(*! Take in two image pyramids and perform a match between them
 return the disparities in the x and y planes of the result and
 return the confidence in the confidenceplane. *)
	FUNCTION match(left,right:pimpyr):pimpyr;
	 PROCEDURE  outputgrey(filename :string; var im:image; level:integer; scale : real);
	 PROCEDURE  warpAbyDisparity(var A,onto,disparity:image);
implementation
   PROCEDURE  outputgrey(filename :string; var im:image; level:integer; scale : real);
    var pim:pimage;
    BEGIN
      new(pim,2,im.maxrow,im.maxcol);
      pim^:=scale * im[level];
      storebmpfile(filename, pim^);
      dispose(pim);
    END ;
 PROCEDURE  printmax(var i:image);
 var r:real;
 BEGIN
  r:=\MAX  \MAX \MAX i;
     writeln(r);
 END ;
 PROCEDURE  warpAbyDisparity(var A,onto,disparity:image);
 var i:integer;
  
  PROCEDURE  mapinterpolated(var p,y,x,a:plane);
	  pure FUNCTION getinterpolated(y,x:real):real;
	  (*! return the interpolated pixel at position x, y  on layer i.*)
	  var fx,fy:integer;dx,dy:real;
	  BEGIN
	     fx:=trunc(x);fy:=trunc(y);
	     dx:= x-fx; dy:= y - fy;
	     getinterpolated:= (A[fy,fx]*(1-dx)+A[fy,fx+1]*dx)*(1-dy)+(A[fy+1,fx]*(1-dx)+A[fy+1,fx+1]*dx)*dy;
	  END ;
  BEGIN
     p[0..p.maxrow-1,0..p.maxcol-1]:=getinterpolated(iota 0 + y,iota 1 +x);
     p[p.maxrow]:=a[p.maxrow];p[][p.maxcol]:=a[][p.maxcol];
  END ;
 BEGIN

    for i:= 0 to onto .maxplane do
    if integerposition then
      onto[i]:=A[i, iota (0)+ round (disparity[yplane]),iota (1)+round(disparity[xplane])]
    else
      mapinterpolated( onto[i],disparity[yplane],disparity[xplane],a[i]);

 END ;
PROCEDURE  computesim(var sim, l,r:image);
  (*! this performs a correlation between the l and r planes
  and adds the correlation to the similarity accumulator. Instead
   of doing a full correlation we will compute the normalised
   inner product or cosine metric$$
\frac{\sum l_{\iota}.t_{\iota}}{\sqrt{\sum l_{\iota}^{2}}.\sqrt{\sum r_{\iota}^{2}}}$$
   which is very similar to the correlation, and, if the images were
   derived from difference of gausian pyramids would be the same as correlation.

   *)
  var bottom:pimage;
  const mask:kernel=(0.08164,0.2185,0.30328,0.2185,0.08164);
  BEGIN
     if comp = correlation then
     BEGIN
		 new (bottom,l.maxplane,l.maxrow,l.maxcol);
		 sim:=l*r;
		 (*! we have the products for the top term now, so we do the summation using
		  a call on the convolution routine *)
		 pconv(sim,mask);
		 (*! now we compute the l2 norm of the left image and divide
		 the top by it*)
		 bottom^:=l*l;
		 pconv(bottom^,mask);
		 sim:=sim/sqrt (bottom^);
		 (*! repeat the calculation with the right l2 norm *)
		 bottom^:=r*r;
		 pconv(bottom^,mask);
		 sim:=sim/ sqrt(bottom^);dispose(bottom);
		 sim:= sim * sim; { this is only in here for compatibility with the c3d version which
		                    uses the square of the cosine metric }
	 end;
	 if comp = mse then
	 BEGIN
	   (*! compute 1- mse of the images *)
	   sim:= (l-r)*(l-r);
	   pconv(sim,mask);
	   sim:= 1-sim;
	 end;
  END ;
  FUNCTION compareplanes(var left,right:image):pimage;
  (*! This ensures that the comparison works equally well between
  colour and monochrome images. It returns an image with the
   total similarity between all colour planes encoded as a confidence
   map in plane 0.*)
  var similarity,fsim:pimage;i:integer;
  BEGIN

    new(fsim,0, left.maxrow,left.maxcol);
	new(similarity,left.maxplane, left.maxrow,left.maxcol);

	computesim(similarity^,left,right);;
	for i:=1 to left.maxplane do
	    similarity^[0]:=similarity^[0]+similarity^[i];
	fsim^[0]:= similarity^[0] * (1.0/(left.maxplane+1));
	(*! Plane 0 of fsim image now contains the similarity
	of the whole coloured image so we can get rid of multi plane similarity *)
	dispose(similarity);

	compareplanes:=fsim;
  END ;
PROCEDURE  matchlevel(left,right , disparity:pimage);
(*! This creates a disparity image which specifies how the right image
    has to be warped to move it onto the left image with minimum error *)

type
     selectionarray(maxrow,maxcol:integer) = array[0..maxrow,0..maxcol] of integer;

 const
   shiftindex:array[direction] of shift=(
    {center}     ( 0,0),
	{above }     ( 0,-1),
	{below}      ( 0, 1),
	{moveleft}   ( -1, 0),
	{moveright}   ( 1, 0) );
(*! shifts are encoded as dx, dy  in pixels *)

 best = center;

  (*! we have these as thresholds for the amount one
	                              comparison has to be better than another to count, it is biased against y shifts *)
 var comparisons:array[direction] of pimage;
     selections : ^selectionarray;
     d:direction; top,i,j:integer;
     warped,relativedisparity:pimage;
     bias: real;
      FUNCTION compareImagePair(dir:shift):pimage;
      (*! Given a direction compares the center of the left image with the
       rignt image in that direction. *)
      var mr,mc,lmr,lmc,dx,dy:integer;
      BEGIN
        dx:=dir[0];
        dy:=dir[1];
        lmr:= left^.maxrow-1;mr:=lmr+dy;
        lmc:=left^.maxcol-1; mc:=lmc+dx;
        
        compareImagePair:=compareplanes(
         left^[][1..lmr,1..lmc],
         warped^[][1+dy..mr,1+dx..mc]);
      END ;
       PROCEDURE  incrementdisparitywindow(var a,b:image);
       BEGIN
		a[xplane..yplane]:=a+b;
		a[confidenceplane]:=b[confidenceplane]*0.25 + a[confidenceplane]*0.75;
	   END ;
      PROCEDURE  updatedisparitywindow(var disparitywindow:image);
      (*! it is only the middle block of the disparity that we want
          to update, there is a 1 pixel margin that we cannot update
          allround, so we pass the middle block into here to
          do the update. *)
      BEGIN
         disparitywindow[xplane..yplane]:= shiftindex[selections^[iota 1, iota 2]][iota 0];
	     disparitywindow[confidenceplane]:=comparisons[best]^[0];
	  END ;
	  PROCEDURE  smooth(var disparity:image);
	  const k:kernel=(0.0,0.333,0.333,0.333,0.0);
	  var smoothedconfidence:pimage;
	      i:integer;
	  BEGIN
	     new(smoothedconfidence,0,disparity.maxrow,disparity.maxcol);
	     smoothedconfidence^[0]:=disparity[confidenceplane] max epsilon;
	     disparity:= disparity * smoothedconfidence^[0];

		 pconv(disparity,k);
	     pconv(smoothedconfidence^,k);
		 disparity:= (disparity/ smoothedconfidence^[0]);
		 dispose(smoothedconfidence);
	  END ;
	  PROCEDURE  constrainDisparity;
     (*! make sure disparity is sensible *)
      var disp:integer;
      BEGIN
        disp:= if integerposition then 0 else 1;
	    top:= disparity^.maxrow;
	    disparity^[yplane]:= (disparity^[yplane] Min (top - iota(0)-disp  ))Max (-iota (0) );
	    top:= disparity^.maxcol;
	    disparity^[xplane]:= (disparity^[xplane] Min (top - iota(1) -disp ))Max (-iota (1) );
        disparity^[][0]:=0.0;
        disparity^[][disparity^.maxrow]:=0.0;
        disparity^[][][0]:=0.0;
        disparity^[][][disparity^.maxcol]:=0.0;
	  END ;
      procedure computepolynomialinterpolation(var f_1,a,f1:plane; var x:image;layer:integer);
      (*! this performs polynomial interpolation and updates all positions
      in x where there is a maximum of the polynomial *)
       
      var b,c:^plane;

      BEGIN
      (*!We do not necessarily want to move directly to integer displacements.
         One way round this is to model the confidence surface as a polynomial
         and maximise this polynomial within the bounds -1 .. +1.

        Let us assume we have a polynomial in $x$ of the form $f(x)=a+bx+cx^{2}$
		and we are sampling the $x$ positions at -1,0,1 so we have
		\begin{enumerate}
		\item $f(-1)=a+-b$+c
		\item $f(0)=a$
		\item $f(1)=a+b+c$
		\end{enumerate}
		We represent $f(-1), f(1)$ in this procedure by the parameters f\_1,f1.
		*)
		new(b, a.maxrow,a.maxcol);new(c,a.maxrow,a.maxcol);
		(*!Thus we can obtain the parameters $a,b,c$ by
		\begin{itemize}
		\item $a=f(0)$ we have this directly as a parameter
		\item $b=\frac{f(1)-f(-1)}{2}$
		\item $c=f(1)-(a+b)$
		\end{itemize} *)
		b^:= (f1-f_1)/2;
		c^:= f1 - (a+b^);

		 (*!
		The maximum of the polynomial is found if the derivative $f'=0$and
		$f''<0$.

		We have $f'=b+2cx$ and $f''=2c$ . Thus it is only worth looking
		for an internal maximum if $c<0$ and then the value of $x$ at the
		turning point $x'$ is given by $0=b+2cx'$ ie
		$$x'=\frac{-b}{2c}$$
		so we update x only where $c<0$ and we keep the answer within the bounds $-1..1$
        if $c$ is positive we have a minimum of the polynomial and we do gradient ascent
         using the $b$ coefficient of the polynomial.

        *)
		{	x[layer]:=(if b^>epsilon then 1.0 else -1.0);}

			x[layer]:=if c^<0 then (-b^ *0.5)/c^ else 0.0;
			x[layer]:= (1.0 min(-1.0 max x[layer])) ;

	 		x[confidenceplane]:= if c^<epsilon then
	 		    x[confidenceplane]*(a+b^*x[layer]+c^*x[layer]*x[layer])
	 		    else 0.4;
		dispose(b);dispose(c);

      end;
BEGIN
    new (warped, right^.maxplane,right^.maxrow,right^.maxcol);
    new (relativedisparity, 2,right^.maxrow,right^.maxcol);
    for i:= 1 to maxiter do BEGIN

        constrainDisparity;
	    warpAbyDisparity(right^,warped^,disparity^);
		comparisons := compareImagePair (shiftindex);

		(*! the call to compareImagePair will return pointers to comparison
		images one plane deep, for the 4 moves plus the null move.*)
		new(selections, comparisons[best]^.maxrow,comparisons[best]^.maxcol);

		
		
		if not enablepolynomials then
		BEGIN
		     selections^:=ord(best);
		     (*! The aim of the next loop is to END  up with the best comparison
		     in $comparisons_{best}$
		      and for selections to hold for each pixel position in which direction the best
		      match was found. *)
			for d:= above to moveright do
			BEGIN
				bias:= biases[d];
				selections^ := if ( comparisons[best]^[0,iota 0, iota 1 ]+bias  )< comparisons[d]^[0, iota 0, iota 1] then ord(d) else selections^[iota 0, iota 1];
				comparisons[best]^[0]:= if ( comparisons[best]^[0] +bias )< comparisons[d]^[0] then comparisons[d]^[0] else comparisons[best]^[0];
			END ;
			updatedisparitywindow(relativedisparity^[][1..disparity^.maxrow-1,1..disparity^.maxcol-1]);
	        (*! The relative disparity now contains the best integer disparity given the comparisons we have made.
	        *)
		end;
        if enablepolynomials then
        BEGIN
          relativedisparity^[confidenceplane]:=1;
          computepolynomialinterpolation(comparisons[above]^[0],comparisons[center]^[0],comparisons[below]^[0],relativedisparity^[][1..disparity^.maxrow-1,(1)..disparity^.maxcol-(1)],yplane);
          computepolynomialinterpolation(comparisons[moveleft]^[0],comparisons[center]^[0],comparisons[moveright]^[0],relativedisparity^[][1..disparity^.maxrow-1,(1)..disparity^.maxcol-(1)],xplane);
		end ;

		incrementdisparitywindow(disparity^[][1..disparity^.maxrow-1,(1)..disparity^.maxcol-(1)],
		                 relativedisparity^[][1..disparity^.maxrow-1,(1)..disparity^.maxcol-(1)]
		);
		(*! the above line adds the relative  disparity to the existing disparity *)

        for j:=1 to maxsmooth do smooth(disparity^);

		(*! now clean up removing temporary buffers *)
		for d:= center to moveright do dispose(comparisons[d]);
		dispose(selections);
	END ;
      pconv(disparity^,averagefilter);
	  constrainDisparity;
	dispose(warped);dispose(relativedisparity);
END ;
PROCEDURE  propagatedownDisparity(higherlevel,lowerlevel:pimage);
(*! Create the disparity in level n given a corresponding disparity for the reduced
 image at level n-1 *)
BEGIN
  lowerlevel^:=0;
  interpolateAOntoB(higherlevel,lowerlevel);
  (*! the x and y disparities are now the interpolated values but they are in terms
   of the images at the smaller scale factor above so we rescale them, but leave the
   confidence plane untouched *)
  lowerlevel^[xplane..yplane] := scalefactor * lowerlevel^;
END ;
FUNCTION match(left,right:pimpyr):pimpyr;
var level,top,width:integer;
    disparity:pimpyr;
BEGIN
    (*! Set up a 3 plane pyramid to hold the disparities, with the planes being the
    xdisparity, the y disparity and the confidence *)
	disparity:=createEmptyPyramid(3,left^[1]^.maxrow+1,left^[1]^.maxcol+1);
	for level := octaves downto  1 do
	BEGIN
		matchlevel(left^[level],right^[level] , disparity^[level]);
		(*! After this we propagate the disparity down to the next level to use it
		as a guide to matching there. *)

		if level >1  then propagatedowndisparity(disparity^[level],disparity^[level-1]);
	END ;
	match:=disparity;
END ;

BEGIN
	biases:= biasesinit;
	maxiter:=1; maxsmooth:=1;
END .
