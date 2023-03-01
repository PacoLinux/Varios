!fopen 	-	open file and assign unique unit number

	integer function 	fopen (u, filename, mode)
	character*(*)		filename
	integer				u, mode, falloc
	include				'global.def'
	include				'iox.cmn'
	integer				flength, ios
	
	flength = index(filename, NULL) - 1
	
	u = falloc (u)
	fopen (u)
	
	if (u .eq. IOERROR) then
		continue
	else if (mode .eq. IOREAD) then
		open (unit = u,
	&			file = filename(1:flength),
	&			status = 'OLD',
	&			iostat = ios,
	&			readonly,
	&			err = 10)
		access(u) = IOREAD
		bp(u) = 0
		length(u) = 0
		
	else  if (mode .eq. IOWRITE) then
		open (unit = u,
	&			file = filename(1:flength),
	&			status = 'NEW',
	&			iostat = ios,
	&			carriagecontrol = 'LIST',
	&			err = 10)
		access(u) = IOWRITE
		bp(u) = 0
		length(u) = 0

	else  if (mode .eq. IOAPPEND) then
		open (unit = u,
	&			file = filename(1:flength),
	&			status = 'OLD',
	&			iostat = ios,
	&			access = 'APPEND',
	&			carriagecontrol = 'LIST',
	&			err = 10)
		access(u) = IOWRITE
		bp(u) = 0
		length(u) = 0
				
	else if (mode .eq. IOFORTRAN) then
		open (unit = u,
	&			file = filename(1:flength),
	&			status = 'NEW',
	&			iostat = ios,
	&			err = 10)
		access(u) = IOFORTRAN
		bp(u) = 0
		length(u) = 0
	
	else 
		call fdealloc (u)
		call fputstr (STDERR, 'fopen: Illegal access mode'//EOL)
		fopen = IOERROR
	
	end if
	return
	
10 	call fdealloc (u)
	fopen = IOERROR
	call fputstr(STDERR, 'fopen; '//NULL)
	call ioerr(ios)
	
	return 
	end
