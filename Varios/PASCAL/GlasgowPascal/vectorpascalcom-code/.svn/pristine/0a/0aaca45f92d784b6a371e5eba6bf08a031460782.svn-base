program maketest;
uses bmp;
var pic, half:^image;
    i,j,k,step:integer;
    r:real;
    pk:^matrix;
const
	kern:array[1..3,1..3] of real=((-0.25,-0.05,0.1),
                                    (-0.05,0.5,-0.05),
				    (0.1,-0.05,-0.25));

PROCEDURE genconv(VAR p:image; var K:matrix);
(*! This computes a general convolution on an image $p$ producing a modified
    image $q$ such that if 
    $$ q_{i,j,k}=\sum_x\sum_y p_{i,j+y-a,k+x-b}\times K_{x,y}$$
where $a= (K.rows)div 2$ and $b=(K.cols)div 2$. At the end $p$ is updated with $q$.
*)
type 	premult(rows,cols:integer)=array[1..rows,1..cols] of pimage;
	tflag(rows,cols:integer)=array[1..rows,1..cols] of boolean;
var f:^premult;
    (*! We will use f to hold the premultiplied versions of the image such
        that $f_{i,j}=p\times K_{i,j}$.
        The algorithm for constructing the premultiplied matrix of images
	will avoid carrying out redundant multiplications. *)
    a,b,i,j:integer; 
       (*! a,b store the steps away from the center of the kernel *)
    flags:^tflag;
	(*! flags[i,j] is true if f[i,j] holds the first pointer to a
            premultiplied image. *)
    FUNCTION dup(i,j:integer):boolean;
	(*! This function returns true if there exists a $m,n$ such
	    that $$n+m\time K.cols < j+i\times K.cols$$
	and $$K_{m,n}=K_{i,j}$$
        in other words, if the matrix element $K_{i,j}$ is preceeded
	in the matrix by an identical element. If that is true, then
	the element $K_{i,j}$ is a duplicate and this fact can be 
	taken advantage of in reducing the amount of pre-multiplication
	required to perform the convolution *)
	var c,d,l,m:integer;b:boolean;
	BEGIN	
		c:=K.cols;
		d:=j+i*c;
		b:=false;
		for l:=1 to c do for m:= 1 to k.rows do
                 b:=b or (K[i,j]=K[m,l])and(m+c*l<d);
		dup:=b
	{	dup:=\or \or ((K[i,j]=K)and(iota 1 +c*iota 0<d));}
		(*! The Vector Pascal statement is more or less a direct
                    translation of the mathematical formulation of the
		    problem. We use or-reduction over both axes of the
		    matrix to search for duplicates. *)
	END;
     FUNCTION prev(i,j:integer):pimage;
	(*! For duplicated matrix elements $K_{i,j}$ function prev returns the pre-multiplied version of the
	    image that was previously computed for this value of matrix element. *)

	(*! This uses classical Pascal constructs to search the matrix for the position of
	the premultiplied duplicate and then assigns the duplicate to the return value of
	the function. Note that the function does not return when the assignment is made. *)
	var m,n:integer;s:real;
	BEGIN
		 
		s:=k[i,j];
		for m:=1 to i-1 do
		   for n:=1 to K.cols do 
			if K[m,n]=s then
				prev:=f^[m,n];
		for n:=1 to j-1 do 
			if K[i,n]=s then
				prev:=f^[i,n];
	END;
     FUNCTION pm(i,j:integer):pimage; 
	(*! The function pm premultiplies the image by the real valued coefficient
	    $K_{i,j}$ returning a new image. The fact that a new pre-multiplied image has been
	    created is recorded in the flags matrix.
        *)
	var x:pimage;
	BEGIN
		 
		new(x,p.maxplane,p.maxrow,p.maxcol);
		adjustcontrast(K[i,j],p,x^);
		flags^[i,j]:=true;
		pm:=x;
	END;
    PROCEDURE doedges;
	(*! When performing a convolution on an image, the edges always pose a problem. The convolution
	operation determines the value of each output image from the corresponging neighbourhood in the
	input image. Around the edges only part of this neigbourhood exists. Some strategies that
	can be adopted here are:
	\begin{enumerate}
	\item One can treat the image as a being topologically equivalent to a torus so that upper the
	neighbourhood of pixel on the top line of the image continues onto bottom lines of the image.
	This approach is computationally easy : when finding the neighbours  of pixel $p_{i,j}$  we
	would normally do this by using the expression $p_{i+y,j+x}$  iterating over a range of values
	of $x$ and $y$. To treat the image as a torus we substitute the indexing expression 
	{\tt p[(i+y)mod p.rows,(j+x)mod p.cols]}.
	Although this is computationally easy, it does not make a great deal of sense, since
	it allows output pixels to  be influenced by input pixels in the parts of the picture that are furthest
	away from it.
	\item One can  mirror  the original image around all four edges so that on, for instance,
	 the top edge the upper neighbour of a pixel is the same as its lower neighbour.
	This makes more sense than using a toroidal topology, and will work well for where the edge
	of the image is intersected by a feature that runs a right angles to the edge.
	\item One can assume that the edge pixels themselves are replicated to an arbitrary degree
	beyond the edge itself, and compute the edge convolution on this basis. This is the
	most parsimonious assumption, and is the one we use here.
	\end{enumerate}
	If we have a $5\times5$ convolution matrix and a $100\times100$ image, then we will have
	a central subregion of the output image : {\tt q[2..97,2..97]} which can be evaluated from
	the full convolution matrix. The 2-pixel wide vetical margins can be expressed a sum of columns of images
	within the premultiplied image matrix. Thus the 0th output column is the sum of the 0th image columns
	within the first three columns of the premultiplication matrix plus the 1st image column of the
	4th column of the premultiplied image matrix and the 2nd image column of the 5th column of the premultiplied
	image matrix, etc.
	Processing the edges takes many more lines of code because it is a mass of special cases.
	*)
	var i,j,l,m,n,row,col:integer;
            r:pimage;
	BEGIN {$r-}
		j:=k.rows div 2;
		i:=k.cols div 2;

		p[][0..j-1]:=0;
		p[][][0..i-1]:=0;
		p[][1+p.maxrow-j..p.maxrow]:=0;	
		p[][][1+p.maxcol-i..p.maxcol]:=0;
		for n:= 0 to p.maxplane do { iterate through the planes }
		for l:=1 to k.rows do 
		for m:= 1 to k.cols do
		begin
		  r:=f^[l,m];
                  for row:=0 to j-1 do
		   p[n,row]:=p[n,row]+r^ [n,(row+l-j-1)max 0];{top}  
		(*! The line above computes the convolution for the top edge, so that the 
                  neighbours above the top are replaced by the corresponding elements of the
		  pre-multiplied top scan-line.  *)  
		  for row:=p.maxrow-j+1 to p.maxrow  do 
		   p[n,row]:=p[n,row]+r^ [n,( row+l-j-1) min p.maxrow]; {bottom}  
		  for col:=0 to i-1 do  for row:= 0 to p.maxrow do begin
		  
		        p[n,row,col]:=r^ [n,row,(col+1+m-i)max 0]+p[n,row,col];{left}
		  end;
		  (*! Using a similar technique we compute the convolution for the left edge.
		  Note that the construct {\tt p[n][][col]} means for   plane n select  the column col
		  from all rows. *) 
		  for col:=1+p.maxcol-i to p.maxcol do	for row:= 0 to p.maxrow do begin
		   p[n][row][col]:=p[n][row][col]+r^[n] [row][(col-1+m-i) min p.maxcol];{right} 
		 end;
		{$r+}
		end;	 
	END;
    PROCEDURE freestore;
	(*! The  first occurrence of of an image in the pre-multiplied image matrix
	is disposed of. The record in the flags matrix, initialised when pre-multiplication
	occured is used to keep track of this. *)
	var i,j:integer;
	BEGIN
		for i:=1 to K.rows do
			for j:=1 to K.cols do
			if flags^[i,j] 
			then dispose(f^[i,j]);
	END;
	
BEGIN
	new(f,K.rows,K.cols);
	f^:=nil;
	new(flags,K.rows,K.cols);
	flags^:=false; 
	for i:= 1 to K.rows do 
	 for j:= 1 to K.cols do
	   if dup(i,j) 
	   then f^[i,j]:=prev(i,j) 
	   else f^[i,j]:=pm(i,j);
	(*! The loops above perform the premultiplication of the input image to
 	    form the matrix of images. If item $K_{i,j}$ is a duplicate then
	    we use a previous premultiply else we perform the premultiply now. *) 
	a:= K.rows div 2; b:= K.cols div 2;
	p[][a..p.maxrow-a,b..p.maxcol-b]:=0;
	for i:= 1 to K.rows do 
	 for j:= 1 to K.cols do
	p[][a..p.maxrow-a,b..p.maxcol-b]:= p[][a..p.maxrow-a,b..p.maxcol-b] +f^[i,j]^[iota 0, i+ iota 1 -a,j+iota 2 -b];
	(*! The above line forms the convolution by replacing the central region of the
            image with the sum of the shifted premultiplied images. *) 
	doedges;  
	freestore;
END;

    procedure halftone(var src,dest:image);
    const 
        black:pixel=-1.0;
	white:pixel=1.0;
        pattern:array[0..3,0..7] of pixel=((0.75,-0.95,0.0,0.5,-0.3,0.33,-0.2,-0.7),
					(0.62,-0.75,-0.1,-0.45,0.8,0.25,0.95,-0.6),
					(-0.15,0.3,0.4,-0.8,-0.9,-0.5,0.15,0.17),
					(-0.25,0.9,0.7,-0.33,-0.4,0.2,0.1,-0.82));
	
    begin
	dest:=pattern[iota 1 mod 4,iota 2 mod 8];
	dest:= if src>dest then white else black ; 
    end;
    procedure errordifuse(var src,dest:image);
    var temp:^image;i,j,k :integer;
        black,white:pixel;
	e1,e2,e3 :real;
        r1,r2:integer;
    const amplitude=0.3;
          divisor = 111;
    begin
 	black:=-1.0; white :=1.0;
	new(temp, src.maxplane, src.maxrow,src.maxcol);
	dest := if src >0 then 1.0 else -1.0;
        temp^:=src ;
	for k:=0 to src.maxplane do  
        for i:=1 to src.maxrow-1 do for j:= 1 to src.maxcol-1 do
        begin
		r1:= random; r2:=random;
                e3:=if r1>r2 then 0.2 else -0.2;
		dest[k][i][j]:=if temp^[k,i,j]>0.0 then white else black;
		e1:= dest[k,i,j]-temp^[k,i,j];
		temp^[k,i,j+1]:= temp^[k,i,j+1]-(0.45-e3)*e1 ;
		temp^[k,i+1,j]:= temp^[k,i+1,j]-(e3+0.375)*e1;
		temp^[k,i+1,j-1]:= temp^[k,i+1,j-1]-(0.125)*e1 ;
	end;	
	dispose(temp);
    end;
    
begin
 
	loadbmpfile('mandrill.bmp',pic);
	NEW(HALF, PIC^.MAXPLANE,PIC^.MAXROW,PIC^.MAXCOL);
	errordifuse(pic^,half^);
	storebmpfile('difuse.bmp',half^);  
	half^:=pic^;
	blur(half^);
	
	storebmpfile('blur.bmp',half^); 
	half^:=pic^;
	sharpen(half^);
 
	storebmpfile('sharp.bmp',half^);
	halftone(pic^,half^);
	storebmpfile('half.bmp',half^);
	
	 
	new(pk,3,3);
	pk^:=kern; 
	genconv(pic^,pk^);
	storebmpfile('diag.bmp',pic^);
end.

