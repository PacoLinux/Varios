program risctest;
uses riscasm,files,symstk;
const sloffset=12;
var SM:sstkp;
    pc,lexical_level:longint;
    bf:bytefileobjp;
    l,l2:labels;
    r1,r2:register;
procedure load_addr(lex_level,offset:integer);
{ load the address of variable n onto the stack }
var lexdiff:integer;
begin
      begin
                  begin { other }
                    { compute how far down the static chain to
                      chase
                    }
                    lexdiff:=lexical_level - lex_level ;
                    SM^.push(sseg);SM^.push(bp);
                    while lexdiff >0 do begin
                        { stack top now holds start of a frame }
                        SM^.pushint(sloffset);
                        SM^.arithop(addop);
                        { top of stack now holds address of static link }

                       SM^.ddup;
                       SM^.pushint(int_size);
     SM^.show(output);readln;
                       SM^.arithop(addop);
                       SM^.stackop(loadop,4);
                       SM^.drot;
                       SM^.stackop(loadop,4);
                       { the static link itself is now on top of stack }
                       lexdiff:=lexdiff-1;
                    end;
                    { top of stack now holds the base of the
                      frame containing the variable
                      Add the offset to it to find the address
                      of the variable
                    }
                    SM^.pushint(offset);
                    SM^.arithop(addop);

                  end;
        end;
   end;

begin
     new(bf,open('p.com',1));
     new(SM,startsstk(0));
     l:=SM^.mklabel;
     l2:=SM^.mklabel;
     lexical_level:=1;
     load_addr(1,-8);
     SM^.pushint(8);
     SM^.stackop(storeop,4);
     SM^.show(output);readln;

     load_addr(1,-8);
     SM^.pushint(8);
     SM^.stackop(storeop,4);
     SM^.show(output);readln;


     load_addr(1,-8);
     SM^.pushint(8);
     SM^.stackop(storeop,4);
     SM^.show(output);readln;


     SM^.startpass2(bf,pc);
     dispose(SM,destroy);
     bf^.destroy;
end.