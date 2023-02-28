

unit genericset (t);
interface
type genset=pointer;

(*! The functions getnext, getlast and getfirst must never be called on an empty set. The function
getnext should never be called on the last element of a set. *)
procedure genericsetnext(var v:t;s:genset);
procedure genericsetfirst(var v:t;s:genset);
procedure genericsetlast(var v:t;s:genset);
function genericsetislast(v:t;s:genset):boolean;
function isemptygenericset(s:genset):boolean;
function genericsetnotempty(s:genset):boolean;
procedure addtogenericset(var s:genset;v:t);
function genericsetsingleton(singleton:t):genset;
function genericsetunion(s1,s2:genset):genset;
function genericsetdifference(s1,s2:genset):genset;
function genericsetintersection(s1,s2:genset):genset;
function genericsetsymetricdifference(s1,s2:genset):genset;
function genericseteq(s1,s2:genset):boolean;
function genericsetneq(s1,s2:genset):boolean;
function isin(s:genset;v:t):boolean;
procedure genericsetisin(s:genset;v:t;var b:boolean);
procedure emptygenericset(var newset:genset);{ set newset to be empty }
function genericsetle(s1,s2:genset):boolean;{ s1<=s2}
function genericsetge(s1,s2:genset):boolean;
implementation
type pset=^setrec;
     setrec = record
	 	value:t;
		left,
		right:pset;
		bal:integer;
		end;
	cheat = record
		case boolean of
		true:(yes:pset;);
		false:(no:pointer);
		end;
		procedure phex(p:pointer);
	var r:record
		case boolean of
		true:(i:integer);
		false:(p:pointer);
		end;
	begin
		r.p:=p;
		write(r.i);
	end;
	function pointer2pset(p:pointer):pset;

	begin
	           pointer2pset:=p;
	end;

	function newnode(var key:t; l,r:pset):pset;
	var temp:pset;
	begin

		new(temp);
		with temp^ do begin
			value:=key; left:=l; right:=r;
		end;
		newnode:=temp;
	end;
	procedure genericsetisin(s:genset;v:t;var b:boolean);
	begin b:=isin(s,v);end;
	function genericsetlt(s1,s2:genset):boolean;
		begin genericsetlt:= not isemptygenericset(genericsetdifference(s2,s1)) end;
        function genericsetgt(s1,s2:genset):boolean;
		begin genericsetgt:=genericsetlt(s2,s1); end;
	function genericsetle(s1,s2:genset):boolean;
		begin genericsetle:= not genericsetgt(s1,s2); end;
	function genericsetge(s1,s2:genset):boolean;
		begin genericsetge:=genericsetle(s2,s1) end;
	function genericsetneq(s1,s2:genset):boolean;
		begin genericsetneq:= not genericseteq(s1,s2); end;
	function genericseteq(s1,s2:genset):boolean;
		begin	genericseteq:=isemptygenericset(genericsetsymetricdifference(s1,s2)) end;

	function genericsetsymetricdifference(s1,s2:genset):genset;
	begin
		genericsetsymetricdifference:=genericsetdifference(genericsetunion(s1,s2),genericsetintersection(s1,s2));
	end;
	function genericsetintersection(s1,s2:genset):genset;
	var temp:genset;
		procedure rec(p:pset);
		begin
			if p<>nil then
			with p^ do begin
				if isin(s2,value) then addtogenericset(temp,value);
				rec(right);rec(left);
			end
		end;
	begin
		emptygenericset(temp);
		rec(pointer2pset(s1 ));
		genericsetintersection:=temp;
	end;
	function genericsetunion(s1,s2:genset):genset;
	var temp:genset;
		procedure rec(p:pset);
		begin
			if p<>nil then
			with p^ do begin
				addtogenericset(temp,value);
				rec(right);rec(left);
			end
		end;
	begin
		{emptygenericset(temp);
		rec(pointer2pset(s1 ));}
		temp:=s1;
		rec(pointer2pset(s2 ));
		genericsetunion:=temp;
	end;
	function genericsetnotempty(s:genset):boolean;begin genericsetnotempty:=not isemptygenericset(s) end;
	function isemptygenericset(s:genset):boolean;begin isemptygenericset:=s=nil end;
	procedure emptygenericset(var newset:genset);
	begin 
		newset :=nil;
	end;
	function newset(v:t;l,r:pset):pset;
	var temp:pset;
	begin
		new(temp);
		with temp^ do
		begin
		   value:=v;left:=l;right:=nil;bal:=0;
		end;
		newset:=temp
	end;
	function find(p:pset;v:t):pset;
	begin

		if p=nil then find:=nil
		else with p^ do
		begin
		{   writeln('find ',v,' key ', p^.value);}
		   if v<value then find:=find(left,v)
		   else if value < v then find:=find(right,v)
		   	else find:=p;
		end;
	end;
	function del(var p:pset;v:t):pset;
        var dup,copy:pset;
	begin

		if p=nil then  del:=nil else begin
                  new (dup); dup^:=p^; copy:=p; p:=dup;
		  with p^ do
		  begin
		 
		   if v<value then del:=del(left,v)
		   else if value < v then del:=del(right,v)
		   	else begin
				del:=left;
			        p:=right;
			end;
                  end;
		end;
	end;
        function isin(s:genset;v:t):boolean;begin 
	      {  writeln('isin ', v);}
		isin:=find(pointer2pset(s ),v)<>nil;
	 end;
	procedure genericsetlast(var v:t;p1:genset);
		procedure genericsetright(p:pset);
		begin
			with p^ do
			begin
				if right=nil then v:=value
				else genericsetright(right)
			end
		end;
	begin
		genericsetright(pointer2pset(p1 ));
		
	end;
	function genericsetislast(v:t;p1:genset):boolean;
	var v2:t;
	begin
		genericsetlast(v2,p1);
		
		genericsetislast:=v2=v;
	end;
	procedure genericsetfirst(var v:t;p1:genset);
		procedure genericsetleft(p:pset);
		begin
			with p^ do
			begin
				if left=nil then v:=value
				else genericsetleft(left)
			end
		end;
	begin
		genericsetleft(pointer2pset(p1 ));
		
	end;
	procedure genericsetnext(var v:t;s:genset);
	(*! Note that the genset s should never be nil when this is called. *)
	  function genericsetnextnode(p:pset):pset;
	  var p1:pset;
	  begin
	  	if p=nil then genericsetnextnode:=nil else
		with p^ do
		begin
		  if v<value then begin
		  	p1:=genericsetnextnode(left);
			if p1=nil then genericsetnextnode:=p else genericsetnextnode:=p1
		  end
		  else genericsetnextnode:=genericsetnextnode(right);
		end
	  end;
	  var p2:pset;
	begin
		p2:=genericsetnextnode(pointer2pset(s ));
		v:=p2^.value;
	end;

	type tree=pset;
        typekey=t;
        procedure lrot( var tp : tree );
        var     temp : tree;
                a : integer;
        begin
                temp := tp;
                tp:= tp^.right;
                temp^.right := tp^.left;
                tp^.left := temp;
                {*** adjust balance ***}
                a := temp^.bal;
                temp^.bal := a - 1 - ( tp^.bal max  0 );
                tp^.bal := ( a-2)min( a+tp^.bal-2)min( tp^.bal-1);
        end;
        procedure rrot( var tp : tree );
        var     temp : tree;
                b : integer;
        begin
                temp := tp;
                tp := tp^.left;
                temp^.left := tp^.right;
                tp^.right := temp;
                {*** adjust balance ***}
                b := temp^.bal;
                temp^.bal := b + 1 + ( -tp^.bal max 0 );
                tp^.bal := -(( -b-2)min( -b-tp^.bal-2)min( -tp^.bal-1));
        end;

	function insert( key : typekey; var tp : tree ) : integer;
	var     incr : integer;dup:tree;
	begin

		insert := 0;
		if tp = nil then begin
                	tp:= NewNode( key, nil, nil );
                	tp^.bal := 0;
                	insert := 1;
                end
		else if tp^.value = key then begin
                	 {*** Key already in table ***}
			
		end
		else begin
		   // make sure it is applicative and does not
		   // alter the original tree
		   new(dup);
		   dup^:=tp^;
		   tp:=dup;
		   with tp^ do
		   begin
        		if value< key then incr := insert( key, right )
                	else    incr := -insert( key, left );
        		bal := bal + incr;
			
        		if (incr <> 0) and (bal <> 0) then
                		if bal < -1 then
				begin
				
                        {*** left subtree too tall: right rotation needed ***}
                        		if left^.bal < 0 then   rrot( tp )
                                	else    begin   lrot( left ); rrot( tp ) end
				end
                		else    if bal > 1 then
				begin
                        {*** right subtree too tall: left rotation needed ***}
                        		if right^.bal > 0 then  lrot( tp )
                                	else    begin   rrot( right ); lrot( tp ) end
				end
                	else    insert := 1;
		   end;
        	end
	end;
	procedure addtogenericset(var s:genset; v:t);
	var p:pset;count:integer;
	begin
		if not isin(s,v) then begin
			p:=pointer2pset(S );
			count:=insert(v,p);
			s :=p;	
		end;
	end;
	procedure removefromgenericset(var s:genset; v:t);
	var p,p2:pset;g:genset;
	begin
		if  isin(s,v) then begin
			p:=pointer2pset(S );
			p2:=del(p,v);
			g:=p2;
			s :=p;
			s:=genericsetunion(s,g);	
		end;
	end;
	function genericsetsingleton(singleton :t):genset;
	var s:genset;
	begin
		emptygenericset(s);
		addtogenericset(s,singleton);
		genericsetsingleton:= s;
	end;
	function genericsetdifference(s1,s2:genset):genset;
	const threshold=2;
	var temp:genset;
		procedure rec(p:pset);
		begin
			if p<>nil then
			with p^ do begin
				if not isin(s2,value) then addtogenericset(temp,value);
				rec(right);rec(left);
			end
		end;
		procedure recb(p:pset);
		begin
			if p<>nil then
			with p^ do begin
				removefromgenericset(temp,value);
				recb(right);recb(left);
			end
		end;
		(*! this traverses the set just far enough to detemine if a set is bigger than
                    a threshold size *)
		function big(p:pset;i:integer):integer;
		var j:integer;
		begin
			if i>threshold then big:=i else
			begin
				if p=nil then big := i
				else
				begin
					j:= big(p^.left,i+1) ;
					if j>threshold then big:=j
					else big:=big(p^.right,j);
				end
			end;
		end;
	begin
		if big(pointer2pset(s2),0)>threshold then begin
			emptygenericset(temp);
			rec(pointer2pset(s1 ));
		end
		else begin
			temp:=s1;
			recb(pointer2pset(s2));
		end;
		genericsetdifference:=temp;
	end;


BEGIN
end.
