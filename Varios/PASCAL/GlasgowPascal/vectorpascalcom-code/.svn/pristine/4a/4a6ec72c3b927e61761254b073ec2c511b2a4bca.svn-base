UNIT numerics;
(*!	Implements some of the trigonometric functions.
	*)
INTERFACE

(*! \begin{bf}The inverse function of cos.\end{bf} 
	Calculates (approximates) the angle $\theta \in [0..\pi]$), such that $\cos\ \theta= cosVal.$\\
	Returns \begin{em}arccos(cosVal)\end{em} if cosVal $\in$ [-1,1].\\
	Returns the error code \begin{em}-5\end{em} otherwise.
	*)
FUNCTION arccos (cosVal : real) : real;
(*! \begin{bf}The inverse function of sin.\end{bf}
	Calculates (approximates) the angle $\theta \in [-\pi/2..\pi/2]$), such that $\sin\ \theta= sinVal.$\\
	Returns \begin{em}arcsin(sinVal)\end{em} if sinVal $\in$ [-1,1].\\
	Returns the error code \begin{em}-5\end{em} otherwise.
	*)
FUNCTION arcsin (sinVal : real) : real;
(*! \begin{bf}Implements the trigonometric function 'tan'.\end{bf}
	Simply returns ($\sin \theta$)/($\cos \theta$).
	Returns a big value if $\cos \theta$ gets too small,
	in which case the fraction gets too big to represent.
	*)
function tangent(theta : real) : real;
(*! \begin{bf}The inverse function of tan.\end{bf} 
	Calculates (approximates) the angle $\theta \in [0..\pi]$), such that $\tan\ \theta= tanVal.$\\
	Returns \begin{em}arctan(tanVal)\end{em}, which is defined for all real values.
	*)
FUNCTION arctan (tanVal : real) : real;

IMPLEMENTATION

const
	errorMargin = 0.0000001; {The acceptable level of error for the approximation}

function arccos (cosVal : real) : real;
var 
	tau, mu, phi : real;
begin
	tau := pi;{Set upper bound for the angle.}
	mu := 0;{Set lower bound for the angle.}
	
	if (cosVal < cos tau) then {If cosVal is below the range of the domain, then assume the sought value is pi.}
		arccos:= pi;
	if (cosVal > cos mu) then {If cosVal is above the range of the domain, then assume the sought value is 0.}
		arccos:= 0;
	if (cosVal > (cos mu) + errorMargin) or (cosVal < (cos tau) - errorMargin) then {If cosVal is outside the range with a noticable margin, return an error value.}
		arccos:= -5;
	if (cosVal > cos tau) and (cosVal < cos mu) then {If cosVal is in the valid range the search for arccos cosVal.}
	begin
		while cosVal - cos tau > errorMargin do {Do a binary search (in the angle range) until cos of the upper bound is sufficiently close to cosVal.}
		begin
			phi := (mu + tau) / 2;
			if cosVal < cos phi then
				mu := phi
			else
				tau := phi
		end;
		arccos:= tau;
	end;
end;

function arcsin (sinVal : real) : real;
var 
	tau, mu, phi : real;
begin
	tau:= pi/2;{Set upper bound for the angle.}
	mu:= -tau;{Set lower bound for the angle.}

	if (sinVal > sin tau) then {If sinVal is above the range of the domain, then assume the sought value is pi/2.}
		arcsin:= pi/2;
	if (sinVal < sin mu) then {If sinVal is below the range of the domain, then assume the sought value is -pi/2.}
		arcsin:= -pi/2;
	if (sinVal < (sin mu) - errorMargin) or (sinVal > (sin tau) + errorMargin) then {If sinVal is outside the range with a noticable margin, return an error value.}
		arcsin:= -5;
	if (sinVal < sin tau) and (sinVal > sin mu) then {If sinVal is in the valid range the search for arcsin sinVal.}
	begin
		while sinVal - sin mu > errorMargin do {Do a binary search (in the angle range) until sin of the lower bound is sufficiently close to sinVal.}
		begin
			phi := -(mu + tau) / 2;
			if sinVal < sin phi then
				mu := phi
			else
				tau := phi
		end;
		arcsin:= mu;
	end;
end;

function tangent(theta : real) : real;
var
	cosValue: real;
const
	errVal= 0.000001;
begin
	cosValue:= cos theta;
	if (((cos theta) < errVal))  and ((cos theta) > - errVal) then {If cos theta is very close to 0 (hence making the fraction extremely big/small (beyond available representation), then use a 'pretty' small number for cos theta.}
	begin
		if (cos theta) > 0 then
			cosValue:= errVal {A pretty small positive value.}
		else
			cosValue:= -errVal {A pretty small negative value.}
	end;
	tangent:= (sin theta)/cosValue; {Calculate the tangent.}
end;

function arctan (tanVal : real) : real;
var 
	tau, mu, phi : real;
begin
	tau:= pi/2;{Set the upper bound for the angle.}
	mu:= -tau;{Set the lower bound for the angle.}
	while tanVal - tangent(tau) > errorMargin*1000 do {Do a binary search (in the angle range) until tan of the upper bound is sufficiently close to sinVal.}
	begin
		phi := (mu + tau) / 2;
		if tanVal < tangent(phi) then
			mu := phi {Reset the lower bound for the angle.}
		else
			tau := phi {Reset the upper bound for the angle.}
	end;
	arctan:= tau;
end;

begin
end.
