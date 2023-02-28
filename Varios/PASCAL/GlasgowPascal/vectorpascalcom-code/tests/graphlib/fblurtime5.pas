program fblurtime;
uses bmp;

var i:integer;
var inm,outm:pimage;
const source='grey1.bmp';
var     r,c:integer;
     c0,c1,c2:real;
PROCEDURE pconv(VAR im:image);
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
     	T [1..r-1] :=  p[0..r-2]* l[0];
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
     	l^[0]:=0.25; l^[1]:=0.5; l^[2]:=0.25; 
	
     (*! Perform convolution on each of the planes of the image. This has to
         be done with an explicit loop as array maps only works with functions not
        with procedures.  *) 
        FOR i:=0 to im.maxplane DO convp(im[i],l^,T^);
    (*! This sequence frees the temporary buffers used in the convolution process. *)
	dispose(l);  
       dispose(T);
END;


PROCEDURE blur(VAR im:image);begin pconv(im); end;

 begin
	 if loadbmpfile(source,inm) then
	 begin
		blur(inm^);
		storebmpfile('mee.bmp',inm^);
	end
	else writeln('failed open file');
 end. 
