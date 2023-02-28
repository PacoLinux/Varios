unit fio;
interface      uses bufdecls;
procedure shortfilename;
implementation
{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\                                                                   \\
\\   ANALOGUE EDITOR TOOLBOX Version 2.00A                           \\
\\   File Name:                                                      \\
\\                                                                   \\
\\   Editor:                                                         \\
\\     Text File I/O                                                 \\
\\	modified to use streams by W P Cockshott in Aug 1990	     \\
\\                                                                   \\
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\}

procedure ShortFileName;
  var dir,name: string;
begin
  getdir(0,dir);
  if pos(dir,FileName) = 1 then
    ShortName:=copy(FileName,length(dir)+2,255) else
    ShortName:=FileName;
end;

function pos_dot(s: TextLine): integer;
{ position of '.' in s, ignoring '..' }
  var j,k: integer;
begin
  repeat
    k:=pos('..',s);
    if k > 0 then begin s[k]:='%'; s[k+1]:='%'; end;
  until k=0;
  pos_dot:=pos('.',s);
end;

procedure SetFileName(name: string);
  var
    disk,st,thisdir,olddir: string;
    i,j: integer;
begin
  if name = '' then begin FileName:=''; exit; end;
  if pos_dot(Name)=0 then Name:=Name+'.'+extension;
  FileName:=name;
  getdir(0,olddir);
  if (length(name) >=2) and (name[2] = ':') then
    begin disk:=copy(name,1,2); name:=copy(name,3,255); end else
    disk:='';
  i:=0;
  for j:=1 to length(name) do
    if name[j] = '\' then i:=j;
  st:=copy(name,i+1,255);
  if i = 0 then name:='' else
  if (name[1]='\') and (i=1) then name:='\' else
    setlength(name, i-1);

  chdir(disk+name);
  if IOresult <> 0 then
  begin
    chdir(olddir);
    ShortFileName;
    exit;
  end;
  getdir(0,thisdir);
  if thisdir[length(thisdir)] <> '\' then thisdir:=thisdir+'\';

  chdir(olddir);
  FileName:=thisdir+st;
  ShortFileName;
end;



end.