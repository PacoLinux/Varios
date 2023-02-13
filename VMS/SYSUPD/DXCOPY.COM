$ !
$ !	DXCOPY.COM - Copy files between console floppy and current directory
$ !		     Assumes console floppy to be mounted /SYSTEM/FOREIGN
$ !		     as normally done by the startup command file.
$ !		     The files copied are also assumed to be text files.
$ !
$ INQUIRE MOUNT "Is console floppy mounted (Y/N)"
$ IF .NOT. MOUNT THEN GOTO EXIT
$ INQUIRE DIR "Copy from console floppy"
$ IF DIR THEN GOTO FROMCON
$ INQUIRE SOURCE "Enter file name"
$ IF SOURCE .EQS. "" THEN GOTO EXIT
$ MCR FLX DX1:/RT=SY:'SOURCE'/RS
$ GOTO EXIT
$ FROMCON:INQUIRE SOURCE "Enter console file name"
$ MCR FLX SY:/RS=DX1:'SOURCE'/RT
$ EXIT:
