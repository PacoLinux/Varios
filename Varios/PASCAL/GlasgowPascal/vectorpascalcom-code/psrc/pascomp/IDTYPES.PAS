{$O+}{$F+
-----------------------------------------------------------------
Module      : IdTypes
Used in     : Compiler toolbox
Author      : W P Cockshott
Date        : 8 Feb 87
Version     : 2
Changes     : converted to unit 21 - 9 - 88
            : June 2005 linked to ilcg system
Function    : Declare the types and variables needed for the symbol table
              This holds the language independent type matching rules
Copyright (C) WP Cockshott & P Balch

----------------------------------------------------------------
}
UNIT idtypes;
INTERFACE

USES
  bufdecls, dlbpret, ilcp,ilcgasm,
  errors

  ;
const  maxid = 4999;
       nulid = 1000;
       global_level = 0;
       maxcart = 20;

       heappntr_size   = address_size;
                           { for the moment we assume that all pointers}
                           { are the same size }
       pntr_on_stack_size = heappntr_size;


type
    idref      = ^idrec;
    typelist  = ^parameter;
    {$ifdef i80386}
    labl       = labels;
    {$endif}
    {$ifndef i80386}
    labl       = integer;
    {$endif}
    typerec    = ^typerecord;
    enump      =^enumelem;
    nametype   = (global,local,param,result,static,typename,constant,field,
                  enumelement);
    idrec    = record
               name_type  : nametype;
               identifier : lextoken;
               offset     : longint ;
               ilcgconst  : pilcgnode;
               block_level,
               lex_level  : byte;
               typeinfo   : typerec;
               {$ifdef i80386}
               lab        : labl;
               {$endif}
               end;
     parameter=record
               paramname:typerec;
               next:typelist;
               end;

    typeoperator = (enumerated,   fileof,
                    atomic,format,cartesian,map,union,subrange,setof,super);
    typerecord  = record
               constant: boolean;
               data_format:formatcode;
               atomictypeid:lexeme;
               case constructr:typeoperator of
               enumerated: (elementlist:enump;);
               cartesian:(elements:typelist;);
               map     :(
                       maptype:lextoken;
                       domain,range: typerec;
                       domainspace,            { number of bytes of parameters for proc }
                       rangespace:longint;        { number of bytes of range }
                       );
               fileof,
               setof   :( ElementType:typerec;);
               subrange:( lower,upper:longint);
               union   :( variants:typelist;);
               super   :(archetype:typerec;archetypeid:lextoken);
               atomic  ,
               format:(
                      stackbytesused,heapbytesused:integer;
                      );
               end;

    namedesc = nulid..maxid;
    typearray = array [1..maxcart] of typerec;
    enumelem =record
                next:enump;
                thisone:namedesc;
                end;


{ -------- PROCEDURES -------------- }




function  lookup(id :lextoken):namedesc;
function already_declared_here( id  :lextoken):boolean;
function cardof(t:typerec):integer;
{$ifdef issalgol}
function classof(id:lextoken):namedesc;
{$endif}
function constantof(t:typerec):typerec;
function domainof(t:typerec):typerec;
function eq( t1, t2:typerec):boolean;
function formatof(low,hi:longint):integer;
function generatorof(id:lextoken):namedesc;
function heapspace(t:typerec):integer;
function inblock(n:namedesc):boolean;
function iscompiletimeliteral(n:namedesc):boolean;
function isfield(N:NAMEDESC):BOOLEAN;
{$ifdef ispascal}
function isitpascalpntr(t:typerec):boolean;
{$endif}
function ispid( t:typerec):boolean;
function ispntr( t:typerec):boolean;
function isproc( t:typerec):boolean;
function isreal( t:typerec):boolean;
{$ifdef issalgol}
function isstruct( t:typerec):boolean;
{$endif}
function istable(t:typerec):boolean;
function istype(var id:lextoken):boolean;
function isvariable(t:typerec):boolean;
{$ifdef ispascal}
function isvarparam(t:typerec):boolean;
{$endif}
function isvector(t:typerec):boolean;
function make_id(var ref:idref):namedesc;
function max(a,b:integer):integer;
function mk_cart(c:boolean;var a:typearray;n:integer):typerec;
function mk_enumtype:typerec;
function mk_map(c:boolean;m:lextoken;d,r:typerec):typerec;
{$ifdef ispascal}
function pointerto(t:typerec):typerec;
function addressof(t:typerec):typerec;
{$endif}
{$ifdef isadpl}
function addressof(t:typerec):typerec;
{$endif}
function mk_range(low,hi:longint):typerec;
function mk_set(c:boolean; var e:typerec):typerec;   
function mk_filetype(c:boolean; var e:typerec):typerec;
function mk_union(c:boolean;var a:typearray;n:integer):typerec;
function ptype( t1:typerec):textline;
function rangeof(t:typerec):typerec;
function stackspace(t:typerec):integer;
function tableof( t:typerec):typerec;
function typecode(  t:typerec):char; 
function variableof(t:typerec):typerec;
{$ifndef ispascal}
function vectorise(constant:boolean; t:typerec):typerec;
{$endif}
{$ifdef ispascal}
function vectorise(constant:boolean;domain, t:typerec):typerec;

{$endif}
procedure coerce( t1:typerec; t2:typerec);
procedure declaration(id:lextoken;sort:nametype; t:typerec);
procedure enterlexlevel;
procedure enterscope( var oldscope:namedesc);
procedure exitscope(oldscope:namedesc);
procedure exitlexlevel;
procedure exit_proc(oldscope:namedesc);
procedure initsymtab;
procedure mkalias(var self,representation:typerec;classid:lextoken);
procedure match( t1:typerec; t2:typerec);
procedure representation(alias:typerec; var rep:typerec);
procedure tablecontents(table:typerec;var contents:typerec);
procedure typeof(id:lextoken; var t:typerec);
procedure unmk_cart(var a:typearray;var n:integer;t:typerec);

var


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
     scopelist : array[namedesc] of idref;
     lexical_level :  byte ;
     scope_level   :  byte ;
{        NAMETOP       ALWAYS POINTS ONE ABOVE LATEST DECLARATION }
const
     nametop       : namedesc=nulid;

IMPLEMENTATION

Type
    string255 = string[255];



var dummyname:namedesc;

    scope_to_level : array[1..127]of byte;



var

     byte_format,
     ib_format,
     real_format,
     double_format,
     void_format,
     closure_format,
     machine_address,
     generic_array,
     pid_format:formatcode;

{ ------------------------ MAX -------------------------------------- }

function max(a,b:integer):integer;
begin if a>b then max:=a else max:=b end;
{ ------------------- new id --------------------------------------- }
procedure newid(var id:idref);
begin
   new(id);
end;

{ ------------------------------------------------------------------ }
{        Lookup an Identifier : return zero if does not exist        }
{ ------------------------------------------------------------------ }
function  lookup(id :lextoken):namedesc;
var i:integer; label 99;
begin
   i:= pred(nametop);
   if i>nulid then while  (scopelist[i]^.identifier<>id) do
   begin     i:=pred(i); if i<=nulid then goto 99 end;
   99:
   if i<nulid then lookup:=nulid else
           lookup:=i;

end;
function lookup_by_name(t:textline):namedesc;
begin
     lookup_by_name:=lookup(tokenof(t));
end;


{ ------------------------------------------------------------------ }
{        Typeof an Identifier                                        }
{ ------------------------------------------------------------------ }
procedure typeof(id:lextoken; var t:typerec);
var n:namedesc;
begin
     n:=lookup(id);
     if n >0 then
     t:=scopelist[lookup(id)]^.typeinfo
     else t:=void;
end;
{ ------------------------------------------------------------------ }
{    CARDOF                                                          }
{      cardinality of a cartesian                                    }
{ ------------------------------------------------------------------ }
function cardof(t:typerec):integer;
var i:integer;
    l:typelist;
begin
   i:=0;
   representation(t,t);
   case t^.constructr of
   union: l:=t^.variants;
   cartesian:l:=t^.elements;
   subrange:with t^ do cardof:=upper-lower+1;
   end;
   if t^.constructr<>subrange then begin
     while l<>nil do
     begin
       i:=i+1;
       l:=l^.next;
     end;
     cardof:=i;
   end;
end;
{ ------------------------------------------------------------------ }
{        LEXLEVEL  - return the lexical lvevel of a var              }
{ ------------------------------------------------------------------ }
function lexlevel(s:lextoken):integer;
begin
    lexlevel:=scopelist[lookup(s)]^.lex_level;

end;
{ ------------------------------------------------------------------- }
{      ISFIELD   is this a field of a struct                          }
{ ------------------------------------------------------------------- }
function isfield(N:NAMEDESC):BOOLEAN;
begin
    isfield:=scopelist[N]^.name_type=field;
end;

function iscompiletimeliteral(n:namedesc):boolean;
begin
   iscompiletimeliteral:=scopelist[N]^.name_type=enumelement;
end;
{ ---------------------------------------------------------------- }
{       MAKE_ID                                                    }
{ ---------------------------------------------------------------- }

function make_id(var ref:idref):namedesc;
begin

     newid(ref);
     scopelist[nametop]:=ref;
     ref^.typeinfo:=void;
     with ref ^ do begin
          lex_level:=lexical_level;
          block_level:=scope_level;
     end;
     make_id:=nametop;
     nametop:=nametop+1;
end;

{ ------------------------------------------------------------------ }
{  REPRESENTATION                                                    }
{          returns the ultimate represetnation of a type             }
{ ------------------------------------------------------------------ }
procedure representation( alias:typerec; var rep:typerec);
begin
     case alias^.constructr  of
     super:
        representation(alias^.archetype,rep);
     else rep:=alias;
     end;
end;
function formatof;
begin
     if (hi<256) and (low>=0) then formatof:=byte_format
     else  formatof:=ib_format
end;
function typecode(  t:typerec):char;
  var s:char;
      t2:typerec;

begin
     representation(t,t2);
     with t2^ do begin
     if data_format= byte_format then s:='b'
     else
     if data_format= ib_format then s:='i'
     else
     if data_format= real_format then s:='r'
     else
     if data_format= pid_format then s:='p'
     else
     if data_format= machine_address then s:='c'
     else
     if data_format= void_format then s:='v'
     else s:='a';
     end;
     typecode:=s;
end;
{ ------------------------------------------------------------------ }
{      ptype                                                         }
{ ------------------------------------------------------------------ }
function ptype( t1:typerec):textline;
var i:integer;s,s1:textline;trav:typelist;
begin
       with t1 ^ do begin
            s:='';
            if constant then s:='c';
            case constructr of
            atomic : s:=s+(psym(ord(atomictypeid))) ;
            super:s:=psym(archetypeid);
            map:if maptype in [ord(procedure_sy),ord(function_sy)]
                then begin
                  s:=s+psym(maptype)+ptype(domain)+'->'+ptype(range);
                end
                {$ifdef ispascal}
                else if maptype = ord(array_sy) then begin
                     s:=s+'array['+ptype(domain)+']of '+ptype(range)
                end
                {$endif}
                else begin
                  s:=s+psym(maptype)+' '+ptype(range);
                end;
            cartesian:
               begin
                 trav:=elements;
                 s:=s+'(';
                 while trav<> nil do
                 begin
                     s:=s+' '+ptype(trav^.paramname) ;
                     trav:= trav^.next;
                 end;
                 s:=s+')';
            end ;
            setof:begin
                  s:=s+' set of '+ptype(ElementType)
            end;
            fileof:begin
                        s:=s+' file of '+ptype(ElementType)
            end;
            subrange:begin str(lower,s);str(upper,s1);s:=s+'..'+s1; end;
            end ;

       end;
       ptype:=s;
end;

{ ------------------------------------------------------------------ }
{ ISPID  true is this is an object not a compact                     }
{ ------------------------------------------------------------------ }
function ispid( t:typerec):boolean;
begin
    ispid:= typecode(t)='p';
end;


function isreal( t:typerec):boolean;
begin
    isreal:= typecode(t)='r';
end;

function isproc( t:typerec):boolean;
begin
    isproc:= (t^.constructr=map)and
             (
              (t^.maptype=ord(function_sy))or
              (t^.maptype=ord(procedure_sy) )
              {$ifdef ispascal}
              or
              (t^.maptype=ord(function_sy))
              {$endif}
             );
end;

function ispntr( t:typerec):boolean;
begin
    ispntr:= (t^.constructr= atomic) and
             (t^.atomictypeid in [pntr_sy]);
end;
{$ifdef issalgol}
function isstruct( t:typerec):boolean;
begin
    isstruct:= (t^.constructr=map)and (t^.maptype=ord(structure_sy));
end;
{$endif}
function istype(var id:lextoken):boolean;
var n:namedesc;
begin
     n:=lookup(id);
     istype:=(n>0)and(scopelist[n]^.name_type=typename);
end;



function stackspace(t:typerec):integer;
{ return number of bytes on stack used by t }
var tot,i:integer;     l:typelist;
    function biggest(v:typelist):integer;
    begin
         if v=nil then biggest:=0 else
         biggest:=max(biggest(v^.next),stackspace(v^.paramname))
    end;
begin
     with t^ do begin
     case constructr of
     union : tot:=biggest( variants);
     setof: begin
                 i:=(cardof(Elementtype) );
                 tot:=i div 8;
                 if (i mod 8)<>0 then tot:=tot+1;
            end;
     cartesian:begin
                l:=elements;
                tot:=0;
                while l<>nil do begin
                     tot:=tot+stackspace(l^.paramname);
                     l:=l^.next;
                end;
               end;
     super:    tot:=stackspace(archetype);
     map:      {$ifdef ispascal}
               if maptype=ord(array_sy) then
               begin
                   tot:=stackspace(rangeof(t))*cardof(domainof(t))
               end
               else
               {$endif}
               tot:=lengthinbytes(data_format);
     else tot:=lengthinbytes(data_format);
     end;
     end;
     stackspace:=tot;
end;
function heapspace(t:typerec):integer;
{ return number of bytes on stack used by t }
var tot:integer;     l:typelist;
begin
     with t^ do begin
     case constructr of
     cartesian:begin
                l:=elements;
                tot:=0;
                while l<>nil do begin
                     tot:=tot+heapspace(l^.paramname);
                     l:=l^.next;
                end;
               end;
     else tot:=lengthinbytes(data_format);
     end;
     end;
     heapspace:=tot;
end;
{------------------------------------------------------------------ }

{    Type  Construction operations                                  }

{ ----------------------------------------------------------------- }

function mk_map(c:boolean;m:lextoken;d,r:typerec):typerec;
var t:typerec;
begin
    new(t);
    with t^ do begin
       constructr:=map;  constant:=c;
       maptype:=m;domain:=d; range:=r;
       if (m= ord(procedure_sy))then data_format:=closure_format
       {$ifdef ispascal}
       else if
          (m= ord(up_arrow_sy))     or (m=ord(var_sy))
       then data_format:=machine_address

        else if  (m= ord(array_sy)) then data_format:=generic_array
       {$endif}
       else data_format:=pid_format;
       domainspace:=stackspace(d);
       rangespace:=stackspace(r);
    end;
    mk_map:=t;
end;
{------------------------------------------------------------------ }
{    Constant formation                                             }
{ ----------------------------------------------------------------- }


function constantof(t:typerec):typerec;
var tt:typerec;
begin
    if t^.constant then tt:=t else begin
      new(tt);tt^:=t^; tt^.constant:=true;
    end;
    constantof:=tt;
end;

function variableof(t:typerec):typerec;
var tt:typerec;
begin
    if not t^.constant then tt:=t else begin
      new(tt);tt^:=t^; tt^.constant:=false;
    end;
    variableof:=tt;
end;
{ ------------------------------------------------------------------ }
{       APPENDPARAM  appends a new parameter to a procedure id       }
{ ------------------------------------------------------------------ }
procedure appendparam(var proc:typelist; parameter:typerec)   ;
  procedure append(var p:typelist);
  begin

     if p=nil then
     begin
        new(p);p^.next:=nil;
        p^.paramname:=parameter
     end
     else append(p^.next)
  end;

begin
  append(proc);
end;

function mk_enumtype;
var t:typerec;
begin
     new(t);  mk_enumtype:=t;
     with t^ do begin
          constructr:=enumerated;
          data_format:=byte_format;
          elementlist:=nil;
     end;
end;

function mk_cart(c:boolean;var a:typearray;n:integer):typerec;
var t:typerec;
    i:integer;
begin
    if n=0 then begin a[1]:=void;n:=1; end;
     new(t);
     with t^ do begin
       elements:=nil;
       constructr:=cartesian;  constant:=c;
       for i:= 1 to n do appendparam(t^.elements,a[i]);
       data_format:=pid_format;

     end;
    mk_cart:=t;
end;

procedure unmk_cart(var a:typearray;var n:integer;t:typerec);
var l:typelist;
    i:integer;
begin


     with t^ do begin
       l:=elements;
       n:=0;
       while l<>nil do begin
          n:=n+1;
          a[n]:= l^.paramname;
          l:=l^.next;
       end;

     end;
end;

function mk_union(c:boolean;var a:typearray;n:integer):typerec;
var t:typerec;
    i:integer;
begin
    new(t);
    with t^ do begin
       variants:=nil;
       constructr:=union;  constant:=c;
       for i:= 1 to n do appendparam(t^.variants,a[i]);
       data_format:=pid_format;
    end;
    mk_union:=t;
end;
{ ifdef ispascal}
function mk_range;
var t:typerec;  s,s1:string;
begin
    new(t);
    with t^ do begin
       constant:=true;
       constructr:=subrange;
       lower:=low;upper:=hi;
       if low>hi then
       begin
             str(lower,s);
             str(upper,s1);
             s:=s+'>='+s1;

             error(' range out of order '+s)
       end
       else data_format:= formatof(low,hi);
    end;
    mk_range:=t;
end;
{ endif}


function mk_set(c:boolean; var e:typerec):typerec;
var t:typerec;
begin
    new(t);
    with t^ do begin
       elementtype:=e;constant:=c;
       constructr:=setof;
       data_format:=pid_format;
    end;
    mk_set:=t;
end;

function mk_filetype(c:boolean; var e:typerec):typerec;
var t:typerec;
begin
    new(t);
    with t^ do begin
       elementtype:=e;constant:=c;
       constructr:=fileof;
       data_format:=ib_format;
    end;
    mk_filetype:=t;
end;

function mk_super(c:boolean; var subtype:typerec;alias:lextoken):typerec;
var t:typerec;
begin
    new(t);
    with t^ do begin
       archetype:=subtype;
       archetypeid:= alias;
       constructr:=super;
       constant:=c;
       data_format:=subtype^.data_format;
    end;
    mk_super:=t;
end;


function mk_atomic(c:boolean;  format:formatcode; name:lexeme):typerec;
var t:typerec;
begin
    new(t);
    with t^ do begin
       atomictypeid:=name;
       constructr:=atomic;
       constant:=c;
       data_format:=format;
    end;
    mk_atomic:=t;
end;

function domainof(t:typerec):typerec;
begin
     if t^.constructr <> map then error('map expected');
     domainof:=t^.domain;
end;
function rangeof(t:typerec):typerec;
begin
     if t^.constructr <> map then error('map expected');
     rangeof:=t^.range;
end;

{ ----------------------------------------------------------------- }
{       MKALIAS                                                     }
{          make a named super type                                  }
{ ----------------------------------------------------------------- }

procedure  mkalias(var self,representation:typerec;classid:lextoken);
var ref:idref;
    n:namedesc;
begin
     n:=make_id(ref);
     ref^.typeinfo:=mk_super(false,representation,classid);
     ref^.identifier:=classid;
     self:=ref^.typeinfo;
     ref^.name_type:=typename;
end;



{ ------------------- Table types ---------------------------------- }

procedure tablecontents(table:typerec;var contents:typerec);
begin

     contents:=table^.range;
end;
function tableof( t:typerec):typerec;
begin
    tableof:=mk_map(false,ord(dollar_sy),string_type,t);
end;

function istable(t:typerec):boolean;
begin
   istable:=(t^.constructr = map) and( t^.maptype=ord(dollar_sy));
end;

{$ifdef ispascal}
function isitpascalpntr(t:typerec):boolean;
begin
     isitpascalpntr:=(t^.constructr=map) and
                    (T^.MAPTYPE=ord(up_arrow_sy));
end;
function isvarparam(t:typerec):boolean;
begin
     isvarparam:=(t^.constructr=map) and
                    (T^.MAPTYPE=ord(var_sy));
end;

{$endif}
{ -------------------------------------------------------------------- }
{ VECTORISE make a vector type                                         }
{ -------------------------------------------------------------------- }
function vectorise(constant:boolean;{$ifdef ispascal}
   domain,{$endif} t:typerec):typerec;
begin
    vectorise:=mk_map(constant,
        {$ifndef ispascal}ord(star_sy){$endif}
        {$ifdef ispascal}ord(array_sy){$endif},
        {$ifdef ispascal}domain{$endif}
        {$ifndef ispascal} int_type{$endif},t);
end;
function isvector(t:typerec):boolean;
begin
   isvector:=(t^.constructr = map) and( t^.maptype=ord(
   {$ifndef ispascal}star_sy{$endif}
   {$ifdef ispascal}array_sy{$endif}));

end;
{$ifdef ispascal}
function pointerto(t:typerec):typerec;
begin
     pointerto:=mk_map(false,ord(up_arrow_sy),void,t);
end;
{$endif}
function addressof(t:typerec):typerec;
begin
     addressof:=mk_map(false,ord(var_sy),void,t);
end;









procedure declaration(id:lextoken;sort:nametype; t:typerec);
var n:namedesc;  idr:idref;
begin
      n:=make_id(idr);
      with idr^ do begin
        name_type:=sort;
        identifier:=id;
        typeinfo:=t;
      end;
end;
{ ------------------------------------------------------------------ }
{      declare types                                                 }
{ ------------------------------------------------------------------ }

procedure declare_types;
 procedure newtype(t:typerec;l:lexeme);
 var id:idref;n:namedesc;
 begin
      n:=make_id(id);
      with id^ do begin
        name_type:=typename;
        identifier:=ord(l);
        typeinfo:=t;
      end;
   end;
   var textt:typerec;
begin
     VOID:=mk_atomic(false,void_format,UNDEFINED);
     newtype(void,undefined);
     char_type:=mk_atomic({$ifndef ispascal}true, {$endif}
                          {$ifdef ispascal}false,{$endif}
                byte_format,char_sy);
     {$ifdef ispascal}
     newtype(char_type,char_sy);
     byte_type:=mk_range(0,255);

     {$endif}
     address_type:=mk_atomic(true,machine_address,address_sy);
     {$ifdef i80386}
     int_type:=mk_range (-maxlongint,maxlongint);
     {$endif}
     {$ifndef i80386}
     int_type:=mk_range (-maxint,maxint);
     {$endif}
     int_type^.atomictypeid:=int_sy;
     newtype(int_type,int_sy);

     {$ifdef ispascal}
     {word_type:=mk_range(0,$ffff);
     word_type^.atomictypeid:=word_sy;
     newtype(word_type,word_sy);    }
     textt:=mk_filetype(false,char_type);
     newtype(textt,lexeme(tokenof('text')));
     {$endif}
     bool_type:=mk_atomic(false,ib_format,bool_sy);
     newtype(bool_type,bool_sy);
     file_type:=mk_atomic(false,ib_format,file_sy);
     newtype(file_type,file_sy);
     real_type:=mk_atomic(false,real_format,real_sy);
     newtype(real_type,real_sy);
     newtype(mk_atomic(false,double_format,lexeme(tokenof('fieee64'))),lexeme(tokenof('double')));
     pntr_type:=mk_atomic(false,pid_format,pntr_sy);
     newtype(pntr_type,pntr_sy);
     newtype(pntr_type,lexeme(tokenof('pointer')));
     string_type:=vectorise(false,{$ifdef ispascal}byte_type,{$endif}
                                                   char_type);
     {$ifndef ispascal}
     newtype(string_type,string_sy);

     {$endif}
     condition_type:=mk_atomic(true,void_format,condition_sy);
     {$ifdef issalgol}
     cint_type:=mk_atomic(true,ib_format,int_sy);
     newtype(cint_type,cint_sy);
     cbool_type:=mk_atomic(true,ib_format,bool_sy);
     newtype(cbool_type,cbool_sy);
     cfile_type:=mk_atomic(true,ib_format,file_sy);
     newtype(cfile_type,cfile_sy);
     creal_type:=mk_atomic(true,real_format,real_sy);
     newtype(creal_type,creal_sy);
     cpntr_type:=mk_atomic(true,pid_format,pntr_sy);
     newtype(cpntr_type,cpntr_sy);
     cstring_type:=vectorise(true,char_type);
     newtype(cstring_type,cstring_sy);
     structure_type:=mk_atomic(true,void_format,structure_sy);
     {$endif}
end;

{ ------------------------------------------------------------------ }
{        VARIABLE  - if an item is a var                             }
{ ------------------------------------------------------------------ }
function isvariable(t:typerec):boolean;
begin
     isvariable:=(not t^.constant) ;


end;
{ ------------------------------------------------------------------ }
{        EQ : compare two types                                      }
{ ------------------------------------------------------------------ }

function eq( t1:typerec;   t2:typerec):boolean;
     function eqid(n1,n2:typelist):boolean;
     begin
          if n1=n2 then eqid:=true else
          if n1=nil then eqid := false else
          if n2=nil then eqid := false else
          eqid:=eq(n1^.paramname,n2^.paramname) and
                eqid(n1^.next,n2^.next);
     end;
begin
{$ifdef debug}
writeln('eq(',ptype(t1),',',ptype(t2),')');
{$endif}
     eq:=false;
     if t1=t2 then eq:=true else
     if t1^.constructr= super then
            eq:= eq(t1^.archetype,t2)
     else
     if t2^.constructr=super then
            eq:= eq(t1,t2^.archetype)
     else
     if (t1^.constructr=t2^.constructr)
     then  begin
         if(t1^.constructr = atomic) then
           eq:=t1^.atomictypeid=t2^.atomictypeid
         else

         if(t1^.constructr =map) then
            eq:= ((eq(t1^.domain,t2^.domain) and eq(t1^.range,t2^.range) ))
         else
         if t1^.constructr=cartesian then
           eq:=eqid(t1^.elements,t2^.elements)
         else

         if(t1^.constructr=setof)then
           eq:=t1^.elementtype=t2^.elementtype
         else
         if   t1^.constructr=union then
           eq:=eqid(t1^.variants,t2^.variants)
         else
         if t1^.constructr=subrange then
           eq:=(t1^.lower=t2^.lower)and(t1^.upper = t2^.upper)
    end
    {$ifdef ispascal}
    else eq:=(isitpascalpntr(t1) and eq(t2,address_type))
    {$endif}

end;



{ ------------------------------------------------------------------ }
{      MATCH                                                         }
{ ------------------------------------------------------------------ }
procedure match( t1:typerec; t2:typerec);
var em:textline;
begin
{$ifdef debug}
        writeln(ptype(t1),'match to ',ptype(t2));
{$endif}
     if not eq(t1,t2) then begin
        em:= ptype(t1)+' not compatible with ' +ptype(t2);
        error(em );
     end;
end;
{ ------------------------------------------------------------------ }
{     COERCE - verify representaional equality                       }
{ ------------------------------------------------------------------ }
procedure coerce( t1:typerec; t2:typerec);
var em:textline;
begin
{$ifdef debug }
     writeln('coerce ',
     ptype(t1),ptype(t2));
     writeln;
{$endif}
     if not eq(t1,t2) then begin
        representation(t1,t1);
        em:= ptype(t1)+' not coercible to ' +ptype(t2);
        error(em );
     end;
end;



{ ------------------------------------------------------------------ }
{       already declared here : true if var defined within block     }
{ ------------------------------------------------------------------ }
function already_declared_here( id  :lextoken):boolean;
var n : integer;
begin
     n:=lookup(id);
     if n<=0 then already_declared_here:=false else
     already_declared_here:=scopelist[n]^.block_level = scope_level;
     if scopelist[n]^.block_level = scope_level  then
       writeln(psym(id),' already declared as variable ',n,' in scope ',
       scope_level);
end;
{ ------------------------------------------------------------------ }
{       INITSYMTAB initialises the symbol table                      }
{ ------------------------------------------------------------------ }
var firstinit:boolean;
procedure initsymtab;
var i:integer;
    temp:idref;
begin
       nametop:=succ(nulid);
       lexical_level:=global_level;
       scope_level:=global_level;
       for i:=1 to 127 do scope_to_level[i]:=global_level;

       for i:= nulid to maxid do begin
         newid(scopelist[i]);
         with scopelist[i] ^ do begin
            typeinfo:=void;
            identifier:=0;
            block_level:=127;
            lex_level:=global_level;
         end;
       end;

       declare_types;
end;


{ ------------------------------------------------------------------ }
{        Class of a field                                            }
{ ------------------------------------------------------------------ }
{$ifdef issalgol}
function classof(id:lextoken):namedesc;
var i:integer;
begin
   i:= lookup(id);
   while (i<nametop) and not isstruct (scopelist[i]^.typeinfo) do
        i:=succ(i);
        classof:=i;
end;
{$endif}
function generatorof(id:lextoken):namedesc;
var i:integer;
begin
   i:= lookup(id);
   while (i<nametop) and not isproc (scopelist[i]^.typeinfo) do
        i:=succ(i);
   if scopelist[i]^.identifier<>id then error('generator not found');
   generatorof:=i;
end;

{ ------------------------------------------------------------------ }
{         Scope handling                                             }
{ ------------------------------------------------------------------ }
procedure enterscope( var oldscope:namedesc);
{ this is called on entry to a new scope level }
{ that is either a block or a procedure        }
begin
     oldscope:= nametop;
     scope_level:=scope_level+1;
     scope_to_level[scope_level]:=lexical_level;
end;
procedure exitscope(oldscope:namedesc);
begin nametop:=oldscope end;
function inblock(n:namedesc):boolean;
{ return true is name declared in this block }
begin
   inblock:=scope_level = scopelist[n]^.block_level
end;

procedure exit_proc(oldscope:namedesc);
begin
     { exit from the scope associated with procedure parameters }
     scope_level := scope_level - 1;
     nametop:=oldscope;
end;
procedure enterlexlevel;
begin
     lexical_level:=succ(lexical_level);
end;
procedure exitlexlevel;
begin
     lexical_level:=pred(lexical_level);
end;





BEGIN


     { create the base formats }
     ib_format:=fint32;
     real_format:=fieee32;
     machine_address:=fint32;
     closure_format:=fint64;
     double_format:=fieee64;
     pid_format:=machine_address;
     byte_format:=fuint8;

     void_format:=0;

     firstinit:=true;
END.