(* Unit Sainsburys*)


unit Sainsburys;

(* The interface holds all of the public constants and public header specs*)
interface
	
	(* here we define our own types *)
	type
		{Both Sainsburys Central and Central Stores are an example of enumerated types}
		{ defines all of the Sainsbury's Central Stores in the United Kingdom}
		Sainsburys_Centrals = (Buchanan,Tottenham,Holborn,Mayfair,Cardiff,Sheffield,Birmingham);
		
		{defines all of the Sainsbury;s Central Zones}
		Central_Zones = (Snacks,Meals,Fresh Foods,Groceries);
		
	
	
	(* here we declare variables*)
	var
	s : Sainsburys_Central; { S is a varible of Sainsburys_Central}
	c : Central_Zones; {C is a variable of Central_Zones}
	
	procedure display_zones;
	(*displays the zones*)
	
	procedure display_stores
	(* displays the stores*)
	
	function number_of_employees (store: Sainsburys_Centrals) : integer;
	(* takes in a Store and returns the number of employees for that store
	returns  -1 if no such store*)
	
	
(*here we define the implementation*)
implementation

	(* PRIVATE PROCEDURE IMPLEMENTATIONS*)

   {since enumerated types cannot be accessed by write provide means to display them}
	procedure write_zones(zone : Central_Zones); {private - internal procedure}
	begin
				{Select which zone to display}
				if zone = Snacks then
						writeln('The Snack Zone');
				else if zone = Meals then
						writeln('The Meal zone');
				else if zone = FreshFoods then
						writeln('The Fresh Foods Zone');
				else
						writeln('The Groceries Zone');
		
	end;
	
	
	
	   {since enumerated types cannot be accessed by write provide means to display them}
	procedure write_stores(store :Sainsburys_Central); {private - internal procedure}
	begin
				{Select which store to display}
				if store = Buchanan then
						writeln('Buchanan Galleries - Glasgow');
				else if store = Holborn then
						writeln('Holborn - London');
				else if store = Mayfair then
						writeln('Mayfair - London');
				else if store  =Cardiff
						writeln('Cardiff Central');
				else
						writeln('Some other Store');
		
	end;
	
	(* BODIES FOR PUBLIC SPECIFICATIONS*)
	
	procedure display_zones;
	begin
		writeln('This will display all zones of Centrals');
		c:= Snacks;
		if succ(c) = FreshFoods then
					writeln('The zone next to snacks is fresh foods');
		else
					writeln('The zone next to snacks is Meals <correct');
		
		writeln;
		writeln(write_zones(c);
			c:= Meals;
		writeln(write_zones(c));
			c:=FreshFoods
		writeln(write_zones(c));
			c:=Groceries;
		writeln(write_zones(c));
		
	end;
	

	 procedure display_stores;
	begin
	
		writeln('Tests out display stores');
		writeln;
				s:= Buchanan;
		writeln(write_stores(c));
				s:=succ(Buchanan);
		writeln(write_stores(c));
				s:=succ(succ(Buchanan));
		writeln(write_stores(c));
				s:= pred(Cardiff);
		writeln(write_stores(c));
		writeln(write_stores(Tottenham));
	
	end;

	
	(* is CASE not a reserved WORD?*)
		function number_of_employees (store: Sainsburys_Centrals) : integer;
		begin
		
			case store of
					Buchanan : number_of_employees:= 180;
		
		end;
		
	
(* begin is not needed for Turbo Pascal*)
begin

end. (* the end of Sainsbury's -  well not literally!*)