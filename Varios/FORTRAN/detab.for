! detab - replace tabs with blanks

	program detab
	include				'global.def'
	
	integer				argc, uin, uout, ntab, i, atoi
	character*(MAXSTR)	argv (MAXARGS)
	character*1			fgetc, c
	
	call ioinit ()
	call getargs (argc, argv)
	call stdargs (argc, argv, uin, uout)
	ntab = 8
	do i = 1, argc
		if (argv(i)(1:1) .eq. QUALIFIER) then
			ntab = atoi(argv(i)(2:))
		end if
	end do
	
	i = 0
	do while (fgetc (uin, c) .ne. EOF)
		if (c .eq. NEWLINE) then
			call fputc (uout, NEWLINE)
			i = 0
		else if (c .eq. TAB) then
			call fputc (uout, BLANK)
			i = i + 1
			do while (mod(i, ntab) .ne. 0)
				call fputc (uout, BLANK)
				i = i + 1
			end do
		else
			call fputc (uout, c)
			i = i + 1
		end if
	end do
	
	call iofinit ()
	end
