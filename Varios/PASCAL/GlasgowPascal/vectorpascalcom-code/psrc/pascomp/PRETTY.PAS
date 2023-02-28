{
----------------------------------------------------------------
Module      : Pretty
Used in     : Compiler toolbox
Author      : W P Cockshott
Date        : 4 Dec 1989
Version     : 1
Function    : To pretty print pascal from a syntax tree
Changes     : derived from file sasyn.cmp on 9-2-89
            : derived from file sasyn.pas starting november 89
Copyright (C) WP Cockshott & P Balch
Conditional compilation flags
   synext   : supports dynamic syntax extensions
   persistent: persistent pascal extenstions
----------------------------------------------------------------}
{$s+}
UNIT Pretty;
INTERFACE USES
  editdecl,
  errors,fsm,
  reader,
  dlb,
  IDTYPES,
  symtab,
  stacks

;

procedure pretty_print(var outfile:text);
implementation

procedure pstackval(var f:text; s:stackval);forward;
procedure recprint(var f:text;n:node);
begin
   if n<> nil then
   with N^ do
      case tag of
      int_lit    : write(f,i);
      real_lit   : write(f,r);
      string_lit : write(f,'''',strptr^,'''');
      newline_sy : begin pstackval(f,head);writeln(';');pstackval(f,tail) end;
      else begin pstackval(f,head);writeln(psym(ord(tag)));pstackval(f,tail) end;
      end;
 end;

procedure pstackval{(var f:text; s:stackval);forward};
begin
     with s do
     case sort of
     lexical    : write(f,' ',psym(ord(token)),' ');
     id         : write(f,psym(identifier^.identifier));
     typeinf    : write(f,ptype(trec));
     grammer    : recprint(f,tree);
     end;
end;

procedure pretty_print(var outfile:text);
var s:stackval;
begin
   tpop(s);pstackval(outfile,s);
end;
begin

end.