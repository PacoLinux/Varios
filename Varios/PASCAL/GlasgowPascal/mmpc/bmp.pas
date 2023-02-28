 unit bmp;
(*!
This unit provides a library to access and manipulate
bitmap images provided in Microsoft .bmp file format.
*)
interface 
(*! The module exports an image type as a 3 dimensional
    array of pixels in which the first dimension identifies
    the colour plane, the second dimension indicates the row
    and the third dimension indicates the column of the pixel *)
type 

      image(maxplane,maxrow,maxcol:integer)=
        array[0..maxplane,0..maxrow,0..maxcol]of pixel;
      pimage=^image;
	filename = string[79];
     
procedure storebmpfile(s:string;var im:image) ; 
(*! This procedure will store an image \textsf{im} as
   a Microsoft .bmp file with name \textsf{s} *)

function loadbmpfile(s:filename;var im:pimage):boolean ;
(*!   This function returns true if it has sucessfully
   loaded the bmp file \textsf{s}. The image pointer \textsf{im}
is initialised to point to an image on the heap. The program should
explicity discard the image after use by calling \textsf{dispose}. *)

procedure adjustcontrast(f:real; var src,dest:image);
(*!   This procedure takes a real number
   as a parameter and adjusts the contrast of an image to
   by that factor. If \textsf{f}=2 then contrast is doubled,
   if \textsf{f}=0.5 contrast is halved. *) 

PROCEDURE sharpen(VAR im:image);
(*! This performs local sharpening of an image *)
PROCEDURE blur(var im:image);
(*! This uses pconv to blur an image *)
PROCEDURE pconv(VAR im:image;c1,c2,c3: real);
(*! this procedure performs a data parallel separable convolution
    of width 3 on the image *)
PROCEDURE genconv(VAR p:image; var K:matrix);
(*! This preforms a general 2d convolution using the matrix K.
    K must have an odd number of rows and an odd number of columns.
 *)


implementation
type  

(*! The following data structures are defined by Microsoft
    for their bitmap files (.BMP) *) 
bitmapfileheader=packed record 
      	 bftype:array [1..2] of byte; 
         bfsize:integer; 
         res1:array[0..3] of byte; 
         bfoffbits:integer; 
      end;   
      (*! A BitmapInfoHeader is the internal data structure used
          by microsoft Windows to handle device independent bitmaps, (DIBs).
	  We only need this structure to interpret the data in a BMP file. *)
      TBitmapInfoHeader = record 
        biSize: integer; 
        biWidth: integer; 
        biHeight: integer; 
        biPlanes: Word; 
        biBitCount: Word; 
        biCompression: integer; 
        biSizeImage: integer; 
        biXPelsPerMeter: integer; 
        biYPelsPerMeter: integer; 
        biClrUsed: integer; 
        biClrImportant: integer; 
      end; 

      (*! This datastructure can optionally include
          a colour table, but this library does not support reading
          .bmp files with colour tables *) 
      TBitmapInfo = record 
   	bmiHeader: TBitmapInfoHeader; 
   	
      end; 
      (*! The start of a .bmp file has a file header followed by
          information about the bitmap itself. *)
      bmpfile=packed record 
             fileheader: bitmapfileheader; 
      	     filedata:tbitmapinfo; 
      end; 
      pbmpfile=^bmpfile;
      (*! This data type is the format in which lines of pixels are stored
          in .bmp files. It is used internally in the unit BMP to load
          and store images to files. This process involves translating
          between internal and external representations. *)	
      imageline(mincol,maxcol,minplane,maxplane:integer)=
           array[mincol..maxcol,minplane..maxplane] of byte; 




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


procedure initbmpheader(var header:bmpfile;var im:image);
(*! This procedure has the task of initialising a Window's BMP file header in
    a way conformant with the dimensions of the image passed as a parameter *)
begin
		(*! 
		     \paragraph{FileHeader} BMP files have the letters BM at the start followed by
                    a 32 bit integer giving the file size, 4 reserved bytes and then
                    a 32 bit integer giving the offset into the file at which
                    the bitmap data starts.
		*)
		header.fileheader.bftype[1]:=ord('B');
		header.fileheader.bftype[2]:=ord('M');
		header.fileheader.bfsize:=sizeof(bmpfile)+
					(im.maxcol+1)*
                                        (im.maxplane+1)*
			        	(im.maxrow+1);
		header.fileheader.res1:=0;
		header.fileheader.bfoffbits:=sizeof(bmpfile);
		(*!
			\paragraph{Bitmap info}
			Next comes a bitmap info header which 
                        gives details about the bitmap itself. The fields
                        of this are as follows:
			\paragraph{bisize} this gives the size of the
                        entire bitmap info header as a 32 bit integer.
			\paragraph{biwidth} this 32 bit integer gives the number of 
                        columns in the image, which can be determined from
			the bounds of the pixel array provided.
			\paragraph{biheight} another 32 bit integer which 
			gives the number of scan
			lines in the image, which can again be determined
			from the bounds of the image array.
			\paragraph{biplanes} This gives the
                        number of planes in the image as a 16 bit integer.
			This defaults to 1.
			\paragraph{bibitcount} Gives the number of  bits
                        per pixel, we only support 8 and 24 bit versions at present.
			\paragraph{bicompression} The meaning of this field is
			not clear, it seems to be 0 in most files.
			\paragraph{biXPelsPerMeter, biYPelsPerMeter} These specify
			 the printable
                        spacing of pixels, I use the value \$ec4 that I observe
			in a number of bmp files. 
			\paragraph{biClrUsed, biClrImportant} these fields are only
			used in images with colour maps, set them to zero for now.	
		*)
		with header.filedata.bmiheader do begin
			bisize:=sizeof(tbitmapinfo);
			biwidth:=im.maxcol+1 ;
			biheight:=im.maxrow+1 ;
			biplanes:= 1;
			bibitcount:=8 * (im.maxplane +1);
			bicompression:=0;
			biXPelsPerMeter:=$ec4;
			biYPelsPerMeter:=$ec4;
			biClrUsed:=0;
			biClrImportant:=0;
		end;
		
        
end;

 
procedure storebmpfile(s:string;var im:image) ; 
(*! This function writes an image in vector pascal format to a microsoft {\tt .BMP} file.
    It is designed only to work with 1 or 3 plane images. *)
type lines(rows,cols,planes:integer)=array[0..rows,0..cols,0..planes] of byte;
var f:file ; fsize,i,index,j,k,m,row,res:integer;  pf:bmpfile;	la: ^lines;b:byte;
begin 

        assign(f,s); 
	rewrite(f); 
        	
        initbmpheader(pf,im); { setup header}
        blockwrite(f,pf,sizeof(bmpfile),res); {write it}
       	new(la  ,im.maxrow,im.maxcol,im.maxplane ); {get buffer}
                (*! Convert the data from the planar signed fixed point format used
                    in Vector Pascal to the interleaved unsigned byte format used
                    in Windows. *)
        la^:= perm[2,0,1] pixel2byte(im);
         (*! Compute the size of a line and
                    write each line. We have to make sure each line occupies
        an integral number of 32 bit words. *)
       fsize:=(im.maxplane+1) *(im.maxcol+1); 
       if (fsize mod 4)<>0 then fsize:= fsize+4-(fsize mod 4);
	{ make integral number of words on a line }    
       for i:=0 to im.maxrow do  
         blockwrite(f,la^[i,0,0],fsize,res);  {write data}
	 
       
       dispose(la); { free buffer}
       close(f);
       
end; 


function loadbmpfile(s:filename;var im:pimage):boolean ; 
type byteimage(maxrow,maxcol,maxpix:integer)=array[0..maxrow,0..maxcol,0..maxpix] of byte;
var f:file of byte; fsize,i,index,j,k,m,row,res:integer; 
	la: ^byteimage; pf:bmpfile;
begin
        loadbmpfile:=false; 
        assign(f,s);        
	reset(f);        
        if ioresult <>0 then begin   	loadbmpfile:=false ;
                                       writeln('cant open ',s,ioresult) ; 
	end
	else 
	begin 	 
		 
	        fsize:=filesize(f); 
		i:=sizeof(bmpfile);
	        blockread(f,pf,i,res); 
	        with pf.filedata.bmiheader do 
		begin 
	                new(im,2,biheight-1,biwidth-1);
			new(la,biheight-1,biwidth-1,2); 
		 
	                if bibitcount=8 then begin loadbmpfile:=false;
				writeln(' 8 bit bmp files not supported');
			end
	                else if bibitcount=24 then 
                        begin 
                           fsize:=(im^.maxplane+1) *(im^.maxcol+1); 
                           if (fsize mod 4)<>0 then fsize:= fsize+4-(fsize mod 4);
	                   { make integral number of words on a line }    
                           for i:=0 to im^.maxrow do  
         		     blockread(f,la^[i,0,0],fsize,res);  {read data}
	 		  im^:= perm[1,2,0]byte2pixel(la^);	
			
			loadbmpfile:=true; 
			end;
			dispose(la); 
	                close(f); 
	        end; 
	end;
end; 

type line (high:integer)=array[0..high] of pixel;

procedure adjustcontrast(f:real; var src,dest:image);
var  l:^line;r:real;
begin
	new(l,src.maxcol);
	{$r-}
	l^:=f;
	if(abs(f) <1) then dest:=src * l^ 
	else dest:=src*f ;
	{$r+}
	dispose(l);
end;


PROCEDURE pconv(VAR im:image;c1,c2,c3: real);
(*!

Convolution of an image by a matrix of real numbers can be used to
smooth or sharpen an image, depending on the matrix used.
If $A$ is an output image, $K$ a convolution matrix, then
if $B$ is the convolved  image
$$B_{y,x}=\sum_i\sum_j A_{y+i,x+j}K_{i,j}$$ 

A separable convolution kernel is a vector of real numbers that can be
applied independently to the rows and columns of an image to provide filtering. 
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
TYPE plane(rows,cols:integer)=ARRAY[0..rows,0..cols] OF pixel;
     
VAR T,l:^plane;
   
    i:integer;   
    PROCEDURE convp(var p,l,T:plane);
    (*! This convolves a plane by applying the vertical and horizontal convolutions in turn.*)
	Var r,c:integer;
    BEGIN (*! This sequence performs a vertical convolution of the rows
        of the plane p and places the result in the temporary plane $T$.
        It uses the lines of pixels {\sf l[i]} as convolution weights. 
        Use of lines of pixels rather than the floating point numbers for the
        kernel weights allows the computation to proceed 8 pixels at a time
        in parallel.
        *)
     {$r-}{disable range checks}
     r:=p.rows;
     	T [1..r-1] := p[0..r-2]*l[0];
	T [1..r-1] := T [1..r-1] +p[1..r-1]*l[1];
	T [1..r-1] := T [1..r-1]+p[2..r]*l[2];
     T[0]:=p[0]; 
     T[r]:=p[r];
	
    (*! Now perform a horizontal convolution of the plane $T$ and
       place the result in p. *)
     c:=p.cols;
     p[0..r,1..c-1]:=T[0..r,0..c-2]*l[0]+T[0..r,2..c]*l[2]+T[0..r,1..c-1]*l[1];
     p[0..r,0]:=T[0..r,0]; 
     p[0..r][c]:=T[0..r][c];
     {$r+}{enable range checks}

    END;
  
BEGIN
      (*! This allocates a temporary buffer to hold a plane, and 3 temporary
        buffers to hold the convolution co-ordinates as lines of pixels. *)      
	new(T,im.maxrow,im.maxcol);
     	new(l,3,im.maxcol); 
     	l^[0]:=c1; l^[1]:=c2; l^[2]:=c3; 
	
     (*! Perform convolution on each of the planes of the image. This has to
         be done with an explicit loop as array maps only works with functions not
        with procedures.  *) 
        FOR i:=0 to im.maxplane DO convp(im[i],l^,T^);
    (*! This sequence frees the temporary buffers used in the convolution process. *)
	dispose(l);  
       dispose(T);
END;


PROCEDURE blur(VAR im:image);begin pconv(im,0.25,0.5,0.25); end;

PROCEDURE sharpen(VAR im:image);
var i:integer;
begin
i:=1;
 pconv(im, -0.25,0.998,-0.25);
 adjustcontrast(3.9,im,im) 
end;

begin
       
end.
    
      
      
