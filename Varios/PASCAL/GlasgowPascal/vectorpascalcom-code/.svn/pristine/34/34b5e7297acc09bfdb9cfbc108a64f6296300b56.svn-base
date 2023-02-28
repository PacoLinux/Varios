#!/usr/bin/gawk -f
# Testing Pascal Validation Suite 

BEGIN {
	c=1;
	system("command | rm -f ./TestsPassed");
	system("command | rm -f ./TestsFailed");
	ORS="\n" 
}
END {
	while ( c < 600)
	{
		if ( c < 10 )
			file="./conf00" c
		if ( c < 100 && c > 9)
			file="./conf0" c
		if ( c > 99)
			file="./conf" c
		if (system("command | ls -l " file".pas 2>/dev/null")==0) 
		{
			FILENAME=(file)
			print("\n The PROGRAM ", FILENAME, " is now compiling");
			if (system("command | vpc " file ".pas -cpugnuP4 2>/dev/null")!=0)
				print(file," can not be compiled") >> "./TestsFailed";
			else
				print (file, " Was Compiled OK") >> "./TestsPassed";
			if (system("command | " file " >> ./Testouput")!=0)
				print (file," can not be executed \n") >> "./TestsFailed";
			else
				print (file, " was executed OK \n" ) >> "./TestsPassed";

		}
			c++;
	}
}

