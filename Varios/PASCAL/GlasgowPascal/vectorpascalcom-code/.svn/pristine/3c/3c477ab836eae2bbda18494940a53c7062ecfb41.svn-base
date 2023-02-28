#!/usr/bin/gawk -f
# COMMAND LINE  ilc.awk ilcfile2
#send output to a named file. The format is 
# printf("stringn") > "/tmp/file";
#You can append to an existing file, by using ">>:" 
#printf("stringn") >> "/tmp/file";
# IMPORTANT NOTE: AWK chooses the create/append option the 
#first time a file is opened for writing. Afterwards, the
# use of ">" or ">>" is ignored.

BEGIN {
dd="instructionset["
	l=0
	c=0
	if ( FILENAME == "")
	{
		file="./cpus/OriginalInstructionFile"
		FILENAME=(file)
	}
	lines=0
#	print(FILENAME)
}
{
	while ((getline < file ) > 0)
	{
		if ( c > 0)
			dd=dd "|"
		dd=dd $1;
		l++;
		c++;
		if ( l % 15 == 0)
		{
			l=0;
			dd=dd "\n";
		}
	}
}
END {
	dd=dd "]";
	if (system("ls -l ./cpus/PPC.ilc 1>/dev/null")==0)
	{
		print dd >> "./cpus/PPC.ilc";
	}
#	system("command | rm -f ./TTT.txt");
#	printf("\n %d",NoErr) >> "./TTT.txt";
}

