program maxcliq;
const maxg =256;
type vertex = 1..maxg;
     vertexset = set of vertex;
     graph=array[vertex] of vertexset;
     vertexarray = array [vertex] of vertex;
     intarray = array[vertex] of integer;
 
var vertmax :integer;
    Cstar,vert,C :vertexset;
    G ,ng:^graph;
    i,cardcstar:integer;
    forwd,reverse,cardinalities,pcard:vertexarray;
    function card(var s:VertexSet):integer;
    var i,c:integer;
    begin
		c:=0;
		for i:=1 to vertmax do if i in s then c:=c+1;
		card:=c;
	end;
	procedure printset(var v:vertexset);
	var i:integer;
	begin
		for i in v do write(i);
		writeln;
	end;
    procedure colourOrder(var P:VertexSet;var order :VertexArray;var bounds :IntArray);
    var pos:vertex; colourable,uncoloured:VertexSet; colour:integer; v:vertex;
    begin
		pos:=1; 
		uncoloured:=P;
		colour:=1;
		while uncoloured<>[ ] do
		begin
			colourable:=uncoloured;v:=1;
			while colourable <> [ ] do
			begin
				 while not ( v in colourable) do v:=v+1;
				(* append v to order and colour to bounds *)
				order[pos]:=v; 
				bounds[pos]:=colour;
				pos:=pos+1;
				 
				uncoloured:=uncoloured -[v]; 
				colourable:=colourable-[v];
				colourable:=colourable - G^[v];
			end;
			colour:=colour+1;
		end;
    end;
    procedure expand(var  C,P:vertexset);
    label 99;
    var order:vertexarray; bounds:intarray;
        v:vertex;i:integer;
        Pprime :vertexset;
        cardc:integer;
    begin
                
		colourOrder(P,order,bounds);
		 
		for i:= card(P) downto 1 do 
		begin
                        cardc:=card(C);
			if (cardc+bounds[i]) <= cardCstar then goto 99;
			v:=order[i];
			C:= C+[v];
			cardc:=card(C);
			if cardc>cardCstar then begin Cstar:=C;cardcstar:=cardc; end;
		 
			Pprime:=P*G^[v];{the vertices in P that are adjacent to v}
			if  Pprime <> [ ] then expand(C, Pprime);
			C:=C-[v];
			P:=P-[v];
		end;
		99:
    end;
    function getnonincreasing (cardinalities:vertexarray):vertexarray;
    type pntr=^sortnode;
         sortnode = record
				left,right:pntr;
				i:integer;
				end;
	var root: pntr;v:integer;
	    order:vertexarray;
	    pos:integer;
	    procedure insert(v:integer;var p:pntr);
	    begin
			if p = nil then 
			begin
			   new(p);
			   with p^ do begin
				i:=v; left:=nil;right:=nil;
			   end;
			end
			else 
			  if cardinalities[v]>cardinalities[p^.i] then insert(v,p^.left)
			  else {if cardinalities [v] = cardinalities[p^.i] then
			  begin
			     if v > p^.i then insert(v,p^.left) else insert(v,p^.right)
			  end
			  else } insert(v,p^.right);
	     end;
	     procedure traverse(p:pntr);
	     begin
			if p<>nil then
			begin
				traverse(p^.left);
				order[pos]:=p^.i;pos:=pos+1;
				traverse(p^.right);
			end;
		end;
	begin
			pos:=1;
			root:=nil;
			for v:=1 to maxg do insert(v,root);
			traverse(root);
			getnonincreasing :=order;
	end;
	function permute(var G:graph;var order:vertexarray):^graph;
	var  i,j,k,l:vertex;
	begin
                new (ng);
		ng^:=[];
		for i:=1 to maxg do
		begin
			k:=order[i];
			for j:=1 to maxg do 
			begin
				l:=order[j];
				if j in G[i] then ng^[k]:=ng^[k]+[l];
			end;
		end;
		permute:=ng;
	end;
	function readin(var G:graph;var max :integer):boolean;
	var edges,s,d,i:integer;c:char;st:string[80];fail:boolean;
	begin
		fail:=false;
		read(c);
		while c='c' do 
		begin
			readln(st);read(c);
		end;
		if c<>'p' then
		begin writeln('error in input file format, expected a p line');fail:=true; end
		else 
		begin
			for i:=1 to 5 do read(c); { skip ' edge'}
			read(max);
			readln(edges);
			for i:=1 to edges do 
			if not fail then
			begin
				read(c); 
				if c<>'e' then
				begin writeln('error in input file format, expected a p line');fail:=true; end
				else 
				begin
					readln(s,d);
					G[s]:=G[s]+[d];G[d]:=G[d]+[s];
				end;
			end;
		end;
		max:=max;
		readin:= not fail;
	end;
	
begin
   
   
 
  new (G);
  cstar:=[ ];
  cardcstar:=0;
  C:=[ ];
 
  if readin(G^,vertmax) then
  begin
         
	  vert:=[1..vertmax];
	  cardinalities:=card(G^);
	 
	  {permute G so th;at vertices are in non-increasing degree order, tie-breaking on vertex number}
	  forwd:=getnonincreasing(cardinalities);
	  for i:=1 to maxg do reverse[forwd[i]]:=i;
	  G:=permute(G^,reverse);
	  pcard:=cardinalities[forwd]; 
	  cardinalities := card(G^);;
	 
	   
	  expand(C,vert);
	 printset(cstar);
	 
	 write('cliquesize');writeln(card(cstar));
  end;
end.    
