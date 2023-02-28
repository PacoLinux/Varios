{$l sdl_rwops.c}
unit SDL;

interface

uses system;

  { These are the flags which may be passed to SDL_Init() -- you should
     specify the subsystems which you will be using in your application.
   }
  const
    SDL_INIT_TIMER = $00000001;
    SDL_INIT_AUDIO = $00000010;
    SDL_INIT_VIDEO = $00000020;
    SDL_INIT_CDROM = $00000100;
    SDL_INIT_JOYSTICK = $00000200;
    SDL_INIT_NOPARACHUTE = $00100000; { Don't catch fatal signals  }
    SDL_INIT_EVENTTHREAD = $01000000; { Not supported on all OS's  }
    SDL_INIT_EVERYTHING = $0000FFFF;
     
  { Basic data types  }
  type

    Uint8   =    0..255;
    Sint8   = -255..255;
    PUint8  = ^Uint8;

    Uint16  =      0..32000;
    Sint16  = -32000..32000;
    PUint16 = ^Uint16;

    Uint32  = 0..4294967295;
    Sint32  = integer;

    Uint64  = record
      hi, lo: Uint32;
    end ;

    SDL_Bool = Boolean;
    PBoolArray = ^BoolArray ;
    BoolArray  = Array[0..0] of Boolean;
     
  {###### Additional types for unicode translation ######}
  type ascii     = 0..127;
   asciiarray  = array[0..99] of ascii;
   pasciiarray = ^asciiarray;

  {######################################################}
     
  { General keyboard/mouse state definitions  }
  const
    SDL_PRESSED  = 1;
    SDL_RELEASED = 0;
     
  Type
    PByte     = ^Byte;
    PLongint  = ^Longint;
    PWord     = ^Word;
    PInteger  = ^Integer;
    PCardinal = ^Cardinal;
    PReal     = ^Real;
    PDouble   = ^Double; 
    PFile     = Pointer ; {FILE *}

  const
    SEEK_SET=0;  { Seek from beginning of file. }
    SEEK_CUR=1;  { Seek from current position. }
    SEEK_END=2;  { Seek from end of file. }
     
    { Header file for access to the SDL raw framebuffer window  }

    { Useful data types  }
   
    SDL_ALPHA_OPAQUE      = 255;
    SDL_ALPHA_TRANSPARENT = 0;

    type

       PSDL_Rect = ^SDL_Rect;
       SDL_Rect = record
            x : Sint16;
            y : Sint16;
            w : Uint16;
            h : Uint16;
         end;
       PSDL_RectArray = ^SDL_RectArray;
       SDL_RectArray = array[0..0] of SDL_Rect ;

       PSDL_Color = ^SDL_COLOR ;
       SDL_Color = record
            r : Uint8;
            g : Uint8;
            b : Uint8;
            unused : Uint8;
         end;
       PSDL_ColorArray = ^SDL_ColorArray;
       SDL_ColorArray = Array[0..0] of SDL_Color ;

       SDL_Palette = record
            ncolors : longint;
            colors : PSDL_ColorArray;
         end;
    { Everything in the pixel format structure is read-only  }

       PSDL_PixelFormat = ^SDL_PixelFormat;
       SDL_PixelFormat = record
            palette : ^SDL_Palette;
            BitsPerPixel : Uint8;
            BytesPerPixel : Uint8;
            Rloss : Uint8;
            Gloss : Uint8;
            Bloss : Uint8;
            Aloss : Uint8;
            Rshift : Uint8;
            Gshift : Uint8;
            Bshift : Uint8;
            Ashift : Uint8;
            Rmask : Uint32;
            Gmask : Uint32;
            Bmask : Uint32;
            Amask : Uint32;
            { RGB color key information  }
            colorkey : Uint32;
            { Alpha value information (per-surface alpha)  }
            alpha : Uint8;
         end;

    { This structure should be treated as read-only, except for 'pixels',
       which, if not nil, contains the raw pixel data for the surface.
     }
       PSDL_Surface = ^SDL_Surface;
       SDL_Surface = record
            flags : Uint32;             { Read only }
            format : ^SDL_PixelFormat;  { Read only }
            w : longint;                { Read only }
            h : longint;                { Read only }
            pitch : Uint16;             { Read only }
            pixels : pointer;           { Read-write }
            offset : longint;           { Private }
            { Hardware-specific surface info }
            hwdata : Pointer; { ***"struct private_hwdata *"*** }
            clip_rect: SDL_Rect; { clipping information }
            unused1: Uint32;     { for binary compatibility }
            locked: Uint32;      { allow recursive locks }
            { info for fast blit mapping to other surfaces }
            map : Pointer;              { Private } { ***"struct SDL_BlitMap *"*** }
            { format version, bumped at every evrsion to invalidate blit maps }
            format_version: Longint;
            { Reference count -- used when freeing surface }
            refcount : longint;         { Read mostly }
         end;

       function SDL_blit(src:PSDL_Surface; srcrect:pSDL_Rect;
                            dst:PSDL_Surface; dstrect:pSDL_Rect):longint;cdecl;


    { These are the currently supported flags for the SDL_surface  }

    const
    { Available for SDL_CreateRGBSurface or SDL_SetVideoMode  }
       
       SDL_SWSURFACE = $00000000; { Surface is in system memory  }
       SDL_HWSURFACE = $00000001; { Surface is in video memory  }
       SDL_ASYNCBLIT = $00000004; { Use asynchronous blits if possible  }
    { Available for SDL_SetVideoMode  }
       { Allow any video depth/pixel-format  }
       SDL_ANYFORMAT = $10000000;
       { Surface has exclusive palette  }
       SDL_HWPALETTE = $20000000;
       { Set up double-buffered video mode  }
       SDL_DOUBLEBUF = $40000000;
       { Surface is a full screen display  }
       SDL_FULLSCREEN = $80000000;
       { Create an OpenGL rendering context}
       SDL_OPENGL = $00000002;
       { Create an OpenGL rendering context and use it for blitting }
       SDL_OPENGLBLIT = $0000000A;
       { This video mode may be resized }
       SDL_RESIZABLE = $00000010;
       { No window caption or edge frame }
       SDL_NOFRAME = $00000020;
    { Used internally (read-only)  }
       { Blit uses hardware acceleration  }
       SDL_HWACCEL = $00000100;
       { Blit uses a source color key  }
       SDL_SRCCOLORKEY = $00001000;
       { Private flag  }
       SDL_RLEACCELOK = $00002000;
       { Surface is RLE encoded  }
       SDL_RLEACCEL = $00004000;
       { Blit uses source alpha blending  }
       SDL_SRCALPHA = $00010000;
       { Surface uses preallocated memory  }
       SDL_PREALLOC = $01000000;

    { Useful for determining the video hardware capabilities  }

    type
       PSDL_VideoInfo = ^SDL_VideoInfo;
       SDL_VideoInfo = record
            flag0 : longint;
            video_mem : Uint32;         { The total amount of video memory (in K)  }
            vfmt : ^SDL_PixelFormat;    { Value: The format of the video surface  }
       end;

    type
     
     pSDL_RWops = ^SDL_RWopsRec;
  
     SDL_RWopsRec = record
          { Seek to 'offset' relative to whence, one of stdio's whence values:
                 SEEK_SET, SEEK_CUR, SEEK_END
            Returns the final offset in the data source.
          }
	  seek : pchar;
          { Read up to 'num' objects each of size 'objsize' from the data
            source to the area pointed at by 'ptr'.
            Returns the number of objects read, or -1 if the read failed.
          }
	  rd : pchar;
          { Write exactly 'num' objects each of size 'objsize' from the area
            pointed at by 'ptr' to data source.
            Returns 'num', or -1 if the write failed.
          }
	  wr : pchar;
          { Close and free an allocated SDL_FSops structure  }
          close : Pointer;
          optype : Uint32;
          hidden : record
              case longint of
                 0 : ( stdio : record
                         autoclose : longint;
                         fp : PFile; {C file *}
                       end
                     );
                 1 : ( mem : record
                         base : PByte;
                         here : PByte;
                         stop : PByte;
                       end
                     );
                 2 : ( unknown : record
                         data1 : pointer;
                       end 
                     );
              end;
       end;
       
  { This function loads the SDL dynamically linked library and initializes 
     the subsystems specified by 'flags' (and those satisfying dependencies)
    Unless the SDL_INIT_NOPARACHUTE flag is set, it will install cleanup
     signal handlers for some commonly ignored fatal signals (like SIGSEGV)
  }
  function SDL_Init(flags:Uint32):longint;cdecl;external name 'SDL_Init';
  
  { This function initializes  specific SDL subsystems }
  function SDL_InitSubSystem(flags:Uint32):longint;cdecl;external name 'SDL_InitSubSystem';
  
  { This function cleans up specific SDL subsystems }
  procedure SDL_QuitSubSystem(flags:Uint32);cdecl;external name 'SDL_QuitSubsystem';
  
  { This function returns mask of the specified subsystems which have
    been initialized.
    If 'flags' is 0, it returns a mask of all initialized subsystems.
  }
  function SDL_WasInit(flags:Uint32):Uint32;cdecl;external name 'SDL_WasInit';
  
  { This function cleans up the initialized subsystems and unloads the
     dynamically linked library.  You should call it upon all exit conditions.
    }
  procedure SDL_Quit;cdecl;external name 'SDL_Quit';

  {###### Additional procedure for unicode translation ######}
  
  procedure string2pasciiarray(	 s : string ; var p:pasciiarray);
  (*! It is up to the calling environment to allocate space
   to hold the ascii array.
   It will create a null terminated ascii string from the
   Unicode string that is passed in.
   *)

  {##########################################################}
  
  
  { *** Accessors for the flags of SDL_VideoInfo *** }

    { Flag: Can you create hardware surfaces?  }
    function hw_available(var a : SDL_VideoInfo) : Uint32;
    procedure set_hw_available(var a : SDL_VideoInfo; __hw_available : Uint32);

    { Flag: Can you talk to a window manager?  }
    function wm_available(var a : SDL_VideoInfo) : Uint32;
    procedure set_wm_available(var a : SDL_VideoInfo; __wm_available : Uint32);
    function UnusedBits1(var a : SDL_VideoInfo) : Uint32;
    procedure set_UnusedBits1(var a : SDL_VideoInfo; __UnusedBits1 : Uint32);
    function UnusedBits2(var a : SDL_VideoInfo) : Uint32;
    procedure set_UnusedBits2(var a : SDL_VideoInfo; __UnusedBits2 : Uint32);

    { Flag: Accelerated blits HW --> HW  }
    function blit_hw(var a : SDL_VideoInfo) : Uint32;
    procedure set_blit_hw(var a : SDL_VideoInfo; __blit_hw : Uint32);

    { Flag: Accelerated blits with Colorkey  }
    function blit_hw_CC(var a : SDL_VideoInfo) : Uint32;
    procedure set_blit_hw_CC(var a : SDL_VideoInfo; __blit_hw_CC : Uint32);

    { Flag: Accelerated blits with Alpha  }
    function blit_hw_A(var a : SDL_VideoInfo) : Uint32;
    procedure set_blit_hw_A(var a : SDL_VideoInfo; __blit_hw_A : Uint32);

    { Flag: Accelerated blits SW --> HW  }
    function blit_sw(var a : SDL_VideoInfo) : Uint32;
    procedure set_blit_sw(var a : SDL_VideoInfo; __blit_sw : Uint32);

    { Flag: Accelerated blits with Colorkey  }
    function blit_sw_CC(var a : SDL_VideoInfo) : Uint32;
    procedure set_blit_sw_CC(var a : SDL_VideoInfo; __blit_sw_CC : Uint32);

    { Flag: Accelerated blits with Alpha  }
    function blit_sw_A(var a : SDL_VideoInfo) : Uint32;
    procedure set_blit_sw_A(var a : SDL_VideoInfo; __blit_sw_A : Uint32);

    { Flag: Accelerated color fill  }
    function blit_fill(var a : SDL_VideoInfo) : Uint32;
    procedure set_blit_fill(var a : SDL_VideoInfo; __blit_fill : Uint32);
    function UnusedBits3(var a : SDL_VideoInfo) : Uint32;
    procedure set_UnusedBits3(var a : SDL_VideoInfo; __UnusedBits3 : Uint32);

    { Evaluates to true if the surface needs to be locked before access  }
    function SDL_MUSTLOCK (surface: PSDL_Surface): Boolean ;

    { The most common video overlay formats.
      For an explanation of these pixel formats, see:
 	http://www.webartz.com/fourcc/indexyuv.htm
 
      For information on the relationship between color spaces, see:
      http://www.neuro.sfc.keio.ac.jp/~aly/polygon/info/color-space-faq.html
    }
    const
      SDL_YV12_OVERLAY=$32315659; { Planar mode: Y + V + U  (3 planes) }
      SDL_IYUV_OVERLAY=$56555949; { Planar mode: Y + U + V  (3 planes) }
      SDL_YUY2_OVERLAY=$32595559; { Packed mode: Y0+U0+Y1+V0 (1 plane) }
      SDL_UYVY_OVERLAY=$59565955; { Packed mode: U0+Y0+V0+Y1 (1 plane) }
      SDL_YVYU_OVERLAY=$55595659; { Packed mode: Y0+V0+Y1+U0 (1 plane) }

    { The YUV hardware video overlay }
    
    type
       TSDL_Plane = Array[0..0] of Uint8;
       PSDL_Plane = ^TSDL_Plane;
       TSDL_Overlay_PlaneArray = Array[0..0] of PSDL_Plane ;
       PSDL_Overlay_PlaneArray = ^TSDL_Overlay_PlaneArray ;
       
       pSDL_Overlay = ^SDL_Overlay;
       SDL_Overlay = record
            format: Uint32;                  { Read-only }
            w, h: Longint;                   { Read-only }
            planes: Longint;                 { Read-only }
            pitches: ^Uint16;                { Read-only }
            pixels: PSDL_Overlay_PlaneArray; { Read-write }
     
            { Hardware-specific surface info }
            hwfuncs: Pointer; { struct private_yuvhwfuncs * }
            hwdata: Pointer;  { struct private_yuvhwdata * }
     
            { Special flags }
            flag0: LongInt ;
         end ;

    { *** Accessors for the flags of SDL_Overlay *** }

    { Flag: This overlay hardware accelerated? }
    function hw_overlay (var o: SDL_Overlay): Uint32;
    procedure set_hw_overlay (var o: SDL_Overlay; value: Uint32);

    const
       SDL_GL_RED_SIZE = 0 ;
       SDL_GL_GREEN_SIZE = 1 ;
       SDL_GL_BLUE_SIZE = 2 ;
       SDL_GL_ALPHA_SIZE = 3 ;
       SDL_GL_BUFFER_SIZE = 4 ;
       SDL_GL_DOUBLEBUFFER = 5 ;
       SDL_GL_DEPTH_SIZE = 6 ;
       SDL_GL_STENCIL_SIZE = 7 ;
       SDL_GL_ACCUM_RED_SIZE = 8 ;
       SDL_GL_ACCUM_GREEN_SIZE = 9 ;
       SDL_GL_ACCUM_BLUE_SIZE = 10 ;
       SDL_GL_ACCUM_ALPHA_SIZE = 11 ;
    type
    { Public enumeration for setting the OpenGL window attributes. }
       SDL_GLattr = LongInt ;
    const
    { flags for SDL_SetPalette() }
       SDL_LOGPAL = $01;
       SDL_PHYSPAL = $02;

    { Function prototypes  }

    function SDL_GetVideoSurface:PSDL_Surface;cdecl;external name 'SDL_GetVideoSurface';

    function SDL_GetVideoInfo:PSDL_VideoInfo;cdecl;external name 'SDL_GetVideoInfo';

    function SDL_VideoModeOK(width:longint; height:longint; bpp:longint; flags:Uint32):longint;cdecl;external name 'SDL_VideoModeOK';

    function SDL_ListModes(format:pSDL_PixelFormat; flags:Uint32):PSDL_RectArray;cdecl;external name 'SDL_ListModes';

    function SDL_SetVideoMode(width:longint; height:longint; bpp:longint; flags:Uint32):PSDL_Surface;cdecl;external name 'SDL_SetVideoMode';

    procedure SDL_UpdateRects(screen:pSDL_Surface; numrects:longint; var rects:SDL_RectArray);cdecl;external name 'SDL_UpdateRects';

    procedure SDL_UpdateRect(screen:pSDL_Surface; x:Sint32; y:Sint32; w:Uint32; h:Uint32);cdecl;external name 'SDL_UpdateRect';

    function SDL_Flip(screen:pSDL_Surface):longint;cdecl;external name 'SDL_Flip';

    function SDL_SetGamma (red, green, blue: Real): Boolean;cdecl;external name 'SDL_SetGamma';

    function SDL_SetGammaRamp (red, green, blue: ^UInt16{PGammaRamp}): Boolean;cdecl;external name 'SDL_SetGammaRamp';

    function SDL_SetColors(surface:pSDL_Surface; var colors:SDL_ColorArray; firstcolor:longint; ncolors:longint):longint;cdecl;external name 'SDL_SetColors';

    function SDL_SetPalette(surface:pSDL_Surface; flags: Longint; var colors:SDL_ColorArray; firstcolor:longint; ncolors:longint):Boolean;cdecl;external name 'SDL_SetPalette';

    function SDL_MapRGB(format:pSDL_PixelFormat; r:Uint8; g:Uint8; b:Uint8):Uint32;cdecl;external name 'SDL_MapRGB';

    function SDL_MapRGBA(format:pSDL_PixelFormat; r, g, b, a:Uint8):Uint32;cdecl;external name 'SDL_MapRGBA';

    procedure SDL_GetRGB(pixel:Uint32; fmt:pSDL_PixelFormat; var r,g,b:Uint8);cdecl;external name 'SDL_GetRGB';

    procedure SDL_GetRGBA(pixel:Uint32; fmt:pSDL_PixelFormat; var r,g,b,a:Uint8);cdecl;external name 'SDL_GetRGBA';

    function SDL_CreateRGBSurface(flags:Uint32; width:longint; height:longint; depth:longint; Rmask:Uint32;
               Gmask:Uint32; Bmask:Uint32; Amask:Uint32):PSDL_Surface;cdecl;external name 'SDL_CreateRGBSurface';

    function SDL_CreateRGBSurfaceFrom(pixels:pointer; width:longint; height:longint; depth:longint; pitch:longint;
               Rmask:Uint32; Gmask:Uint32; Bmask:Uint32; Amask:Uint32):PSDL_Surface;cdecl;external name 'SDL_CreateRGBSurfaceFrom';

    procedure SDL_FreeSurface(surface:pSDL_Surface);cdecl;external name 'SDL_FreeSurface';

    function SDL_LockSurface(surface:pSDL_Surface):longint;cdecl;external name 'SDL_LockSurface';

    procedure SDL_UnlockSurface(surface:pSDL_Surface);cdecl;external name 'SDL_UnlockSurface';

    function SDL_LoadBMP_RW(src:pSDL_RWops; freesrc:Boolean):PSDL_Surface;cdecl;external name 'SDL_LoadBMP_RW';

    function SDL_SaveBMP_RW(surface:pSDL_Surface; dst:pSDL_RWops; freedst:Boolean):longint;cdecl;external name 'SDL_SaveBMP_RW';

    function SDL_SetColorKey(surface:pSDL_Surface; flag:Uint32; key:Uint32):longint;cdecl;external name 'SDL_SetColorKey';

    function SDL_SetAlpha(surface:pSDL_Surface; flag:Uint32; alpha:Uint8):longint;cdecl;external name 'SDL_SetAlpha';

    function SDL_SetClipRect(surface:pSDL_Surface; rect:pSDL_Rect): SDL_Bool;cdecl;external name 'SDL_SetClipRect';

    procedure SDL_GetClipRect(surface: pSDL_Surface; var rect: SDL_Rect);cdecl;external name 'SDL_GetClipRect';

    function SDL_ConvertSurface(src:pSDL_Surface; fmt:pSDL_PixelFormat; flags:Uint32):PSDL_Surface;cdecl;external name 'SDL_ConvertSurface';

    function SDL_UpperBlit(src:pSDL_Surface; srcrect:pSDL_Rect; dst:pSDL_Surface; dstrect:pSDL_Rect):longint;cdecl;external name 'SDL_UpperBlit';

    function SDL_LowerBlit(src:pSDL_Surface; srcrect:pSDL_Rect; dst:pSDL_Surface; dstrect:pSDL_Rect):longint;cdecl;external name 'SDL_LowerBlit';

    function SDL_FillRect(dst:pSDL_Surface; dstrect:pSDL_Rect; color:Uint32):longint;cdecl;external name 'SDL_FillRect';

    function SDL_DisplayFormat(surface:pSDL_Surface):PSDL_Surface;cdecl;external name 'SDL_DisplayFormat';

    function SDL_DisplayFormatAlpha(surface:pSDL_Surface):pSDL_Surface;cdecl; external name 'SDL_DisplayFormatAlpha';

    function SDL_CreateYUVOverlay (width, height: Longint; format: Uint32;
                                   display: pSDL_Surface): pSDL_Overlay;cdecl;external name 'SDL_CreateYUVOverlay';

    function SDL_LockYUVOverlay(var overlay: SDL_Overlay):Longint;cdecl;external name 'SDL_LockYUVOverlay';

    procedure SDL_UnlockYUVOverlay(var overlay: SDL_Overlay);cdecl;external name 'SDL_UnlockYUVOVerlay';

    function SDL_DisplayYUVOverlay(var overlay:SDL_Overlay; var dstrect: SDL_Rect):Longint;cdecl;external name 'SDL_DisplayYUVOverlay';

    procedure SDL_FreeYUVOverlay(var overlay: SDL_Overlay);cdecl;external name 'SDL_FreeYUVOverlay';

    function SDL_GL_LoadLibrary(path: PChar):Longint;cdecl;external name 'SDL_GL_LoadLibrary';

    procedure SDL_GL_GetProcAddress(proc: PChar);cdecl;external name 'SDL_GL_GetProcAddress';

    function SDL_GL_SetAttribute(attr: SDL_GLattr; value: Longint):Longint;cdecl;external name 'SDL_GL_SetAttribute';

    function SDL_GL_GetAttribute (attr: SDL_GLattr; var value: Longint):Longint;cdecl; external name 'SDL_GL_GetAttribute';

    Procedure SDL_GL_SwapBuffers; cdecl; external name 'SDL_GL_SwapBuffers';

    procedure SDL_WM_SetCaption(title:pchar; icon:pchar);cdecl;external name 'SDL_WM_SetCaption';

    procedure SDL_WM_GetCaption(title:pchar; icon:pchar);cdecl;external name 'SDL_WM_GetCaption';

    procedure SDL_WM_SetIcon(icon:pSDL_Surface; mask:pByte);cdecl;external name 'SDL_WM_SetIcon';  
  
  function SDL_BlitSurface(src:pSDL_Surface; srcrect:pSDL_Rect; dst:pSDL_Surface; dstrect:pSDL_Rect):longint; 

  function SDL_LoadBMP(filename:string): PSDL_Surface;

  {######### Error Handling functions ###########}
  function SDL_GetError: PChar; cdecl; external name 'SDL_GetError';
  procedure SDL_SetError(fmt: PChar); cdecl; external name 'SDL_SetError';  
  procedure SDL_ClearError; cdecl; external name 'SDL_ClearError';

  { Procedure to display a detailed internal SDL error message
    Additional procedure written for Vector Pascal }
  procedure ShowSDLErrorMsg;

  {###SDL_rwops###}
  { Functions to create SDL_RWops structures from various data sources  }

  function SDL_RWFromFile(filename:pasciiarray; mode:pasciiarray):pSDL_RWops;cdecl;external name 'SDL_RWFromFile';

  function SDL_RWFromFP(fp:Pointer; autoclose:longint):pSDL_RWops;cdecl;external name 'SDL_RWFromFP';

  function SDL_RWFromMem(var mem; size:longint):pSDL_RWops;cdecl;external name 'SDL_RWFromMem';

  function SDL_AllocRW:pSDL_RWops;cdecl;external name 'SDL_AllocRW';

  
  function SDL_RWseek(context: pSDL_RWops;offset,whence : longint) : longint; external name 'accessSDL_RWseek'
  function SDL_RWread(ctx : pSDL_RWops; var data;size,n : longint) : longint; external name 'accessSDL_RWread';
  function SDL_RWwrite(ctx : pSDL_RWops; var data;size,n : longint) : longint; external name 'accessSDL_RWclose';
  function SDL_RWclose(ctx : pSDL_RWops) : longint; external name 'accessSDL_RWclose';

  {########SDL_Keyboard#########}
  { Include file for SDL keyboard event handling  }


  type
    PKeyStateArr = ^KeyStateArr;   
    KeyStateArr  = array[0..65000] of UInt8;
     
    SDLKey = UInt8;
    const 
       SDLK_UNKNOWN = 0;
       SDLK_FIRST = 0;
       SDLK_BACKSPACE = 22;
       SDLK_TAB = 23;
       //SDLK_CLEAR = 12;// not setup
       SDLK_RETURN = 36;
       SDLK_PAUSE = 110;
       SDLK_ESCAPE = 9;
       SDLK_SPACE = 65;
       SDLK_EXCLAIM = 33;// not setup
       SDLK_QUOTEDBL = 34;// not setup
       SDLK_HASH = 51;
       SDLK_DOLLAR = 36;// not setup
       SDLK_AMPERSAND = 38;// not setup
       SDLK_QUOTE = 48;
       //SDLK_LEFTPAREN = 40; // not setup
       //SDLK_RIGHTPAREN = 41; // not setup
       //SDLK_ASTERISK = 63; // not setup
       //SDLK_PLUS = 43; // not setup
       SDLK_COMMA = 59;
       SDLK_MINUS = 20;
       SDLK_PERIOD = 60;
       SDLK_SLASH = 61;
       SDLK_0 = 19;
       SDLK_1 = 10;
       SDLK_2 = 11;
       SDLK_3 = 12;
       SDLK_4 = 13;
       SDLK_5 = 14;
       SDLK_6 = 15;
       SDLK_7 = 16;
       SDLK_8 = 17;
       SDLK_9 = 18;
       //SDLK_COLON = 58; // not setup
       SDLK_SEMICOLON = 47;
       //SDLK_LESS = 60; // not setup
       SDLK_EQUALS = 21;
       // SDLK_GREATER = 62; // not setup
       //SDLK_QUESTION = 63; // not setup
       //SDLK_AT = 64; // not setup
       { Skip uppercase letters }
       SDLK_LEFTBRACKET = 34;
       SDLK_BACKSLASH = 94;
       SDLK_RIGHTBRACKET = 35;
       //SDLK_CARET = 94; // not setup
       //SDLK_UNDERSCORE = 95; //not setup
       //SDLK_BACKQUOTE = 96; //not setup
       SDLK_a = 38;
       SDLK_b = 56;
       SDLK_c = 54;
       SDLK_d = 40;
       SDLK_e = 26;
       SDLK_f = 41;
       SDLK_g = 42;
       SDLK_h = 43;
       SDLK_i = 31;
       SDLK_j = 44;
       SDLK_k = 45;
       SDLK_l = 46;
       SDLK_m = 58;
       SDLK_n = 57;
       SDLK_o = 32;
       SDLK_p = 33;
       SDLK_q = 24;
       SDLK_r = 27;
       SDLK_s = 39;
       SDLK_t = 28;
       SDLK_u = 30;
       SDLK_v = 55;
       SDLK_w = 25;
       SDLK_x = 53;
       SDLK_y = 29;
       SDLK_z = 52;
       SDLK_DELETE = 107;
       { End of ASCII mapped keysyms  }
       { International keyboard syms  }
       SDLK_WORLD_0 = 160;      { 0xA0  }
       SDLK_WORLD_1 = 161;
       SDLK_WORLD_2 = 162;
       SDLK_WORLD_3 = 163;
       SDLK_WORLD_4 = 164;
       SDLK_WORLD_5 = 165;
       SDLK_WORLD_6 = 166;
       SDLK_WORLD_7 = 167;
       SDLK_WORLD_8 = 168;
       SDLK_WORLD_9 = 169;
       SDLK_WORLD_10 = 170;
       SDLK_WORLD_11 = 171;
       SDLK_WORLD_12 = 172;
       SDLK_WORLD_13 = 173;
       SDLK_WORLD_14 = 174;
       SDLK_WORLD_15 = 175;
       SDLK_WORLD_16 = 176;
       SDLK_WORLD_17 = 177;
       SDLK_WORLD_18 = 178;
       SDLK_WORLD_19 = 179;
       SDLK_WORLD_20 = 180;
       SDLK_WORLD_21 = 181;
       SDLK_WORLD_22 = 182;
       SDLK_WORLD_23 = 183;
       SDLK_WORLD_24 = 184;
       SDLK_WORLD_25 = 185;
       SDLK_WORLD_26 = 186;
       SDLK_WORLD_27 = 187;
       SDLK_WORLD_28 = 188;
       SDLK_WORLD_29 = 189;
       SDLK_WORLD_30 = 190;
       SDLK_WORLD_31 = 191;
       SDLK_WORLD_32 = 192;
       SDLK_WORLD_33 = 193;
       SDLK_WORLD_34 = 194;
       SDLK_WORLD_35 = 195;
       SDLK_WORLD_36 = 196;
       SDLK_WORLD_37 = 197;
       SDLK_WORLD_38 = 198;
       SDLK_WORLD_39 = 199;
       SDLK_WORLD_40 = 200;
       SDLK_WORLD_41 = 201;
       SDLK_WORLD_42 = 202;
       SDLK_WORLD_43 = 203;
       SDLK_WORLD_44 = 204;
       SDLK_WORLD_45 = 205;
       SDLK_WORLD_46 = 206;
       SDLK_WORLD_47 = 207;
       SDLK_WORLD_48 = 208;
       SDLK_WORLD_49 = 209;
       SDLK_WORLD_50 = 210;
       SDLK_WORLD_51 = 211;
       SDLK_WORLD_52 = 212;
       SDLK_WORLD_53 = 213;
       SDLK_WORLD_54 = 214;
       SDLK_WORLD_55 = 215;
       SDLK_WORLD_56 = 216;
       SDLK_WORLD_57 = 217;
       SDLK_WORLD_58 = 218;
       SDLK_WORLD_59 = 219;
       SDLK_WORLD_60 = 220;
       SDLK_WORLD_61 = 221;
       SDLK_WORLD_62 = 222;
       SDLK_WORLD_63 = 223;
       SDLK_WORLD_64 = 224;
       SDLK_WORLD_65 = 225;
       SDLK_WORLD_66 = 226;
       SDLK_WORLD_67 = 227;
       SDLK_WORLD_68 = 228;
       SDLK_WORLD_69 = 229;
       SDLK_WORLD_70 = 230;
       SDLK_WORLD_71 = 231;
       SDLK_WORLD_72 = 232;
       SDLK_WORLD_73 = 233;
       SDLK_WORLD_74 = 234;
       SDLK_WORLD_75 = 235;
       SDLK_WORLD_76 = 236;
       SDLK_WORLD_77 = 237;
       SDLK_WORLD_78 = 238;
       SDLK_WORLD_79 = 239;
       SDLK_WORLD_80 = 240;
       SDLK_WORLD_81 = 241;
       SDLK_WORLD_82 = 242;
       SDLK_WORLD_83 = 243;
       SDLK_WORLD_84 = 244;
       SDLK_WORLD_85 = 245;
       SDLK_WORLD_86 = 246;
       SDLK_WORLD_87 = 247;
       SDLK_WORLD_88 = 248;
       SDLK_WORLD_89 = 249;
       SDLK_WORLD_90 = 250;
       SDLK_WORLD_91 = 251;
       SDLK_WORLD_92 = 252;
       SDLK_WORLD_93 = 253;
       SDLK_WORLD_94 = 254;
       SDLK_WORLD_95 = 255;     { 0xFF  }
       { Numeric keypad  }
       SDLK_KP0 = 90;
       SDLK_KP1 = 87;
       SDLK_KP2 = 88;
       SDLK_KP3 = 89;
       SDLK_KP4 = 83;
       SDLK_KP5 = 84;
       SDLK_KP6 = 85;
       SDLK_KP7 = 79;
       SDLK_KP8 = 80;
       SDLK_KP9 = 81;
       SDLK_KP_PERIOD = 91;
       SDLK_KP_DIVIDE = 112;
       SDLK_KP_MULTIPLY = 63;
       SDLK_KP_MINUS = 82;
       SDLK_KP_PLUS = 86;
       SDLK_KP_ENTER = 108;
       //SDLK_KP_EQUALS = 272; // NOT SETUP
       { Arrows + Home/End pad  }
       SDLK_UP = 98;
       SDLK_DOWN = 104;
       SDLK_RIGHT = 102;
       SDLK_LEFT = 100;
       {SDLK_INSERT = 277;
       SDLK_HOME = 278;
       SDLK_END = 279;
       SDLK_PAGEUP = 280;
       SDLK_PAGEDOWN = 281;}// NOT SETUP
       { Function keys  }
       SDLK_F1 = 67;
       SDLK_F2 = 68;
       SDLK_F3 = 69;
       SDLK_F4 = 70;
       SDLK_F5 = 71;
       SDLK_F6 = 72;
       SDLK_F7 = 73;
       SDLK_F8 = 74;
       SDLK_F9 = 75 ;
       SDLK_F10 = 76 ;
       SDLK_F11 = 95 ;
       SDLK_F12 = 96 ;
       //SDLK_F13 = 96 ;// NOT SETUP
       //SDLK_F14 = 80 ;// NOT SETUP
       //SDLK_F15 = 296;// NOT SETUP
       { Key state modifier keys  }
       SDLK_NUMLOCK = 77;
       SDLK_CAPSLOCK = 66;
       SDLK_SCROLLOCK = 78;
       SDLK_RSHIFT = 62;
       SDLK_LSHIFT = 50;
       SDLK_RCTRL = 109;
       SDLK_LCTRL = 37;
       SDLK_RALT = 113;
       SDLK_LALT = 64;
       //SDLK_RMETA = 309;// NOT SETUP
       //SDLK_LMETA = 310;// NOT SETUP
       SDLK_LSUPER = 115;       { Left "Windows" key  }
       SDLK_RSUPER = 116;       { Right "Windows" key  }
       //SDLK_MODE = 313; // NOT SETUP        { "Alt Gr" key  }
       //SDLK_COMPOSE = 314;    // NOT SETUP  { Multi-key compose key  }
       { Miscellaneous function keys  }
       //SDLK_HELP = 315;// NOT SETUP
       SDLK_PRINT = 111;
       SDLK_SYSREQ = 111;
       //SDLK_BREAK = 318;// NOT SETUP
       SDLK_MENU = 117;
       { Power Macintosh power key  }
       //SDLK_POWER = 320;// NOT SETUP
       { Some european keyboards  }
       //SDLK_EURO = 321;// NOT SETUP
       { Add any other keys here  }
       SDLK_LAST = 322;

  type
     SDLMod =  Longint;
       Const
       { Enumeration of valid key mods (possibly OR'd together)  }
       KMOD_NONE = $0000;
       KMOD_LSHIFT = $0001;
       KMOD_RSHIFT = $0002;
       KMOD_LCTRL = $0040;
       KMOD_RCTRL = $0080;
       KMOD_LALT = $0100;
       KMOD_RALT = $0200;
       KMOD_LMETA = $0400;
       KMOD_RMETA = $0800;
       KMOD_NUM = $1000;
       KMOD_CAPS = $2000;
       KMOD_MODE = $4000;
       KMOD_RESERVED = $8000;

     KMOD_CTRL = KMOD_LCTRL or KMOD_RCTRL;
     KMOD_SHIFT = KMOD_LSHIFT or KMOD_RSHIFT;
     KMOD_ALT = KMOD_LALT or KMOD_RALT;
     KMOD_META = KMOD_LMETA or KMOD_RMETA;
  { ***end of SDL_keysym.h***}

  { Keysym structure
     - The scancode is hardware dependent, and should not be used by general
       applications.  If no hardware scancode is available, it will be 0.
  
     - The 'unicode' translated character is only available when character
       translation is enabled by the SDL_EnableUNICODE API.  If non-zero,
       this is a UNICODE character corresponding to the keypress.  If the
       high 9 bits of the character are 0, then this maps to the equivalent
       ASCII character:
  	var
          ch:char;
          
  	if (keysym.unicode and $FF80) = 0  then
  	  ch := keysym.unicode and 0x7F
  	else
  	  An international character...
  	
    }
  type
     SDL_keysym = record
          scancode : Uint8;     { hardware specific scancode  }
          sym : SDLKey;         { SDL virtual keysym  }
          modifier : SDLMod;    { current key modifiers  }
          unicode : Uint16;     { translated character  }
       end;

  const
     { This is the mask which refers to all hotkey bindings }
     SDL_ALL_HOTKEYS = $FFFFFFFF;

  { Function prototypes  }
  {
     Enable/Disable UNICODE translation of keyboard input.
     This translation has some overhead, so translation defaults off.
     If 'enable' is 1, translation is enabled.
     If 'enable' is 0, translation is disabled.
     If 'enable' is -1, the translation state is not changed.
     It returns the previous state of keyboard translation.
    }

  function SDL_EnableUNICODE(enable:longint):longint;cdecl; external name 'SDL_EnableUNICODE';

  {
     Get a snapshot of the current state of the keyboard.
     Returns an array of keystates, indexed by the SDLK_  syms.
     Used:
     	keystate: PBoolArray;
        
        keystate := SDL_GetKeyState(nil);
        if keystate[SDLK_RETURN] then
    	  ... <RETURN> is pressed
    }
  function SDL_GetKeyState(var numkeys:longint):PKeyStateArr;cdecl; external name 'SDL_GetKeyState';

  {
     Get the current key modifier state
    }
  function SDL_GetModState:SDLMod;cdecl;external name 'SDL_GetModState';

  {
     Set the current key modifier state
     This does not change the keyboard state, only the key modifier flags.
    }
  procedure SDL_SetModState(modstate:SDLMod);cdecl;external name 'SDL_SetModState';

  {
     Get the name of an SDL virtual keysym
    }
  function SDL_GetKeyName(key:SDLKey):pchar;cdecl;external name 'SDL_GetKeyName';
  
  {########Additional Mouse functions#######}

{ Retrieve the current state of the mouse.
  The current button state is returned as a button bitmask, which can
  be tested using the SDL_BUTTON(X) macros, and x and y are set to the
  current mouse cursor position.  You can pass NULL for either x or y. }

  type
     
  PSDL_Cursor = ^SDL_Cursor;
  SDL_Cursor = record
    area: SDL_Rect; { The area of the mouse cursor }
    hot_x, hot_y: SInt16; { The "tip" of the cursor }
    data: PUInt8; { B/W cursor data }
    mask: PUInt8; { B/W cursor mask }
    save: array[1..2] of PUInt8; { Place to save cursor area }
    wm_cursor: Pointer; { Window-manager cursor }
  end;
  
  function SDL_GetMouseState(var x: Integer; var y: Integer): UInt8; cdecl; external name 'SDL_GetMouseState';

  { Retrieve the current state of the mouse.
    The current button state is returned as a button bitmask, which can
    be tested using the SDL_BUTTON(X) macros, and x and y are set to the
    mouse deltas since the last call to SDL_GetRelativeMouseState(). }
  function SDL_GetRelativeMouseState(var x: Integer; var y: Integer): UInt8; cdecl; external name 'SDL_GetRelativeMouseState';

  { Set the position of the mouse cursor (generates a mouse motion event) }
  procedure SDL_WarpMouse(x, y: UInt16); cdecl; external name 'SDL_WarpMouse';

  { Create a cursor using the specified data and mask (in MSB format).
    The cursor width must be a multiple of 8 bits.

    The cursor is created in black and white according to the following:
    data  mask    resulting pixel on screen
     0     1       White
     1     1       Black
     0     0       Transparent
     1     0       Inverted color if possible, black if not.

    Cursors created with this function must be freed with SDL_FreeCursor(). }
  function SDL_CreateCursor(data, mask: PUInt8; w, h, hot_x, hot_y: Integer): PSDL_Cursor; cdecl; external name 'SDL_CreateCursor';

  { Set the currently active cursor to the specified one.
    If the cursor is currently visible, the change will be immediately
    represented on the display. }
  procedure SDL_SetCursor(cursor: PSDL_Cursor); cdecl; external name 'SDL_SetCursor';

  { Returns the currently active cursor. }
  function SDL_GetCursor: PSDL_Cursor; cdecl; external name 'SDL_GetCursor';

  { Deallocates a cursor created with SDL_CreateCursor(). }
  procedure SDL_FreeCursor(cursor: PSDL_Cursor); cdecl; external name 'SDL_FreeCursor';

  { Toggle whether or not the cursor is shown on the screen.
    The cursor start off displayed, but can be turned off.
    SDL_ShowCursor() returns 1 if the cursor was being displayed
    before the call, or 0 if it was not.  You can query the current
    state by passing a 'toggle' value of -1. }
  function SDL_ShowCursor(toggle: Integer): Integer; cdecl; external name 'SDL_ShowCursor';

  
  {###########SDL_Joystick ################}
  const
  MAX_JOYSTICKS = 2; // only 2 are supported in the multimedia API
  MAX_AXES = 6; // each joystick can have up to 6 axes
  MAX_BUTTONS = 32; // and 32 buttons
  AXIS_MIN = -32768; // minimum value for axis coordinate
  AXIS_MAX = 32767; // maximum value for axis coordinate
 
  { Get the current state of a POV hat on a joystick
    The return value is one of the following positions: }
  SDL_HAT_CENTERED = $00;
  SDL_HAT_UP = $01;
  SDL_HAT_RIGHT = $02;
  SDL_HAT_DOWN = $04;
  SDL_HAT_LEFT = $08;
  SDL_HAT_RIGHTUP = SDL_HAT_RIGHT or SDL_HAT_UP;
  SDL_HAT_RIGHTDOWN = SDL_HAT_RIGHT or SDL_HAT_DOWN;
  SDL_HAT_LEFTUP = SDL_HAT_LEFT or SDL_HAT_UP;
  SDL_HAT_LEFTDOWN = SDL_HAT_LEFT or SDL_HAT_DOWN;

  type
  //SDL_joystick.h types
  PTransAxis = ^TransAxis;
  TransAxis = record
    offset: Integer;
    scale: double;
  end;

  // The private structure used to keep track of a joystick
  PJoystick_hwdata = ^Joystick_hwdata;
  Joystick_hwdata = record
    // joystick ID
    id: Integer;
  end;

  PBallDelta = ^BallDelta;
  BallDelta = record
    dx: Integer;
    dy: Integer;
  end; // Current ball motion deltas

  // The SDL joystick structure
  PSDL_Joystick = ^SDL_Joystick;
  SDL_Joystick = record
    index: UInt8; // Device index

    naxes: Integer; // Number of axis controls on the joystick
    axes: PUInt16; // Current axis states

    nhats: Integer; // Number of hats on the joystick
    hats: PUInt8; // Current hat states

    nballs: Integer; // Number of trackballs on the joystick
    balls: PBallDelta; // Current ball motion deltas

    nbuttons: Integer; // Number of buttons on the joystick
    buttons: PUInt8; // Current button states

    hwdata: PJoystick_hwdata; // Driver dependent information

    ref_count: Integer; // Reference count for multiple opens
  end;

  { Count the number of joysticks attached to the system }
  function SDL_NumJoysticks: Integer; cdecl; external name 'SDL_NumJoysticks';

  { Get the implementation dependent name of a joystick.
    This can be called before any joysticks are opened.
    If no name can be found, this function returns NULL. }
  function SDL_JoystickName(index: Integer): PChar; cdecl; external name 'SDL_JoystickName';

  { Open a joystick for use - the index passed as an argument refers to
    the N'th joystick on the system.  This index is the value which will
    identify this joystick in future joystick events.

    This function returns a joystick identifier, or NULL if an error occurred. }
  function SDL_JoystickOpen(index: Integer): PSDL_Joystick; cdecl; external name 'SDL_JoystickOpen';

  { Returns 1 if the joystick has been opened, or 0 if it has not. }
  function SDL_JoystickOpened(index: Integer): Integer; cdecl; external name 'SDL_JoystickOpened';

  { Get the device index of an opened joystick. }
  function SDL_JoystickIndex(joystick: PSDL_Joystick): Integer; cdecl; external name 'SDL_JoystickIndex';

  { Get the number of general axis controls on a joystick }
  function SDL_JoystickNumAxes(joystick: PSDL_Joystick): Integer; cdecl; external name 'SDL_JoystickNumAxes';

  { Get the number of trackballs on a joystick
    Joystick trackballs have only relative motion events associated
    with them and their state cannot be polled. }
  function SDL_JoystickNumBalls(joystick: PSDL_Joystick): Integer; cdecl; external name 'SDL_JoystickNumBalls';


  { Get the number of POV hats on a joystick }
  function SDL_JoystickNumHats(joystick: PSDL_Joystick): Integer; cdecl; external name 'SDL_JoystickNumHats';

  { Get the number of buttons on a joystick }
  function SDL_JoystickNumButtons(joystick: PSDL_Joystick): Integer; cdecl; external name 'SDL_JoystickNumButtons';

  { Update the current state of the open joysticks.
    This is called automatically by the event loop if any joystick
    events are enabled. }
  procedure SDL_JoystickUpdate; cdecl; external name 'SDL_JoystickUpdate';
 
  { Enable/disable joystick event polling.
    If joystick events are disabled, you must call SDL_JoystickUpdate()
    yourself and check the state of the joystick when you want joystick
    information.
    The state can be one of SDL_QUERY, SDL_ENABLE or SDL_IGNORE. }
  function SDL_JoystickEventState(state: Integer): Integer; cdecl; external name 'SDL_JoystickEventState';

  { Get the current state of an axis control on a joystick
    The state is a value ranging from -32768 to 32767.
    The axis indices start at index 0. }
  function SDL_JoystickGetAxis(joystick: PSDL_Joystick; axis: Integer): SInt16; cdecl; external name 'SDL_JoystickGetAxis';

  { The hat indices start at index 0. }
  function SDL_JoystickGetHat(joystick: PSDL_Joystick; hat: Integer): UInt8; cdecl; external name 'SDL_JoystickGetHat';

  { Get the ball axis change since the last poll
    This returns 0, or -1 if you passed it invalid parameters.
    The ball indices start at index 0. }
  function SDL_JoystickGetBall(joystick: PSDL_Joystick; ball: Integer; var dx: Integer; var dy: Integer): Integer; 
  cdecl; external name 'SDL_JoystickGetBall';

  { Get the current state of a button on a joystick. The button indices start at index 0. }
  function SDL_JoystickGetButton(joystick: PSDL_Joystick; Button: Integer): UInt8; cdecl; external name 'SDL_JoystickGetButton';

  { Close a joystick previously opened with SDL_JoystickOpen() }
  procedure SDL_JoystickClose(joystick: PSDL_Joystick); cdecl; external name 'SDL_JoystickClose';

  {########SDL_Events###########}
  const
  { Event enumerations  }
    SDL_NOEVENT=0;                      { Unused (do not remove) }
    SDL_EVENTACTIVE=1;                  { Application loses/gains visibility }
    SDL_KEYDOWN=2;                      { Keys pressed }
    SDL_KEYUP=3;                        { Keys released }
    SDL_MOUSEMOTION=4;                  { Mouse moved }
    SDL_MOUSEBUTTONDOWN=5;              { Mouse button pressed }
    SDL_MOUSEBUTTONUP=6;                { Mouse button released }
    SDL_JOYAXISMOTION=7;                { Joystick axis motion }
    SDL_JOYBALLMOTION=8;                { Joystick trackball motion }
    SDL_JOYHATMOTION=9;                 { Joystick hat position change }
    SDL_JOYBUTTONDOWN=10;               { Joystick button pressed }
    SDL_JOYBUTTONUP=11;                 { Joystick button released }
    SDL_EVENTQUIT=12;                   { User-requested quit }
    SDL_EVENTSYSWM=13;                  { System specific event }
    SDL_EVENT_RESERVEDA=14;             { Reserved for future use }
    SDL_EVENT_RESERVEDB=15;             { Reserved for future use }
    SDL_VIDEORESIZE=16;                 { User resized video mode }
    SDL_VIDEOEXPOSE=17;                 { Screen needs to be redrawn }
    SDL_EVENT_RESERVED2=18;             { Reserved for future use }
    SDL_EVENT_RESERVED3=19;             { Reserved for future use }
    SDL_EVENT_RESERVED4=20;             { Reserved for future use }
    SDL_EVENT_RESERVED5=21;             { Reserved for future use }
    SDL_EVENT_RESERVED6=22;             { Reserved for future use }
    SDL_EVENT_RESERVED7=23;             { Reserved for future use }
       { Events SDL_USEREVENT through SDL_MAXEVENTS-1 are for your use }
    SDL_EVENTUSER = 24;
       { This last event is only for bounding internal arrays
	  It is the number of bits in the event mask datatype -- Uint32
        }
    SDL_NUMEVENTS = 32;

  { Predefined event masks }
    SDL_ACTIVEEVENTMASK         = 1 shl (SDL_EVENTACTIVE);
    SDL_KEYDOWNMASK             = 1 shl (SDL_KEYDOWN);
    SDL_KEYUPMASK               = 1 shl (SDL_KEYUP);
    SDL_MOUSEMOTIONMASK         = 1 shl (SDL_MOUSEMOTION);
    SDL_MOUSEBUTTONDOWNMASK     = 1 shl (SDL_MOUSEBUTTONDOWN);
    SDL_MOUSEBUTTONUPMASK       = 1 shl (SDL_MOUSEBUTTONUP);
    SDL_MOUSEEVENTMASK          = SDL_MOUSEMOTIONMASK or 
                                  SDL_MOUSEBUTTONDOWNMASK or
                                  SDL_MOUSEBUTTONUPMASK;
    SDL_JOYAXISMOTIONMASK       = 1 shl (SDL_JOYAXISMOTION);
    SDL_JOYBALLMOTIONMASK       = 1 shl (SDL_JOYBALLMOTION);
    SDL_JOYHATMOTIONMASK        = 1 shl (SDL_JOYHATMOTION);
    SDL_JOYBUTTONDOWNMASK       = 1 shl (SDL_JOYBUTTONDOWN);
    SDL_JOYBUTTONUPMASK         = 1 shl (SDL_JOYBUTTONUP);
    SDL_JOYEVENTMASK            = SDL_JOYAXISMOTIONMASK or
                                  SDL_JOYBALLMOTIONMASK or
                                  SDL_JOYHATMOTIONMASK or
                                  SDL_JOYBUTTONDOWNMASK or
                                  SDL_JOYBUTTONUPMASK;
    SDL_VIDEORESIZEMASK         = 1 shl (SDL_VIDEORESIZE);
    SDL_VIDEOEXPOSEMASK         = 1 shl (SDL_VIDEOEXPOSE);
    SDL_QUITMASK                = 1 shl (SDL_EVENTQUIT);
    SDL_SYSWMEVENTMASK          = 1 shl (SDL_EVENTSYSWM);

    SDL_ALLEVENTS = $FFFFFFFF;

    type

    { Application visibility event structure  }
       SDL_ActiveEvent = record
            eventtype : Uint8; { SDL_ACTIVEEVENT }
            gain : Uint8;      { Whether given state were gained or lost (1/0) }
            state : Uint8;     { A mask of the focus states }
         end;

    { Keyboard event structure  }
       SDL_KeyboardEvent = record
            eventtype : Uint8;   { SDL_KEYDOWN or SDL_KEYUP }
            which : Uint8;       { The keyboard edvice index }
            state : Uint8;       { SDL_PRESSED or SDL_RELEASED }
            keysym : SDL_keysym;
         end;

    { Mouse motion event structure  }
       SDL_MouseMotionEvent = record
            eventtype : Uint8; { SDL_MOUSEMOTION }
            which : Uint8;     { The mouse device index }
            state : Uint8;     { The current button state }
            x, y : Uint16;     { The x/y coordinates of the mouse }
            xrel : Sint16;     { The relative motion in X direction }
            yrel : Sint16;     { The relative motion in Y  direction }
         end;

    { Mouse button event structure  }
       SDL_MouseButtonEvent = record
            eventtype : Uint8; { SDL_MOUSEBUTTONDOWN or SDL_MOUSEBUTTONUP }
            which : Uint8;     { The mouse device index }
            button : Uint8;    { The mouse button index }
            state : Uint8;     { SDL_PRESSED or SDL_RELEASED }
            x, y : Uint16;     { The X/Y coordinates of the mouse at press time }
         end;

    { Joystick axis motion event structure  }
       SDL_JoyAxisEvent = record
            eventtype : Uint8; { SDL_JOYAXISMOTION }
            which : Uint8;     { The joystick device index }
            axis : Uint8;      { The joystick axis index }
            value : Uint16;    { The axis value: (range: -32768 to 32768) }
         end;

    { Joystick trackball motion event structure  }
       SDL_JoyBallEvent = record
            eventtype : Uint8; { SDL_JOYBALLMOTION }
            which : Uint8;     { The joystick device index }
            ball : Uint8;      { The joystick trackball index }
            xrel : Uint16;     { The relative motion in X direction }
            yrel : Uint16;     { The relative motion in Y direction }
         end;

    { Joystick hat position change event structure  }
       SDL_JoyHatEvent = record
            eventtype : Uint8; { SDL_JOYHATMOTION }
            which : Uint8;     { The joystick device index }
            hat : Uint8;       { The joystick hat index }
            value : Uint16;    { The hat position value 
                                  8   1   2
                                  7   0   3
                                  6   5   4
			         Note that zero means the POV is centered.
                               }
         end;

    { Joystick button event structure  }
       SDL_JoyButtonEvent = record
            eventtype : Uint8; { SDL_JOYBUTTONDOWN or SDL_JOYBUTTONUP }
            which : Uint8;     { The joystick device index }
            button : Uint8;    { The joystick button index }
            state : Uint8;     { SDL_PRESSED or SDL_RELEASED }
         end;

    { The "window resized" event 
       When you get this event you are responsible for setting a new video
       mode with the new width and height.
    }
       SDL_ResizeEvent = record
            eventtype : Uint8; { SDL_VIDEORESIZE}
            w : Longint;       { New width }
            h : Longint;       { New height }
         end;

    { The "screen redraw" event }
       SDL_ExposeEvent = record
            eventtype : Uint8; { SDL_VIDEOEXPOSE }
         end;

    { The "quit requested" event }
       SDL_QuitEvent = record
            eventtype : Uint8; { SDL_QUIT }
         end;

    { A user defined event type }
       SDL_UserEvent = record
            eventtype : Uint8; { SDL_USEREVENT through SDL_NUMEVENTS-1 }
            code: Longint;     { User defined event code }
            data1: Pointer;    { User defined data pointer }
            data2: Pointer;    { User defined data pointer }
         end;

    { If you want to use this event, you should include SDL_syswm.h  }
       PSDL_SysWMmsg = ^SDL_SysWMmsg;
       SDL_SysWMEvent = record
            eventtype : Uint8;
            msg : PSDL_SysWMmsg;
         end;

    { General event structure  }
       PSDL_Event = ^SDL_Event;
       SDL_Event = record
           case longint of
              0 : ( eventtype : Uint8 );
              1 : ( active : SDL_ActiveEvent );
              2 : ( key : SDL_KeyboardEvent );
              3 : ( motion : SDL_MouseMotionEvent );
              4 : ( button : SDL_MouseButtonEvent );
              5 : ( jaxis : SDL_JoyAxisEvent );
              6 : ( jball : SDL_JoyBallEvent );
              7 : ( jhat : SDL_JoyHatEvent );
              8 : ( jbutton : SDL_JoyButtonEvent );
              9 : ( resize : SDL_ResizeEvent );
              10: ( expose : SDL_ExposeEvent );
              11: ( quit : SDL_QuitEvent );
              12: ( user : SDL_UserEvent );
              13: ( syswm : SDL_SysWMEvent );
	   end; { case }
		      
    { SDL_Event Function prototypes  }
    { Pumps the event loop, gathering events from the input devices.
       This function updates the event queue and internal input device state.
       This should only be run in the thread that sets the video mode.
     }

    procedure SDL_PumpEvents;cdecl; external name 'SDL_PumpEvents'; 

    { Checks the event queue for messages and optionally returns them.
       If 'action' is SDL_ADDEVENT, up to 'numevents' events will be added to
       the back of the event queue.
       If 'action' is SDL_PEEKEVENT, up to 'numevents' events at the front
       of the event queue, matching 'mask', will be returned and will not
       be removed from the queue.
       If 'action' is SDL_GETEVENT, up to 'numevents' events at the front 
       of the event queue, matching 'mask', will be returned and will be
       removed from the queue.
       This function returns the number of events actually stored, or -1
       if there was an error.  This function is thread-safe.
     }

    type

       SDL_eventaction =  Longint;
         Const
         SDL_ADDEVENT = 0;
         SDL_PEEKEVENT = 1;
         SDL_GETEVENT = 2;

       function SDL_PeepEvents(var events:SDL_Event; numevents:longint; action:SDL_eventaction; mask:Uint32):longint;cdecl; external name 'SDL_PeepEvents';

    { Polls for currently pending events, and returns 1 if there are any pending
       events, or 0 if there are none available.  If 'event' is not nil, the next
       event is removed from the queue and stored in that area.
      }
    function SDL_PollEvent(event:pSDL_Event):longint;cdecl; external name 'SDL_PollEvent';

    { Waits indefinitely for the next available event, returning 1, or 0 if there
       was an error while waiting for events.  If 'event' is not nil, the next
       event is removed from the queue and stored in that area.
      }
    function SDL_WaitEvent(event:pSDL_Event):longint;cdecl; external name 'SDL_WaitEvent';

    { Add an event to the event queue.
       This function returns 0, or -1 if the event couldn't be added to
       the event queue.  If the event queue is full, this function fails.
    }
    function SDL_PushEvent (var event: SDL_Event):longint;cdecl; external name 'SDL_PushEvent';
    
    {
      This function sets up a filter to process all events before they
      change internal state and are posted to the internal event queue.
    
      The filter is protypted as:
     }
    type
       //function SDL_EventFilter(event:pSDL_Event):longint;cdecl; external name 'SDL_EventFilter';
    {
      If the filter returns 1, then the event will be added to the internal queue.
      If it returns 0, then the event will be dropped from the queue, but the 
      internal state will still be updated.  This allows selective filtering of
      dynamically arriving events.
    
      WARNING:  Be very careful of what you do in the event filter function, as 
                it may run in a different thread!
    
      There is one caveat when dealing with the SDL_QUITEVENT event type.  The
      event filter is only called when the window manager desires to close the
      application window.  If the event filter returns 1, then the window will
      be closed, otherwise the window will remain open if possible.
      If the quit event is generated by an interrupt signal, it will bypass the
      internal queue and be delivered to the application at the next event poll.
     }

    //procedure SDL_SetEventFilter(filter:SDL_EventFilter);cdecl; external name 'SDL_SetEventFilter';

    { Return the current event filter - can be used to "chain" filters.
      If there is no filter set, this function returns nil.
    }
    //function SDL_GetEventFilter:SDL_EventFilter;cdecl; external name 'SDL_GetEventFilter';
    
    {
      This function allows you to set the state of processing certain events.
      If 'state' is set to SDL_IGNORE, that event will be automatically dropped
      from the event queue and will not event be filtered.
      If 'state' is set to SDL_ENABLE, that event will be processed normally.
      If 'state' is set to SDL_QUERY, SDL_EventState will return the 
      current processing state of the specified event.
     }

    const
       SDL_QUERY = -(1);
       SDL_IGNORE = 0;
       SDL_DISABLE = 0;
       SDL_ENABLE = 1;

    function SDL_EventState(eventtype:Uint8; state:longint):Uint8;cdecl; external name 'SDL_EventState';
   
  {####SDL_Timer####}
  { Header for the SDL time management routines  }

  const
     { This is the OS scheduler timeslice, in milliseconds }
     SDL_TIMESLICE = 10;
     { This is the maximum resolution of the timer on all platforms }
     TIMER_RESOLUTION = 10;  { Experimentally determined  }

  { Get the number of milliseconds since the SDL library initialization.
     Note that this value wraps if the program runs for more than ~49 days.
    }
  function SDL_GetTicks:Uint32;cdecl;external name 'SDL_GetTicks';
  
  { Wait a specified number of milliseconds before returning  }
  procedure SDL_Delay(ms:Uint32);cdecl;external name 'SDL_Delay';

  type
  { Function prototype for the timer callback function  }
     {SDL_TimerCallback = function (interval:Uint32):Longbool;cdecl;}

  { Set a callback to run after the specified number of milliseconds has
     elapsed. The callback function is passed the current timer interval
     and returns the next timer interval.  If the returned value is the 
     same as the one passed in, the periodic alarm continues, otherwise a
     new alarm is scheduled. If the callback returns False, the periodic
     alarm is cancelled. 
    
     To cancel a currently running timer, call SDL_SetTimer(0, nil);
    
     The timer callback function may run in a different thread than your
     main code, and so shouldn't call any functions from within itself.
    
     The maximum resolution of this timer is 10 ms, which means that if
     you request a 16 ms timer, your callback will run approximately 20 ms
     later on an unloaded system.  If you wanted to set a flag signaling
     a frame update at 30 frames per second (every 33 ms), you might set a 
     timer for 30 ms:
       SDL_SetTimer((33 div 10)*10, flag_update);
    
     If you use this function, you need to pass SDL_INIT_TIMER to SDL_Init.
    
     Under UNIX, you should not use raise or use SIGALRM and this function
     in the same program, as it is implemented using setitimer().  You also
     should not use this function in multi-threaded applications as signals
     to multi-threaded apps have undefined behavior in some implementations.
    }
  {function SDL_SetTimer(interval:Uint32; callback:SDL_TimerCallback):longint;cdecl;}

  { New timer API, supports multiple timers
    Written by Stephane Peter <megastep@lokigames.com> }

  { Function prototypye for the new timer callback function.
    The callback function is passed the current timer interval and returns
    the next timer interval.  If the returned value is the same as the one
    passed in, the periodic alarm continues, otherwise a new alarm is
    scheduled.  If the callback returns 0, the periodic alarm is cancelled.
  }
  type
    {SDL_NewTimerCallback = function (interval: Uint32;
                                      param: Pointer):Uint32; cdecl;}

     _SDL_TimerID = record end ; { No public Data}
     SDL_TimerID = ^_SDL_TimerID ;
     
  { Add a new timer to the pool of timers already running.
    Returns a timer ID, or Nil when an error occurs.
  }
  {function SDL_AddTimer (interval: Uint32; callback: SDL_NewTimerCallback; 
                         param: Pointer): SDL_TimerID ; cdecl;}

  { Remove one of the multiple timers knowing its ID.
    Returns a boolean value indicating success.
  }
  function SDL_RemoveTimer (t: SDL_TimerID): SDL_bool;cdecl; external name 'SDL_RemoveTimer';
  
  {####SDL_cdrom####}
  const
     SDL_MAX_TRACKS = 99;
  { The types of CD-ROM track possible  }
     SDL_AUDIO_TRACK = $00;
     SDL_DATA_TRACK = $04;
  { The possible states which a CD-ROM drive can be in.  }

  type

     CDstatus =  Longint;
       Const
       CD_TRAYEMPTY = 0;
       CD_STOPPED = 1;
       CD_PLAYING = 2;
       CD_PAUSED = 3;
       CD_ERROR = -(1);

  { Given a status, returns true if there's a disk in the drive  }
  function CD_INDRIVE(status : longint) : Boolean;

  type

     SDL_CDtrack = record
          id : Uint8;         { Track number  }
          track_type : Uint8; { Data or audio track  }
          unused: Uint16;
          length : Uint32;    { Length, in frames, of this track  }
          offset : Uint32;    { Offset, in frames, from start of disk  }
       end;
  { This structure is only current as of the last call to SDL_CDStatus  }

     PSDL_CD = ^SDL_CD ;
     SDL_CD = record
          id : longint;        { Private drive identifier  }
          status : CDstatus;   { Current drive status  }
          numtracks : longint; { The rest of this structure is only valid if there's a CD in drive  }
          cur_track : longint; { Number of tracks on disk  }
          cur_frame : longint; { Current track position  }
          { Current frame offset within current track  }
          track : array[0..SDL_MAX_TRACKS] of SDL_CDtrack;
       end;

  { Conversion functions from frames to Minute/Second/Frames and vice versa  }

  const
     CD_FPS = 75;

    procedure FRAMES_TO_MSF(v: Longint; var m,s,f: Longint);

    { CD-audio API functions:  }

    { Returns the number of CD-ROM drives on the system, or -1 if
       SDL_Init has not been called with the SDL_INIT_CDROM flag.
      }
    function SDL_CDNumDrives:Longint;cdecl; external name 'SDL_CDNumDrives';

    { Returns a human-readable, system-dependent identifier for the CD-ROM.
       Example:
    	"/dev/cdrom"
    	"E:"
    	"/dev/disk/ide/1/master"
     }
    function SDL_CDName(drive:longint):Pchar;cdecl; external name 'SDL_CDName';

    { Opens a CD-ROM drive for access.  It returns a drive handle on success,
       or NULL if the drive was invalid or busy.  This newly opened CD-ROM
       becomes the default CD used when other CD functions are passed a NULL
       CD-ROM handle.
       Drives are numbered starting with 0.  Drive 0 is the system default CD-ROM.
     }
    function SDL_CDOpen(drive:longint):PSDL_CD;cdecl; external name 'SDL_CDOpen';

    { This function returns the current status of the given drive.
       If the drive has a CD in it, the table of contents of the CD and current
       play position of the CD will be stored in the SDL_CD structure.
     }
    function SDL_CDStatus(cdrom:pSDL_CD):CDstatus;cdecl; external name 'SDL_CDStatus';

    { Play the given CD starting at 'start_track' and 'start_frame' for 'ntracks'
       tracks and 'nframes' frames.  If both 'ntrack' and 'nframe' are 0, play
       until the end of the CD.  This function will skip data tracks.
       This function should only be called after calling SDL_CDStatus to
       get track information about the CD.
       For example:
    	(* Play entire CD: *)
    	if CD_INDRIVE(SDL_CDStatus(cdrom)) then
    		SDL_CDPlayTracks(cdrom, 0, 0, 0, 0);
    	(* Play last track: *)
    	if CD_INDRIVE(SDL_CDStatus(cdrom)) then
    		SDL_CDPlayTracks(cdrom, cdrom^.numtracks-1, 0, 0, 0);
    	(* Play first and second track and 10 seconds of third track: *0
    	if CD_INDRIVE(SDL_CDStatus(cdrom)) then
    		SDL_CDPlayTracks(cdrom, 0, 0, 2, 10);

       This function returns 0, or -1 if there was an error.
     }
    function SDL_CDPlayTracks(var cdrom:pSDL_CD; start_track:longint; start_frame:longint; ntracks:longint; nframes:longint):longint;cdecl; external name 'SDL_CDPlayTracks';

    { Play the given CD starting at 'start' frame for 'length' frames.
       It returns 0, or -1 if there was an error.
     }
    function SDL_CDPlay(cdrom:pSDL_CD; start:longint; length:longint):longint;cdecl; external name 'SDL_CDPlay';

    { Pause play -- returns 0, or -1 on error  }
    function SDL_CDPause(cdrom:pSDL_CD):longint;cdecl; external name 'SDL_CDPause';

    { Resume play -- returns 0, or -1 on error  }
    function SDL_CDResume(cdrom:pSDL_CD):longint;cdecl; external name 'SDL_CDResume';

    { Stop play -- returns 0, or -1 on error  }
    function SDL_CDStop(cdrom:pSDL_CD):longint;cdecl; external name 'SDL_CDStop';

    { Eject CD-ROM -- returns 0, or -1 on error  }
    function SDL_CDEject(cdrom:pSDL_CD):longint;cdecl; external name 'SDL_CDEject';

    { Closes the handle for the CD-ROM drive  }
    procedure SDL_CDClose(cdrom:pSDL_CD);cdecl; external name 'SDL_CDClose';

  {######SDL_Audio######}
  type
  { Access to the raw audio mixing buffer for the SDL library  }
    { The calculated values in this structure are calculated by SDL_OpenAudio  }
     pSDL_AudioSpec = ^SDL_AudioSpec;
     SDL_AudioSpec = record
          freq : longint;       { DSP frequency -- samples per second  }
          format : Uint16;      { Audio data format  }
          channels : Uint8;     { Number of channels: 1 mono, 2 stereo  }
          silence : Uint8;      { Audio buffer silence value (calculated)  }
          samples : Uint16;     { Audio buffer size in samples  }
          size : Uint32;        { Audio buffer size in bytes (calculated)  }
          { This function is called when the audio device needs more data.
  	   'stream' is a pointer to the audio data buffer
  	   'len' is the length of that buffer in bytes.
  	   Once the callback returns, the buffer will no longer be valid.
           Stereo samples are stored in a LRLRLR ordering.
          }
	  callback : pointer;
          userdata : pointer;
       end;

  const
  { Audio format flags (defaults to LSB byte order)  }
     { Unsigned 8-bit samples  }
     AUDIO_U8 = $0008;
     { Signed 8-bit samples  }
     AUDIO_S8 = $8008;
     { Unsigned 16-bit samples  }
     AUDIO_U16LSB = $0010;
     { Signed 16-bit samples  }
     AUDIO_S16LSB = $8010;
     { As above, but big-endian byte order  }
     AUDIO_U16MSB = $1010;
     { As above, but big-endian byte order  }
     AUDIO_S16MSB = $9010;
     AUDIO_U16 = AUDIO_U16LSB;
     AUDIO_S16 = AUDIO_S16LSB;

  type
   { A structure to hold a set of audio conversion filters and buffers  }

     pSDL_AudioCVT = ^SDL_AudioCVT;
     //SDL_FilterFunction = procedure (cvt:pSDL_AudioCVT; format:Uint16);cdecl;
     SDL_AudioCVT = record
          needed : longint;     { Set to 1 if conversion possible  }
          src_format : Uint16;  { Source audio format  }
          dst_format : Uint16;  { Target audio format  }
          rate_incr : double;   { Rate conversion increment  }
          buf : ^Uint8;         { Buffer to hold entire audio data  }
          len : longint;        { Length of original audio buffer  }
          len_cvt : longint;    { Length of converted audio buffer  }
          len_mult : longint;   { buffer must be len*len_mult big  }
          len_ratio : double;   { Given len, final size is len*len_ratio  }
          //filters : array[0..9] of SDL_FilterFunction;
          filter_index : longint;{ Current audio conversion function  }
       end;

  { Function prototypes  }

  {
     This function opens the audio device with the desired parameters, and
     returns 0 if successful, placing the actual hardware parameters in the
     structure pointed to by 'obtained'.  If 'obtained' is nil, the audio
     data passed to the callback function will be guaranteed to be in the
     requested format, and will be automatically converted to the hardware
     audio format if necessary.  This function returns -1 if it failed 
     to open the audio device, or couldn't set up the audio thread.
    
     When filling in the desired audio spec structure,
      'desired^.freq' should be the desired audio frequency in samples-per-second.
      'desired^.format' should be the desired audio format.
      'desired^.samples' is the desired size of the audio buffer, in samples.
         This number should be a power of two, and may be adjusted by the audio
         driver to a value more suitable for the hardware.  Good values seem to
         range between 512 and 8096 inclusive, depending on the application and
         CPU speed.  Smaller values yield faster response time, but can lead
         to underflow if the application is doing heavy processing and cannot
         fill the audio buffer in time.  A stereo sample consists of both right
         and left channels in LR ordering.
         Note that the number of samples is directly related to time by the
         following formula:  ms = (samples*1000)/freq
      'desired^.size' is the size in bytes of the audio buffer, and is
         calculated by SDL_OpenAudio.
      'desired^.silence' is the value used to set the buffer to silence,
         and is calculated by SDL_OpenAudio.
      'desired^.callback' should be set to a function that will be called
         when the audio device is ready for more data.  It is passed a pointer
         to the audio buffer, and the length in bytes of the audio buffer.
         This function usually runs in a separate thread, and so you should
         protect data structures that it accesses by calling SDL_LockAudio
         and SDL_UnlockAudio in your code.
      'desired^.userdata' is passed as the first parameter to your callback
         function.

     The audio device starts out playing silence when it's opened, and should
     be enabled for playing by calling SDL_PauseAudio(0) when you are ready
     for your audio callback function to be called.  Since the audio driver
     may modify the requested size of the audio buffer, you should allocate
     any local mixing buffers after you open the audio device.
    }

  function SDL_OpenAudio(desired:pSDL_AudioSpec; var obtained:SDL_AudioSpec):longint;cdecl; external name 'SDL_OpenAudio';

  type
    SDL_audiostatus = Longint;
      Const
        SDL_AUDIO_STOPPED = 0 ;
        SDL_AUDIO_PLAYING = 1 ;
        SDL_AUDIO_PAUSED = 2 ;

  { Get the current audio state }
  function SDL_GetAudioStatus: SDL_audiostatus; cdecl; external name 'SDL_GetAudioStatus';
  
  {
     This function pauses and unpauses the audio callback processing.
     It should be called with a parameter of 0 after opening the audio
     device to start playing sound.  This is so you can safely initialize
     data for your callback function after opening the audio device.
     Silence will be written to the audio device during the pause.
    }
     procedure SDL_PauseAudio(pause_on:longint);cdecl; external name 'SDL_PauseAudio';

  {
     This function loads a WAVE from the data source, automatically freeing
     that source if 'freesrc' is True.  For example, to load a WAVE file,
     you could do:
    	SDL_LoadWAV_RW(SDL_RWFromFile('sample.wav', 'rb'), 1, ...);

     If this function succeeds, it returns the given SDL_AudioSpec,
     filled with the audio data format of the wave data, and sets
     'audio_buf' to a getmem'd buffer containing the audio data,
     and sets 'audio_len' to the length of that audio buffer, in bytes.
     You need to free the audio buffer with SDL_FreeWAV when you are
     done with it.

     This function returns nil and sets the SDL error message if the
     wave file cannot be opened, uses an unknown data format, or is
     corrupt.  Currently raw and MS-ADPCM WAVE files are supported.
    }
  function SDL_LoadWAV_RW(src:pSDL_RWops; freesrc:Boolean; spec:pSDL_AudioSpec;
    var audio_buf:pByte; var audio_len:Uint32):pSDL_AudioSpec;cdecl; external name 'SDL_LoadWAV_RW';

  { Compatibility convenience function -- loads a WAV from a file  }
  function SDL_LoadWAV(filename:String; spec:pSDL_AudioSpec;
    var audio_buf:pByte; var audio_len : Uint32) : pSDL_AudioSpec;

  {
     This function frees data previously allocated with SDL_LoadWAV_RW
  }
  procedure SDL_FreeWAV(audio_buf:pByte);cdecl; external name'SDL_FreeWAV';

  {
     This function takes a source format and rate and a destination format
     and rate, and initializes the 'cvt' structure with information needed
     by SDL_ConvertAudio to convert a buffer of audio data from one format
     to the other.
     This function returns 0, or -1 if there was an error.
    }
  function SDL_BuildAudioCVT(cvt:pSDL_AudioCVT; src_format:Uint16; src_channels:Uint8; src_rate:longint; dst_format:Uint16;
             dst_channels:Uint8; dst_rate:longint):longint;cdecl; external name'SDL_BuildAudioCVT';

  { Once you have initialized the 'cvt' structure using SDL_BuildAudioCVT,
     created an audio buffer cvt^.buf, and filled it with cvt^.len bytes of
     audio data in the source format, this function will convert it in-place
     to the desired format.
     The data conversion may expand the size of the audio data, so the buffer
     cvt^.buf should be allocated after the cvt structure is initialized by
     SDL_BuildAudioCVT, and should be cvt^.len*cvt^.len_mult bytes long.
    }
  function SDL_ConvertAudio(cvt:pSDL_AudioCVT):longint;cdecl; external name'SDL_ConvertAudio';

  const
     SDL_MIX_MAXVOLUME = 128;
  {
     This takes two audio buffers of the playing audio format and mixes
     them, performing addition, volume adjustment, and overflow clipping.
     The volume ranges from 0 - 128, and should be set to SDL_MIX_MAXVOLUME
     for full audio volume.  Note this does not change hardware volume.
     This is provided for convenience -- you can mix your own audio data.
    }

  procedure SDL_MixAudio(dst:pByte; src:pByte; len:Uint32; volume:longint);cdecl; external name'SDL_MixAudio';

  {
     The lock manipulated by these functions protects the callback function.
     During a LockAudio/UnlockAudio pair, you can be guaranteed that the
     callback function is not running.  Do not call these from the callback
     function or you will cause deadlock.
    }
  procedure SDL_LockAudio;cdecl; external name'SDL_LockAudio';
  procedure SDL_UnlockAudio;cdecl; external name'SDL_UnlockAudio';

  {
     This function shuts down audio processing and closes the audio device.
  }
  procedure SDL_CloseAudio;cdecl; external name'SDL_CloseAudio';

  
  implementation
  
    { *** masks for implementing the bit fields accesors of SDL_VideoInfo *** }
    const
       bm_SDL_VideoInfo_hw_available = $1;
       bp_SDL_VideoInfo_hw_available = 0;
       bm_SDL_VideoInfo_wm_available = $2;
       bp_SDL_VideoInfo_wm_available = 1;
       bm_SDL_VideoInfo_UnusedBits1 = $FC;
       bp_SDL_VideoInfo_UnusedBits1 = 2;
       bm_SDL_VideoInfo_UnusedBits2 = $100;
       bp_SDL_VideoInfo_UnusedBits2 = 8;
       bm_SDL_VideoInfo_blit_hw = $200;
       bp_SDL_VideoInfo_blit_hw = 9;
       bm_SDL_VideoInfo_blit_hw_CC = $400;
       bp_SDL_VideoInfo_blit_hw_CC = 10;
       bm_SDL_VideoInfo_blit_hw_A = $800;
       bp_SDL_VideoInfo_blit_hw_A = 11;
       bm_SDL_VideoInfo_blit_sw = $1000;
       bp_SDL_VideoInfo_blit_sw = 12;
       bm_SDL_VideoInfo_blit_sw_CC = $2000;
       bp_SDL_VideoInfo_blit_sw_CC = 13;
       bm_SDL_VideoInfo_blit_sw_A = $4000;
       bp_SDL_VideoInfo_blit_sw_A = 14;
       bm_SDL_VideoInfo_blit_fill = $8000;
       bp_SDL_VideoInfo_blit_fill = 15;
       bm_SDL_VideoInfo_UnusedBits3 = $FFFF0000;
       bp_SDL_VideoInfo_UnusedBits3 = 16;

    { *** bit fields accesors of SDL_VideoInfo *** }
    function hw_available(var a : SDL_VideoInfo) : Uint32;
      begin
         hw_available:=(a.flag0 and bm_SDL_VideoInfo_hw_available) shr bp_SDL_VideoInfo_hw_available;
      end;

    procedure set_hw_available(var a : SDL_VideoInfo; __hw_available : Uint32);
      begin
         a.flag0:=a.flag0 or ((__hw_available shl bp_SDL_VideoInfo_hw_available) and bm_SDL_VideoInfo_hw_available);
      end;

    function wm_available(var a : SDL_VideoInfo) : Uint32;
      begin
         wm_available:=(a.flag0 and bm_SDL_VideoInfo_wm_available) shr bp_SDL_VideoInfo_wm_available;
      end;

    procedure set_wm_available(var a : SDL_VideoInfo; __wm_available : Uint32);
      begin
         a.flag0:=a.flag0 or ((__wm_available shl bp_SDL_VideoInfo_wm_available) and bm_SDL_VideoInfo_wm_available);
      end;

    function UnusedBits1(var a : SDL_VideoInfo) : Uint32;
      begin
         UnusedBits1:=(a.flag0 and bm_SDL_VideoInfo_UnusedBits1) shr bp_SDL_VideoInfo_UnusedBits1;
      end;

    procedure set_UnusedBits1(var a : SDL_VideoInfo; __UnusedBits1 : Uint32);
      begin
         a.flag0:=a.flag0 or ((__UnusedBits1 shl bp_SDL_VideoInfo_UnusedBits1) and bm_SDL_VideoInfo_UnusedBits1);
      end;

    function UnusedBits2(var a : SDL_VideoInfo) : Uint32;
      begin
         UnusedBits2:=(a.flag0 and bm_SDL_VideoInfo_UnusedBits2) shr bp_SDL_VideoInfo_UnusedBits2;
      end;

    procedure set_UnusedBits2(var a : SDL_VideoInfo; __UnusedBits2 : Uint32);
      begin
         a.flag0:=a.flag0 or ((__UnusedBits2 shl bp_SDL_VideoInfo_UnusedBits2) and bm_SDL_VideoInfo_UnusedBits2);
      end;

    function blit_hw(var a : SDL_VideoInfo) : Uint32;
      begin
         blit_hw:=(a.flag0 and bm_SDL_VideoInfo_blit_hw) shr bp_SDL_VideoInfo_blit_hw;
      end;

    procedure set_blit_hw(var a : SDL_VideoInfo; __blit_hw : Uint32);
      begin
         a.flag0:=a.flag0 or ((__blit_hw shl bp_SDL_VideoInfo_blit_hw) and bm_SDL_VideoInfo_blit_hw);
      end;

    function blit_hw_CC(var a : SDL_VideoInfo) : Uint32;
      begin
         blit_hw_CC:=(a.flag0 and bm_SDL_VideoInfo_blit_hw_CC) shr bp_SDL_VideoInfo_blit_hw_CC;
      end;

    procedure set_blit_hw_CC(var a : SDL_VideoInfo; __blit_hw_CC : Uint32);
      begin
         a.flag0:=a.flag0 or ((__blit_hw_CC shl bp_SDL_VideoInfo_blit_hw_CC) and bm_SDL_VideoInfo_blit_hw_CC);
      end;

    function blit_hw_A(var a : SDL_VideoInfo) : Uint32;
      begin
         blit_hw_A:=(a.flag0 and bm_SDL_VideoInfo_blit_hw_A) shr bp_SDL_VideoInfo_blit_hw_A;
      end;

    procedure set_blit_hw_A(var a : SDL_VideoInfo; __blit_hw_A : Uint32);
      begin
         a.flag0:=a.flag0 or ((__blit_hw_A shl bp_SDL_VideoInfo_blit_hw_A) and bm_SDL_VideoInfo_blit_hw_A);
      end;

    function blit_sw(var a : SDL_VideoInfo) : Uint32;
      begin
         blit_sw:=(a.flag0 and bm_SDL_VideoInfo_blit_sw) shr bp_SDL_VideoInfo_blit_sw;
      end;

    procedure set_blit_sw(var a : SDL_VideoInfo; __blit_sw : Uint32);
      begin
         a.flag0:=a.flag0 or ((__blit_sw shl bp_SDL_VideoInfo_blit_sw) and bm_SDL_VideoInfo_blit_sw);
      end;

    function blit_sw_CC(var a : SDL_VideoInfo) : Uint32;
      begin
         blit_sw_CC:=(a.flag0 and bm_SDL_VideoInfo_blit_sw_CC) shr bp_SDL_VideoInfo_blit_sw_CC;
      end;

    procedure set_blit_sw_CC(var a : SDL_VideoInfo; __blit_sw_CC : Uint32);
      begin
         a.flag0:=a.flag0 or ((__blit_sw_CC shl bp_SDL_VideoInfo_blit_sw_CC) and bm_SDL_VideoInfo_blit_sw_CC);
      end;

    function blit_sw_A(var a : SDL_VideoInfo) : Uint32;
      begin
         blit_sw_A:=(a.flag0 and bm_SDL_VideoInfo_blit_sw_A) shr bp_SDL_VideoInfo_blit_sw_A;
      end;

    procedure set_blit_sw_A(var a : SDL_VideoInfo; __blit_sw_A : Uint32);
      begin
         a.flag0:=a.flag0 or ((__blit_sw_A shl bp_SDL_VideoInfo_blit_sw_A) and bm_SDL_VideoInfo_blit_sw_A);
      end;

    function blit_fill(var a : SDL_VideoInfo) : Uint32;
      begin
         blit_fill:=(a.flag0 and bm_SDL_VideoInfo_blit_fill) shr bp_SDL_VideoInfo_blit_fill;
      end;

    procedure set_blit_fill(var a : SDL_VideoInfo; __blit_fill : Uint32);
      begin
         a.flag0:=a.flag0 or ((__blit_fill shl bp_SDL_VideoInfo_blit_fill) and bm_SDL_VideoInfo_blit_fill);
      end;

    function UnusedBits3(var a : SDL_VideoInfo) : Uint32;
      begin
         UnusedBits3:=(a.flag0 and bm_SDL_VideoInfo_UnusedBits3) shr bp_SDL_VideoInfo_UnusedBits3;
      end;

    procedure set_UnusedBits3(var a : SDL_VideoInfo; __UnusedBits3 : Uint32);
      begin
         a.flag0:=a.flag0 or ((__UnusedBits3 shl bp_SDL_VideoInfo_UnusedBits3) and bm_SDL_VideoInfo_UnusedBits3);
      end;

    { *** masks for implementing the bit fields accesors of SDL_Overlay *** }
    const
       bm_SDL_Overlay_hw_overlay = $1;
       bp_SDL_Overlay_hw_overlay = 0;

    { *** bit fields accesors of SDL_Overlay *** }
    function hw_overlay (var o: SDL_Overlay): Uint32;
    Begin
       hw_overlay := (o.flag0 and bm_SDL_Overlay_hw_overlay) shr bp_SDL_Overlay_hw_overlay ;
    End;

    procedure set_hw_overlay (var o: SDL_Overlay; value: Uint32);
    Begin
       o.flag0 := o.flag0 or ( (value shl bp_SDL_Overlay_hw_overlay) and bm_SDL_Overlay_hw_overlay) ;
    End;    
	
    { Macro }
    function SDL_MUSTLOCK(surface: PSDL_Surface): Boolean;
    begin
      SDL_MUSTLOCK := (surface^.offset<>0) or
         ((surface^.flags and (SDL_HWSURFACE or SDL_ASYNCBLIT or SDL_RLEACCEL)) <>0)
    end; { SDL_MUSTLOCK }
  

    {alias for SDL_CreateRGBSurface}
    function SDL_AllocSurface(flags:Uint32; width:longint; height:longint; depth:longint; Rmask:Uint32; 
               Gmask:Uint32; Bmask:Uint32; Amask:Uint32):PSDL_Surface;
    Begin
      SDL_AllocSurface := SDL_CreateRGBSurface (flags, width, height,
               depth, Rmask, Gmask, Bmask, Amask);
    End; { SDL_AllocSurface }
  

  {###### Additional procedure for unicode translation ######}
  procedure string2pasciiarray(s : string; var p:pasciiarray);
  var i				      : 0..100;
  begin 
     for i:= 0 to length(s)-1 do p^[i]:= ord(s[i+1]);
     p^[length(s)]:= 0;
  end; { string2pasciiarray }
  {##########################################################}

    {convenience macros}
    function SDL_LoadBMP(filename:string) : PSDL_Surface;
    var
      mode   : pasciiarray;
      fname  : pasciiarray;
      handle : pSDL_RWops;
    begin
      new(mode);
      new(fname);

      string2pasciiarray('rb',mode);
      string2pasciiarray(filename,fname);
  
      handle:=SDL_RWFromFile(fname,mode);
      SDL_LoadBMP := SDL_LoadBMP_RW(handle, True);
 
      dispose(mode);
      dispose(fname);
    end;

    function SDL_SaveBMP(surface: pSDL_Surface;filename:pasciiarray) : longint;
    var
      mode   : pasciiarray;
      handle : pSDL_RWops;
    begin
      new(mode);
      string2pasciiarray('wb',mode);
      handle:=SDL_RWFromFile(filename,mode);
      SDL_SaveBMP := SDL_SaveBMP_RW(surface,handle, True);
      dispose(mode);
    end;

    { alias for SDL_UpperBlit }
    function SDL_BlitSurface(src:pSDL_Surface; srcrect:pSDL_Rect; dst:pSDL_Surface; dstrect:pSDL_Rect):longint;
    begin
       SDL_BlitSurface := SDL_UpperBlit(src, srcrect, dst, dstrect)
    end;

  {####SDL_cdrom####}
    
  { Implementation of macros }
  function CD_INDRIVE(status : longint) : Boolean;
  begin
    CD_INDRIVE:=(status > 0);
  end; { CD_INDRIVE }
    
  procedure FRAMES_TO_MSF(v: Longint; var m,s,f: Longint);
  begin
    f := v mod CD_FPS ;
    v := v div CD_FPS ;
    s := v mod 60 ;
    v := v div 60 ;
    m := v ;
  end; { FRAMES_TO_MSF }

  {########SDL_Audio########}
  function SDL_LoadWAV(filename:String; spec:pSDL_AudioSpec;
    var audio_buf:pByte; var audio_len : Uint32) : pSDL_AudioSpec;
  var
    mode   : pasciiarray;
    fname  : pasciiarray;
    handle : pSDL_RWops;
  begin
    new(mode);
    string2pasciiarray('rb',mode);
    string2pasciiarray(filename,fname);
    handle:=SDL_RWFromFile(fname,mode);
    SDL_LoadWAV:=SDL_LoadWAV_RW(handle,True,spec,audio_buf,audio_len);
    dispose(mode);
  end; { SDL_LoadWAV }

  procedure ShowSDLErrorMsg;
  begin
    Writeln(StrPas(SDL_GetError));
  end; { ShowSDLErrorMsg }
  
begin
end.