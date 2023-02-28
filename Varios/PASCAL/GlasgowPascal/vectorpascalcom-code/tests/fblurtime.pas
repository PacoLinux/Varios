program fblurtime;

 
const size=1024;
      runs=30;
type pmat= ^matrix;
      var im: pmat;   t1,t2:double; i:integer;
PROCEDURE pconvp(VAR p:matrix;c0,c1,c2: real);
 
(*!

Convolution of an image by a matrix of real numbers can be used to
smooth or sharpen an image, depending on the matrix used.
If $A$ is an output image, $K$ a convolution matrix, then
if $B$ is the convolved  image
$$B_{y,x}=\sum_i\sum_j A_{y+i,x+j}K_{i,j}$$ 

A separable convolution kernel is a ve T^[][1]:=T^[][2];T^[][r+1]:=T^[][r];ctor of real numbers that can be
applied independently to the rows and columns of an image to provide filtering. 
It is a specialisation of the more general
convolution matrix, but is algorithmically more effplaneicient to implement.

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
 
     
VAR T,l:pmat;
   
    i:integer;   
     r,c:integer;
    BEGIN (*! This sequence performs a vertical convolution of the rows
        of the plane p and places the result in the temporary plane $T$.
        
        *)
     {$r-}{disable range checks}
     
     r:=p.rows;c:=p.cols;
     new (T, r+2,c+2);T ^[2..r+1,2..c+1] :=  p[1..r,1..c];
     (*! Allocate a temporary array initialised in the middle to the original one.*)
     T^[1]:=T^[2];
     T^[r+2]:=T^[r]+1; 
    
     (*! We now replicate out the   rows   to fill the top and bottom margins of the temporary array.  *)

    (*! Now perform a vertical convolution of the plane $T$ and
       place the result in p. Note that this is done by multiplying the whole temporary array by the kernel constants
       and then adding shifted versions of it. *)
    
     p [1..r,1..c]:=T^[2..r+1,2..c+1]*c1+T^[1..r,2..c+1]*c0+T^[3..r+2,1..c+1]* c2;
     (*! again place it into the temporary array and this time replicate horizontaly *)
     T ^[2..r+1,2..c+1] :=  p[1..r,1..c];
     T^[][1]:=T^[][2];T^[][r+1]:=T^[][r];
     (*! Nopw perform a horizontal convolution *)
     p [1..r,1..c]:=T^[2..r+1,2..c+1]*c1+T^[2..r+1,1..c]*c0+T^[2..r+1,2..c+2]* c2;
     {$r+}{enable range checks}
     dispose(T);
    END;

 
PROCEDURE blurp(VAR im:matrix);begin pconvp(im,0.25,0.5,0.25); end;
PROCEDURE cconv(VAR p:real; rows,cols:integer; c1,c2,c3:real);external;
 
 begin
   new(im,size,size);
   t1:=secs;
   for i:=1 to runs do blurp(im^);
   t2:=secs;
   writeln('PASCAL ',t2-t1);
   t1:=secs;
   for i:= 1 to runs do cconv(im^[1,1],size,size, 0.25,0.5,0.25);
   T2:=SECS;
   writeln('C      ',t2-t1);

 end. 
