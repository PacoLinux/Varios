$ SET NOVERIFY
$ !RMS TEST
$ ! AUTHOR: PAULA TIRAK,  CREATION DATE: FEBRUARY, 1978
$ !
$ ! MODIFIED BY:
$ !
$ !       , : VERSION
$ ! 1.0   -
$ ! 1.1   -	SUPPRESSED MESSAGES FROM REASSIGNING
$ !		LOGICAL NAMES				PJT 30-MAY-78
$ ! 1.2   -	ADDED NOUNL OPTION TO MOUNT COMMAND.	RAB 1-AUG-78
$
$ !--
$ SET VERIFY
$			! RMS TEST
$ SET NOVERIFY
$ SHOW TIME
$
$
$			! Indicate continuous mode of operation
$ ASSIGN RMS RMS$TST_VERBOSITY_FLAG
$			! Define TST$DISK to be the default disk
$ ASSIGN SYS$DISK:  TST$DISK
$			! Continue after finding an error
$ ON SEVERE THEN CONTINUE
$
$			! Execute all the tests sequentially
$ ! B -- Block input/output tests
$ ! F -- XAB and $FLUSH tests
$ ! G -- Sequential tests
$ ! K -- Directory and related filename tests
$ ! L -- Relative tests, including locking
$ ! C -- Copy the input file to the output file
$ ! A -- Append the input file to the output files
$ ! M -- Magtape tests
$
$ SET VERIFY
$ RUN UETNRMS01
B
F
G
K
L
C
PIPDATA.PIP
APPENDIT.PIP
A
PIPDATA.PIP
APPENDIT.PIP
$		! See if the append succeeded with the DIF program
$ MCR DIF TI:=APPEND.PIP,APPENDIT.PIP
$ SET NOVERIFY
$ DEASSIGN RMS$TST_VERBOSITY_FLAG
$ IF MAGTAP .EQS. "" THEN GOTO FINI
$ ASSIGN RMS RMS$TST_VERBOSITY_FLAG
$ ALL 'MAGTAP
$ INI 'MAGTAP UETTAP
$ MOUNT 'MAGTAP UETTAP
$		! Define TST$MTA to be the default magtape
$ ASSIGN 'MAGTAP TST$MTA
$ SET VERIFY
$ RUN UETNRMS01
M
$ SET NOVERIFY
$ DISMOUNT/NOUNLOAD 'MAGTAP
$ DEAL 'MAGTAP
$ DEASSIGN RMS$TST_VERBOSITY_FLAG
$ DEASSIGN TST$MTA
$ FINI:
$ DEASSIGN TST$DISK
$ DEL *.FIL;*,T4FILE.DAT;*,APPENDIT.*;*
$ SET VERIFY
$			! END RMS TEST
$ EXIT
