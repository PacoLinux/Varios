unit expand;
interface uses bmp;
procedure resize(var src,dest:image);
(*! Copy the source image to a  destination image of a different size
applying interpolation if the destination image is bigger*)
implementation
type line (high:integer)=array[0..high] of pixel;
procedure Interpolateh(var src,dest:image);
(*! Interpolate an image in the horizontal direction. Src and dest 
    must differ in size only in the horizontal direction. 
    This is inherently serial code.
 *)
var ratio,p,q:real;i,j,k,l:integer;
begin
	ratio:= (1+ src.maxcol)/(1+dest.maxcol);	
	for j:=0 to dest.maxrow do 
	begin
	  for k:=0 to dest.maxcol do
	  begin
		p:=k*ratio;
		(*! P holds the horizontal position in the source that the 
                    data must come from. *)
		l:=trunc(p); 
		(*! l holds the sample point below p and l+1 holds the position above it *)
		q:=p-l;
		
		(*! q holds the distance away from l, that p was. *)
		if l+1> src.maxcol then dest[][j,k]:=src[][j,l]
		else
		dest[][j,k]:=src[][j,l]*(1-q)+src[][j,1+l]*q;
		(*! Interpolate in the horizontal direction using linear weighting. *)
	  end;
	end;
end;
procedure Interpolatev(var src,dest:image);
(*! Interpolate in the vertical direction. 
    Src, and dest must differ in size only in the vertical direction.
   This is parallel code.
 *)
var l:^line;pp:pixel;i,j,k:integer;ratio,p,q:real;
begin
	new(l,dest.maxcol);
	ratio:= (1+ src.maxrow)/(dest.maxrow +1);	
	for j:=0 to dest.maxrow do
	begin
		p:=j*ratio;
		k:=trunc(p);		
		q:=p-k;
		pp:=q; (*! convert weight to pixel *)
		l^:=pp;(*! replicate to a line to allow efficient vectorisation *)
		for i:=0 to src.maxplane do if k+1 > src.maxrow then  dest[i][j]:=src[i][k]*l^
		else
		 dest[i][j]:=src[i][ 1+k]*l^;
		pp:=1-q;
		l^:=pp;
		for i:=0 to src.maxplane do dest[i][j]:=dest[i][j]+src[i][k]*l^;
	end;
	dispose(l);
end;
procedure resizeh(var src,dest:image);
(*! Change the size of an image in the horizontal direction. Dest must
be same height as src. 
*)
var n:real;t,av:pimage;i:integer;
begin
	
	n:= (1+src.maxcol)/(1+dest.maxcol);
	if n<1 
	then  interpolateh(src,dest)
	else 
	if n=1
	then dest:=src
	else
	if n<=2
	then 
	begin   (*! We can not simply select every nth pixel on a row, since this would allow
                    high frequency noise to penetrate the reduced image. We have to
		    filter out this noise first. The way we do it is by first 
		    forming a new image each of whose pixels is is the average of the
		    corresponding two horizontally adjacent pixels in the source.*)
		new(t,src.maxplane,src.maxrow,src.maxcol);
		new(av,src.maxplane,src.maxrow,src.maxcol);
		adjustcontrast(0.5,src,t^);
		
		av^[][][0..src.maxcol-1]:=t^[][][ 0..src.maxcol-1  ]+t^[][][1..src.maxcol];
		av^[][][src.maxcol]:=src[][][src.maxcol];
		(*! av now contains an horizontally blured version of the source. *)
		dispose(t);
		 interpolateh(av^,dest);
		dispose(av);
	end	
	else
	begin
		(*! Apply the shrinking recursively to get down to a shrinkage factor $< 2$ *);
		new(t,src.maxplane,src.maxrow, (1+src.maxcol) div 2 + -1 );
		resizeh(src, t^);{ by  2 }
		resizeh(t^,dest);{ by n/2 }
		dispose(t);
	end 
end;
procedure resizev(var src,dest:image);
(*! Change the size of an image in the vertical direction. Dest must
be same width as src. 
*)
var n:real;t,av:pimage;rows:integer;
begin
	n:= (1+src.maxrow)/(1+dest.maxrow);
	if n<1 then interpolatev(src,dest)
	else
	if n=1 then dest:=src
	else
	if n<=2
	then 
	begin
		(*! this filters in the vertical direction *)
		new(t,src.maxplane,src.maxrow,src.maxcol);
		new(av,src.maxplane,src.maxrow,src.maxcol);
		adjustcontrast(0.5,src,t^);
		for rows := 0 to src.maxrow-1 do
		av^[][rows]:=t^[][rows ]+t^[][rows+1];
		av^[][src.maxrow]:=src[][src.maxrow];
		(*! av now contains a vertically ally blured version of the source. *)
		dispose(t);
		interpolatev(av^,dest);
		dispose(av);
	end	
	else
	begin
		(*! Apply the shrinking recursively to get down to a shrinkage factor $< 2$ *)
		rows:=src.maxrow div 2;
		new(t,src.maxplane,rows , (src.maxcol)   );
		resizev(src, t^);{ by  2 }
		resizev(t^,dest);{ by n/2 }
		dispose(t);
	end 
	
end;
procedure resize(var src,dest:image);
(*! This invokes the horizontal and vertical resize functions to
do the effective work.

Since vertical interpolation is run in parallel whereas horizontal
interpolation must run sequentially, we want to do as much work as
possible in the vertical resizing. If we are making a picture higher
then it is quicker to resize horizontally and then resize vertically.
If we are reducing the height of a picture the reverse holds. *)
var t:pimage;
begin
	if  (src.maxrow < dest.maxrow) 
	then
	begin
		new(t,src.maxplane,src.maxrow,dest.maxcol);
		resizeh(src,t^);
		resizev(t^,dest);
		dispose(t);
	end
	else
	begin
		new(t,src.maxplane,dest.maxrow,src.maxcol);
		resizev(src,t^);
		resizeh(t^,dest);
		dispose(t);
	end
end;

begin
end.
