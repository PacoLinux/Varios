$ !
$ !	[SYSUPD] B O O T U P D . C O M - Update bootstrap image on console floppy
$ !
$ ! This command file will update the VMS bootstrap file "VMB.EXE" on the
$ ! console floppy.  It is assumed that the current default device is
$ ! the system device.  It is also assumed that the floppy is mounted
$ ! /FOREIGN by the startup command file.
$ !
$ WRITE SYS$OUTPUT "BOOTUPD.COM - Command file to update bootstrap image"
$ WRITE SYS$OUTPUT "		  on console floppy disk."
$ DIR:='F$DIRECTORY()
$ DISK:='F$LOG("SYS$DISK")
$ INQUIRE CONFIRM "Is console floppy mounted (Y/N)"
$ IF .NOT. CONFIRM THEN GOTO 10
$ SET DEF SYS$SYSTEM
$ MCR FLX DX1:/RT/IM=VMB.EXE/RS
$10:
$ SET DEF 'DISK''DIR'
