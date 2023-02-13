$ SET NOVERIFY
$ !COMPATIBILITY MODE UTILITY TEST
$ ! AUTHOR: PAULA TIRAK,  CREATION DATE: NOVEMBER, 1977
$ !
$ ! MODIFIED BY:
$ !
$ !       , : VERSION
$ ! 1.0   -
$ ! 1.01  -	DELETED THE CODE IN DMP THAT
$ !             CREATES THE DMP MASTER FILES   PJT 16-FEB-78
$ ! 1.02  -	ADDED SOS (EDIT) TEST   RAB  23-FEB-78
$ ! 1.03 -	ADDED MESSAGE PROGRAMS   RAB 18-APR-78
$ ! 1.04  -	ADDED SRT (SORT-11) TEST	PJT 26-MAY-78
$ ! 1.05  -	ADDED NOUNLOAD OPTION TO MOUNT COMMAND 
$ !		FOR FLX				RAB 1-AUG-78
$ ! 1.06  -	CHANGED COMMENT IN (LBR) TEST	PJT 1-AUG-78
$ ! 1.07  -	ADD DISMOUNT AND DEALLOCATE COMMANDS TO THE
$ !		SECTION CALLED (FINI)		PJT 1-AUG-78
$ ! 1.08  -	ADDED CTRL-Y COMMAND		RAB 2-AUG-78
$ ! 1.09  -	FIX COMMENTS, ON ERROR		RAB 10-AUG-78
$ !--
$
$ ON ERROR     THEN GOTO FINI
$ ON CONTROL_Y THEN GOTO FINI
$
$ RUN UETCOMP01
$ PNAME:='P1
$
$ PARAMETER:
$ IF PNAME .EQS. "DMP" THEN GOTO UETCDMP00
$ IF PNAME .EQS. "FLX" THEN GOTO UETCFLX00
$ IF PNAME .EQS. "LBR" THEN GOTO UETCLBR00
$ IF PNAME .EQS. "PAT" THEN GOTO UETCPAT00
$ IF PNAME .EQS. "PIP" THEN GOTO UETCPIP00
$ IF PNAME .EQS. "SLP" THEN GOTO UETCSLP00
$ IF PNAME .EQS. "SOS" THEN GOTO UETCSOS00
$ IF PNAME .EQS. "SRT" THEN GOTO UETCSRT00
$ IF PNAME .EQS. "VFY" THEN GOTO UETCVFY00
$ IF PNAME .EQS. "" .OR. PNAME .EQS. "ALL" THEN GOTO UTILITIES
$ INQUIRE PAR "ENTER THE NAME OF A UTILITY OR CARRIAGE RETURN"
$ PNAME:='PAR
$ GOTO PARAMETER
$
$ UTILITIES:
$ SET VERIFY
$		! COMPATIBILITY MODE UTILITY TEST
$ SET NOVERIFY
$ SHOW TIME
$
$
$ UETCDMP00:
$ SET VERIFY
$
$			! DMP Test
$ 
$		! Dump DMPDATA.DMP a record at a time in ASCII mode
$ MCR DMP ASRC.DMP/-SP=DMPDATA.DMP/AS/RC
$		! Compare against a master file for differences
$ MCR DIF TI:=DMPASRC.DMP,ASRC.DMP/CO:FF
$ 
$		! Dump DMPDATA.DMP in byte octal format
$ MCR DMP BYOC.DMP/-SP=DMPDATA.DMP/BY
$		! Compare the new file against a master for differences
$ MCR DIF TI:=DMPBYOC.DMP,BYOC/CO:FF
$
$		! Dump DMPDATA.DMP in decimal word format
$ MCR DMP DCWD.DMP/-SP=DMPDATA.DMP/DC
$		! Compare the new file against a master for differences
$ MCR DIF TI:=DMPDCWD.DMP,DCWD.DMP/CO:FF
$ 
$ DEL ASRC.*;*,BYOC.*;*,DCWD.*;*	! Delete unnecessary files
$ 
$ 			! DMP Testing Complete
$ SET NOVERIFY
$ IF PNAME .EQS. "DMP" THEN GOTO FINI
$ IF MAGTAP .EQS. "" THEN GOTO UETCLBR00
$
$
$ UETCFLX00:
$ SET VERIFY
$
$ 			! FLX Test
$
$ ALLOCATE 'MAGTAP			! Allocate a magtape
$ MOUNT 'MAGTAP/FOREIGN			! Mount the magtape
$
$ MCR PIP RNDFLX.FLX=RANDOM.FLX		! Create the FILES-11 test files
$ MCR PIP SRTFLX.FLX=SORTED.FLX		! on sys to be copied
$
$ MCR FLX 'MAGTAP/DO/ZE			! Initialize a DOS-11 magtape
$ MCR FLX 'MAGTAP/DO=RNDFLX.FLX,SRTFLX.FLX/RS   ! Copy  the test files
$ MCR FLX 'MAGTAP/DO/LI			! List the directory
$ MCR PIP RNDFLX.FLX;*,SRTFLX.FLX;*/DE  ! Delete test files from sys
$ MCR FLX SY:/RS='MAGTAP*.*/DO		! Copy test files from magtape
$
$ MCR DIF TI:=RANDOM.FLX,RNDFLX.FLX	! Compare for differences
$ MCR DIF TI:=SORTED.FLX,SRTFLX.FLX	! Compare for differences
$
$ DISMOUNT/NOUNLOAD 'MAGTAP		! Dismount the magtape
$ DEALLOCATE 'MAGTAP			! Deallocate the magtape
$ DEL RNDFLX.*;*,SRTFLX.*;*		! Delete unnecessary files
$
$ 			!FLX Testing Complete
$ SET NOVERIFY
$ IF PNAME .EQS. "FLX" THEN GOTO FINI
$
$
$ UETCLBR00:
$ SET VERIFY
$
$ 			!LBR Test			
$
$ MCR LBR OBJLIB/CR:50:::OBJ	! Create an object module library
$ MCR LBR OBJLIB/IN=OBJLBR1,OBJLBR2,OBJLBR3  ! Insert 3 object modules
$
$ MCR LBR OBJLIB/DE:OBJ3		! Delete a module
$ MCR LBR OBJLIB/LE/FU			! List the directory
$ MCR LBR OBJLIB/IN=OBJLBR3		! Insert the module back
$
$ MCR LBR OBJLIB/RP=OBJLBR1,OBJLBR2	! Replace two existing modules
$ MCR LBR OBJLIB/LE/FU        ! List the object module library directory
$
$ MCR LBR OBJLIB/DG:ENT$A1:ENT$B2:ENT$A3  ! Delete several entry points
$ MCR LBR OBJLIB/LE/FU			  ! List the library directory
$
$ MCR LBR EXTOBJ2=OBJLIB/EX:OBJ2	! Extract an object module
$ MCR DIF TI:=EXTOBJ2.OBJ,OBJLBR2.OBJ   ! Compare module with original
$
$ MCR LBR OBJLIB/LE/FU			! List the directory
$ MCR LBR OBJLIB/CO=OBJLIB		! Compress the library
$ MCR LBR OBJLIB/LE/FU			! List the directory
$
$ MCR LBR MACLIB/CR:50:::MAC		! Create a macro library
$ MCR LBR MACLIB.MLB/IN=MCLBR1,MCLBR2,MCLBR3	! Insert three macros
$
$ MCR LBR MACLIB.MLB/DE:MCLBR3		! Delete a module
$ MCR LBR MACLIB.MLB/LE/FU		! List the directory
$ MCR LBR MACLIB.MLB/IN=MCLBR3		! Insert the module back
$
$ MCR LBR MACLIB.MLB/RP=MCLBR1,MCLBR2	! Replace two existing modules
$ MCR LBR MACLIB.MLB/LE/FU    	    ! List the macro library directory
$
$ MCR LBR EXTMAC2=MACLIB.MLB/EX:MCLBR2     ! Extract a macro
$ MCR DIF TI:/MS:2=EXTMAC2.MAC,MCLBR2.MAC  ! Compare with the original
$
$ MCR LBR MACLIB.MLB/LE/FU		! List the directory
$ MCR LBR MACLIB.MLB/CO=MACLIB.MLB	! Compress the macro library
$ MCR LBR MACLIB.MLB/LE/FU		! List the directory
$
$					! Delete unnecessary files
$ DEL OBJLIB.*;*,EXTOBJ2.*;*,MACLIB.*;*,EXTMAC2.*;*
$
$ 			! LBR Testing Complete
$ SET NOVERIFY
$ IF PNAME .EQS. "LBR" THEN GOTO FINI
$
$
$ UETCPAT00:
$ SET VERIFY
$
$ 			! PAT Test
$
$				! Create an updated object file
$ MCR PAT PATPATCH.PAT=OBJLBR1.OBJ,PATCHPAT.OBJ
$				! Compare file with one of known quality
$ MCR DIF TI:=PATPATCH.PAT,PATCHED.PAT
$
$ DEL PATPATCH.PAT;*			! Delete unnecessary files
$
$ 			! PAT Testing Complete
$ SET NOVERIFY
$ IF PNAME .EQS. "PAT" THEN GOTO FINI
$
$
$ UETCPIP00:
$ SET VERIFY
$
$ 			! PIP Test
$
$ MCR PIP /ID				! Version of PIP
$
$ 			! Test "Copy" Function
$ MCR PIP COPY.PIP;1=PIPDATA.PIP	! Create a copy of a file
$ MCR DIF TI:=COPY.PIP,PIPDATA.PIP      ! Verify that it is an exact copy
$
$ 			! Test "Version Override" Function (/SU)
$ MCR PIP COPY.PIP;1=PIPDATA.PIP/SU	! Replace an existing file
$ MCR PIP COPY.PIP;*/LI		        ! Show current versions of COPY.PIP
$
$ 			! Test "Append" Function (/AP)
$ MCR PIP APPENDED.PIP=PIPDATA.PIP	! Create a file
$ MCR PIP APPENDED.PIP=PIPDATA.PIP/AP	! Append another copy to the end
$				! Compare file with one of known quality
$ MCR DIF TI:=APPENDED.PIP,APPEND.PIP
$
$ 			! Test "Delete" Function (/DE)
$ MCR PIP DELETE.PIP=PIPDATA.PIP	! Create a file
$ MCR PIP DELETE.PIP;*/BR		! Make sure the file exists
$ MCR PIP DELETE.PIP;*/DE		! Delete the file
$ MCR PIP DELETE.PIP;*/BR		! Make sure the file is gone
$
$ 			! Test "Free Space" Function (/FR)
$ MCR PIP SY:/FR			! Show space on system volume
$
$ 			! Test "Merge" Function (/ME)
$ MCR PIP MERGED.PIP=PIPDATA.PIP,PIPDATA.PIP/ME	  ! Merge two files
$ MCR DIF TI:=MERGED.PIP,APPEND.PIP	! Compare file with one of known quality
$
$ 			! Test "Purge" Function (/PU)
$ MCR PIP VERSIONS.PIP=PIPDATA.PIP	! Create several versions
$ MCR PIP VERSIONS.PIP=PIPDATA.PIP	! of the same file
$ MCR PIP VERSIONS.PIP=PIPDATA.PIP
$ MCR PIP VERSIONS.PIP=PIPDATA.PIP
$ MCR PIP VERSIONS.PIP=PIPDATA.PIP
$ MCR PIP VERSIONS.PIP;*/LI	! Show the versions created
$ MCR PIP VERSIONS.PIP/PU:3	! Retain the 3 most current versions
$ MCR PIP VERSIONS.PIP;*/LI	! Show that two versions were deleted
$ MCR PIP VERSIONS.PIP/PU	! Purge all but the highest version
$ MCR PIP VERSIONS.PIP;*/LI	! Show that only 1 version remains
$
$ 			! Test "Rename" Function (/RE)
$ MCR PIP COPY.PIP=PIPDATA.PIP	        ! Create a file
$ MCR PIP COPY.PIP;*/LI		        ! Current versions of COPY.PIP
$ MCR PIP RENAME.PIP=COPY.PIP/RE	! Rename the file
$ MCR PIP RENAME.PIP,COPY.PIP;*/LI	! Show the resulting file status
$
$ 			! Test "Total Blocks" Function (/TB)
$ MCR PIP /TB				! Show current directory info
$
$			! Test "Update" Function (/Up)
$ MCR PIP UPDATE.PIP=PIPDATA.PIP	! Create a file
$ MCR PIP UPDATE.PIP;*/FU		! Show UPDATE.PIP attributes
$ MCR PIP UPDATE.PIP=APPEND.PIP/UP	! Update file to larger file
$ MCR PIP UPDATE.PIP;*/FU	! Show that original file was extended
$ MCR DIF TI:=UPDATE.PIP,APPEND.PIP     ! Verify original file updated
$
$ DEL COPY.*;*,APPENDED.*;*,MERGED.*;*	! Delete unnecessary files
$ DEL VERSIONS.*;*,RENAME.*;*,UPDATE.*;*
$
$ 			! PIP Testing Complete
$ SET NOVERIFY
$ IF PNAME .EQS. "PIP" THEN GOTO FINI
$
$
$ UETCSLP00:
$ SET VERIFY
$
$ 			! SLP Test
$
$ MCR SLP		! Invoke the SLP Editor to edit a data file
OUTPUT.SLP,LIST.SLP/-SP=SLPDATA.SLP
-2
INSERTED LINE 200A
INSERTED LINE 200B
INSERTED LINE 200C
INSERTED LINE 200D
-/5/,/9/,/AUDIT#1/
INSERTED LINE 900A
INSERTED LINE 900B
-.,,/AUDIT#2/
INSERTED LINE 1000A
INSERTED LINE 1000B
-.,,/AUDIT#3/
INSERTED LINE 1100A
\
-.
INSERTED LINE 1200A
INSERTED LINE 1200B
%
INSERTED LINE 1200C
INSERTED LINE 1200D
-/15/+2,.+1
/
$		! Verify that the editing was properly performed
$		! Compare new files with files of known quality
$ MCR DIF TI:=OUTPUT.SLP,SLPOUT.SLP	! Compare for differences
$ MCR DIF TI:=LIST.SLP,SLPLIST.SLP	! Compare for differences
$
$ DEL OUTPUT.*;*,LIST.*;*		! Delete unnecessary files
$
$ 			! SLP Testing Complete
$ SET NOVERIFY
$ IF PNAME .EQS. "SLP" THEN GOTO FINI
$
$
$ UETCSOS00:
$ SET VERIFY
$			! SOS (EDIT) Test
$
$ EDIT UETCSOS01.DAT/OUTPUT=UETCSOS04.DAT	! SOS commands in file 2
@UETCSOS02
$
$ MCR DIF TI:=UETCSOS03.DAT,UETCSOS04.DAT	! Compare with good file
$ 
$			! SOS testing complete
$ SET NOVERIFY
$ DELE UETCSOS04.DAT;*				! Clean up
$ IF PNAME .EQS. "SOS" THEN GOTO FINI
$
$
$ UETCSRT00:
$ SET VERIFY
$
$			! SRT (SORT-11) TEST
$
$			! Sort RANDOM.FLX using bytes 2-10 as the key
$ MCR SRT SORT.SRT=RANDOM.FLX/FO:U:80/KE:2.10
$
$			! Compare the output file with one of known quality
$ MCR DIF TI:=SORT.SRT,SORTED.FLX
$
$ DEL SORT.SRT;*	! Delete unnecessary files
$
$			! SRT Testing Complete
$ SET NOVERIFY
$ IF PNAME .EQS. "SRT" THEN GOTO FINI
$
$
$ UETCVFY00:
$ SET VERIFY
$
$ 			! VFY Test
$
$ MCR VFY2 SY:/FR     ! Show the amount of free space on the system disk
$ MCR VFY2 SY:        ! Check readability and validity of the volume
$
$ 			! VFY testing Complete
$ SET NOVERIFY
$ IF PNAME .EQS. "VFY" THEN GOTO FINI
$
$ FINI:
$ ON ERROR THEN GOTO DONE
$ IF MAGTAP .EQS. "" THEN GOTO DONE
$ DISMOUNT/NOUNLOAD 'MAGTAP		! Dismount the magtape
$ DEALLOCATE 'MAGTAP			! Deallocate the magtape
$ DONE:
$ RUN UETCOMP02
$
$		! END OF COMPATIBILITY MODE UTILITY TEST
