PROGRAM trade;
TYPE commodity=(oil, UKcurrency, EUcurrency, UScurrency);
   barrels = real OF oil;
   pounds  = real OF UKcurrency;
   euros   = real OF EUcurrency;
   dollars = real OF UScurrency;
CONST
 barrel:barrels=1.0;
 megabarrel:barrels=1E6;
 dollar:dollars=1.0;
 cent:dollars=0.01;
 pound:pounds=1.0;
 euro:euros=1;
VAR 
 dollarRate:real OF UScurrency * UKcurrency POW -1;
 euroRate : real OF EUcurrency * UKcurrency POW -1;
 oilRate  : real OF oil * UKcurrency POW -1;
 FUNCTION oilInEuros(b:barrels):euros;
 BEGIN
    oilInEuros:= b* euroRate / oilrate;
 END;
 PROCEDURE euroquote;
 VAR oilwanted :real;
    price:euros;
 BEGIN
   WRITE(' Oil in barrels:');
   READLN(oilwanted);
   price:=oilInEuros(oilwanted*barrel);
   WRITELN(chr($ee),price/euro);
 END;

BEGIN
	dollarRate:=1.45 *dollar/pound;
        eurorate:=1.62 * euro/pound;
        oilRate := 0.04 * barrel/pound;
        euroquote;
END.
    
