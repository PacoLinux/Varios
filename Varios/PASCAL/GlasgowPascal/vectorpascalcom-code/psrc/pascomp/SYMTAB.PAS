
{$o+}{$F+}
{$b+
-----------------------------------------------------------------
Module      : symtab.cmp
Used in     : Compiler toolbox
Author      : W P Cockshott
Date        : 27 oct 86
Version     : 1
Function    : to maintain a table relating identifiers to type
Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------
}

UNIT symtab;
INTERFACE
USES
  bufdecls,
  errors,
{$ifdef i80386}ilcp, ilcgasm,{$endif}
  idtypes,
{$ifndef pretext}  dlb,{$endif}
{$ifdef pretext}dlbpret,{$endif}
 sagen;
const
       constants:set of lexeme =
                 [cint_sy,cfile_sy,cbool_sy,cstring_sy];
type parameterref = ^ paramrec;
     paramrec = record
                paramname:idref;
                next:parameterref;
                end;

procedure exitblock( oldscope:namedesc;  t:typerec);
procedure balance(var t1:typerec;  var t2:typerec);
procedure rewindfields(n:namedesc);
function getnextfield:lextoken;
procedure getconst(original:lextoken;var literal:pilcgnode;var t:typerec);
procedure fixup_params( theproc:typerec;
                           parameters:parameterref;
                           result:idref);
function  newname(i:lextoken; t:typerec; sort:nametype;var ref:idref):namedesc;
function  newdummy(i:lextoken; t:typerec; sort:nametype;var ref:idref):namedesc;
procedure append_element(t:typerec;id:lextoken);

function int2Ilcg(val:longint):pilcgnode;
procedure defilcgconst(n:namedesc;val:pilcgnode);
procedure defconst(n:namedesc;val:integer);
procedure bindlabel(l:labl;v:idref);

procedure make_idalias( original,copy:lextoken;var t:typerec);
procedure fixupstruct(var parameters:parameterref;
                      var pntrs:integer;
                      var reals:integer;
                      var ints :integer);
var     fieldoffset: integer;
IMPLEMENTATION

{ ------------------------------------------------------------------ }
{      APPEND_ELEMENT                                                }
{             add a element to an enumerated type                    }
{ ------------------------------------------------------------------ }

procedure append_element(t:typerec;id:lextoken);
var temp:namedesc;ref:idref;i:integer;
    p:enump;
    function newelement:enump;
    var pp:enump;
    begin
         new(pp);
         pp^.thisone:=temp;pp^.next:=nil;
         newelement:=pp
    end;
begin temp:=newname(id, t, enumelement,ref);
      p:=t^.elementlist;i:=0;
      if p=nil then
         t^.elementlist:=newelement
      else begin
           while p^.next<>nil do begin
                 p:=p^.next  ;
                 i:=i+1; { work out what ord of the element will be }
           end;
           p^.next:=newelement;i:=i+1;
      end;
      ref^.offset:=i;
      t^.data_format:=formatof(0,i);
 end;


{ ------------------------------------------------------------------ }
{      BALANCE                                                       }
{ ------------------------------------------------------------------ }
procedure balance(var t1:typerec;var  t2:typerec);
begin
     if Not eq(t1,t2) then begin
        if eq(t1,int_type)and eq(t2,real_type) then begin
           match(t2,real_type);
           float2op;
           t1:=real_type;
        end else
        if eq(t1,real_type) then begin
           match(t2,int_type);
           floatop;
           t2:=real_type;
        end  ;

     end;
end;

{ ------------------------------------------------------------------- }
{ BINDLABEL                                                           }
{ ------------------------------------------------------------------- }
procedure bindlabel(l:labl;v:idref);
begin
   v^.lab:=(l);
end;

{------------------------------------------------------------------- }
{   Fixup params                                                     }
{------------------------------------------------------------------- }
procedure fixup_params( theproc:typerec;parameters:parameterref;result:idref);
{ call the code generator to assign offsets to the parameters }
{ proceed in reverse order to declaration }
var ptotal:word;

   procedure listchase(i:parameterref);
   begin
        if i<> nil then
        with i^ do
        begin
             listchase(next);
             ptotal:=ptotal+fixup_param(paramname^);
        end;
   end;
   {$ifndef i80386}
   { on a 386 we place the result above the params so there
     is no alteration of the params
     Otherwise we may have to alter the param offset to allow
     space for the result in the case where the result
     and the params are overlaid
   }
   procedure listmodify(i:parameterref);
   begin
        if i<> nil then
        with i^ do
        begin
             listmodify(next);
             correct_param(paramname^,theproc^.domainspace,
                           theproc^.rangespace);
        end;
   end;
   {$endif}
begin
    ptotal:=0;
    with theproc ^ do begin
     listchase(parameters);
     domainspace:=ptotal;
     if range <>nil then
     rangespace:=fixupresult(result^,domainspace)
     else rangespace:=0;
     {$ifndef i80386}
     listmodify(parameters);
     {$endif}
    end;
end;
{ ------------------------------------------------------------------ }
{  REWINDFIELDS                                                      }
{     find the first field of a structure                            }
{ ------------------------------------------------------------------ }
var first:namedesc;
procedure rewindfields(n:namedesc);
begin
  first:=n-cardof(domainof(scopelist[n]^.typeinfo));
end;
function getnextfield:lextoken;
begin
   getnextfield:=scopelist[first]^.identifier;
   first:=first+1;
end;
{ ------------------------------------------------------------------ }
{      fixup struct                                                  }
{ ------------------------------------------------------------------ }
{ this allocates addresses to fields within a structure              }
{ in doing so it reorganises the fields into the order               }
{    trademark   pntr* real* int*                                    }
{ integers are assumed to be 4 byte ones for compatibility           }
{ with code that will run on a 386 in future                         }
procedure fixupstruct(var parameters:parameterref;
                      var pntrs:integer;
                      var reals:integer;
                      var ints :integer);
  procedure listchase(i:parameterref);
  var locreals,locints,locpntrs:integer;
   begin
        if i<> nil then
        with i^ do
        begin
              locints:=ints;
              locpntrs:=pntrs;
              locreals:=reals;
              if ispid(paramname^.typeinfo) then  pntrs:= pntrs +1 else
              if isreal(paramname^.typeinfo) then  reals:= reals +1
                         else ints:=ints+1;

             listchase(next);

             with i^ do
             if ispid(paramname^.typeinfo) then
             begin
                paramname^.offset:= locpntrs*heappntr_size;
       if (paramname^.offset mod 16)<>0 then error('pid field alignment');
             end
             else        with paramname^ do
                         if isreal( typeinfo )then
                              offset:= pntrs*heappntr_size +
                                       locreals*real_size
                         else offset:= pntrs*heappntr_size +
                                       reals*real_size +
                                       locints*int_size;


        end;
   end;
begin
      reals:=0; ints:=0;
      pntrs:=1;
      listchase(parameters);

end;



{ ------------------------------------------------------------------ }
{        Define generator functions                                  }
{ ------------------------------------------------------------------ }

function  newname(i:lextoken; t:typerec; sort:nametype;var ref:idref):namedesc;
var temp:namedesc;         l:labl;
begin
     if already_declared_here(i) then begin Error('Already declared here'); exit end;
     newname:=make_id(ref);
     with ref^ do begin
          identifier:=i;
          name_type:=sort;
          typeinfo:=t;
          case sort of
          global : offset:=declare_global(ref^);
          local  : offset:=declare_local(ref^);
          field  : begin offset:=fieldoffset;
                         fieldoffset:=stackspace(t)+fieldoffset;
                   end;
          constant:begin l:=newlab;plant(l);
                         lab:= l;
                   end;
          end;
     end;
end;
procedure getconst(original:lextoken;var literal:pilcgnode;var t:typerec);
var i:integer; L:longint;
begin
     i:=lookup(original)      ;
     with scopelist[i]^ do
     case name_type of
     enumelement: begin
                       t:=typeinfo;
                       literal:=new_intlit(offset,fint);
                  end;
     constant: begin

                   literal:=ilcgconst;
                   t:=typeinfo;
               end;
     else  error('not known at compile time '+psym(original));

     end
end;
function int2Ilcg(val:longint):pilcgnode;
begin
      if( val > maxint )or(val < -maxint) then
      int2ilcg:=new_intlit(val,fint64)
      else int2ilcg:=new_intlit(val,fint32)
end;
procedure defconst(n:namedesc;val:longint);
begin
      defilcgconst(n,int2ilcg(val))
end;

procedure defilcgconst(n:namedesc;val:pilcgnode);
begin
       scopelist[n]^.ilcgconst :=val;
end;
procedure make_idalias( original,copy:lextoken;var t:typerec);
var ref:idref;temp:namedesc;
begin
      temp:=make_id(ref);
      temp:=lookup(original);
      ref^:= scopelist[temp]^;
      with ref^ do begin
      t:= typeinfo;  identifier:=copy;
      end;
end;
function  newdummy(i:lextoken; t:typerec; sort:nametype;var ref:idref):namedesc;
var temp:namedesc;
begin
     newdummy:=make_id(ref);
     with ref^ do begin
          identifier:=i;
          name_type:=sort;
          typeinfo:=t;
          case sort of
          global : offset:=declare_global(ref^);
          local  : offset:=declare_local(ref^);
          end;
     end;
end;

procedure exitblock( oldscope:namedesc;  t:typerec);
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
      if nametop>nulid then
      if scopelist[nametop]^.name_type in [global,local]  then
      if not(scopelist[nametop-1]^.name_type in [global,local]) then
      discard(scopelist[nametop]^,t) ;
      99:
    
    end;
  end
end;


BEGIN
END.

///////////////////////////////////////////////////////////////

