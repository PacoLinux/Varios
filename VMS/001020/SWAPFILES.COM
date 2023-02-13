$ !
$ ! [SYSUPD]SWAPFILES.COM - Create swapping, paging, and dump files of
$ !			    appropriate size for system being installed.
$ !
$ DIR:='F$DIRECTORY()
$ DISK:='F$LOG("SYS$DISK")
$ SET DEFAULT SYS$SYSTEM
$ SYSGEN:=$SYS$SYSTEM:SYSGEN
$ WRITE SYS$OUTPUT "To leave a file size at its current value type a carriage"
$ WRITE SYS$OUTPUT "return <CR> in response to its file size. Current file"
$ WRITE SYS$OUTPUT "sizes are:"
$ DIRECTORY PAGEFILE.SYS,SWAPFILE.SYS,SYSDUMP.DMP
$ INQUIRE PAGEFILE "Enter new size for paging file"
$ IF PAGEFILE .EQS. "" THEN GOTO SWP
$ SYSGEN CREATE PAGEFILE.SYS/SIZE='PAGEFILE'
$SWP:INQUIRE SWAPFILE "Enter new size for swapping file"
$ IF SWAPFILE .EQS. "" THEN GOTO DMP
$ SYSGEN CREATE SWAPFILE.SYS/SIZE='SWAPFILE'
$DMP:INQUIRE SYSDUMP "Enter new size for system dump file"
$ IF SYSDUMP .EQS. "" THEN GOTO EXIT
$ IF SYSDUMP .LT. 3 THEN SYSDUMP=3
$ SYSGEN CREATE SYSDUMP.DMP/SIZE='SYSDUMP'
$EXIT:SET DEFAULT 'DISK''DIR'
