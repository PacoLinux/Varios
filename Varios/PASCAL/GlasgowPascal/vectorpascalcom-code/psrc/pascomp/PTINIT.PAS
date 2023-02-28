unit ptinit;
interface uses overlay;
implementation
begin
     ovrinit('pretex.ovr');
     if ovrresult<>0 then begin
        writeln('overlay error ',ovrresult);halt(1);
     end;
     ovrinitems;
end.
