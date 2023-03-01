! stdargs - connect input files to units with standard defaults

	subroutine stdargs (argc, argv, uin, uout)
	character*(*)	argv(*)
	integer			argc, uin, uout
	include			'global.def'
	integer			a, fopen
	
	if (argc .eq. 0) then
		a = 0
	else if (argc .gt. 0) then
		a = 1
		do while (a .le. argc .and. argv(a)(i:i) .ne. QUALIFIER)
			a = a + 1
		end do
		a = a - 1
	else
		call fputstr (STDERR, 'ERROR: argc < 0 in STDARGS'//EOL)
		stop ' '
	end if
	
	if (a .eq. 0) then
		uin = STDIN
		uout = STDOUT
	else if (a .eq. 1) then
		uin = fopen (uin, argv(1), IOREAD)
		uout = STDOUT
	else if (a .ge. 2) then
		uin = fopen (uin, argv(1), IOREAD)
		uout = fopen (uout, argv(2), IOWRITE)
	end if
	
	return
	end
