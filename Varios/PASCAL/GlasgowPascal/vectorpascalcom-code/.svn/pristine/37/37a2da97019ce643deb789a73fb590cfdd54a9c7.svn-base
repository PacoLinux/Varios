PROGRAM PolyTest;  { For QuickPascal 1.0 }

		   { BY Jeff Duntemann   }
		   { For DDJ 1/90        }

USES Crt;

TYPE
  FatherPtr = ^Father;
  Father = OBJECT
	     Age : Integer;
	     PROCEDURE Init;
	     PROCEDURE Talk;
	   END;

  SonPtr = ^Son;
  Son    = OBJECT(Father)
	     Girlfriends : Integer;
	     PROCEDURE Init; OVERRIDE;
	     PROCEDURE Talk; OVERRIDE;
	   END;



VAR
  Dad     : Father;
  Twerp   : Son;
  Person  : Father;
  Link    : FatherPtr;
  KidLink : SonPtr;


PROCEDURE Father.Init;

BEGIN
  Self.Age := 42;
END;


PROCEDURE Father.Talk;

BEGIN
  Writeln('This is the old man talking.');
END;



PROCEDURE Son.Init;

BEGIN
  Self.Age := 11;
  Self.Girlfriends := 5;
END;


PROCEDURE Son.Talk;

BEGIN
  Writeln('Cool it, daddy-o!');
END;



BEGIN
  ClrScr;

  New(Dad);  { These three statements allocate the objects on the heap }
  New(Twerp);
  New(Person);

  Dad.Init;        { Type Father }
  Twerp.Init;      { Type Son }
  Person.Init;     { Type Father }

  { The following works polymorphically in QuickPascal but not Turbo: }

  Person := Twerp;   { Assign a Son object to a Father object }
  Person.Talk;	     { Polymorphism allows the Son.Talk method to be }
		     { executed from Person, which is type Father }
  Writeln('Person''s age is: ',Person.Age);  { Check the age on-screen! }
  Readln;

  { Working through pointers works with either Turbo or Quick Pascal: }

  Link := @Dad;      { Link is defined as a ^Father }
  Link^.Talk;        { Dad speaks here... }

  KidLink := @Twerp; { Twerp is type Son }
  Link := KidLink;   { Assign a SonPtr to a FatherPtr }
  Link^.Talk;        { Even tho Link is a FatherPtr, the kid talks here. }
  Readln;

END.


[LISTING TWO]

PROGRAM PolyTest;   { For Turbo Pascal 5.5 }

                    { BY Jeff Duntemann    }
                    { For DDJ 1/90         }


USES Crt;

TYPE
  FatherPtr = ^Father;
  Father = OBJECT
             Age : Integer;
             CONSTRUCTOR Init;
             PROCEDURE Talk; VIRTUAL;
           END;

  SonPtr = ^Son;
  Son    = OBJECT(Father)
             Girlfriends : Integer;
             CONSTRUCTOR Init;
             PROCEDURE Talk; VIRTUAL;
           END;



VAR
  Dad     : Father;
  Twerp   : Son;
  Person  : Father;
  Link    : FatherPtr;
  KidLink : SonPtr;


CONSTRUCTOR Father.Init;

BEGIN
  Age := 42;
END;


PROCEDURE Father.Talk;

BEGIN
  Writeln('This is the old man talking.');
END;



CONSTRUCTOR Son.Init;

BEGIN
  Age := 11;
  Girlfriends := 5;
END;


PROCEDURE Son.Talk;

BEGIN
  Writeln('Cool it, daddy-o!');
END;



BEGIN
  ClrScr;

  Dad.Init;        { Type Father }
  Twerp.Init;      { Type Son }
  Person.Init;     { Type Father }


  { The following does not work polymorphically in Turbo Pascal: }

  Person := Twerp;  { The assignment is kosher to the compiler...}
  Person.Talk;      { ...but polymorphism does NOT work here...  }
                    { ...and Dad speaks instead of the kid.      }
  Writeln('Person''s age is: ',Person.Age);
  Readln;

  { This, on the other hand, works polymorphically as it should: }

  Link := @Dad;       { Link is defined as a FatherPtr }
  Link^.Talk;         { Dad speaks here... }

  KidLink := @Twerp;  { Twerp is type Son }
  Link := KidLink;    { Assign a SonPtr to FatherPtr }
  Link^.Talk;         { Even tho Link is a FatherPtr, the kid talks here. }
  Readln;

END.
