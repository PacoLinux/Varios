{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks that allocating and deallocating causes no        }
{:mem errors                                                         }
program conf566;
type vector(a:integer)=array[1..a] of real;

     matrix(rows,cols:integer)=array[1..rows,1..cols] of real;
     pv=^vector;

     pm=^matrix;
var vp:pv; mp:pm; i:integer;
begin
      for i:=1 to 18 do begin
	new (vp,3000+i);
	vp^:=2;
	new (mp,1000+i,1000 );
	mp^:=99;
      dispose(vp);dispose(mp);
      end;

	writeln('PASS CONF566 schematic arrays allocate and deallocate')


end.
