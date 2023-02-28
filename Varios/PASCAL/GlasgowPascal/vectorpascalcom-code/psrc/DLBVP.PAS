{

-----------------------------------------------------------------
Module      : DLB.pas
Used in     : Compiler toolbox
Uses        : Fsm.cmp
Author      : W P Cockshott
Date        : 9 Oct 1986
Version     : 2
Changes     : changed to unit 21 - 9 - 88
              modified for use in vector pascal April 2003
Function    : This uses a de La Brandis tree to convert the
              lexemes to integer tokens
              next_symbol,have, and mustbe provide the basic
              entry points of the lexical analyser.
Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------
}
{$r+}
UNIT dlbvp;

INTERFACE
uses bufdecls;

  const null=0;
      firsttoken =1;

      firststring = 1000;
      lasttoken = firststring -1;
      firstcell = 5000;
      laststring = firstcell-1;

      lastcell  =30000;



const maxvar = 200;

      maxstring=maxvar;
      tab =9;
      newline = 10;
      cr  =13;
      bs = 8;
      vtab = 11;
{
     *****************
     *  TYPES        *
     *****************}
type
lextoken = firststring..laststring;
listcell = firstcell..lastcell;
stringv  = string[maxstring];
var dlbtoken:lextoken;

{
   *****************
   * PROCEDURES    *
   *****************

}
  function psym(l:lextoken): stringv;

  function isid(i:Integer):boolean;
  function tokenof(s:stringv):lextoken;



IMPLEMENTATION
const
      minchar = ' ';
      maxchar = '~';
      poolsize=4000;
type
    lexnode = ^delabrandis;
    lexarray = array[minchar..maxchar] of lexnode;
    delabrandis = record
                      final:integer;
                      pref:char;
                      follower,alternates:lexnode;
               end;
    poolpntr = 0..poolsize;
    tpool=array[poolpntr] of char  ;
var    predefined:lexarray;
       linebuf:stringv;
       converted:string[255];
       lasttoken_used:lextoken;
       pool:^tpool;
       pooltop:poolpntr;
       printables:array[lextoken] of poolpntr;
function isid(i:integer):boolean;begin isid:=(i<=laststring)and(i>=firststring) end;
procedure addch(c:char);
begin
     if pooltop < poolsize then begin
       pool^[pooltop]:=c;pooltop:=succ(pooltop);
     end
end;

var
       maxpredefined:lextoken;
       {
       ------------------------- de la brandis tree manipulation -------------}

{
       ****************
       * INSERT_TOKEN *
       ****************
       }
function insert_token(var B:textstack; var n:lexarray):lextoken;
{  inserts the string into the tree }
{$S-}
var p      : lexnode;
    charno : integer;
    c      : char;
    hit ,inserted   :boolean;
    procedure newnode(var next:lexnode;c:char);
    begin
        new(next);
        with next^ do begin
          pref:=c; final:=0;
          follower:=nil;
          alternates:=nil;
        end;
    end;
    procedure ins(var n:lexnode;charno: word );
    var t:lexnode;
        c:char;
    begin
       c:=b.buf^[charno];
       if charno <B.finish then with B do
          if n=nil then begin
             newnode(t,c);
             n:=t;
             ins(n,charno)
          end
          else with  n ^ do
            if c = pref then begin
                 if charno=finish -1 then begin
                    { a  hit }
                    hit:=true;
                    if final = 0 then { first time we have encountered this word}
                    begin
                       final:=lasttoken_used;
                       printables[final]:=pooltop;
                       for charno:=start to finish-1 do
                          addch(buf^[charno]);
                       addch(chr(0));
                       lasttoken_used:=succ(lasttoken_used);
                    end;
                    insert_token:=final;
                 end
                 else ins(follower,charno+1);
            end
            else if c< pref then ins(alternates,charno)
            else
            begin { char less than pref }
                  t:=n;
                  newnode(n,c);
                  n^.alternates:=t;
                  ins(n,charno);
            end ;
    end;
begin
 {$r-}
 ins(  n[B.buf^[B.start]], B.start);

end;
{
        ***************
        * INITLEXANAL *
        ***************
}
procedure initdlb;
var B:textstack;
    i:integer;
    c:char;
    s:string[90];
    f:text;
begin
 lasttoken_used:=firststring;
  pooltop:=0;

  { create the symbol tree }
  for c:=minchar to maxchar do begin
   new(predefined[c]);
   with predefined[c]^ do begin
       follower:=nil;
       alternates:=nil;
       pref:=chr(0)
       ;
   end;
  end;
end;
{
        ***************
        * TokenOf     *
        ***************
}
function tokenof(s:stringv):lextoken;
var B:textstack;
begin
  { create the symbol tree }
  B.buf:=addr(s[1]);
  with B do begin
      start:=textbuflo;
      finish:=length(s)+start;
      tokenof:=insert_token(B,predefined);
  end;

end;


{ ------------------------------------------------------------------- }
{          PSYM                                                       }
{          print out a lexeme                                         }
{ ------------------------------------------------------------------- }
  function psym(l:lextoken): stringv;
  var
    f:text;
    s:string[30];
    i:integer;
    c:char;

  begin
     s:='';
     i:=printables[l];
     while pool^[i]<>chr(0) do begin

        s:=s+pool^[i];
        i:=i+1;
     end;
     psym:=s;
  end;
{-------------------------------------------------------------------- }
BEGIN
     new(pool);  initdlb;
     converted:='';



END.
