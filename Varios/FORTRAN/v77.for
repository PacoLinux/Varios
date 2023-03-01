! v77 - convert VAX Fortran extensions to fortran 77 equivalents

	program	v77
	include				'global.def'
	integer				argc, uin, uout, u, i, length, lp, lbl, plevel
	integer				atoi, fopen, qindex
	logical				equal, finclude, isletter, incflag
	character*(MAXSTR)	argv(MAXARGS), line, word, getword, upper, itoa
	integer				WHILESTMT, DOSTMT, STACKSIZE
	parameter			(WHILESTMT = 1)
	parameter			(DOSTMT = 2)
	parameter			(STACKSIZE = 16)
	integer				stack(STACKSIZE), label(STACKSIZE), sp, ilabel
	data				sp, ilabel / 0, 7701 /
	
	call ioinit ()
	call getargs (argc, argv)
	call stdargs (argc, argv, uin, uout)
	do i = 1, argc
		if (argv(i)(1:1) .eq. '-') then
			incflag = (index(upper(argv(i)),'I') .gt. 0)
		end if
	end do
	call inclinit (uin)
	
	do while (finclude (line))
		length = index (line, EOL)
		lp = qindex (line(1:length), COMMENT)
		if (lp .ge. 2) then					!trailing comment
			line = line(1:lp-1)//EOL
			length = lp -1
		else if (lp .eq. 1) then 			!full line comment
			line(1:2) = EOL
			length =1
		else
			length = length - 1
		end if
		
		line = upper (line)
		if (line(1:1) .ne. '*' .and. line(1:1) .ne. 'C') then
			if (length .gt. 6 .and. line(1:5) .ne. '   ') then
				lbl = atoi (line(1:5)//NULL)		!get existing label
			end if
			lp = 7
			if (equal (getword (word, line, lp), 'DO'//NULL)) then
				if (equal (getword (word, line, lp), 'WHILE'//NULL)) then
					sp			= sp +1
					stack(sp)	= WHILESTMT
					if (lbl .eq. 0) then
						label(sp)	= ilabel
						ilabel		= ilabel + 1
					else
						label(sp) = lbl
					end if
					call fput77 (uout, ' '//itoa(label(sp)))
					call fput77 (uout, ' IF'//NULL)
					do while (line(lp:lp) .eq. BLANK)
						lp = lp + 1
					end do
					lp = lp + 1						!skip past opening parenthesis
					call fput77 (uout, '('//NULL)
					plevel = 1
					do while (plevel .ne. 0)		!find closing parenthesis
						if (line(lp:lp) .eq. '(') then	
							plevel = plevel + 1
							call fput77 (uout, line(lp:lp)//NULL)
							lp = lp + 1
						else if (line(lp:lp) .eq. ')') then
							plevel = plevel - 1
							call fput77 (uout, line(lp:lp)//NULL)
							lp = lp + 1
						else if (line(lp:lp) .eq. NEWLINE) then 	!continued
							if (finclude(line)) then
								lp = 7 					!skip past continuation
								line = upper(line)
								do while (line(lp:lp) .eq. ' ')
									lp = lp + 1
								end do
							else
								call fputstr (STDERR,
	&							'unexpected eof on while smtm expression'//EOL)
								stop ' '
							end if
						else
							call fput77 (uout, line(lp:lp)//NULL)
							lp = lp + 1
						end if
					end do
					call fput77 (uout, ' THEN'//EOL)
				else if (isletter (word(1:1))) then			!VAX do stmt
					sp			= sp +1
					stack(sp)	= DOSTMT
					label(sp)	= ilabel
					ilabel		= ilabel + 1
					call fput77 (uout, '      DO '//itoa (label(sp))
					call fput77 (uout, ' '//word(1:index(word,NULL)-1//line(lp))
				else										!Fortran77 do stmt
					call fput77 (uout, line)
				end if
			else if (equal (word, 'END'//NULL)) then
				if (equal (getword (word, line, lp), 'DO'//NULL)) then
					if (sp .le. 0) then
						call fputstr (STDERR, 'END DO without DO'//EOL)
					else if (stack(sp) .eq. WHILESTMT) then
						call fput77 (uout, '          GOTO'//itoa (label(sp)))
						call fput77 (uout, EOL)
						call fput77 (uout,'           END IF'//EOL)
					else if (stack (sp) .eq. DOSTMT) then
						call fput77 (uout, ' '//itoa (label(sp)))
						call fput77 (uout, ' CONTINUE'//EOL)
					end if
					sp = sp -1
				else
					call fputt77 (uout, line)
				end if
			else if (equal (word, 'INCLUDE'//NULL) then !get filename
				if (inclflag) then
					word = getword (word, line, lp)
					word = word(2:index(word(2:), QUOTE))//NULL		! strip quotes
					if (fopen (u, word, IOREAD) .eq. IOERROR) then
						call fputstr (STDERR, 'file include failed, file:'//word)
						call fputc (STDERR, NEWLINE)
						call fput77 (uout, line)
					else	
						call pushincl (u)		!push u onto finclude unit stack
					end if
				else					!not processsing includes - output to file
					call fput77 (uout, line)
				end if
			else								!all other lines
				call fput77 (uout, line)
			end if
		end if
	end do
	if (sp .ne. 0) then
		call fputstr (STDERR, ' Unclosed DO or DO WHILE statement'//EOL)
	end if
	
	call iofinit ()
	end
