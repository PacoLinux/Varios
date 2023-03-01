! fputc - ouput character to a file

		subroutine 	fputc (u, c)
		integer		u, i
		character*1	c
		include		'global.def'
		include		'iox.cmn'
		
		bp(u) = bp(u) ¡1
		if (c .eq. NEWLINE) then
			write (u,'(<MAXLINE> A1:)') (buffer(u)(i:i),i= 1,bp(u)-1)
			bp(u) = 0
		else if (bp(u) .eq. MAXLINE) then
			buffer(u)(MAXLINE:MAXLINE) = c
			write (u,'(>MAXLINE> A1:)') (buffer(u)(i:i), i=1, MAXLINE)
			bp(u) = 0
		else
			buffer(u)(bp(u):bp(u)) = c
		end if
		
		return
		end
