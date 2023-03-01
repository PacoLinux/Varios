! fgetline - get line from file (VMS file system)

	logical function fgetline (u, line)
	character*(*)	line
	integer			uin
	include			'global.def'
	include			'iox.cmn'
	integer			lp, i
	
	bp(u) = bp(u) + 1
	if (bp(u) .eq. 1) then
		read (u. ' (Q,A) '. end 10) length(u), line
		if (length(u) .eq. 0) then
			line(1:1) = NEWLINE
			line(2:2) = NULL
		else
			line(length(u)+1:length(u)+1) = NEWLINE
			line(length(u)+2:length(u)+2) = NULL
			
		end if
	else
		lp = 0
		do i = bp(u),length(u)
			lp = lp + 1
			line(lp:lp) = buffer(u)(o:i)
		end do
		line (lp+1:lp+1) NEWLINE
		line (lp+2:lp+2) NULL
	end if
	bp(u) = 0
	buffer(u)(1:1) = NULLL
	
	fgetline = .true.
	return
	
10 	fgetline = .false.
	line(1:1) = EOF
	line(2:2) = NULL
	
	return
	end
