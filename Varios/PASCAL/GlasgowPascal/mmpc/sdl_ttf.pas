unit SDL_ttf; 
 
interface 
 
uses 
  SDL; 
 
type 
  PTTF_Font = ^TTF_font; 
  TTF_Font = record 
  end; 
 
const
{* 
   Set and retrieve the font style 
   This font style is implemented by modifying the font glyphs, and 
   doesn't reflect any inherent properties of the truetype font file. 
*} 
  TTF_STYLE_NORMAL	= $00; 
  TTF_STYLE_BOLD       	= $01; 
  TTF_STYLE_ITALIC	= $02; 
  TTF_STYLE_UNDERLINE	= $04; 
 
//returns 0 on succes, -1 if error occurs 
function TTF_Init : integer; cdecl; external name 'TTF_Init'; 
 
// Open a font file and create a font of the specified point size 
function TTF_OpenFont(filename : Pchar; ptsize : integer): PTTF_Font; cdecl; external name 'TTF_OpenFont'; 
function TTF_OpenFontIndex(filename : Pchar; ptsize : integer; index : Longint): PTTF_Font; cdecl; external name 'TTF_OpenFontIndex'; 
 
function TTF_GetFontStyle(font : PTTF_Font): integer; cdecl; external name 'TTF_GetFontStyle'; 
procedure TTF_SetFontStyle(font : PTTF_Font; style : integer); cdecl; external name 'TTF_SetFontStyle'; 
 
{ Get the total height of the font - usually equal to point size } 
function TTF_FontHeight( font : PTTF_Font ): Integer; cdecl; external name 'TTF_FontHeight'; 
{ Get the offset from the baseline to the top of the font 
   This is a positive value, relative to the baseline. 
} 
function TTF_FontAscent(font : PTTF_Font): Integer; cdecl; external name 'TTF_FontAscent'; 
{ Get the offset from the baseline to the bottom of the font 
   This is a negative value, relative to the baseline. 
} 
function  TTF_FontDescent(font : PTTF_Font): Integer; cdecl; external name 'TTF_FontDescent'; 
{ Get the recommended spacing between lines of text for this font } 
function  TTF_FontLineSkip(font : PTTF_Font): Integer; cdecl; external name 'TTF_FontLineSkip'; 
 
{ Get the number of faces of the font } 
function TTF_FontFaces(font : PTTF_Font): Longint; cdecl; external name 'TTF_FontFaces'; 
 
{ Get the font face attributes, if any } 
function  TTF_FontFaceIsFixedWidth(font : PTTF_Font): Integer; cdecl; external name 'TTF_FontFaceIsFixedWidth'; 
function  TTF_FontFaceFamilyName(font : PTTF_Font): PChar; cdecl; external name 'TTF_FontFaceFamilyName'; 
function  TTF_FontFaceStyleName(font : PTTF_Font): PChar; cdecl; external name 'TTF_FontFaceStyleName'; 
 
{ Get the metrics (dimensions) of a glyph } 
function  TTF_GlyphMetrics(font : PTTF_Font; ch : Uint16; minx : integer; maxx : integer; 
                           miny : integer; maxy : integer; advance : integer): Integer; cdecl; external name 'TTF_GlyphMetrics'; 
 
{ Get the dimensions of a rendered string of text } 
function  TTF_SizeText(font : PTTF_Font; text : PChar; var w : integer; var y : integer): Integer; cdecl; external name 'TTF_SizeText'; 
function  TTF_SizeUTF8(font : PTTF_Font; text : PChar; var w : integer; var y : integer): Integer; cdecl; external name 'TTF_SizeUTF8'; 
function  TTF_SizeUNICODE(font : PTTF_Font; text : PUint16; var w : integer; var y : integer): Integer; cdecl; external name 'TTF_SizeUNICODE'; 
 
{ Create an 8-bit palettized surface and render the given text at 
   fast quality with the given font and color.  The 0 pixel is the 
   colorkey, giving a transparent background, and the 1 pixel is set 
   to the text color.
   This function returns the new surface, or NULL if there was an error. 
} 
function TTF_RenderText_Solid(font : PTTF_Font; 
			      text : PChar; fg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderText_Solid'; 
function TTF_RenderUTF8_Solid(font : PTTF_Font; 
			      text : PChar; fg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderUTF8_Solid'; 
function TTF_RenderUNICODE_Solid(font : PTTF_Font; 
				 text :Uint16; fg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderUNICODE_Solid'; 
{  
Create an 8-bit palettized surface and render the given glyph at 
   fast quality with the given font and color.  The 0 pixel is the 
   colorkey, giving a transparent background, and the 1 pixel is set 
   to the text color.  The glyph is rendered without any padding or 
   centering in the X direction, and aligned normally in the Y direction. 
   This function returns the new surface, or NULL if there was an error. 
} 
function TTF_RenderGlyph_Solid(font : PTTF_Font; 
			       ch : Uint16; fg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderGlyph_Solid'; 
 
{ Create an 8-bit palettized surface and render the given text at 
   high quality with the given font and colors.  The 0 pixel is background, 
   while other pixels have varying degrees of the foreground color. 
   This function returns the new surface, or NULL if there was an error. 
} 
function TTF_RenderText_Shaded(font : PTTF_Font; 
			       text : PChar; fg : SDL_Color; bg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderText_Shaded'; 
function TTF_RenderUTF8_Shaded(font : PTTF_Font; 
			       text : PChar; fg : SDL_Color; bg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderUTF8_Shaded'; 
function TTF_RenderUNICODE_Shaded(font : PTTF_Font; 
				  text : PUint16; fg : SDL_Color; bg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderUNICODE_Shaded'; 
 
{ Create an 8-bit palettized surface and render the given glyph at 
   high quality with the given font and colors.  The 0 pixel is background, 
   while other pixels have varying degrees of the foreground color. 
   The glyph is rendered without any padding or centering in the X 
   direction, and aligned normally in the Y direction. 
   This function returns the new surface, or NULL if there was an error. 
} 
function TTF_RenderGlyph_Shaded(font : PTTF_Font; ch : Uint16; fg : SDL_Color; 
                                bg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderGlyph_Shaded'; 
 
{ Create a 32-bit ARGB surface and render the given text at high quality, 
   using alpha blending to dither the font with the given color. 
   This function returns the new surface, or NULL if there was an error. 
} 
function TTF_RenderText_Blended(font : PTTF_Font; 
				text : PChar; fg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderText_Blended'; 
function TTF_RenderUTF8_Blended(font : PTTF_Font; 
				text : PChar; fg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderUTF8_Blended'; 
function TTF_RenderUNICODE_Blended(font : PTTF_Font; 
				   text: PUint16; fg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderUNICODE_Blended'; 
 
{ Create a 32-bit ARGB surface and render the given glyph at high quality, 
   using alpha blending to dither the font with the given color. 
   The glyph is rendered without any padding or centering in the X 
   direction, and aligned normally in the Y direction. 
   This function returns the new surface, or NULL if there was an error. 
} 
function TTF_RenderGlyph_Blended(font : PTTF_Font; ch : Uint16; fg : SDL_Color): PSDL_Surface; cdecl; external name 'TTF_RenderGlyph_Blended';
 
{ For compatibility with previous versions, here are the old functions } 
{#define TTF_RenderText(font, text, fg, bg) 
	TTF_RenderText_Shaded(font, text, fg, bg) 
#define TTF_RenderUTF8(font, text, fg, bg)	 
	TTF_RenderUTF8_Shaded(font, text, fg, bg) 
#define TTF_RenderUNICODE(font, text, fg, bg)	 
	TTF_RenderUNICODE_Shaded(font, text, fg, bg)} 
 
{ Close an opened font file } 
procedure TTF_CloseFont(font : PTTF_Font); cdecl; external name 'TTF_CloseFont'; 
 
//De-initialize TTF engine 
procedure TTF_Quit; cdecl; external name 'TTF_Quit'; 
 
implementation 
 
begin 
end.
