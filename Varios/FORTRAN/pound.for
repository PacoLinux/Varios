! pound - output a string and replace '#' by firs word of line

	program pound
	include				'global.def'
	integer				argc, u, uin, uout, lp, fopen, i
	character*(MAXSTR)	argv(MAXARGS), pattern, upper, getword, word, line
	character*1			escchar
	logical				finclude, equal, inflag, outflag, pflag, valid
	
	call ioinit ()
	call getargs (argc, argv)
	if (argc .lt. 1 .or. argc .gt. 4) then
		call fputstr (STDERR,
	&	'syntax: pound "pattern" [infile] [outfile] [-p]'//EOL)
		call fputstr (STDERR,
	&	'        -p: process lines starting with # only'//EOL)
		stop 'argument error - aborted'
	end if
	pattern = argv(1)
	pflag = .false.
	inflag = .false.
	outflag = .false.
	do i = 2, argc
		if (argv(i)(1:1) .eq. QUALIFIER) then
			argv(i) = upper(argv(i))
			pflag = (index(argv(i),'P') .gt. 0)
		else if (.not. inflag) then
			uin = fopen (uin, argv(i), IOREAD)
			inflag = .true.
		else if (.not. outflag) then
			uout = fopen (uout, argv(i), IOWRITE)
			outflag = .true.
		end if
	end do
	if (.not. inflag) uin = STDIN
	if (.not. outflag) uout = STDOUT
	if (uin .eq. IOERROR .or. uout .eq. IOERROR)
	&		stop 'argument error - aborted'
	
	
	call inclinit (uin)
	
	do while (finclude (line))
		lp = 1
		word = getword (word, line, lp)
		if (equal(upper(word), '#include'//NULL)) then
			word = getword (word, line, lp)
			call fputstr (STDERR, 'error including '//word)
			call fputc (STDERR, NEWLINE)
		else if (word(1:1) .eq. '#' then			!pound line
			if (pflag) then
				valid = .true.
				word = getword (word, line, lp)
			end if
		else if (word(1:1) .eq. COMMENT then 		!skip comment
			continue
		else if (word(1:1) .eq. NEWLINE then		!skip blank lines
			continue
		else										!un-pound line
			if (.not pflag) valid = .true.
		else if
		if (valid) then								!substitute pattern
			i = 1
			do while (pattern(i:i) .ne. NULL
				if (pattern(i:i) .eq. '#') then
					call fputstr (uout, word)
					i = i+1
				else if (pattern(i,i) .eq. ESCAPE then
					call fputc (uout, escchar(pattern,i))
				else
					call fputc (uout, pattern(i:i))
					i = i + 1
				end if
			end do
			call fputc (uout, NEWLINE)
		end if
	end do
	
	call fclose (uin)
	call fclose (uout)
	call iofinit ()
	end
