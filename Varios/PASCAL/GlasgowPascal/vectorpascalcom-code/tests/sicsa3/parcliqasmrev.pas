program parcliqasmrev;
 
uses threadlib;
const maxg =1024;
type vertex = 1..maxg;
     vertexset = set of vertex;
     graph=array[vertex] of vertexset;
     vertexarray = array [vertex] of vertex;
     intarray = array[vertex] of integer;
var vertmax :integer;
    m:Mutex;
    Cstar,empty,vert,C :vertexset;
    G ,
    CC,Pprime:^graph;
    gorder:vertexarray; 
    gbounds:intarray;
    i,k,cardcstar:integer;
    forwd,reverse,cardinalities,pcard:vertexarray;
 
    function card(var s:VertexSet):integer;
    var i,c:integer;
    function Pcounter(var s:vertexset):integer;external;
    begin
       card :=Pcounter(s);
	{	c:=0;
		for i:=1 to vertmax do if i in s then c:=c+1;
		card:=c;}
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
		while uncoloured<>empty do
		begin
			colourable:=uncoloured;v:=1;
			while colourable <> empty do
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
    

    procedure expand(   C,P:vertexset);
    label 99;
    var order:vertexarray; 
        bounds:intarray;
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
			if cardc>cardCstar then 
                        begin 
                                mutex_lock(m);
                                if cardc>cardCstar then 
                                begin
                                Cstar:=C;
                                cardcstar:=cardc; 
                                end;
                                mutex_unlock(m);
                        end;
		 
			Pprime:=P*G^[v];{the vertices in P that are adjacent to v}
			if  Pprime <> empty then expand(C, Pprime);
			C:=C-[v];
			P:=P-[v];
		end;
		99:
    end;
    procedure preexpand(   C,P:vertexset);
    type col(len:integer)=array[1..len,1..1] of integer;
         pcol=^col;
    var order:vertexarray; 
        bounds:intarray;
        v:vertexarray;i,initcard:integer;
        column:pcol;
        cardc:intarray;
        
        pure function f(i:integer):integer;
        label 99;
        begin
              if (initcard+ bounds[i]) <= cardCstar then goto 99;
                        v[i]:=order[i];
                        CC^[i]:=  [v[i]];
                        cardc[i]:=card(CC^[i]);
                        if cardc[i]>cardCstar then 
                        begin 
                                mutex_lock(m);
                                if cardc[i]>cardCstar then 
								begin 
										Cstar:=CC^[i];
                                        cardcstar:=cardc[i]; 
                                end;
                                mutex_unlock(m);
                        end;
                 
                        Pprime^[i]:=P*G^[v[i]];{the vertices in P that are adjacent to v}
                        if  Pprime^[i] <> empty then expand(CC^[i], Pprime^[i]);
                       { C:=C-[v[i]];}
                        mutex_lock(m);
                        P:=P -[v[i]];
                        mutex_unlock(m);
                99:f:=cardc[i];
        end;
    begin
                colourOrder(P,order,bounds);
                new (column, vertmax);
                
                initcard:=card(C);
                {$par}
                for i:= 1 to vertmax do 
                column^[1+(vertmax-i)]:=f(1+vertmax-i);
                
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
	var  i,j,k,l:vertex;ng:^graph;
	begin
                new(ng);
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
					G[s]:=G[s]+[d];
                                        G[d]:=G[d]+[s];
				end;
			end;
		end;
		max:=max;
		readin:= not fail;
	end;
	
begin
  empty:=[ ];
  cstar:=empty;cardcstar:=0;C:=empty;new (CC); new (pprime);new (G);
   if mutex_init(m) =0 then
  begin
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
                
                preexpand(C,vert);
                printset(cstar);
                
                write('cliquesize');writeln(card(cstar));
        end
        else writeln('mutex init fails');
  end
  else writeln('file read fails'); 
end.    
