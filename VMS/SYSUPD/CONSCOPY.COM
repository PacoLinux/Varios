$ DEFAULT:='F$LOGICAL("SYS$DISK")''F$DIRECTORY()'
$ ON ERROR THEN GOTO EXIT
$ !
$ ! This command file saves or restores the contents of the console medium
$ ! from the user-specified device and directory.
$ !
$ ! On a restore operation, the entire contents of the specified directory are
$ ! transferred to the output device therefore only the files necessary to re-
$ ! build the media should be placed in the directory.
$ !
$ TYPE SYS$INPUT:
!
! Save or restore the contents of the console device from a Files-11 medium.
!
$ INQUIRE FILES11 What is the files-11 device and directory (DDCU:[DIRECTORY])
$ INQUIRE CONSOLE What is the name of the console device (DDCU:)
$ IF 'F$LOCATE(":",CONSOLE)'.EQ.'F$LENGTH(CONSOLE)' THEN CONSOLE:='CONSOLE':
$ ASSIGN 'CONSOLE' CX0:
$ SET DEFAULT 'FILES11'
$ ASSIGN SYS$DISK: TR0:
$ !
$ ! Determine if a backup or restore operation is to be done.
$ !
$ INQUIRE BACKUP Is the console medium to be saved (Y/N)
$ IF BACKUP THEN GOTO SAVE
$ !
$ ! Rebuild the console medium. FLX will be used to copy all the files to
$ ! the console device in RT-11 format. If the device contains a bootable
$ ! system image (ie. the LSI-11 console program) the device bootstrap
$ ! blocks will be written.
$ !
$ ! Get the name of the system image used to write the bootstrap blocks.
$ !
$ TYPE SYS$INPUT:
!
! If no bootable file is to be written on the console medium type only a <CR>
! in response to the next query.
!
! For bootable floppies supplied by DEC, the name of this file is CONSOL.SYS.
!
$ INQUIRE BOOTFILE What is the name of the bootable image
$ INQUIRE TEMP Mount a scratch medium on device 'console', type <CR> when ready
$ ON ERROR THEN CONTINUE
$ MOUNT/FORE 'CONSOLE'
$ ON ERROR THEN GOTO EXIT
$ MCR FLX CX0:/RT/ZE
$ MCR FLX CX0:/RT/IM=*.*/RS
$ !
$ ! List the directory of the medium just created
$ !
$ MCR FLX CX0:/RT/LI
$ IF BOOTFILE .EQS. "" THEN GOTO COPYEXIT
$ MCR RTB CX0:='BOOTFILE'
$ COPYEXIT:
$ ON ERROR THEN CONTINUE
$ DISMOUNT 'CONSOLE'
$ TYPE SYS$INPUT:
!
! Restoration of the console device is complete. Remove the media
! from the device.
!
$ GOTO EXIT
$ SAVE:
$ INQUIRE TEMP Mount the media to be copied on device 'CONSOLE', type <CR> when ready
$ ON ERROR THEN CONTINUE
$ MOUNT/FOREIGN 'CONSOLE'
$ ON ERROR THEN GOTO EXIT
$ MCR FLX /RS=CX0:*.*/RT/IM
$ DISMOUNT 'CONSOLE'
$ TYPE SYS$INPUT:
!
! Backup of the console device is now complete. Remove the media
! from the device.
!
$ EXIT:
$ ON ERROR THEN CONTINUE
$ DEASSIGN CX0:
$ DEASSIGN TR0:
$ SET DEFAULT 'DEFAULT'
$ EXIT
