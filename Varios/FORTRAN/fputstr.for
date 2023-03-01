! fputstr - output string to file

	subroutine	fputstr (u, string)
	character*(*)	string
	integer			u, i, j
	include		'global.def'
	include		'iox.cmn'
	
	i = 1
	
	do while (string(i:i) .ne. NULL)
		bp(u) = bp(u) + 1
		if (bp(u) .eq. MAXLINE then
			write (u, '(<MAXLINE>A1:)') (buffer(u)(j:j), j=1, MAXLINE)
			bp(u) = 0
		else if (string(i:i) .eq. NEWLINE) then
			write (u, '(<MAXLINE>A1:)') (buffer  (u)(j,j), j=1, bp(u)-1)
			i = i + 1
			bp(u) = 0
		else
			buffer(u)(bp(u):bp(u)) = string(i:i)
			i = i + 1
		end if
	end do
	return
	end
