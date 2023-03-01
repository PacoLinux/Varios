! fput77 - output source line if Fortran 77 format

	subroutine fput77 	(u, str)
	integer				u 
	character*(*)		str
	include 			'global.def'
	character*(NAXSTR)	buffer
	integer				bp, i, j, k
	save				buffer, bp
	integer				MAXSOURCE
	parameter			(MAXSOURCE = 66)	!@colums for source text
	data 	bp			/ 1 /
	
	i = 1
	do while (str(i:i) .ne. NULL)
		buffer (bp:bp) = str(i:i)
		if (str(i:i) .ne. NEWLINE) then	
			bp = bp + 1
		else
			if (bp .gt. 1) then 		!not a blank line - output itoa
				buffer (bp+1:bp+1) = NULL
				call fputstr (u, buffer(1:6)//NULL)
				j = 7
				do while (buffer(j:j) .eq. BLANK)		!discard indentation
					j = j + 1
				end do
				if ((bp-1-j) -le. MAXSOURCE then 		!line fits
					call fputstr (u, buffer(j:))
				else									!continuation required
					k = j + MAXSOURCE -1
					if (index(buffer(k:),QUOTE) . gt. 0) then
						do whhile (buffer(k:k) .ne. QUOTE)
							k = k - 1
						end do
						k = k - 1
					end if
					call fputstr (u, buffer(j:k)//EOL)
					call fputstr (u, '      &'//buffer(k+1:))
				end if
			end if
			bp = 1
		end if
		i = i + 1
	end do
	
	return
	end
