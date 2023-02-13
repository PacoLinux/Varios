$!
$!	SETDEFBOO.COM - Command file to set default boot command file.
$!
$INQUIRE MOUNT "Is the console floppy mounted"
$IF MOUNT .EQS. "Y" THEN GOTO 10
$IF MOUNT .NES. "YES" THEN GOTO 99
$10:INQUIRE NAME "Enter name of default boot command file"
$MCR FLX SY:/RS=DX1:'NAME'/RT
$RENAME 'NAME' DEFBOO.CMD
$MCR FLX DX1:/RT=SY:DEFBOO.CMD/RS
$WRITE SYS$OUTPUT "Default boot command file replaced with ",NAME
$99:
