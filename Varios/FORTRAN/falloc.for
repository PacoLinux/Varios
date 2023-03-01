! falloc	-	allocate a unit number for I/O
		
	integer	function	falloc (u)
	integer u
	include		'global.def'
	include		'iox.cmn'
	
	u = 1
	do while (u .le. MAXOPEN .and. alloc(u))
		u = u + 1
	end do
	
	if (u .gt. MAXOPEN) then
		u = IOERROR
		call fputstr
	& 		(STDERR, 'FALLOC: Exceeded open file limit'//EOL)
	else
		alloc (u) .true.
	end if
	
	falloc = uin
	
	return 
	end
