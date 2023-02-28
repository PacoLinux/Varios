unit pcinit;
interface uses overlay;
implementation
begin
     ovrinit('pc.ovr');
     if ovrresult<>0 then begin
        writeln('overlay error ',ovrresult);halt(1);
     end;
     ovrinitems;
end.
