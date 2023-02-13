$ DEFDIR:='F$DIR()
$ DEFUIC:='F$USER()
$ SYSDISK:='F$LOGICAL("SYS$DISK")
$ SET NOON
$ WRITE SYS$OUTPUT " This command procedure performs VAX/VMS software updates and unbundled"
$ WRITE SYS$OUTPUT " software installations for VAX/VMS Release 1."
$ WRITE SYS$OUTPUT " During this sequence, the standard console floppy will not be present"
$ WRITE SYS$OUTPUT " in the console floppy drive."
$ WRITE SYS$OUTPUT " Therefore, the system is vulnerable to a power failure or other"
$ WRITE SYS$OUTPUT " fatal crash. If a system crash should occur during this period"
$ WRITE SYS$OUTPUT " the update sequence can be restarted at the beginning of the "
$ WRITE SYS$OUTPUT " first incomplete update.""
$ WRITE SYS$OUTPUT " "
$ WRITE SYS$OUTPUT " Dismount the current console floppy."
$ DISMOUNT DXA1:
$ GOTO 25
$ 20:
$ inquire ready are there more kits to process?[Y/N]
$ IF .NOT. READY THEN GOTO FINISH
$ 25:
$ WRITE SYS$OUTPUT " "
$ WRITE SYS$OUTPUT " Please place the first floppy of the kit in the console drive"
$ WRITE SYS$OUTPUT " "
$ INQUIRE READY Are you ready to continue?
$ IF .NOT. READY THEN GOTO 25
$ SET UIC 'DEFUIC'
$ SET DEFAULT 'SYSDISK'[SYSUPD]
$ ASSIGN/USER DEVNAM.TMP SYS$OUTPUT
$ MOUNT/PROCESS=UNIQUE/OVER=ID DXA1: 
$ OPEN DEV DEVNAM.TMP
$ READ DEV DEVSTRING
$ CLOSE DEV
$ DELETE DEVNAM.TMP;*
$ K='F$LOCATE(",",DEVSTRING)+2
$ FILE:='F$EXTRACT(K,9,DEVSTRING)
$ K='F$LOCATE(" ",FILE)
$ FILE:='F$EXTRACT(0,K,FILE).COM
$ COPY DXA1:'FILE SYS$DISK:
$ @'FILE
$ SET UIC 'DEFUIC'
$ SET DEFAULT 'SYSDISK'[SYSUPD]
$ DELETE 'FILE;*
$ DISMOUNT DXA1:
$ GOTO 20
$ FINISH:
$ WRITE SYS$OUTPUT " "
$ WRITE SYS$OUTPUT " Please place the system console floppy in the console drive."
$ WRITE SYS$OUTPUT " "
$ 100:
$ INQUIRE READY Are you ready to continue?
$ IF .NOT. READY THEN GOTO 100
$ MOUNT/SYSTEM/FOR/PROT=(SYSTEM:RWLP) DXA1: CONSOLE
$ WRITE SYS$OUTPUT " Requested update sequence is complete."
$ FINISH:
$ SET UIC 'DEFUIC'
$ SET DEFAULT 'SYSDISK''DEFDIR
$ EXIT
