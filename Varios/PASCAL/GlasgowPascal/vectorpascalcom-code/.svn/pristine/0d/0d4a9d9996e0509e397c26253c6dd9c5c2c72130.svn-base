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
	la: ^byteimage; pf:bmpfile;bb:byte;
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
		{	writeln('read header');}
	                new(im,2,biheight-1,biwidth-1);
			new(la,biheight-1,biwidth-1,2); 
		    { writeln('created array la',biheight-1,biwidth-1,2);{}
	                if bibitcount=8 then begin 
                          loadbmpfile:=false;
				  writeln(' 8 bit bmp files not supported');
			   end
	                else if bibitcount=24 then 
                        begin 
                           fsize:=(im^.maxplane+1) *(im^.maxcol+1); 
                           if (fsize mod 4)<>0 then fsize:= fsize+4-(fsize mod 4);
	                   { make integral number of words on a line }    
                           for i:=0 to im^.maxrow do  begin
			{	writeln('read row',i);}{$r-}
				bb:=la^[i,0,0];
			{	writeln('got byte');}
         		     blockread(f,la^[i,0,0],fsize,res);  {read data}
			    end;  
		{	writeln('permute ');}
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
    
      
      


