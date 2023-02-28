{
-----------------------------------------------------------------
Module      : unicode.pas
Used in     : Vector Pascal
Author      : W P Cockshott
Date        : 22 dec 2002
Version     : 1
Function    : Definitions associated with unicode i/o
              and character ranges
Copyright (C) University of Glasgow



----------------------------------------------------------------
}

unit unicode;

interface

const maxstring             = 256;
(*! Ranges of unicode characters recognised in vector pascal *)
      firstlwcaseLatin      = ord('a');
      lastlwcaseLatin       = ord('z');
      firstupcaseLatin      = ord('A');
      lastupcaseLatin       = ord('Z');
      firstlwcaseGreek      = $3b1;
      lastlwcaseGreek       = $3c9;
      firstupcaseGreek      = $391 ;
      lastupcaseGreek       = $3a9;
      firstlwcaseCyrillic   = $430;
      lastlwcaseCyrillic    = $44f;
      firstupcaseCyrillic   = $410;
      lastupcaseCyrillic    = $42f;
      firsthiragana         = $3041;
      lasthiragana          = $3094;
      firstkatakana         = $30a1;
      lastkatakana          = $30fa;
      firstcjk              = $4e00;
      lastcjk               = $9fff;
      minpaschar            = ord(' ');
      maxpaschar            = lastcjk;

(*!  Characters for mathematical operators *)
     uni_in                 = $2208;
     uni_and                = $2227;
     uni_or                 = $2228;
     uni_iota               = $2373;
     uni_assign             = $2190;
     uni_naryproduct        = $220f;
     uni_divide             = $00f7;
     uni_multiply           = $2715;
     uni_narysum            = $2211;
     uni_sqrt               = $221a;
     uni_lessthanorequal    = $2264;
     uni_notequal           = $2260;
     uni_greaterthanorequal = $2265;
     uni_not                = $00ac;




type
    unicodechar = 0 .. $ffff;

var
   (*! this array maps a unicode character to the equivalent lower case
       character, this is useful in pascal to maintain case conversion
       rules *)
    lwcasemap : array [unicodechar] of unicodechar;

implementation

procedure setupcasemap;
var i:integer;
begin
     for i:= 0 to $ffff do
     begin
      if chr(i) in ['A'..'Z']
      then lwcasemap[i]:=i - ord('A')+ord('a') else
      if (i>= firstupcasegreek) and (i<= lastupcasegreek)
      then lwcasemap[i]:= i - firstupcasegreek +firstlwcasegreek else
      if (i>= firstlwcasecyrillic) and (i<= lastupcasecyrillic)
      then lwcasemap[i]:= i - firstupcasecyrillic + lastlwcasecyrillic else
      lwcasemap[i]:=i;         { the default }
     end;
end;

begin
     setupcasemap;
end.
