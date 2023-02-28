function [Format,VerNum,Comment,ChanNum,XStart,XEnd,YStart,YEnd,ChanSample,StepNum,Data] = in(filename)

% IN Reads a SINGLE CONVAD data file from disk. Main output in "Data"

%  READS:  Format: file format  VerNum: version number    Comment: text comment
%          ChanNum: total # of channels
%          XStart, XEnd: start and end coordinate of the scan along X (in mm)
%          YStart, YEnd: start and end coordinate of the scan along Y (in mm)
%          ChanSample: # of samples per channel
%          StepNum: # of steps between 2 acquisitions
%          -> Data: actual data matrix, of size [ChanNum x ChanSample] <-
%
%  To be called with:
%  [Format,VerNum,Comment,ChanNum,XStart,XEnd,YStart,YEnd,ChanSample,StepNum,Data] = in(filename)	enter filename within ' '
%  NOTE:   The detailed input file format is appended at the end of this file
%
%  NOTE:   This section can be viewed online typing "help in"

% -> CHECK ARGUMENT AND FILENAME

if (nargin==0)
  error ('INPUT requires at least a filename as an argument !');
end;
if (isstr (filename)~=1)
  error ('Argument is not a filename !');
end;

% -> OPEN FILE - BIG endian format
fid=fopen (filename,'rb','ieee-be');
if (fid ==-1)
  error (['Error opening ',filename,' for input !']);
end;



% -> READ and CHECK FILE FORMAT
Size = 4;
Precision = 'char';
Format    = setstr(fread (fid, Size, Precision))'
% switch from col to row
if (Format ~= 'MDET')
  fclose (fid);
  error ('Not a CONVAD data file !');
end;

%Descriptor = deblank(setstr(fread (fid, 16, 'char')));   % for LeCroy check
%if (~strcmp (Descriptor, 'WAVEDESK'))
%  fclose (fid);
%  error ('Missing WAVEDESC !');
%end;

% -> READ VERSION #
Size = 1;
Precision = 'int8';
VerNum    = fread(fid,Size,Precision)

% -> READ COMMENT
Size = 32;
Precision = 'char';
Comment   = setstr(fread(fid,Size,Precision))' % switch from col to row

% -> READ DATE
Size = 19;
Precision = 'char';
Date   = setstr(fread(fid,Size,Precision))' % switch from col to row

% -> READ # of CHANNELS
Size = 1;
Precision = 'int8';
ChanNum   = fread(fid,Size,'int8')

% -> READ START and END COORD. ALONG X and Y
Size = 1;
Precision = 'ushort';
XStart    = fread(fid,Size,Precision)
YStart    = fread(fid,Size,Precision)
XEnd      = fread(fid,Size,Precision)
YEnd      = fread(fid,Size,Precision)

% -> READ # of SAMPLES PER CHANNEL
Size = 1;
Precision = 'ushort';
ChanSample    = fread(fid,Size,Precision)

% -> READ # of STEPS BETWEEN TWO ACQUISITIONS 
Size = 1;
Precision = 'ushort';
StepNum   = fread(fid,Size,Precision)

% -> READ DATA <-
Offset = 128;
Precision = 'short';
fseek (fid, Offset, 'bof');
Data   = fread(fid,[ChanNum ChanSample],Precision);

fclose (fid);


