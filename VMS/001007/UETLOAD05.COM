$ SET VERIFY
$ ! 			***   UETLOAD05.COM   ***
$ SHOW LOG/ALL
$ SH DEF
$ MCR PIP /FR
$ SH PROC/ALL
$ HELP
$ MCR PIP /TB
$ SH SYMB/G/A
$ HELP */FULL
$ SH DA
$ LOGO
