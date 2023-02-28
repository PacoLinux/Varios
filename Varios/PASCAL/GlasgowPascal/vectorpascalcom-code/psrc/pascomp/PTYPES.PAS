
USES
  editdecl,
  errors,
  dlb,assemble,idtypes;
  begin
  writeln('at start');readln;
  initlexanal;initsymtab;
  writeln(ptype(int_type),ptype(pntr_type),ptype(cpntr_type));
  end.
