{ program to try to switch to protected mode }
{unit segments;
interface }
{$r-}     { range checks off}
{$s-}     { stack checks off}
{$v-}     { no check on strings}
{$l prot}
program prot;{ uses dos,graph,crt;}
const { 286 flags }
      present = 128 ; { segment is here }
      DPLmask = 96  ; { Descriptor priveledge level }
      dataorcode  = 16  ; { not operating system segment }
      Executable = 8;
      Expansiondown = 4 ; { used for stack segments }
      Writeable = 2 ;     { write permit bit }
      Accessed = 1;       { has been used }
      Conforming = 4 ;    { can only be executed if CPL >= DPL }
      Readable =2 ;       { for code segments }

      { 386 flags }
      hilimitmask =15;
      AVL =16 ;           { available for operating system }
                          { used as a free bit }
      freebit = AVL;
      seg32 =64 ;         { uses 32 bit code }
      pagegranular=128;   { limit is in pages }

     topUserseg = 10;
     topGlobalseg=21;
     toptask = 2;

     { predefined selectors }
     { these are known about by the assembly code and must not change }
     nullseg     = 0;
     gdtsel      = 8 ;
     idtsel      = 16;
     bootdata    = 24;
     bootes      = 32;
     bootstack0  = 40;
     bootcode    = 48;
     boottempcs  = 56;
     bootstack1  = 64;
     bootstack2  = 72;
     bootstack3  = 80;
     bootstack4  = 88;
     boottss     = 112;
     bootldt     = 128;
     screensel   = 144;
     dummytss    = 160;

     { interrupt vectors }
     divideerror         =0;
     debugexception      =1;
     nmi                 =2;
     onebyte             =3;
     overflow            =4;
     bounds              =5;
     invalidopcode       =6;
     nofpu               =7;
     doublefault         =8;
     intel1              =9;
     invalidtss          =10;
     segmentnotpresent   =11;
     stackfault          =12;
     generalprotection   =13;
     pagefault           =14;
     fpuerr              =16;
     alignmentcheck      =17;
     firstfree           =33;
     deviceints          =40;
     first8259           =deviceints;
      clockvector         =40;
      keyboardvector      =41;
      serial2             =43;
      serial1             =44;
      printer2            =45;
      floppyvector        =46;
      printervector       =47;

     second8259          =48;
     topinterrupt= 63;


     { standard stack size }
     stacksize= $800;
     maxsegsize=$0ffff;

type
    byte = 0 .. 255;
    descriptor = record
                limitlow,baselow : word ;
                basemed, flags286,flags386,basehi: byte;
     end;
     bigdescriptor = record
                normaldesc:descriptor;
              { big descriptors are padded out to 16 bytes }
              { this allows them to stand in 1 to 1    }
              { correspnondance with pids              }
                freepntr:word;
                master  :word;
              { if this is a copy of another then holds the master selector  }
                attribs :byte;
                opflags   :byte;  {this should be zero }
                utility : word;
     end;

     codepntr =^char;
     registers =
             record
                case integer of
                0:(ax,bx,cx,dx,bp,si,di,ds,es,flags:word);
                1:(al,ah,bl,bh,cl,ch,dl,dh:byte)
              end;

     globaltable = array [0..topGlobalseg] of descriptor;
     usertable = array [0..topUserseg] of bigdescriptor;
     interrupttable = array[0..topinterrupt] of descriptor;
     selector = word;

     longint = record
                     lowword,hiword:integer
               end;
     address = longint;
     systemtypes =(
                 invalid,
                 available286tss,
                 ldt,
                 busy286tss,
                 callgate286,
                 taskgate,
                 interruptgate286,
                 trapgate286,
                 invalidtoo,
                 available386tss,
                 undefined,
                 busy386tss,
                 callgate386,
                 undefinedtoo,
                 interruptgate386,
                 trapgate386);
     tssfields = (
                 backlink,
                 sp0,
                 ss0,
                 sp1,
                 ss1,
                 sp2,
                 ss2,
                 ip,
                 storedflags,
                 eax,
                 ecx,
                 edx,
                 ebx,
                 esp,
                 ebp,
                 esi,
                 edi,
                 eseg,
                 cseg,
                 sseg,
                 dseg,
                 ldtsel);
      tid = 1..toptask;
      processdata = record  { extra information kept on process }
                      debug:word;
                      iomap:word;
                      processpid:array[0..15] of byte;
                      state:(idle,running,blocked);
                      processname:string[80];
                      taskno:tid;
                    end;

      tss286 = record
               regs,unused:array[tssfields] of word;
               opsysdata:processdata;
               end;
      tss386 = record
               regs:array[tssfields] of longint;
               opsysdata:processdata;
               iomap:array[0..31] of byte;
               ff:byte;
               end;
       stack =array[1..stacksize] of char;

{ implementation    }
{ ------------------- EXTERNALS ---------------------------------}
procedure inttable;external;
procedure highlevptr;external;
procedure tswitch;external;
function  setrestart:integer;external;
procedure restart;external;
procedure reset;external;
function virton(gdt,interrupts:word):integer;external;
procedure biosvirt(gdt,interrupts:word);external;
{ --------------------- SCREEN UNIT -----------------------------}
const
  screen_width  = 80;
  screen_height = 25;

type
  screenChar= record
    ch: char;
    st: byte;
  end;
  ScreenArray = array [1..screen_height,1..screen_width] of ScreenChar;
  string20 = string[20];
  screenp= ^screenarray;

var
  realscreen,virtscreen,ScreenPtr: screenp;
  DisplayType,DisplayMode: integer;
  names :array[0..21]of string[6] =(
     'null',
     'gdt',
     'idt' ,
     'data',
     'es',
     'ss',
     'code',
     'bioscs',
     'stack1',
     'stack2',
     'stack3','unused','unused', 'unused',
     'tss','unused'   ,
     'ldt','unused',
     'screen','unused',
     'dumtss','unused');
     nonsystemtypes:array[0..7] of string[3] =
      ('DU ','DUW','DD ', 'DDW', 'E  ', 'E R', 'EC ', 'ECR');

const
  CGA      = 1;
  MCGA     = 2;
  EGA      = 3;
  EGA64    = 4;
  EGAMono  = 5;
  HercMono = 7;
  ATT400   = 8;
  VGA      = 9;
  PC3270   = 10;


var
  retracemode: boolean;

{-------------------------------------------------------------------}
{  Move memory, as Turbo Move, but assume that the target is in
{  video memory; prevent screen flicker based on this assumption,
{  unless RetraceMode is false.  Timing is VERY tight: if the code
{  were 1 clock cycle slower, it would cause flicker.
{-------------------------------------------------------------------}
procedure MoveToScreen(Var Source,Dest; Length: Integer);
Begin
  if length = 0 then exit;
  If Not RetraceMode Then Move(Source,Dest,Length) else
    Inline(
       $1E               {   PUSH DS            ; Save Turbo's DS
                    }
      /$55               {   PUSH BP            ;   and BP
                    }
      /$BA /$03DA        {   MOV DX,03DA        ; Point DX to CGA status po
rt                  }
      /$C5 /$B6 />source {   LDS SI,[BP+source] ; Source pointer into DS:SI
                    }
      /$C4 /$BE />dest   {   LES DI,[BP+dest]   ; Dest pointer into ES:DI
                    }
      /$8B /$8E />length {   MOV CX,[BP+length] ; Length value into CX
                    }
      /$FC               {   CLD                ; Set string direction to f
orward              }
      /$AC               {  L0:LODSB            ; Grab a video byte
                    }
      /$89 /$C5          {   MOV BP,AX          ; Save it in BP
                    }
      /$B4 /$09          {   MOV AH,09          ; Move horiz. + vertical re
trace mask to fast  }
                         {                      ;   storage
                    }
      /$EC               {  L1:IN AL,DX         ; Get 6845 status
                    }
      /$D0 /$D8          {   RCR AL,1           ; Check horizontal retrace
                    }
      /$72 /<-5          {   JB L1              ; Loop if in horizontal ret
race: this prevents }
                         {                      ;   starting in mid-retrace
, since there is    }
                         {                      ;   exactly enough time for
 1 and only 1 STOSW }
                         {                      ;   during horizontal retra
ce                  }
      /$FA               {   CLI                ; No ints during critical s
ection              }
      /$EC               {  L2:IN AL,DX         ; Get 6845 status
                    }
      /$20 /$E0          {   AND AL,AH          ; Check for both kinds of r
etrace: IF the      }
                         {                      ;   video board does not re
port horizontal     }
                         {                      ;   retrace while in vertic
al retrace, this    }
                         {                      ;   will allow several char
acters to be        }
                         {                      ;   stuffed in during verti
cal retrace         }
      /$74 /<-5          {   JZ L2              ; Loop if not equal zero
                    }
      /$89 /$E8          {   MOV AX,BP          ; Get the video word
                    }
      /$AA               {   STOSB              ; Store the video byte
                    }
      /$FB               {   STI                ; Allow interrupts
                    }
      /$E2 /<-22         {   LOOP L0            ; Go do next word
                    }
      /$5D               {   POP BP             ; Restore Turbo's BP
                    }
      /$1F               {   POP DS             ;   and DS
                    }
    );
End;

{-------------------------------------------------------------------}
{  Move memory, as Turbo Move, but assume that the source is in     }
{  video memory; prevent screen flicker based on this assumption,   }
{  unless RetraceMode is false.  Timing is VERY tight: if the code  }
{  were 1 clock cycle slower, it would cause flicker.               }
{-------------------------------------------------------------------}
procedure MoveFromScreen(Var Source,Dest; Length: Integer);
Begin
  if length = 0 then exit;
  If Not RetraceMode Then Move(Source,Dest,Length) else
    Inline(
       $1E               {  PUSH DS            ; Save Turbo's DS
                   }
      /$55               {  PUSH BP            ;   and BP
                   }
      /$BA /$03DA        {  MOV DX,03DA        ; Point DX to CGA status por
t                  }
      /$C5 /$B6 />source {  LDS SI,[BP+source] ; Source pointer into DS:SI
                   }
      /$C4 /$BE />dest   {  LES DI,[BP+dest]   ; Dest pointer into ES:DI
                   }
      /$8B /$8E />length {  MOV CX,[BP+length] ; Length value into CX
                   }
      /$FC               {  CLD                ; Set string direction to fo
rward              }
      /$EC               { L0:IN AL,DX         ; Get 6845 status
                   }
      /$D0 /$D8          {  RCR AL,1           ; Check horizontal retrace
                   }
      /$72 /$FB          {  JB L0              ; Loop if in horizontal retr
ace: this prevents }
                         {                     ;   starting in mid-retrace,
 since there is    }
                         {                     ;   exactly enough time for
1 and only 1 LODSW }
                         {                     ;   during horizontal retrac
e                  }
      /$FA               {  CLI                ; No ints during critical se
ction              }
      /$EC               { L1:IN AL,DX         ; Get 6845 status
                   }
      /$D0 /$D8          {  RCR AL,1           ; Check for horizontal retra
ce: LODSW is 1     }
                         {                     ;   clock cycle slower than
STOSW; because of  }
                         {                     ;   this, the vertical retra
ce trick can't be  }
                         {                     ;   used because it causes f
licker!  (RCR AL,1 }
                         {                     ;   is 1 cycle faster than A
ND AL,AH)          }
      /$73 /$FB          {  JNB L1             ; Loop if not in retrace
                   }
      /$AC               {  LODSB              ; Load the video byte
                     }
      /$FB               {  STI                ; Allow interrupts
                   }
      /$AA               {  STOSB              ; Store the video byte
                   }
      /$E2 /<-16         {  LOOP L0            ; Go do next word
                   }
      /$5D               {  POP BP             ; Restore Turbo's BP
                   }
      /$1F               {  POP DS             ;   and DS
                   }
    );
End;

procedure StringToScreen(Var Source,Dest; Length: integer; colour: byte);
{ Move Length bytes from Source to alternate even bytes of Dest. Set the
{ alternate odd bytes of Dest to Colour. Only write to the Dest if the
{ screen is in a horizontal and vertical retrace  }
  const CRTCstatus = $3DA; { CRTC status port }
  var s: array[0..32767] of byte absolute source;
      d: array[0..32767] of byte absolute dest;
      i: integer;
begin
  if length = 0 then exit;
  If Not RetraceMode Then
  for i:=0 to length-1 do
  begin
    d[i*2]:=s[i];
    d[i*2+1]:=colour;
  end else           (*
  inline(
     $1E               {  PUSH    DS                                  }
    /$BA />CRTCstatus  {  MOV     DX,CRTCstatus                       }
    /$C5 /$76 /<dest   {  LDS     SI,[BP+dest]                        }
    /$C4 /$7E /<source {  LES     DI,[BP+source]                      }
    /$8B /$4E /<length {  MOV     CX,[BP+length]                      }
    /$51               { L1: PUSH CX                                  }
    /$8A /$6E /<colour {     MOV     CH,[BP+colour]                   }
    /$26               {     ES:                                      }
    /$8A /$0D          {     MOV     CL,[DI]   CL:= source byte       }
    /$EC               {   L2: IN   AL,DX      CRTC status            }
    /$24 /$01          {       AND     AL,1    horiz retrace          }
    /$75 /<-5          {       JNZ     L2      Loop until zero        }
    /$FA               {     CLI               interrupts off         }
    /$EC               {   L3: IN   AL,DX      CRTC status            }
    /$24 /$09          {       AND     AL,9    horiz and vert retrace }
    /$74 /<-5          {       JZ      L3      Loop until non-zero    }
    /$89 /$0C          {     MOV     [SI],CX   dest word := CX        }
    /$FB               {     STI               interrupts on          }
    /$47               {     INC     DI                               }
    /$46               {     INC     SI                               }
    /$46               {     INC     SI                               }
    /$59               {     POP     CX                               }
    /$E2 /<-27         {     LOOP    L1                               }
    /$1F               {  POP     DS                                  }
  );
(**)
end;

procedure ScreenToString(Var Source,Dest; Length: integer);
{ Move Length alternate even bytes from Source to Dest.
{ Only read from the Source if the
{ screen is in a horizontal and vertical retrace  }
  const CRTCstatus = $3DA; { CRTC status port }
  var s: array[0..32767] of byte absolute source;
      d: array[0..32767] of byte absolute dest;
      i: integer;
begin
  if length = 0 then exit;
  for i:=0 to length-1 do
    d[i]:=s[i*2];
end;



{-------------------------------------------------------------------}
{ screen writes
{-------------------------------------------------------------------}
procedure writeAt(x,y,c: integer;var s);
  var i,j: integer;
begin
  if (x>0) and (x<=screen_width) and
     (y>0) and (y<=screen_height) then
  StringToScreen(string(s)[1], ScreenPtr^[y,x], ord(string(s)[0]),c);
end;

procedure clearBox(x1,y1,x2,y2,style: integer);
  var x,y: integer;
      line: array [1..screen_width] of Char;
begin
  for x:=x1 to x2 do line[x]:=' ';
  for y:=y1 to y2 do StringToScreen(line[x1], ScreenPtr^[y,x1], (x2-x1+1),
    style);
end;



function istr(i,len: longint): string20;
  var s: string20;
begin
  str(i:len,s);
  istr:=s;
end;

function rstr(r: real; len,adp: integer): string20;
  var s: string20;
begin
  str(r:len:adp,s);
  rstr:=s;
end;

function hexdigit(num:address):char;
var n:integer;
begin
   n:=num and 15;
   if (n)>9 then hexdigit:=chr(ord('a')+(n)-10)
   else hexdigit:=chr(ord('0')+n)
end;
procedure tohex(len:byte;num:address;var form:string20);
var i:integer;
begin
    if len>20 then len:=20;
    form[0]:=chr(len);
    for i:=len downto 1 do begin
        form[i]:=hexdigit(num);
        num:=num div 16;
    end;
end;
{-------------------------------------------------------------------}
{ Determine screen type for screen updating procedures
{-------------------------------------------------------------------}
procedure screeninit;
var b: word;

begin
    Displaytype:=EGA;
  DisplayType:=detect;
  DetectGraph(DisplayType,DisplayMode);

  if DisplayType = HercMono then
  begin        { monochrome screen }
    ScreenPtr:=ptr($B000,0);
    Retracemode:=false;
  end else (* *)
  begin            { color screen }
    ScreenPtr:=ptr($B800,0);
    Retracemode:=DisplayType = CGA;
  end;
end;
{---------------------- SCREEN UNIT ENDS ---------------- }


{ -------------------- GLOBAL VARS ---------------------- }
var  users:array[tid] of usertable;
     globals: globaltable;
     idt : interrupttable;
     bstacks: array[1..4] of stack;
     tasks:array[tid] of tss286;
     bootvec,intvec,tempvec:codepntr;
     highlevvec:^word;





function gdtindex(sel:word):word; { convert selector into gdt index }
begin
    gdtindex:=sel shr 3;
end;
function ldtindex(sel:word):word; { convert selector into ldt index }
begin
    ldtindex:=sel shr 4;
end;

procedure printdesc(var f:text; var d:descriptor);
var s:string20;
begin
   with d do   begin
      tohex(2,basehi,s);  write(s:3);
      tohex(2,basemed,s); write(s);
      tohex(4,baselow,s);  write(s);
      write('  ');
      tohex(4,limitlow ,s); write(s);
      tohex(2,flags286,s);  write(s:3,' ');
      if (flags286 and 128)=128 then write('P') else write(' ');
      write(((flags286  shr 5) and 3):2);
      if (flags286 and 16)=0 then begin
         write('S',hexdigit(flags286 and 15):2);

      end else
      begin
         write(' ');
         write(nonsystemtypes[(flags286 shr 1) and 7]);
         if (flags286 and 1)=1 then write('A') else write(' ');

      end;
   end;
   writeln;
end;

procedure setdesc(base,lim:address;
                   A:boolean;
                   TYPEcode:byte;
                   Syst:boolean;    { true if it is a systme seg }
                   DPL:byte;
                   P:boolean;
                   Free:boolean;
                   op32:boolean;
                   pagesized:boolean;
                   wordcount:byte;
                 var d:descriptor);
const maxstack = $10000;

var cheat : record
            case boolean of
            true: (a:address;);
            false:(low:word;med,hi:byte);
            end;
            t,newbase,newlimit:address;

begin
     with d do
     begin
          if not syst and ((typecode and expansiondown) <> 0)
             and ((typecode and executable)=0)
          then { it is a stack }
          begin
               { in this case we have to alter base  }
               t:=maxstack;
               newbase:=base -t +lim ;
               newlimit:=t -lim;
               base:=newbase;
               lim:=newlimit;
          end;
          cheat.a:=base;
          baselow:=cheat.low;
          basemed:=cheat.med ;
          basehi:= cheat.hi;
          cheat.a:=lim;
          limitlow:=cheat.low;
          flags386:=cheat.med and hilimitmask;
          if op32      then flags386:=flags386+seg32;
          if pagesized then flags386:=flags386+pagegranular;
          if Free      then flags386:=flags386+freebit;
          if not Syst then begin { code of executable }
            flags286:=(typecode and 14)+dataorcode;
            if A         then flags286:=flags286+Accessed ;
          end
          else begin
               flags286:=typecode and 15 ;
               case typecode of
               4,5,6,7,12,14,15:begin
                        {gate descriptor }
                        basemed:=wordcount;
                        flags386:=cheat.med;
                        basehi:=cheat.hi;
                        end;
               end;
          end;
          if P         then flags286:=flags286+present ;
          flags286:=flags286+(dplmask and(dpl *32));
     end;
end;


procedure setbigdesc(base,lim:address;
                   A:boolean;
                   TYPEcode:byte;
                   Syst:boolean;    { true if it is a systme seg }
                   DPL:byte;
                   P:boolean;
                   Free:boolean;
                   op32:boolean;
                   pagesized:boolean;
                   wordcount:byte;
                 var d:bigdescriptor);
begin

         setdesc(base,lim,A,typecode,
                 syst,dpl,p,free,op32,pagesized,wordcount,
                 d.normaldesc);
end;
function physaddrof(var v):address;
{ computes a 32 bit physical address from an 8086 type address }
var t:address;
begin
     t:=seg(v);
     t:=t*16;
     physaddrof:= t+ofs(v);
end;
function physcs:address; { returns physcal address of current CS }
var t:address;
begin
     t:=cseg;
     physcs:=t*16;
end;
function physds:address; { returns physcal address of current DS }
var t:address;
begin
     t:=dseg;
     physds:=t*16;
end;
function physss:address; { returns physcal address of current SS }
var t:address;
begin
     t:=sseg;
     physss:=t*16;
end;

{---------- initialise boot segments ------------- }
procedure initbootsegs(var startcode:codepntr);
var i:integer;
    reg:tssfields;
begin
     for i:=0 to topglobalseg do with globals[i] do begin
        flags286:=0;
        flags386:=0;
        limitlow:=0;
        baselow:=0;
        basemed:=0;

     end;

     { nullseg seg }
     setdesc( 0,        { base address }
              1,           { limit }
              false,       { not yet accessed }
              0,
              false,       { not a system segment }
              0,           { DPL }
              false,       { it is not present }
              false,       { it is not free}
              false,       { it is 286 not 386 }
              false,       { it is byte granular }
              0,           { not applicable }
              globals[gdtindex(nullseg)]);

     { gdt seg }
     setdesc( physaddrof(globals),        { base address }
              sizeof(globals),           { limit }
              true,        {  accessed }
              writeable,
              false,       { not a system segment }
              0,           { DPL }
              true,        { it is  present }
              false,       { it is not free}
              false,       { it is 286 not 386 }
              false,       { it is byte granular }
              0,           { not applicable }
              globals[gdtindex(gdtsel)]);


     { idt seg }
     setdesc( physaddrof(idt),        { base address }
              sizeof(idt),           { limit }
              true,       {  accessed }
              readable,
              false,       { not a system segment }
              0,           { DPL }
              true,        { it is  present }
              false,       { it is not free}
              false,       { it is 286 not 386 }
              false,       { it is byte granular }
              0,           { not applicable }
              globals[gdtindex(idtsel)]);


     { Code seg }
     setdesc( physcs,      { base address }
              maxsegsize,  { limit }
              true ,       { accessed }
              executable+readable,
              false,       { not a system segment }
              0,           { DPL }
              true,        { it is present }
              false,       { it is not free}
              false,       { it is 286 not 386 }
              false,       { it is byte granular }
              0,           { not applicable }
              globals[gdtindex(bootcode)]);

     { data seg }
     setdesc( physds ,     { base address }
              maxsegsize,  { limit }
              true,       {  accessed }
              writeable,
              false,       { not a system segment }
              0,           { DPL }
              true,        { it is present }
              false,       { it is not free}
              false,       { it is 286 not 386 }
              false,       { it is byte granular }
              0,           { not applicable }
              globals[gdtindex(bootdata)]);

     { extra seg }
     setdesc( physds ,     { base address }
              maxsegsize,  { limit }
              true,        { accessed }
              writeable,
              false,       { not a system segment }
              0,           { DPL }
              true,        { it is present }
              false,       { it is not free}
              false,       { it is 286 not 386 }
              false,       { it is byte granular }
              0,           { not applicable }
              globals[gdtindex(bootes)]);

     { stack segs }
     for i:=1 to 4 do
     setdesc( physaddrof(bstacks[i]),     { base address }
              stacksize-2,                { limit }
              false,                      { not yet accessed }
              writeable+expansiondown,
              false,                      { not a system segment }
              0,                          { DPL }
              true,                       { it is present }
              false,                      { it is not free}
              false,                      { it is 286 not 386 }
              false,                      { it is byte granular }
              0,                          { not applicable }
              globals[gdtindex(bootstack1)+i-1]);
      setdesc(physss,                     { base address }
              maxsegsize,                 { limit }
              true,                       { not yet accessed }
              writeable{+expansiondown},
              false,                      { not a system segment }
              0,                          { DPL }
              true,                       { it is present }
              false,                      { it is not free}
              false,                      { it is 286 not 386 }
              false,                      { it is byte granular }
              0,                          { not applicable }
              globals[gdtindex(bootstack0)]);

     { boot tss }
     setdesc( physaddrof(tasks[1]),       { base address }
              sizeof(tasks[1]),           { limit }
              false,                      { not yet accessed }
              ord(available286tss),
              true,                       { is a system segment }
              0,                          { DPL }
              true,                       { it is present }
              false,                      { it is not free}
              false,                      { it is 286 not 386 }
              false,                      { it is byte granular }
              0,                          { not applicable }
              globals[gdtindex(boottss)]);


     { boot ldt }
     setdesc( physaddrof(users[1]),       { base address }
              sizeof(users[1]),           { limit }
              false,                      { not yet accessed }
              ord(ldt),
              true,                       { is a system segment }
              0,                          { DPL }
              true,                       { it is present }
              false,                      { it is not free}
              false,                      { it is 286 not 386 }
              false,                      { it is byte granular }
              0,                          { not applicable }
              globals[gdtindex(bootldt)]);

     { screen }
     setdesc( physaddrof(screenptr^),     { base address }
              sizeof(screenptr^),         { limit }
              false,                      { not yet accessed }
              writeable,
              false,                      { isnt a system segment }
              2,                          { DPL }
              true,                       { it is present }
              false,                      { it is not free}
              false,                      { it is 286 not 386 }
              false,                      { it is byte granular }
              0,                          { not applicable }
              globals[gdtindex(screensel)]);
     virtscreen:=screenp(ptr(screensel,0));
     realscreen:=screenptr;
    { --------- initialise the boot tss ------------------- }

    for i:= 1 to 2 do with tasks[i] do begin
         for reg:=backlink to ldtsel do regs[reg]:=0;
         regs[backlink]:=0;
         { set all the stacks to near top }
         regs[sp0]:=$fff0;
         regs[sp1]:=$fff0;
         regs[sp2]:=$fff0;
         regs[sp ]:=$fff0;

         regs[ss0]:=bootstack1;
         regs[ss1]:=bootstack2;
         regs[ss2]:=bootstack3;
         regs[ss ]:=bootstack4;


         regs[cs ]:=bootcode;
         regs[ds ]:=bootdata;
         regs[es ]:=bootdata;
         regs[ldtsel ]:=bootldt;

         regs[ip] := ofs(startcode^);
{         for reg:=backlink to ldtsel do write(regs[reg]:16);}

    end;
    { ------------- set up interrupt table ------------------ }
    for i:=0 to topinterrupt do begin

     { vector interupts through a jump table at intvec^ }
     setdesc( bootcode,          { base segment }
              ofs(intvec^)+(5*i),{ ofset of interupthandler }
              false,       { not yet accessed }
              ord(trapgate286),
              true,        { a system segment }
              0,           { DPL }
              true,        { it is present }
              false,       { it is not free}
              false,       { it is 286 not 386 }
              false,       { it is byte granular }
              0,           { not applicable }
              idt[i]);

    end;
end;
procedure printsegs(l,h:integer);
var i:integer;
begin
    for i:=l to h do
    begin write(names[i]:7); printdesc(input,globals[i]);end;
end;
procedure printints(l,h:integer);
var i:integer;s:string20;
begin
    for i:=l to h do
    begin  printdesc(input,idt[i]);end;
    tohex(4,highlevvec^,s);write('hihlev ',s);
    tohex(4,ofs(intvec^),s); write(' jumptable ',s);
end;
var shared:integer;
{ ----------------------------------------------------------}
procedure protected;
var i,j:integer;
const succ:string20='-test succeeds---';
begin
 j:=0;
 repeat
     writeat(5,(j and 15)+1,j and 7,succ);
     {tswitch;
     j:=j+1;
     shared:=j;
    { inline($cc); { INT 3 }
 until false;
  restart;
end;
{-------------------------------------------------------------}
procedure defaulttrap(vec,ax,cx,dx,bx,sp,bp,si,di,ds,es:word);
const trap:string20='Default trap     ';
      gpf:string20='General protection';
      pf:string20='Page fault';
      snp:string20='Seg not present';
      sf:string20='Stack fault';
      df:string20='Panic Double fault';
      itss:string20='Invalid tss';
var   s:string20;
begin
       writeat(1,3,2,trap);
       if vec=13 then writeat(20,3,4,gpf) else
       if vec=14 then writeat(20,3,4,pf) else
       if vec=12 then writeat(20,3,4,sf) else
       if vec=11 then writeat(20,3,4,snp) else
       if vec=10 then writeat(20,3,4,itss) else
       if vec=8 then begin
          { Double fault can not recover }
          writeat(20,3,1,df) ;
          while true do ;
       end;

    {   tohex(vec,2,s);
       writeat(27,4,3,s);}
       { put in our own return not to discard params   }
       { these are needed to go back to original state }
       inline(
       $8b/$e5     { mov sp, bp }
       /$5d        { pop bp }
       /$c3        { ret    }
       );
end;



procedure callvirtual;
const back:string20='Back';
begin
 { dummy  tss  saves state as we go into protected mode }
     setdesc( physaddrof(tasks[2]),    { base address }
              sizeof(tasks[1]),           { limit }
              false,                      { not yet accessed }
              ord(available286tss),
              true,                       { is a system segment }
              0,                          { DPL }
              true,                       { it is present }
              false,                      { it is not free}
              false,                      { it is 286 not 386 }
              false,                      { it is byte granular }
              0,                          { not applicable }
              globals[gdtindex(dummytss)]);
       screenptr:=virtscreen;
       biosvirt(ofs(globals),256*first8259+second8259); protected;{}
       if (virton(ofs(globals),256*first8259+second8259)=2) then begin
       end;
       screenptr:=realscreen;
       writeat(5,5,6,back);
end;

var c:char;
begin
    screeninit;
    bootvec:= @protected;
    intvec:= @inttable;
    highlevvec:=@highlevptr;
    tempvec:=@defaulttrap;
    highlevvec^ :=ofs(tempvec^);    { set up pointer in assembly code }
                                    { to high level interrupt handler }
    initbootsegs(bootvec);
    clrscr;
    shared:=0;
    if setrestart =1 then
    repeat


       readln;
       printsegs(1,15);
       printints(1,3);
       readln;callvirtual;
       write('again ? (Y/N)');
       readln(c);
       if c<>'Y' then exit;
       clrscr;
    until shared > 10;
end.
