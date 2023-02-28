{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{            FILE=CONF554,                                           }
{                                                                    }
{:tests that array bounds are constants                              }
program conf554;
  const d=0;
  procedure a(b:integer);
   var c:array[d..b] of integer;{ this line should fail }
  begin
	c:=1;
  end;
    
 
begin
	 a(2);
end.
