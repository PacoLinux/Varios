program pcc(input,output);
{$apptype console}
{interface}
  uses
  ilcp,
  lexlib,
  yacclib,
  lists,
  dlbvp,
  i486,
 { idtypes ,}
  intelcallbacks in 'intelcallbacks.pas';

{  }


{implementation }

const  maxid = 2450;
       nulid = 2000;
       global_level = 0;
       maxcart = 20;
       address_size =4;
       truecode = -1;
       falsecode = 0;
       machine_address= faddr;
       int_size=4;
       real_size=4;
       ib_format=fint32;
       real_format=fieee32;
       charformat = fuint16;
       closure_format= machine_address;
       heappntr_size   = address_size;
                           { for the moment we assume that all pointers}
                           { are the same size }
       pntr_on_stack_size = heappntr_size;
       stack_linkage_space=2* address_size; { space for bp and ret addr }
type parameterref = ^ paramrec;
     labl=lextoken;
     labstring=string[20];
     typerec=cell;
     paramrec = record
                paramname:lextoken;
                next:parameterref;
                end;
     nametype   = (global,local,param,result,
                  static,typename,constant,field,
                  enumelement);

var
    fieldoffset :integer;                     { holds the offset in record
                                                at which spaceis being allocated}
    labelnum:integer;
    tempid:cell;
    {  attributes used to describe variables }
    offset,domainspace,typeinfo,name_type,atomic, translation:lextoken;
(*! This procedure does the translation from a syntax tree to code
	initially it just produces a log file listing
*)
procedure translate( tree:cell;var asmfile:text); forward ;
procedure enterlexlevel;forward;
procedure exitlexlevel;forward;
procedure enter_scope; forward;
procedure exit_scope; forward;
function lookup(id :lextoken):cell; forward; (* return attribute list *)
function dyad(left,op,right:cell):cell; forward;
function monad(op,right:cell):cell;forward;
function mkifthenelse(cond,left,right:cell):cell;forward;
function mkfnhdr(i:lextoken;args,res:cell):cell;forward;
function mkcase(sel,caselist,alternative:cell):cell; forward;
function mkrepeat(action,test:cell):cell; forward;
function mkwhile(test,action:cell):cell; forward;
function newname(i:lextoken; t:cell; sort:nametype):cell;forward;
function mkfor(iterator,start,stop,step,action:cell):cell;forward;
function mkrangetyperef(l,h:cell):cell;forward;
function mkarraytype(r,d:cell):cell;forward;
procedure pushcell(l:cell);forward;
function popcell:cell;forward;
procedure declarevars(varlist:cell;typeexp:cell);forward;
function gettypefromcell(t:cell):cell;forward;
function spaceusedbytype(typelist:cell):integer;forward;
procedure error(m:string);forward;
procedure printlist(l:cell);forward;
var
    asmfile:text;
    cellstack:array[0..100] of cell;
    scopelist:cell;
    cellstackpntr,lexlevel:0..100;
    
    globalbase,localbase:pilcgnode;
     allocationdir: integer; { do we allocate up or down }
     global_allocator,local_allocator:integer; { hold the address at
                                                which space is being
                                                allocated in global or
                                                local space }



     VOID :typerec;
     char_type,
     byte_type,
     int_type ,
     word_type,
     cint_type ,
     bool_type ,
     cbool_type ,
     file_type ,
     cfile_type ,
     string_type ,
     cstring_type ,
     real_type ,
     creal_type ,
     pntr_type ,
     address_type,
     cpntr_type ,
     condition_type,
     structure_type : typerec ;

     lexical_level :  byte ;
    {$i vps.pas}
    {$i vplex.pas}

{--------------------------------------------------------------- }
{ push and pop cells                                             }
{ -------------------------------------------------------------- }
function popcell:cell;
begin
  cellstackpntr:= pred(cellstackpntr);
  popcell:=cellstack[cellstackpntr];
end;
procedure pushcell(l:cell);
begin
    cellstack[cellstackpntr]:= l;
    cellstackpntr:= succ(cellstackpntr);
end;

procedure enterlexlevel;begin lexlevel:=succ(lexlevel); end;
procedure exitlexlevel ;begin lexlevel:=pred(lexlevel); end;
procedure enter_scope; begin pushcell(scopelist); end;
procedure exit_scope; begin scopelist:=popcell; end;
function lookup(id :lextoken):cell;  (* return attribute list *)
begin lookup:= tail(findkeyvalpair(id, scopelist)) end;
function getattribute(id,attributename:integer):cell;
begin
  getattribute:=tail(findkeyvalpair(attributename,lookup(id)) )
end;
procedure createattribute(id,attributename:lextoken);
begin
  settail(findkeyvalpair(id,scopelist) , cons(attributename,nullcell))
end;
procedure setattribute(id,attributename:integer;attributeval:cell);
var c:cell;
begin
  c:=lookup(id);
  if findkeyvalpair(attributename,c)=nullcell then
   createattribute(id,attributename);
  udatevalue(attributename, attributeval,c)
end;

{ -------------------------------------------------------------- }
{ mkarraytype                                                    }
{     build a typref from a range and a domain                   }
{ --------------------------------------------------------- -----}

function mkarraytype(r,d:cell):cell;
var t1,t2:cell;
begin
     t1:=gettypefromcell(r);t2:=gettypefromcell(d);
     mkarraytype:=cons((_array_),cons(t1,t2))  ;
end;
{ ---------------------------------------------------------------- }
{ GetIntValFromCell                                                }
{    sees if the cell corresponds to an integer value              }
{    and if so returns it                                          }
{----------------------------------------------------------------- }
function GetIntValFromCell(c:cell):int64;
var n:cell;
begin
    if isint(c) then
        getIntValFromCell:=getint(c)
    else
      if istoken(c) then
      begin
        n:=lookup(c);
        if isint(n)  then  getintvalfromcell:=getint(c)
        else error('name must be a constant or element of an enumerated type');
      end
      else error('integer value wanted here');
end;
{ ---------------------------------------------------------------- }
{ MK_RangeTyperef                                                  }
{        Construct a subrange type from cells                      }
{----------------------------------------------------------------- }
function mkrangetyperef(l,h:cell):typerec;
var t1,t2:cell;
begin
          t1:=gettypefromcell(l);
          t2:=gettypefromcell(h);
          if not(t1=t2) then
                        error(  'the lower and upper parts of a range must be of the same type');
          mkrangetyperef:=cons(dotdot,cons(t1,cons( getintvalfromcell(l),getintvalfromcell(h))));
end;
function isrange(l:typerec):boolean;begin isrange:=head(l)=dotdot end;
function parent(t:typerec):cell;
begin
	if not isrange(t) then error('this type is not a range so its parent type is undefined'); 
	parent:=head(tail(t))
end;
function lwb(t:typerec):cell;begin lwb:=head(tail(tail(t))) end;
function upb(t:typerec):cell;begin upb:=tail(tail(tail(t))) end;
function mk_set(t:typerec):typerec ; begin mk_set:=cons(_SET_,t) end;
function elementtype(settype:typerec):typerec;
begin
	elementtype:=tail(settype)
end;


{ ------------------------------------------------------------------ }
{      APPEND_ELEMENT                                                }
{             add a element to an enumerated type                    }
{ ------------------------------------------------------------------ }

procedure append_element(t:cell;id:lextoken);

begin newname(id, t, enumelement);
      append(t,id);
 end;


{ ------------------------------------------------------------------- }
{ BINDLABEL                                                           }
{ ------------------------------------------------------------------- }
procedure bindlabel(l:labl;v:cell);
begin
   setattribute(v,_label_, l);
end;

{------------------------------------------------------------------- }
{   Fixup params                                                     }
{------------------------------------------------------------------- }
procedure fixup_params( theproc:lextoken;parameters:parameterref;result:cell);
{ call the code generator to assign offsets to the parameters }
{ proceed in reverse order to declaration }
var ptotal,param_sp:integer;

function fixup_param(var i:lextoken):integer;
var size:word;
begin
     size:=spaceusedbytype(getattribute(i,typeinfo));

     setattribute(i, offset,param_sp);
     param_sp := size + param_sp;

     fixup_param:=size;
end;
   procedure listchase(i:parameterref);
   begin
        if i<> nil then
        with i^ do
        begin
             listchase(next);
             ptotal:=ptotal+fixup_param(paramname);
        end;
   end;

begin
    ptotal:=0;
    param_sp:=stack_linkage_space;
    listchase(parameters);
    setattribute(theproc,domainspace,ptotal);

end; (*
{ ------------------------------------------------------------------ }
{  REWINDFIELDS                                                      }
{     find the first field of a structure                            }
{ ------------------------------------------------------------------ }
var first:cell;
procedure rewindfields(n:cell);
begin
  first:=n-cardof(domainof(scopelist[n]^.typeinfo));
end;
function getnextfield:lextoken;
begin
   getnextfield:=scopelist[first]^.identifier;
   first:=first+1;
end;  *)



{ ------------------------------------------------------------------ }
{        Define generator functions                                  }
{ ------------------------------------------------------------------ }




function newlab:integer;
  function uencode(i:integer):labstring;
  begin
    if i<=0 then  uencode:=''
    else uencode:=uencode(i div 21) +chr(ord('A')+( i mod 24))
  end;
    
begin
     labelnum:=labelnum+1;
     newlab:=tokenof('_lQqZx'+uencode(labelnum));
end;

function already_declared_here( id  :lextoken):boolean;
var trav,last:cell;   label 99;
begin
   trav:=scopelist;  last:=popcell;pushcell(last);
   while trav<>nullcell do
   begin
         if trav=last  then  begin
           already_declared_here:=false;
           goto 99;
         end;
         if head(head(trav))=id then begin
           already_declared_here:=true  ;
           goto 99;
         end;
   end;
      already_declared_here:=false;
      99:
end;
function mk_atomic(formatcode:integer):cell;
begin
	mk_atomic:=cons(atomic,formatcode)
end;
{---------------------------------------------------- }
{ data_format					      }
{ returns the format code for a type held in	      }
{ linked list form                                    }
{-----------------------------------------------------}

function data_format(typecell:cell):integer;
begin
	data_format:=0;
	if atomic=head(typecell) then
		data_format:=tail(typecell)
	else
	
		error('internal error, could not recognise typecell '+psym(head(typecell)))
end;

function stackspace(t:cell):integer;
begin
  stackspace:=lengthinbytes(data_format(t))
end;
function declare_global(i:lextoken;var typedata:cell):integer;
begin
    global_allocator:= global_allocator+stackspace(typedata)*allocationdir;
     setattribute(i,translation,pntrlit(new_memref(
      new_dyad(globalbase,'+',new_intlit(local_allocator,fint32)),      data_format(typedata)) ) );
    declare_global := global_allocator;
end;

function declare_local(i:lextoken;var typedata:cell):integer;
begin
    local_allocator:= local_allocator-stackspace( typedata)*allocationdir;
    setattribute(i,translation,pntrlit(new_memref(
      new_dyad(new_deref(localbase),'+',new_intlit(local_allocator,fint32)),
      data_format(typedata))));
    declare_local := local_allocator;
end;
function  newname(i:lextoken; t:cell; sort:nametype):cell;
var          l:labl;
begin
     if already_declared_here(i) then begin Error('Already declared here'); exit end;
     scopelist:=cons(cons(i,nullcell),scopelist);
     newname:=head(scopelist);
     setattribute(i,(name_type),ord(sort));
     setattribute(i,typeinfo,t);
      begin

          case sort of
          global :  setattribute(i,offset,declare_global(i,t));
          local  : setattribute(i,offset,declare_local(i,t));
          field  : begin setattribute(i, offset,fieldoffset);
                         fieldoffset:=stackspace(t)+fieldoffset;
                   end;
          constant:begin l:=newlab;
			 setattribute(i,_label_,l);
                          
                   end;
          end;
     end;
end;
procedure getconst(original:lextoken;var literal:integer;var t:cell);
begin 
     case getattribute(original,name_type) of
     ord(enumelement): begin
                       t:=typeinfo;
                       literal:=offset;
                  end;
     ord(constant): begin
                   t:=typeinfo;
                   literal:=(offset)
               end;
     else  error('not known at compile time');

     end
end;
procedure defconst(i:lextoken;val:integer);
begin
     setattribute(i,_const_,val);
      
end;
procedure make_idalias( original,copy:lextoken;var t:cell);
begin
      scopelist:=cons(cons(copy,lookup(original)),scopelist);
     
end;
function  newdummy(i:lextoken; t:cell; sort:nametype ):cell;
 
begin
     newdummy:=newname(i, t, sort)
      
end;
    (*
procedure exitblock( oldscope:namedesc;  t:cell);
label 99;
begin
    { dispose of objects declared in the block }
  scope_level:=scope_level - 1;
  if (nametop>nulid) and(scopelist[nametop-1]^.block_level >scope_level) then
    begin
    while (nametop>nulid)and
    ( scopelist[nametop-1]^.block_level >scope_level )do
    begin
      nametop:=nametop-1;
    end;
  end
end;
       *)










{---------------------------------------------------------------- }
function gettypefromcell(t:cell):cell;

begin
     gettypefromcell:=void;
     if typemap[t] =nullcell then begin
	     if isid(t) then
	     begin
	          if lookup(t)=nullcell then error('undeclared type');
         
	          gettypefromcell:= getattribute(t,typeinfo);
	     end
	     else if isint(t) then begin
	           gettypefromcell:=int_type ; typemap[t]:=int_type;
	     end
	     else if isrealcell(t) then
	     begin
	           gettypefromcell:=real_type ; typemap[t]:=real_type;
	     end
	     else if ispntr(t) then 
		error(' internal error should not have pntr here')
     end
     else
     gettypefromcell:=typemap[t];
end;
procedure error(m:string);
begin
     yyerror(m);
     halt(1);
end;
procedure newid(id:lextoken; t:cell;inrecord:boolean);

begin
 if inrecord then newname(id,t,field) else
 if lexical_level = global_level then newname(id,t,global)
 else newname(id,t,local);
end;
procedure declarevars(varlist:cell;typeexp:cell);
begin
     if ispair(varlist) then
     begin
          declarevars(head(varlist),typeexp);
          declarevars(tail(varlist),typeexp);
     end
     else
     begin
          newid(varlist,(typeexp),false);
     end;
end;
{constructors and deconstructors }

function dyad(left,op,right:cell):cell;
begin
  dyad:=cons(dyadic,cons(op,cons(left,right)))
end;
function isdyad(l:cell):boolean;begin isdyad:=head(l)=dyadic end ;
function getleft(l:cell):cell;begin getleft:=head(tail(tail(l)))end;
function getright(l:cell):cell;begin getright:=tail(tail(tail(l))) end;
function getop(l:cell):cell;begin  getop:=head(tail(l)) end;
function monad(op,right:cell):cell;
begin
     monad:=cons(monadic,cons (op, right));
end; 
function ismonad(l:cell):boolean;begin ismonad:=head(l)=monadic end ;
function isx(n,x:cell):boolean;
begin
        if ispair(n) then isx:= head(n)=x else isx:=false
end;
function isfor(n:cell):boolean;begin    isfor:=isx(n,_for_)end;
function mkfor(iterator,start,stop,step,action:cell):cell;
begin
                                        mkfor:= cons(_for_,
                                                          cons(
							        cons(iterator,
								     cons(start,
									  cons(stop,step)
								     )
                                                                    ),
                                                                action
							   )
                                                         );
end;
function mkifthenelse(cond,left,right:cell):cell;
begin
     mkifthenelse:=CONS(_IF_,CONS(cond,CONS(left,right)))
end;
function getifcond(l:cell):cell;begin getifcond:=head(tail(l))end;
function getthen(l:cell):cell;begin getthen:=head(tail(tail(l)))end;
function getelse(l:cell):cell;begin getelse:=tail(tail(tail(l)))end;
function isif(l:cell):boolean;begin isif:=isx(l,_if_)end;

function mkfnhdr(I:lextoken;args,res:cell):cell;
begin
     mkfnhdr:=CONS(_FUNCTION_,CONS(I,CONS(args,res)))
end;
function getfnid(l:cell):lextoken;begin getfnid:=head(tail(l))end;
function getfnargs(l:cell):cell;begin getfnargs:=head(tail(tail(l)))end;
function getfnres(l:cell):cell;begin getfnres:=tail(tail(tail(l)))end;
function isfn(l:cell):boolean;begin isfn:=isx(l,_function_)end;
function mkcase(sel,caselist,alternative:cell):cell;
begin
     mkcase:=CONS(_CASE_,CONS(sel ,CONS(caselist,alternative)))
end;
function iscase(l:cell):boolean;begin iscase:=isx(l,_case_) end;
function mkrepeat(action,test:cell):cell;
begin
     mkrepeat:=cons(_REPEAT_,cons(action,test));
end;
function getrepeatcond(l:cell):cell;begin getrepeatcond:=tail(tail(l))end;
function getrepeataction(l:cell):cell;begin getrepeataction:=head(tail(l))end;
function isrepeat(l:cell):boolean;begin isrepeat:=isx(l,_repeat_)end;
function mkwhile(test,action:cell):cell;
begin
     mkwhile:=cons(_WHILE_,cons(test,action))
end;
function iswhile(l:cell):boolean;begin iswhile:=isx(l,_while_)end;
function istpntr(l:cell):boolean;
var i:integer;
begin
	i:=head(l);
	istpntr:= (i = atomic)or(i=_record_)or
                  (i=_array_)or(i=_set_) or( i=dotdot)
end;
function ptype(c:cell):string;
var i:integer;
begin
	i:=head(c);
	ptype:='';
	if i = atomic then
	case tail(c) of
		fint8:ptype:='boolean';
		fint32:ptype:='integer';
		fieee32:ptype:='real';
		
	end
end;

procedure printlist(l:cell);
    begin
	 	{write(l:5,':');}
     if l<=127 then write (chr(l))
     else
     if istpntr(l) then write(ptype((l)))
     else
     if isint(l)
     then write(round(1.0*getint(l)))
     else
     if isrealcell(l)
     then  write(getreal(l))
     else
     if isstring(l)
     then  write(psym(l))
     else
     if l= defeq
     then write(':=')
     else
     if istoken(l)
     then begin
               if (_ABS_>=l) and( l<=_XOR_)
               then write(keyword[1+l-_ABS_])
               else
               if l<=127 then write (chr(l))
               else write(token2keyword(l));
          end
     else
     if ispair(l)
     then begin
          if isdyad(l)
          then begin
		    write('(');
                    printlist(car(cdr(cdr(l))));
                    printlist(car(cdr(l)));
                    printlist(cdr(cdr(cdr(l))));
		    write(')');
               end
          else
          if ismonad(l)
          then begin

                    printlist(car(cdr(l)));
		    write('(');
                    printlist(cdr(cdr(l)));
		    write(')');
               end
          else
          begin
               write('(');
               printlist(car(l));
               write(',');
               printlist(cdr(l));
               write(')');
          end
     end
     else
       begin write(l);


       end
    end;


function isrealtype( t:typerec):boolean;
begin
    isrealtype:= (data_format(t)=fieee32)or (data_format(t)=fieee64);
end;
function isintegertype( t:typerec):boolean;
begin
    isintegertype:= (t=int_type)
             or
             (head(t) = dotdot)  ;
end;
function isproc( t:typerec):boolean;
begin
    isproc:= (head(t)=_function_);
end;




procedure translate(tree:cell;var asmfile :text);


	function ptrans(tree:cell):boolean;
	var     typeok,codegenok,transformok:boolean;
	        cooked :  pilcgnode;
	        assemblerfile:text;
                procedure typeerr(s:string;c:cell);
                begin
                     writeln('type error on line ',getline(c));
                     writeln(s);
                     halt(3);
                end;

		{ ----------------------------------------------------
		AdominatesB
		returns true if the set of values of type B
		is a subset of the set of values of type A
		--------------------------------------------------- }
		function AdominatesB(A,B:typerec):boolean;
		var a_constructor:lextoken;
                begin
		     a_constructor:=head(a);
                     if isrealtype(A) then
                       AdominatesB:= isIntegerType(B) or
                                     ( isrealtype(B) and
                                      ( (data_format(A)=fieee64  )
                                       or
                                       (data_format(A)=data_format(B))
                                      )
                                     )
                     else
		     
                      if a_constructor=ord('^')  then 
                         AdominatesB:=AdominatesB(tail(A),tail(B))
		      else
		      if a_constructor=_string_ then begin
                                                  if head(b)=_string_ then
                                                  AdominatesB:= tail(A)>=tail(B)
                                                  else AdominatesB:=B=char_type
                                             end   
                      else
                      if a_constructor=_set_ then
                        AdominatesB:=AdominatesB(tail(A),tail(B))
		      else
		      if a_constructor= dotdot then
                       AdominatesB:=((lwb(A))<=(lwb(B)))
                                                           and
                                    (upb((A))>=(upb(B)))
                                                          
                      else AdominatesB:= a=b;
                end;
		{ ----------------------------------------
		  LUB
		  finds the least upper bound of types A,B
		  in the type lattice
		  ---------------------------------------- }
		function LUB(A,B:typerec):typerec;
		var a_constructor:lextoken;
		begin
		     a_constructor:=head(a);
		     if A=B then LUB:=A else
		     if A_constructor = dotdot then
		            LUB:=LUB(B,parent(A))
		     else
		     if A_constructor = _string_ then begin
				if AdominatesB(A,B) then LUB:=A else
		                if AdominatesB(B,A) then LUB:=B else
		                LUB:=string_type
		     end else
		     if A_constructor = ord('^') then begin
		     		if AdominatesB(A,B) then LUB:=A else
		                if AdominatesB(B,A) then LUB:=B else
		                LUB:=pntr_type;
		     end else
		     if a_constructor = _set_ then
		      LUB:= mk_set(LUB(elementtype(a),elementtype(b)))

		     else     LUB:=void;
		     
		end;
		                 
		{ ----------------------------------------------------
                   BalanceTypes
                      given two types left and right, it checks that they
                      are dominated by upb, and returns the least upper
                      bound of the types left and right in the Pascal
                      type lattice
                   ----------------------------------------------------  }
                function balancetypes(left,right,upb:cell;src:cell):cell;
                 begin
                     if not AdominatesB(upb,left) then
                        typeerr(ptype(left)+' is not a '+ ptype(upb),src);
                     if not AdominatesB(upb,right) then
                        typeerr(ptype(right)+' is not a '+ ptype(upb),src);
                     if AdominatesB(left,right) then balancetypes:=left
                     else
                     if AdominatesB(right,left) then balancetypes:=right
                     else balancetypes:=upb;
                 end;
                {------------------------------------------------}
                { typecheck                                      }
                { this traverses the tree and checks each node   }
                { as it does so it updates the type records for  }
                { all nodes in the typemap array                 }
                { this allows fast caching of type checking      }
                { subsequently                                   }
                {----------------------------------------------- }
	         procedure typecheck(tree:cell);
                 var cond,then_,else_,action,left,right,op:cell;
	         begin

	              if iscell(tree) then
	              begin
                        if ispair(tree) then
                        begin
                        { --------------------------------------------}
                        { test dyadic expressions for type correctness}
                        {---------------------------------------------}
                            if isdyad(tree) then
                            begin
                                 left:=getleft(tree);
                                 right:=getright(tree);
                                 op:=getop(tree);
                                 typecheck(left); typecheck(right);
                                 case op of

                                 STAR,
                                 MINUS:begin
                                           if typemap[left]=typemap[right] then
                                           begin
                                                typemap[tree]:=typemap[left];
                                                if not (
                                                  isintegertype(typemap[left]) or
                                                  isrealtype(typemap[left]))
                                                  or (typemap[left] = bool_type)
                                                then
                                                typeerr(' integer or real required ',tree);
                                           end
                                           else
                                           typemap[tree]:=balancetypes(typemap[left],typemap[right],real_type,tree)
                                      end ;
                                 _div_: begin
                                                if not (
                                                  isintegertype(typemap[left]) and
                                                  isintegertype(typemap[right]) )
                                                then
                                                typeerr(' integers required for div ',tree)
                                           else
                                           typemap[tree]:=int_type
                                      end ;
                                 PLUS : begin
                                          if isintegertype(typemap[left])or isrealtype(typemap[left]) then
                                               typemap[tree]:= balancetypes(typemap[left],typemap[right],real_type,tree)
                                          else
                                          if (head(left) = _string_)or (head(left)=_set_) then
                                              typemap[tree]:= balancetypes(typemap[left],typemap[right],lub(typemap[left],typemap[right]),tree)
                                          else typeerr(' + only allowed on numbers, strings and sets ',tree)

                                        end

                                 else begin
                                       typeerr(' unrecognised operator ',tree);
                                      end
                                 end
                            end
                            else
                        { --------------------------------------------}
                        { test repeat loops for type correctness      }
                        { --------------------------------------------}
                            if isrepeat(tree) then
                            begin
                                 typemap[tree]:=void;
                                 cond:= getrepeatcond(tree);
                                 typecheck(cond);
                                 if typemap[cond]<>bool_type then
                                    begin
                                           typeerr('must be boolean ',cond);
                                    end ;
                                 action:=getrepeataction(tree);
                                 typecheck(action);
                                 if typemap[action]<>void then
                                       begin
                                           typeerr('must be void ',action);
                                        end ;

                            end
                            else
                        {---------------------------------------------}
                        { test if then else for type correctness      }
                        {---------------------------------------------}
                            if isif(tree) then
                            begin
                                 cond:=getifcond(tree);
                                 then_:=getthen(tree);
                                 else_:=getelse(tree);
                                 typecheck(cond);
                                 typecheck(then_);
                                 typecheck(else_);
                                 begin
                                      if  (typemap[cond]<>bool_type )  then
                                      begin

                                           typeerr('must be boolean ',cond);
                                      end ;
                                      if  typemap[then_]<>typemap[else_] then
                                      begin

                                           typeerr('both branches of if then else must be of same type',tree);
                                      end;
                                      typemap[tree]:=typemap[then_];
                                 end
                            end
                        end
                        else if isint(tree) then
                             typemap[tree]:=int_type
                        else if isrealcell(tree) then
                             typemap[tree]:=real_type

	              end
	              else  error('not a valid tree');
	         end;
	         function transformtoilcg(  tree:cell;var ok:boolean):pilcgnode;
           var ok1,ok2:boolean;
               t1,t2:pilcgnode;
              function translatevariable(l:lextoken):pilcgnode;
              var n:cell;
              begin
                 n:=lookup(l);
                 if n=nulid then  
                 begin
                    ok:=false;
                    writeln('undeclared identifier ',psym(l));
                 end
                 else
                 begin
                    translatevariable:=getpntr(getattribute(l,translation));
                    ok:=true;
                 end
              end;
              function formatofint(i:int64):formatcode;
              begin
                if (i>maxint) or (i< -maxint) then  formatofint:=fint64
                else formatofint:=fint32
              end;

	         begin
			          transformtoilcg:=nil;
	              ok:=false;
                if tree=0 then
                begin
                  transformtoilcg:=nil; ok:=true;
                end
                else
                if isid(tree) then
                  transformtoilcg:=translatevariable(tree)
                else
                if ispair(tree) then
                begin
                  if isdyad(tree) then
                  begin
                    case getop(tree) of
                    defeq: begin
                            { this is an assign }
                            transformtoilcg:= new_assign(
                              transformtoilcg(getleft(tree),ok1),
                              transformtoilcg(getright(tree),ok2)
                            );
                            ok:=ok1 and ok2;
                          end;
                    plus: begin
                            transformtoilcg:= new_dyad(
                              transformtoilcg(getleft(tree),ok1),'+',
                              transformtoilcg(getright(tree),ok2)
                            );
                            ok:=ok1 and ok2;
                          end;
                    minus: begin
                            transformtoilcg:= new_dyad(
                              transformtoilcg(getleft(tree),ok1),'-',
                              transformtoilcg(getright(tree),ok2)
                            );
                            ok:=ok1 and ok2;
                          end;
                    star: begin
                            transformtoilcg:= new_dyad(
                              transformtoilcg(getleft(tree),ok1),'*',
                              transformtoilcg(getright(tree),ok2)
                            );
                            ok:=ok1 and ok2;
                          end;
                    slash: begin
                            transformtoilcg:= new_dyad(
                              transformtoilcg(getleft(tree),ok1),'/',
                              transformtoilcg(getright(tree),ok2)
                            );
                            ok:=ok1 and ok2;
                          end;
                    end;
                  end
                  else
                  begin  { this is the drop through case of a pair
                           which represents a sequence operation }
                          t1:=transformtoilcg(head(tree),ok1);
                          t2:=transformtoilcg(tail(tree),ok2)   ;
                          transformtoilcg:= new_seq( t1,t2  );
                            ok:=ok1 and ok2;
                  end;
                end
                else
                if isint(tree) then
                begin
                  transformtoilcg:=new_intlit(getint(tree),formatofint(getint(tree)));
                  ok:=true;
                end ;
                if not ok then
                begin
                  writeln('could not transform <<',tree,':',gettag(tree));
                  printlist(tree);  write('>> ')
                end;

	         end;
	begin
		writeln('type check');
	        typecheck(tree);

	        begin
			writeln('transform');
	             cooked:= transformtoilcg(tree,transformok);
	             if transformok then
	             begin
			writeln('codegen');
	                 codegenok:=codegen(cooked, asmfile);
	                 if codegenok then
	                 begin

	                 end
	                 else writeln('ilcg tree generation failed');
	             end
	             else writeln('error transforming program');
	        end   ;

	        ptrans:=typeok and transformok and codegenok;
	end;


	begin
     writeln('translate <<<');

     printlist(tree);
     writeln('>>>')                      ;
     ptrans(tree);
end;
function nosuffix(s:string):string;

var t:string;i:integer; ok:boolean;
begin
     t:='';  ok:=true;
     for i:=1 to length(s) do
     if ok then
     begin
          ok:=ok and (s[i]<>'.');
          if ok then t:=t+s[i];
     end;
     nosuffix:=t;
end;
procedure defineattributes;
var prefix:string[3];
   function mkatt(s:string[20]):lextoken;
   var s2:string[23];
   begin
    s2:=prefix+s;
    mkatt:=tokenof(s2);
   end;

begin
  prefix:=' # ';
  offset := mkatt('offset');
  domainspace:=mkatt('domainspace');
  typeinfo:= mkatt('typeinfo');
  name_type:=mkatt('name_type');
  atomic:= mkatt('atomic');
  translation:=mkatt('translation');
end;

{ ------------------------------------------------------------------ }
{      declare types                                                 }
{ ------------------------------------------------------------------ }

procedure declare_types;
 procedure newtype(t:typerec;l:integer); begin    newname(l, t,typename);   end;
begin
     VOID:=mk_atomic(foctet);
     newtype(void,tokenof('_VOID_'));
     char_type:=mk_atomic(charformat);

     newtype(char_type,tokenof('CHAR'));
     string_type:=mk_string(255);
     newtype(string_type,tokenof('STRING'));
     byte_type:=mk_range(0,255,int_type);

     address_type:=mk_atomic(true,machine_address,tokenof('ADDRESS'));

     int_type:=mk_range(-maxint,maxint,address_type);


     newtype(int_type,tokenof('INTEGER'));

     bool_type:=mk_range(truecode,falsecode,int_type);
     newtype(bool_type,tokenof('BOOLEAN'));
     file_type:=mk_atomic(false,fint32,tokenof('FILE'));
     newtype(file_type,tokenof('FILE'));
     real_type:=mk_atomic(false,fieee32,tokenof('REAL'));
     newtype(real_type,tokenof('REAL'));
     pntr_type:=mk_atomic(false,machine_address,tokenof('POINTER'));
     newtype(pntr_type,tokenof('POINTER'));
     string_type:=vectorise(false,{$ifdef ispascal}byte_type,{$endif}
                                                   char_type);

     newtype(string_type,tokenof('STRING'));



end;



var filename:string[80];
begin
    defineattributes;
    cellstackpntr:=0; lexlevel:=0;  scopelist:=nullcell;
     allocationdir:=-1;
     globalbase:=new_typecast(fint,new_label{('pmainbase')});
    localbase:=new_register(fp);
     lexical_level :=global_level ;
     {scope_level   :=global_level ;}
     for i:= firstcell to lastcell do
         typemap[i]:=nullcell;
     
      
     declare_types;
    filename := paramStr(1);
  if filename='' then
    begin
      write('input file: ');
      readln(filename);
    end;
  assign(yyinput, filename);
  reset(yyinput);
  if ioresult<>0 then begin
     writeln( ' cant open ',filename);
     halt(2);
  end;
  assign(asmfile,nosuffix(filename));
  rewrite(asmfile);
  if yyparse=0
  then writeln('successful parse!');
  
end.{  of compiler  }
