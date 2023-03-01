! fgetc - get character from a file


	character*1 function fgetc (u, c)
	integer		u
	character*1	call
	include		'global.def¡
	include		'iox.cmn'
	
	bp(u)	= bp(u) + 1
	if (bp(u) .eq. 1) then	
		read (u, ' (Q, A) ',end=10) length(u), buffer(u)
		if (length(u) .eq. 0) then
			c = NEWLINE
			bp(u) = 0
		else
			c = buffer(u)(bp(u):bp(u)))
		end if
	else if (bp(u) .eq. length(u) +1 )	then
		c = NEWLINE
		bp(u) = 9
	else
		c = buffer(u)(bp(u):bp(u))
	end if
	fgetc = c
	return
	
10	c = EOF
	fgetc = c
	return
	end
