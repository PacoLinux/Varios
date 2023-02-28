unit blas1_s;

interface

uses blas, vectors_real, matrices_real;

type
   number = real;
   number_parameters = array[0..4] of real;
   vector = vector_real;
   matrix = matrix_real;

procedure SWAP(var V1,V2 : Vector);
   { Swap the values in V1 and V2. }
procedure ROTG(var sa,sb,c,s : Number);
   { Generate a Givens rotation matrix to zero the second element in the
     column vector (sa,sb). }
procedure ROT(var XS,YS : Vector; c, s : Number);
   { Apply a rotation generated by ROTG to the vectors (XS[n],YS[n]). }
procedure ROTMG(var sd1,sd2,sx1,sy1 : Number; var sparam : number_parameters);
   { Construct the Modified Givens Transformation Matrix H which zeroes the
     second component of column vector (sqrt(sd1)*sx1, sqrt(sd2)*sy1) 
     Depending on the value returned in sparam(1), H has one of the following
     values:
     -1.0
            (SH11 SH12)
        H = (         )
            (SH21 SH22)
     0.0
            (1.0  SH12)
        H = (         )
            (SH21 1.0 )
     1.0
            (SH11 1.0 )
        H = (         )
            (-1.0 SH22)
     2.0
            (1.0  0.0 )
        H = (         )
            (0.0  1.1 )
     Locations 2-4 of sparam contain SH11,SH21,SH12 and SH22 respectively.
   }
procedure ROTM(var XS,YS : Vector; var sParam : Number_Parameters);
   { Apply a rotation generated by ROTMG to the vectors (XS[n],YS[n]). }
procedure SCAL(Alpha : Number; var Source,Dest : Vector);
   { Scale the values in Source by Alpha and store in Dest. }
procedure COPY(var Source,Dest : Vector);
   { Copy the values in Source to Dest. }
procedure AXPY(Alpha : Number; var Source,Dest : Vector);
   { Scale the values in Source by Alpha and add to Dest. }
function DOT(var V1,V2 : Vector):Number;
   { Calculate the dot product V1.V2 }
function NRM2(var V:Vector):Number;
   { Calculate the Euclidean length of V. }
function ASUM(var V:Vector):Number;
   { Calculate the sum of magnitudes of the elements of V. }
function IAMAX(var V:Vector):Integer;
   { Return the index (0-based) of the largest magnitude element in V. }

implementation

const
   TempVecMax = 15;

var
   TempVec : ^Vector;        { Pre-allocated temporary storage. }
   DynamicTempVec : ^Vector;


procedure ROTG(var sa,sb,c,s : Number);
var
   roe,scale,r,z : Number;
begin
   roe:=sb;
   if (abs(sa)>abs(sb)) then begin
      roe := sa;
   end;
   scale := abs(sa) + abs(sb);
   if (scale=0) then begin
      { The vector is already zero, use the identity matrix. }
      c := 1.0;
      s := 0.0;
      r := 0.0;
      z := 0.0;
   end else begin
      r := scale * sqrt((sa/scale)**2 + (sb/scale)**2);
      if roe<0 then begin
         r := -r;
      end;
      c := sa/r;
      s := sb/r;
      z := 1.0;
      if abs(sa)>abs(sb) then begin
         z := s;
      end;
      if (abs(sb)>=abs(sa)) and (c<>0) then begin
         z:= 1.0/c;
      end;
   end;
   sa:=r;
   sb:=z;
end; { RotG }

procedure ROTMG(var sd1,sd2,sx1,sy1 : Number; var sparam : number_parameters);

   { The following code is translated from Fortran, some of which is not
     completely documented, and which made extensive use of GOTO. Numbers
     in comments correspond to the original labels. }

const
   gam    : Number = 4096.0;
   gamsq  : Number = 1.67772e7;
   rgamsq : Number = 5.96046e-8;

var
   abort                : boolean; 
   done                 : boolean;
   skipreduction       : boolean;
   sq1,sq2,sp1,sp2     : Number;
   sh11,sh12,sh21,sh22 : Number;
   su                  : Number;
   stemp               : Number;
   sflag               : Number;

   procedure sub70;
   begin
      if sflag>=0 then begin
         if sflag=0 then begin
            sh11:=1.0;
            sh22:=1.0;
            sflag:=-1.0;
         end else begin
            sh21:=-1.0;
            sh12:=1.0;
            sflag:=-1.0;
         end;
      end;
   end;

begin
   abort := false;
   done:= false;
   
   if sd1<0 then begin 
      { sd1 has an invalid value. }
      abort:=true;
   end else begin
      { 10 }
      sp2:=sd2*sy1;
      if sp2=0 then begin
         { Y component is already zeroed. Use the identity matrix. }
         sflag:=-2.0;
         done:=true;
         { no more till 260 }
      end else begin
         { 20 }
         sp1:=sd1*sx1;
         sq2:=sp2*sy1;
         sq1:=sp1*sx1;
         if abs(sq1)>abs(sq2) then begin { else at 40 }
            sh21:=-sy1/sx1;
            sh12:=sp2/sp1;
            su:=1.0-sh12*sh21;
            if su<=0.0 then begin
               { Parameters were invalid: scaling unit is negative. }
               abort:=true;
            end else begin
               { 30 }
               sflag := 0.0;
               sd1:=sd1/su;
               sd2:=sd2/su;
               sx1:=sx1*su;
               { no more till 100 }
            end;
         end else begin
            { 40 }
            if sq2<0 then begin
               { Y^2 is negative: something was invalid. }
               abort:=true;
            end else begin
               { 50 }
               sflag:=1.0;
               sh11:=sp1/sp2;
               sh22:=sx1/sy1;
               su:=1.0+sh11*sh22;
               stemp:=sd2/su;
               sd2:=sd1/su;
               sd1:=stemp;
               sx1:=sy1*su;
               { no more till 100 }
            end;
         end;
      end;
   end;
   if abort then begin
      { 60 }
      { Something went wrong earlier and we're giving up. }
      sflag:=-1.0;
      sh11:=0.0;
      sh12:=0.0;
      sh21:=0.0;
      sh22:=0.0;

      sd1:=0.0;
      sd2:=0.0;
      sx1:=0.0;
      { no more till 220 }
   end else begin
      if not done then begin
         { 100 }
         skipreduction:=false;
         while (sd1<=rgamsq) and (not skipreduction) do begin
            if (sd1=0.0) then begin
               skipreduction:=true;
            end else begin
               sub70;
               sd1:=sd1*gam**2;
               sx1:=sx1/gam;
               sh12:=sh12/gam;
            end;
         end;
         if not skipreduction then begin
            while (sd1>=gamsq) do begin
               sub70;
               sd1:=sd1/gam**2;
               sx1:=sx1*gam;
               sh11:=sh11*gam;
               sh12:=sh12*gam;
            end;
         end;
         { 160 }
         skipreduction:=false;
         while (abs(sd2)<=rgamsq) and (not skipreduction) do begin
            if (sd2=0.0) then begin
               skipreduction:=true;
            end else begin
               sub70;
               sd2:=sd2*gam**2;
               sh21:=sh21/gam;
               sh22:=sh22/gam;
            end;
         end;
         if not skipreduction then begin
            while (abs(sd2)>=gamsq) do begin
               sub70;
               sd2:=sd2/gam**2;
               sh21:=sh21*gam;
               sh22:=sh22*gam;
            end;
         end; 
      end;
   end;
   if not done then begin
      if sflag=0 then begin
         sparam[3]:=sh21;
         sparam[4]:=sh12;
      end else if sflag>0 then begin
         sparam[2]:=sh11;
         sparam[5]:=sh22;
      end else if sflag<0 then begin
         sparam[2]:=sh11;
         sparam[3]:=sh21;
         sparam[4]:=sh12;
         sparam[5]:=sh22;
      end;
   end;
   sparam[1]:=sflag;
end;

procedure ROT(var XS,YS : Vector; c, s : Number);
   var
      maxelement:integer;
   begin
      maxelement:=xs.high;
      if (maxelement=ys.high) then begin
         if maxelement>TempVecMax then begin
            New(DynamicTempVec,maxelement);
            DynamicTempVec^[0..maxelement] := c*xs + s*ys;
            ys := c*ys - s*xs;
            xs := DynamicTempVec^[0..maxelement];
            Dispose(DynamicTempVec);
         end else begin
            tempvec^[0..maxelement] := c*xs + s*ys;
            ys := c*ys - s*xs;
            xs := tempvec^[0..maxelement];
         end;
      end else begin
         Blas_Error('ROT: mismatched vector sizes.');
      end;
   end; { ROT }

procedure ROTM(var XS,YS : Vector; var sParam : Number_Parameters);
   var
      maxelement:Integer;
   procedure ROTM_transform_skewed(var XS,YS,Temp : Vector; tr,bl : Number);
      begin
         Temp[0..maxelement] := xs + ys * tr;
         ys   := xs * bl + ys;
         xs   := Temp[0..maxelement];
      end;
   procedure ROTM_transform_side_skewed(var XS,YS,Temp : Vector; tl,br : Number);
      begin
         Temp[0..maxelement] := xs * tl + ys;
         ys   := br * ys - xs;
         xs   := Temp[0..maxelement];
      end;
   procedure ROTM_transform_full(var XS,YS,Temp : Vector; tl,tr,bl,br : Number);
      begin
         Temp[0..maxelement] := xs * tl + ys * tr;
         ys   := xs * bl + ys * br;
         xs   := Temp[0..maxelement];
      end;

   begin
      if sParam[0]<>-2.0 then begin
         maxelement:=xs.high;
         if maxelement=(ys.high) then begin
            if (maxelement)>TempVecMax then begin
               New(DynamicTempVec,maxelement);
            end else begin
               DynamicTempVec:=TempVec;
            end;
            if sParam[0]=-1.0 then begin
               ROTM_transform_full(xs,
                                   ys,
                                   DynamicTempVec^,
                                   sParam[1],sParam[2],sParam[3],sParam[4]);
            end else if sParam[0]=0.0 then begin
               ROTM_transform_skewed(xs,
                                     ys,
                                     DynamicTempVec^,
                                     sParam[2],sParam[3]);
            end else if sParam[0]=1.0 then begin
               ROTM_transform_side_skewed(xs,
                                          ys,
                                          DynamicTempVec^,
                                          sParam[1],sParam[4]);
            end;
            if (maxelement)>TempVecMax then begin
               Dispose(DynamicTempVec);
            end;
         end else begin
            BLAS_Error('ROTM: mismatched vector sizes.');
         end;
      end else begin
         { Matrix H is identity. }
         { Nothing to do. }
      end;
   end; { ROTM }

procedure SWAP(var V1,V2 : Vector);
   var
      maxelement:integer;
   begin
      maxelement:=v1.high;
      if maxelement=(v2.high) then begin
         if (maxelement)>TempVecMax then begin
            New(DynamicTempVec,maxelement);
            DynamicTempVec^[0..maxelement] := v1;
            v1 := v2;
            v2 := DynamicTempVec^[0..maxelement];
            Dispose(DynamicTempVec);
         end else begin
            tempvec^[0..maxelement] := v1;
            v1 := v2;
            v2 := tempvec^[0..maxelement];
         end;
      end else begin
         Blas_Error('SWAP: mismatched vector sizes.');
      end;
   end; { SWAP }

procedure SCAL(Alpha : Number; var Source,Dest : Vector);
   var
      maxelement:integer;
   begin
      maxelement:=source.high;
      if maxelement=dest.high then begin
         dest:=source*alpha;
      end else begin
         Blas_Error('SCAL: mismatched vector sizes.');
      end;
   end; { SCAL }

procedure COPY(var Source,Dest : Vector);
   var
      maxelement:integer;
   begin
      maxelement:=source.high;
      if maxelement=dest.high then begin
         dest:=source;
      end else begin
         Blas_Error('COPY: mismatched vector sizes.');
      end;
   end; { SCAL }

procedure AXPY(Alpha : Number; var Source,Dest : Vector);
   var
      maxelement:integer;
   begin
      maxelement:=source.high;
      if maxelement=dest.high then begin
         dest:=source*alpha+dest;
      end else begin
         Blas_Error('AXPY: mismatched vector sizes.');
      end;
   end; { SCAL }

function DOT(var V1,V2 : Vector):Number;
   var
      maxelement:integer;
   begin
      maxelement:=v1.high;
      if maxelement=v2.high then begin
         DOT:=\+v1*v2;
      end else begin
         Blas_Error('DOT: mismatched vector sizes.');
      end;
   end;

function NRM2(var V:Vector):Number;
   begin
      NRM2 := sqrt( \+ (v**2) );
   end;

function ASUM(var V:Vector):Number;
   begin
      ASUM := \+ abs(v);
   end;

function IAMAX(var V:Vector):Integer;
   var
      { index : Integer; }
      value : Number;
      { max_index : Integer; }
   begin
      value := \max (abs V);
      IAMAX := \min (if V=value then iota 0 else V.high);
      {
      value := v[0];
      max_index := 0;
      for index:=1 to v.high do begin
         if (abs v[index])>value then begin
            value:=abs v[index];
            max_index:=index;
         end;
      end;
      IAMAX:=max_index;}
   end;

begin
   new(TempVec,TempVecMax);
end.
