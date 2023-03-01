! getargs - get command line arguments and argument count

	subroutine getargs(argc, argv)
	integer				argc			!argument count
	character*(*)		argv(*)			!array of arguments
	include 			'global.def'
	include				'($clidef)'
	character*(MAXSTR)	line			!local string for parsing
	integer*2			length			!total length of command line
	integer				i, k
	
	call cli$get_value('$LINE', line, length)
	i = 1
	argc = 0
	
	do while (line(i:i) .ne. BLANK)		!skip the command invocation
		i = i + 1
	end do
	i = i + 1							!skip the space after command
	
	do while (i .le. length)
	
		k = i
		
		if (line(i:i) .eq. DQUOTE) then
			argc = argc + 1
			i = i + 1					!skip the quote mark
			k = i 
			do while (i .ne. length .and. line(i:i) .ne. DQUOTE)
				i = i + 1
			end do
			argv(argc) = line(k:(i-1))//NULL	!skip trailing quote
			i = i + 1							!move past quote
		else if (line(i:i) .eq. BLANK) then
			i = i + 1
		else
			argc = argc + 1
			do while (i .le. length .and. line(i:i) .ne. BLANK)
				i = i + 1
			end do
			argv(argc) = line(k:i-1)//NULL
		end if
		
	end do
	
	return
	end
