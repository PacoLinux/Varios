{ Complex Number Turbo 5.5 Package.                        }
{ Written by Eric Robert Jablow                            }
{ Version 0.1.  Completed July 20, 1989, 9:45 AM EDT.      }
{            34 Hart Street                                }
{            Port Jefferson Station, NY 11776              }
{            (516)-331-6687 (until August 1.)              }
{            ERIC JABLOW on EXEC-PC, Sound of Music.       }
{            ejablow@dasys1.UUCP                           }
{            eric%sbmath@sbee.sunysb.edu (USENET addresses)}

{ TP 5.5 Copyright (c) 1989 by Borland International, Inc. }
{ Also uses Turbo Professional 5.0 copyright 1987, 1988,   }
{ 1989 by TurboPower Software.                             }

unit Complex;

{***************************************************}
{*                                                 *}
{* Turbo Pascal 5.5 object-oriented example.       *}
{* This unit defines the complex numbers and       *}
{* various operations on them.  Other units will   *}
{* extend this to the Riemann sphere, quaternions, *}
{* and so on.  More units will later be provided   *}
{* to handle various classes of complex functions, *}
{* the Mobius transformations, for example.  I     *}
{* hope to write a curve and integration unit, at  *}
{* least for the holomorphic functions.            *}
{*                                                 *}
{***************************************************}

{***************************************************}
{*                                                 *}
{* Copyright (c) 1989 by Eric Jablow.  You may use *}
{* this unit freely in any non-profit application, *}
{* as long as you provide credit to me.  Feel free *}
{* to modify this unit too; just don't remove the  *}
{* copyright notice.                               *}
{*                                                 *}
{***************************************************}

{$R+}
{$S-}

interface

uses Objects,   {From TP5.5 by Borland International.}
     Trig,      {An auxiliary unit for hyperbolic functions }
                {from the Turbo Professional Bonus Disk.    }
                {It is public-domain.                       }
     TPDos,     {An extension to the Dos unit from TPro 5.0.}
                {The only use of this is OpenStdDev and     }
                {StdErrHandle in the ReportError method.    }
     TPString;  {Also from TPro 5.0.  Its only use is HexPtr}
                {in the ReportError method.                 }

type

  MathString       = String[79];     {Enough to fit on one line.}

{****************************************************}
{*                                                  *}
{* The different error types this unit will handle. *}
{*                                                  *}
{****************************************************}

  ComplexError     = ( NoError,       { This insures that the true }
                                      { errors have Ordinal Value  }
                                      { greater than zero.         }

                       DivByZero,     { Dividing a non-zero number }
                                      { by zero.  Use the Extended }
                                      { Complex Numbers instead.   }

                       ZeroOverZero,  { Dividing zero by zero, or  }
                                      { multiplying zero by an     }
                                      { infinite extended complex  }
                                      { number.                    }

                       BrArgRangeErr, { Silly value for the branch }
                                      { angle in method BrArgument.}

                       LogError,      { Taking logarithm of 0.0,   }
                                      { or any other logarithmic   }
                                      { singularity.               }

                       InputError);   { EOF or a badly-formatted   }
                                      { in the ReadNum method.     }

{******************************************************}
{*                                                    *}
{* The ComplexNumber object, and its various methods. *}
{*                                                    *}
{******************************************************}

  ComplexNumberPtr = ^ComplexNumber;

  ComplexNumber    = object(Base)     {Base is from the  OBJECTS unit}

{*********************************************************}
{*                                                       *}
{* Class variable definitions: real and imaginary parts. *}
{*                                                       *}
{*********************************************************}

    RealPart       : real;            { If z = x + iy, this is x, }
    ImagPart       : real;            {            and this is y. }

{*********************************************************}
{*                                                       *}
{*      Ordinary constructors and destructors.           *}
{*                                                       *}
{*********************************************************}

{ Create a complex number from two real numbers. }

    constructor Init(re : Real; im : Real);

{ Convert a real number to a complex number. }

    constructor RealInit(re : Real);

{ Copy a complex number to another. }

    constructor Copy(var w : ComplexNumber);

{ Read a complex number from Input. }

    constructor ReadNum;

{ Destroy a complex number. }

    destructor  Done; virtual;


{********************************************}
{*                                          *}
{* Stream-oriented methods for reading and  *}
{* writing complex numbers in binary form.  *}
{* Streams are defined in the Objects unit. *}
{*                                          *}
{********************************************}


{ Read a complex number from a stream. }

    constructor Load(var S : Stream);

{ Write a complex number to a stream.  }

    procedure   Store(var S : Stream);






{***********************************}
{*                                 *}
{* Access the object's components. *}
{*                                 *}
{***********************************}

{ Get Re z. }

    function    GetRealPart: real;

{ Get Im z. }

    function    GetImagPart: real;

{ Set Re z. }

    procedure   SetRealPart(x : Real);

{ Set Im z. }

    procedure   SetImagPart(y: Real);

{ Reset z. }

    procedure   CSet(x : Real; y : Real);


{*******************************************}
{*                                         *}
{* Handle errors in the various routines.  *}
{*                                         *}
{*******************************************}

    procedure   ReportError( ErrorType : ComplexError);

{********************************************************}
{*                                                      *}
{* Equality tests.  EqualTo checks for exact equality,  *}
{* and Approx checks for additive approximate equality. *}
{* Similarly, MultApprox checks for multiplicatively    *}
{* approximate equality.  The tolerance is epsilon.     *}
{*                                                      *}
{********************************************************}

{ Exact equality--rare for real numbers on a computer. }

    function   EqualTo(  var w  : ComplexNumber) : Boolean;

{ Additive approximate equality: Approx will be true   }
{ when both |Re z - Re w| and |Im z - Im w| < epsilon. }

    function   Approx(   var w  : ComplexNumber;
                         epsilon:  real) : Boolean;

{ Multiplicative approximate equality.  MultApprox     }
{ will be true when |Re z - Re w| <= epsilon*|Re z|    }
{               and |Im z - Im w| <= epsilon*|Im z|    }

    function   MultApprox(var w : ComplexNumber;
                         epsilon:  real) : Boolean;


{****************************************************************}
{*                                                              *}
{*                   COMPLEX ARITHMETIC                         *}
{*                                                              *}
{* The four basic arithmetic functions: all done essentially as *}
{* z --> z op w.  These all modify the base object.             *}
{* ScalarMult is virtual because it extends to extended complex *}
{* numbers and quaternions as multiplications by reals too.     *}
{* Since the procedure in SubFrom works for any group, make it  *}
{* virtual too.  Essentially, make addition and multiplication  *}
{* static, and everything depending on them virtual.            *}
{*                                                              *}
{*  AbsValue and Conjugate are inserted here so as to define    *}
{* Reciprocal, which is necessary to define DivideBy, even they *}
{* are all important in their own right.  (If only one could    *}
{* overload the ordinary arithmetic operations like +, -, etc.  *}
{* as in C++.)   Conjugate is declared as virtual because it    *}
{* can be extended to generalizations quite easily; after all,  *}
{* it has no argument list.  The same goes for Reciprocal.      *}
{* Finally, DivideBy is virtual because of the way it is        *}
{* implemented.  The method given in DivideBy extends to any    *}
{* integral domain.                                             *}
{*                                                              *}
{****************************************************************}

    procedure   AddTo(  var  w: ComplexNumber);           {z --> z + w.}

    procedure   Minus;                                    {z -->  - z. }

    procedure   SubFrom( var w: ComplexNumber); virtual;  {z --> z - w.}

    procedure   ScalarMult( t: real); virtual;            {z --> t * z.}

    procedure   MultBy( var w: ComplexNumber);            {z --> z * w.}

    procedure   Square;                                   {z --> z ^ 2.}

    function    AbsValue: real;                  {(x ^ 2 + y ^ 2) ^ 0.5}

    procedure   Conjugate; virtual;                       {z --> x - iy}

    procedure   Reciprocal; virtual;                      {z --> 1 / z.}

    procedure   DivideBy( var w: ComplexNumber); virtual; {z --> z / w.}

{* The argument of a (non-zero) complex number z is the angle   *}
{* from the positive x-axis to the vector from the origin to z. *}
{* BrArgument is provided for those situations where you cannot *}
{* use the ordinary principal part of the arctan function.  See *}
{* any good complex analysis book for details.  This happens    *}
{* quite often with roots and logarithms.                       *}



    function    Argument: real;

    function    BrArgument( branchangle: real): real;


{ Various complex functions. }

    procedure  ComplexLog;                                {z -->log z.}

    procedure  BrComplexLog( branchangle : Real);

    procedure  ComplexExp;                                {z-->exp z.}

    procedure  ComplexSqrt;

    procedure  ComplexPower(        var w : ComplexNumber);

    procedure  RealPower(               t : Real);

    procedure  BrComplexPower(      var w : ComplexNumber;
                              branchangle : Real);

    procedure  BrRealPower(t, branchangle : Real);

    procedure  ComplexIntPower( i : Integer);

    procedure  ComplexSin;

    procedure  ComplexCos;

    procedure  ComplexTan;

    procedure  ComplexSec;

    procedure  ComplexCsc;

    procedure  ComplexCot;

{***************************************************************}
{*                                                             *}
{*               INPUT AND OUTPUT                              *}
{*                                                             *}
{* Convert a complex number to a string so that you can put it *}
{* into a Write or WriteLn statement.  Since no parameter list *}
{* is necessary, it should obviously be virtual.               *}
{*                                                             *}
{***************************************************************}

    function    ToString: MathString; virtual;
    function    ToFormatted( width, dwidth: Byte;
                               exponential: Boolean): MathString; virtual;
    procedure   Display; virtual;
    procedure   FormattedDisplay( width, dwidth: Byte;
                                    exponential: Boolean); virtual;


  end;

const

{ 0. }
  CZero            : ComplexNumber = (Realpart : 0.0; ImagPart : 0.0);

{ 1. }
  COne             : ComplexNumber = (Realpart : 1.0; ImagPart : 0.0);

{ i  }
  CI               : ComplexNumber = (Realpart : 0.0; ImagPart : 1.0);


implementation

function Floor( x: real) : LongInt;
var
  l: LongInt;
begin
  If x >= 0.0 then
    l := Trunc(x)
  else                 { x is negative. }
    begin
    x := -x;           { Take the absolute value of x.}
    l := Trunc(x);
    If x > l then      { x was originally not a negative integer.}
      l := l + 1;      {      We must round _away_ from zero.    }

    l := -l            {Now, convert back to a negative integer. }
    end;
  Floor := l
end;  { Floor }

{*******************************************************************}

constructor ComplexNumber.Init( re: real; im: real);
begin
  Realpart := re;
  ImagPart := im
end;  { Init }

constructor ComplexNumber.RealInit( re: real);
begin
  Realpart := re;
  ImagPart := 0.0
end;  { RealInit }

constructor ComplexNumber.Copy( var w: ComplexNumber);
begin
  Self := w
end;  { Copy }

{ This Routine needs a lot of work.  It takes input exactly }
{ the way the output routines write them.                   }

constructor ComplexNumber.ReadNum;
var
  imag : Char;
begin
  {$I-}
  Read(RealPart);
  {$I+}
  if IOResult <> 0 then ReportError(InputError);
  if Eof OR EoLn then
    ImagPart := 0.0
  else begin
    {$I-}
    Read(ImagPart, imag);
    {$I+}
    if (IOResult <>0) OR (imag <> 'i') then ReportError(InputError);
  end
end; { ReadNum }

destructor ComplexNumber.Done;
begin
end;  { Done }


{*******************************************************************}


constructor ComplexNumber.Load(var S : Stream);
begin
  S.Read(RealPart, SizeOf(Real));
  if S.Status <> 0 then Fail;
  S.Read(ImagPart, SizeOf(Real));
  if S.Status <> 0 then Fail;
end; { Load }

procedure ComplexNumber.Store(var S : Stream);
begin
  S.Write(RealPart, SizeOf(Real));
  S.Write(ImagPart, SizeOf(Real))
end; { Store }


{*******************************************************************}

function   ComplexNumber.GetRealPart;
begin
  GetRealPart := RealPart
end;  { GetRealPart }

function   ComplexNumber.GetImagPart;
begin
  GetImagPart := ImagPart
end;  { GetImagPart }


procedure  ComplexNumber.SetRealPart(x : Real);
begin
  RealPart := x
end;  { SetRealPart }

procedure  ComplexNumber.SetImagPart(y : Real);
begin
  ImagPart := y
end;  { GetImagPart }

procedure  ComplexNumber.CSet(x : Real; y : Real);
begin
  RealPart := x;
  ImagPart := y
end;  { CSet }

{*******************************************************************}


{ OpenStdDev is from the Turbo Professional 5.5 TPDos unit. }
{ HexPtr is from its TPString unit.                         }

procedure   ComplexNumber.ReportError( errortype : ComplexError);
const
  Message : ARRAY[ComplexError] OF MathString =
    ( 'No Error.',
      'You tried to divide a non-zero number by zero.',
      'You tried to divide zero by zero.',
      'The branchangle you sent to BrArgument was too large in magnitude.',
      'You tried to take the logarithm of 0.0 +0.0*i.',
      'EOF or malformed input on read.');

  TProError = 255;

var
  StdErr  : Text;

begin
  if NOT OpenStdDev( StdErr, StdErrHandle) then
    Halt(TProError);
  Writeln( StdErr, '***Error in ComplexNumber Unit ***');
  Writeln( Stderr, Message[errortype] );
  Write(   StdErr, 'The ComplexNumber object was at ');
  Writeln( StdErr, HexPtr(@Self) + '.');
  Close(   StdErr);
  Halt( Ord(errortype) )
end;

{*******************************************************************}


function  ComplexNumber.EqualTo( var w: ComplexNumber): Boolean;
begin
  EqualTo :=     (RealPart = w.RealPart)
             AND (ImagPart = w.ImagPart)
end;

function  ComplexNumber.Approx(  var w : ComplexNumber;
                               epsilon : real): Boolean;
begin
  Approx :=     (Abs(RealPart - w.RealPart) < epsilon)
            AND (Abs(ImagPart - w.ImagPart) < epsilon)
end;

function  ComplexNumber.MultApprox( var  w : ComplexNumber;
                                   epsilon : real): Boolean;
begin
  MultApprox :=  (Abs(RealPart - w.RealPart) <= epsilon * Abs(RealPart))
             AND (Abs(ImagPart - w.ImagPart) <= epsilon * Abs(ImagPart))
end;


{*******************************************************************}


procedure  ComplexNumber.Addto( var w: ComplexNumber);
begin
  RealPart := RealPart + w.GetRealPart;
  ImagPart := ImagPart + w.GetImagPart
end;

procedure  ComplexNumber.Minus;
begin
  RealPart := -RealPart;
  ImagPart := -ImagPart
end;

procedure  ComplexNumber.SubFrom( var w: ComplexNumber);
begin
  Minus;     {     z --> -z.    }
  AddTo(w);  { now z --> w - z. }
  Minus      { now z --> z - w. }
end;

procedure  ComplexNumber.ScalarMult( t: real);
begin
  RealPart := RealPart * t;
  ImagPart := ImagPart * t
end;

procedure  ComplexNumber.MultBy( var w: ComplexNumber);

var
  temp1, temp2, temp3: Real;

begin
  temp1 := (RealPart + w.RealPart) * (ImagPart + w.ImagPart);
  temp2 := RealPart * w.RealPart;
  temp3 := ImagPart * w.ImagPart;
  RealPart := temp2 - temp3;
  ImagPart := temp1 - (temp2 + temp3)
end;

procedure ComplexNumber.Square;
var
  tempreal, tempimag: Real;
begin
  tempreal := Sqr(RealPart) - Sqr(ImagPart);
  tempimag := RealPart * ImagPart;
  RealPart := tempreal;
  ImagPart := tempimag + tempimag { Faster than multiplying}
                                  { by 2.                  }
end;

function  ComplexNumber.AbsValue: real;
begin
  AbsValue := Sqrt( Sqr(RealPart) + Sqr(ImagPart))  {TP5.5 is probably faster.}
end;


procedure  ComplexNumber.Conjugate;
begin
  ImagPart := - ImagPart
end;

procedure  ComplexNumber.Reciprocal;
var
  temp: real;

begin

  if EqualTo(CZero) then
    ReportError(DivByZero);

  Conjugate;
  temp := 1/ (Sqr(RealPart) + Sqr(ImagPart));
  ScalarMult(temp)
end;

procedure  ComplexNumber.DivideBy( var w: ComplexNumber);
var
  winverse: ComplexNumber;  { 1 / w, eventually.}

begin

  if EqualTo(CZero) AND w.EqualTo(CZero) then
      ReportError(ZeroOverZero);

  winverse.Copy(w);         { Set  winverse = w.    }
  winverse.Reciprocal;      { Now, winverse = 1 / w.}
  MultBy(winverse)          { z --> z * (1 / w).    }
end;

{*******************************************************************}


function  ComplexNumber.Argument: real;
{ Give the argument of the complex number, in the interval [-pi, pi) }
{ If the number is 0, report 0 back.}

var
  theta: real;

begin
  if RealPart = 0.0 then
    begin
    if ImagPart = 0.0 then
      theta := 0.0
      else
    if ImagPart > 0.0 then
      theta := PI/2.0
      else
      theta := -PI/2.0
    end
  else theta := ArcTan( ImagPart/ RealPart);

  if (RealPart < 0) then begin
    if (ImagPart >= 0) then
      theta := theta + pi
    else
      theta := theta - pi
    end;

  Argument := theta
end;

function  ComplexNumber.BrArgument( branchangle: real): real;
const
  maxbranchangle = 2.0 * 3.14159 * (MAXLONGINT - 1);
var
  principal: real;
  adjust:    longint;
begin
  if (Abs(branchangle) > Maxbranchangle) then ReportError(BrArgRangeErr);

  principal := Argument;
  adjust := Floor( (principal - branchangle)/ (2.0 * PI));
  BrArgument := principal - 2.0 * PI * adjust
end;

procedure  ComplexNumber.ComplexLog;
var
  modulus : Real;
begin
  modulus := AbsValue;
  if ( modulus = 0.0 ) then
    ReportError(LogError);  {Doesn't return.}
  ImagPart := Argument;
  RealPart := Ln(modulus)
end;

procedure  ComplexNumber.BrComplexLog( branchangle : Real);
var
  modulus : Real;
begin
  modulus := AbsValue;
  if ( modulus = 0.0 ) then
    ReportError(LogError);  {Doesn't return.}
  ImagPart := BrArgument( branchangle);
  RealPart := Ln(modulus)
end;

procedure  ComplexNumber.ComplexExp;
var
  temp : Real;
begin
  temp := Exp(RealPart);
  RealPart := temp * Cos(ImagPart);
  ImagPart := temp * Sin(ImagPart)
end;


procedure  ComplexNumber.ComplexSqrt;
var
  newModulus  : Real;
  newArgument : Real;
begin
  newModulus  := Sqrt(AbsValue);
  newArgument := Argument/2.0;
  RealPart    := newModulus * Cos(newArgument);
  ImagPart    := newModulus * Sin(NewArgument);
end;

procedure  ComplexNumber.ComplexPower( var w : ComplexNumber);
begin
  ComplexLog;
  MultBy(w);
  ComplexExp
end;

procedure  ComplexNumber.RealPower( t : Real);
begin
  ComplexLog;
  ScalarMult(t);
  ComplexExp
end;

procedure  ComplexNumber.BrComplexPower( var w : ComplexNumber;
                                   branchangle : Real);
begin
  BrComplexLog( branchangle);
  MultBy(w);
  ComplexExp
end;

procedure  ComplexNumber.BrRealPower( t, branchangle : Real);
begin
  BrComplexLog( branchangle);
  ScalarMult(t);
  ComplexExp
end;


procedure  ComplexNumber.ComplexIntPower{ i : Integer};
const
  limit = 12; { This is a tweakable parameter; since ComplexLog is slow, }
              { if |i| <= limit we will do this by multiplication. Else, }
              { we use ComplexLog and ComplexExp.  I chose 12 because it }
              { largest integer such that this function requires at most }
              { six multiplications.                                     }
var
  w        : ComplexNumber;
  negative : Boolean;
begin
  if ( Abs(i) > limit ) then
    begin
      w.RealInit(i);
      ComplexPower(w)
    end
  else
    if i = 0 then Self := COne
  else begin
    negative := i < 0;
    i := Abs(i);
    while i > 1 do begin          { Suppose i = 2*m + k, k = 0 or 1.}
      w.Copy(Self);               { w --> z }
      Square;                     { z --> z^2}
      ComplexIntPower(i div 2);   { z --> z^(2*n)}
      if Odd(i) then MultBy(w); { z --> z^(2*n+k)}
    end; {while}
    if negative then Reciprocal
    end
end;   {ComplexIntPower}


{*******************************************************************}


procedure  ComplexNumber.ComplexSin;
var
  temp: Real;
begin
  temp     := Sin(RealPart) * Cosh(ImagPart);
  ImagPart := Cos(RealPart) * Sinh(ImagPart);
  RealPart := temp
end;

procedure  ComplexNumber.ComplexCos;
var
  temp : Real;
begin
  temp     :=   Cos(RealPart) * Cosh(ImagPart);
  ImagPart := - Sin(RealPart) * Sinh(ImagPart);
  RealPart :=   temp
end;
procedure  ComplexNumber.ComplexTan;
var
  w : ComplexNumber;
begin
  w.Copy(Self);
  ComplexSin;
  w.ComplexCos;
  DivideBy(w)
end;

procedure  ComplexNumber.ComplexSec;
begin
  ComplexCos;
  Reciprocal
end;

procedure  ComplexNumber.ComplexCsc;
begin
  ComplexSin;
  Reciprocal
end;

procedure  ComplexNumber.ComplexCot;
var
  w : ComplexNumber;
begin
  w.Copy(Self);
  ComplexCos;
  w.ComplexSin;
  DivideBy(w)
end;

{*******************************************************************}

function  ComplexNumber.ToString: MathString;
var
  ImSign:   String[2];
  ReString: MathString;
  ImString: MathString;

begin
  if ImagPart < 0 then
    ImSign := ' -'
  else
    ImSign := ' +';

  Str( RealPart, ReString);
  Str( Abs(ImagPart), ImString);
  ToString := ReString + ImSign + ImString + '*i'
end;

function  ComplexNumber.ToFormatted(width, dwidth: Byte;
                                      exponential: Boolean): MathString;
var
  ImSign: String[2];
  ReString: MathString;
  ImString: MathString;

begin
  if ( ImagPart < 0 ) then
    ImSign := ' -'
  else
    ImSign := ' +';

  if ( exponential ) then
    begin
      Str( RealPart : width, ReString);
      Str( Abs(ImagPart) : width, ImString)
    end
  else
    begin
      Str( RealPart : width : dwidth, ReString);
      Str( Abs(ImagPart) : width : dwidth, ImString)
    end;
  ToFormatted := ReString + ImSign + ImString + 'i'
end;

procedure ComplexNumber.Display;
begin
  Write( ToString )
end;

procedure ComplexNumber.FormattedDisplay( width, dwidth: Byte;
                                            exponential: Boolean);
begin
  Write( ToFormatted( width, dwidth, exponential))
end;


end.

