%{
/****************************************************************************
paslexer.l
ParserWizard generated Lex file.

Date: Tuesday, January 07, 2003
****************************************************************************/

%}

/////////////////////////////////////////////////////////////////////////////
// declarations section\x

// place any declarations here
%{

/**
Pascal Unicode lexical analyser


Author Paul Cockshott

Copyright University of Glasgow 2003

*/
int modularArithmetic =0;
int rangechecks=0;
int fatal=0;
unsigned short * fatalmessage, *theString;
#include "pasrev.h"
%}
latin [a-zA-Z_]
greek [\x0391-\x03a9]
cyrillic [\x0410-\x042f]
hiragana [\x3041-\x3094]
katakana[\x30a1-\x30fa]
cjk [\x4e00-\x9fff]
hanguljamo [\x1100-\x11ff]
alpha ({latin}|{greek}|{cyrillic}|{katakana}|{hiragana}|{cjk})
digit [0-9]
in \x2208
and \x2227
or \x2228
iota \x2373
leftarrow \x2190
naryproduct \x220f
divide (\x00f7|div)
multiply (\x2715|\x00d7)
narysum \x2211
sqrt \x221a
lessthanorequal \x2264
notequal \x2260
greaterthanorequal \x2265
not \x00ac
cabs \x7edd\x5bf9\x503c
hexdigit [0-9a-fA-F]
alphanumeric ({alpha}|{digit})
whitespace (" "|\n|\r|\t)
exp (e|E)
COMMENT_TEXT (\n|\r|\t|[^*]|\*[^)])
LINECOMMENT_TEXT [^\n]*
%start STRSTAT
%start COMMENT

%start SKIP
%option yywgetchar
%%

/////////////////////////////////////////////////////////////////////////////
// rules section
%{

/**
Pascal Unicode lexical analyser


Author Paul Cockshott

Copyright University of Glasgow 2003

*/

%}
// place your Lex rules here
{whitespace} {
		 
	/*	yy_mark_start();/* Java lex call to  skip white space */
		}
\{\$FATAL({COMMENT_TEXT})*\} {fatal=1;fatalmessage=yywtext;}
\{\$ELSE\} {yywbegin(SKIP);}
<SKIP>\{\$ELSE\} {yywbegin(INITIAL);}
<SKIP>\{\$ENDIF([^}])*\} {    yywbegin(INITIAL);}
<SKIP>({whitespace}|{alphanumeric}|{COMMENT_TEXT}|.) { /*yy_mark_start(); /* Java lex call to  skip white space */}
"(*" {  yywbegin(COMMENT); comment_count = comment_count + 1; }
<COMMENT>"*)" {
                
	/*	yy_mark_start(); /* Jlex code to mark the start of a token */
    		yywbegin(INITIAL);

}
<COMMENT>({COMMENT_TEXT})* {  
	yywbegin(COMMENT);
}
\/\/{LINECOMMENT_TEXT} {}

(and|{and}) {return (int) TT_AND;}
(or|{or}) {return (int) TT_OR;}
\+ { return (int)'+';}
- { return (int)'-';}
{narysum} { return TT_SUMATION;}
{naryproduct} { return TT_PRODUCT;}
{sqrt} { return (int)TT_SQRT;}
{divide} { return (int)TT_DIV;}
{in} { return (int)TT_IN;}

\.\. {return TT_ELIPSIS;}
:= {return TT_ASSIGN;}
{leftarrow} {return TT_ASSIGN;}
\+: {return TT_SATPLUS;}
\-: {return TT_SATMINUS;}
@ {return TT_ADDR;}
\*\* {return TT_EXP;}
\* {return (int)'*';}
{multiply} { return (int) '*';}
\\ {return (int)'\\';}
\/ {return (int)'/';}
\. {return (int) '.';}
; {return (int)';';}
\x5e  {return (int) '^';}
\) {return (int) ')';}
\[ {return (int) '[';}
\] {return (int) ']';}
: {return (int) ':';}
, {return (int) ',';}
= {return (int) '=';}
\>= {return TT_GE;}
{greaterthanorequal} {return TT_GE;}
{lessthanorequal} {return TT_LE;}
\<= {return TT_LE;}
\<\> {return TT_NE;}
{notequal} {return TT_NE;}
\>\< {return TT_SETXOR;}
\> {return (int) '>';}
\< {return (int) '<';}
\{\$IFDEF\ ([^}])*\} {
			/* java prototype
              String comm =yywtext; 
              comm=comm.substring(8);
              comm=comm.substring(0,comm.length()-1).trim();
			  if(defined.get(comm)==null){
			                 yywbegin(SKIP);          
                        }
             */
		     }
\{\$IFNDEF\ ([^}])*\}  {
			/* java prototype
                     String comm =yywtext;
                     comm=comm.substring(9);
                     comm=comm.substring(0,comm.length()-1).trim();
			         if(defined.get(comm)!=null)yywbegin(SKIP);
			*/
			}
\{\$DEFINE([^}])*\} {
			/* java prototype 
			String comm =yywtext; 
			comm=comm.substring(9);
			comm=comm.substring(0,comm.length()-1).trim();
			defined.put(comm,comm);
			*/
			}
\{\$[mM]\+([^}])*\} {modularArithmetic=1;/* skip comment */ }
\{\$[mM]\-([^}])*\} {modularArithmetic=0; /* skip comment */ }
\{\$[rR]\+([^}])*\} {rangechecks=1;/* skip comment */ }
\{\$[rR]\-([^}])*\} {rangechecks=0; /* skip comment */ }
\{\$linklib\ ([^}])*\} {
	/* JLex code to handle linking
	String filename = yywtext.substring(10, yywtext.length()-1).trim();
	ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" -l"+filename;
	*/
	}
\{\$INCLUDE\ ([^}])*\} {
			/* Jlex code for including a file
			 filename = yywtext.substring(10, yywtext.length()-1).trim();
			 
			 return TT_INCLUDE;
			 */
			 }
\{\$include\ ([^}])*\} {
			/* Jlex file inclusion code 
			filename = yywtext.substring(10, yywtext.length()-1).trim();
		 
			 return TT_INCLUDE;
			 */
			 }
\{\$[i|I]\ ([^}])*\} { 
			/* JLEX file inclusion code 
			filename = yywtext.substring(4, yywtext.length()-1).trim();
			//System.out.println("try to include "+filename);
			 return TT_INCLUDE;
			 */
			 
			 }



\{\$l\ ([^}])*\} {
			/* JLex code for linkage library
			String filename = yywtext.substring(4, yywtext.length()-1);
			ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" -l"+filename; // set link flag
			*/
			}
\{\$L\ ([^}])*\} {
		/* JLex code for linking to a library
		String filename = yywtext.substring(4, yywtext.length()-1);
		ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" -l"+filename; // set link flag
		*/
		}
\{([^}])*\} {/* skip comment */ }
'(''|[^'])*' {theString=yywtext;return TT_STRING;}
\( {return (int) '(';}
// chinese and english reserved words
({cabs}|abs)  {return (int) TT_ABS;/*chinese reserved words start */}
(\x5730\x5740|addr) {return (int) TT_ADDR;}
(\x6570\x7ec4|array) {return (int) TT_ARRAY;}
(\x5f00\x59cb|begin) {return (int) TT_BEGIN;}
(\x5b57\x8f6c\x50cf|byte2pixel) {return (int) TT_BYTE2PIXEL;}
(\x4e2a\x6848|case) {return (int) TT_CASE;}
(cast) {return (int) TT_CAST;}
(\x5b57\x7b26|chr) {return (int) TT_CHR;}
(\x5e38\x91cf|const) {return (int) TT_CONST;}
(\x4f59\x5f26|cos) {return (int) TT_COS;}
(\x5224\x65ad|diag) {return (int) TT_DIAG;}
(\x5faa\x73af|do) {return (int) TT_DO;}
(\x4e08\x81f3|downto) {return (int) TT_DOWNTO;}
(\x7ed3\x675f|end)  {return (int) TT_END;}
(\x5426\x5219|else) {return (int) TT_ELSE;}
(\x9000\x51fa|exit)  {return (int) TT_EXIT;}
(\x5916\x90e8\x7684|external)  {return (int) TT_EXTERNAL;}
(\x9534\x8bef|false)  {return (int) TT_FALSE;}
(\x6587\x4ef6|file)  {return (int) TT_FILE;}
(\x4ece|for)  {return (int) TT_FOR;}
(\x51fd\x6570|function)  {return (int) TT_FUNCTION;}
(\x8df3\x8f6c|goto)  {return (int) TT_GOTO;}
(\x5982\x679c|if)  {return (int) TT_IF;}
(\x5b9e\x73b0|implementation)  {return (int) TT_IMPLEMENTATION;}
(\x2208|in)  {return (int) TT_IN;}
(\x63a5\x53e3|interface)  {return (int) TT_INTERFACE;}
({iota}|iota)  {return (int) TT_IOTA;}
(\x6807\x7b7e|label)  {return (int) TT_LABEL;}
(\x5e93|library)  {return (int) TT_LIBRARY;}
(\x81ea\x7136\x5bf9\x6570|ln)  {return (int) TT_LN;}
(\x6700\x5927\x503c|max)  {return (int) TT_MAX;}
(\x6700\x5c0f\x503c|min)  {return (int) TT_MIN;}
(\x0025|mod)  {return (int) TT_MOD;}
(\x540d\x79f0|name)  {return (int) TT_NAME;}
(\x65b0\x5efa|new)  {return (int) TT_NEW;}
(\x00ac|not)  {return (int) TT_NOT;}
(\x7684|of)  {return (int) TT_OF;}
(\x8fd0\x7b97\x7b26|operator)  {return (int) TT_OPERATOR;}
({or}|or)  {return (int) TT_OR;}
(\x5b57\x8f6c\x6570|ord)  {return (int) TT_ORD;}
(\x5426\x6570|otherwise)  {return (int) TT_OTHERWISE;}
(\x5c01\x88c5|packed)  {return (int) TT_PACKED;}
(\x6392\x5217|perm)  {return (int) TT_PERM;}
(\x50cf\x8f6c\x5b57|pixel2byte)  {return (int) TT_PIXEL2BYTE;}
(\x5e42|pow) {return (int) TT_POW;}
(\x524d\x79fb|pred) {return (int) TT_PRED;}
(\x8fdb\x7a0b|procedure) {return (int) TT_PROCEDURE;}
(\x7a0b\x5e8f|program) {return (int) TT_PROGRAM;}
(\x4fdd\x62a4|protected) {return (int) TT_PROTECTED;}
(\x8bfb|read) {return (int) TT_READ;}
(\x8bfb\x884c|readln)  {return (int) TT_READLN;} 
(\x8bb0\x5f55|record)  {return (int) TT_RECORD;}
(\x91cd\x590d|repeat)  {return (int) TT_REPEAT;}
(\x56db\x820d\x4e94\x5165|round)  {return (int) TT_ROUND;}
(\x96c6\x5408|set)  {return (int) TT_SET;}
(\x5de6\x4f4d\x79fb|shl)  {return (int) TT_SHL;}
(\x53f3\x4f4d\x79fb|shr)  {return (int) TT_SHR;}
(\x6b63\x5f26|sin)  {return (int) TT_SIN;}
(\x957f\x5ea6|sizeof)  {return (int) TT_SIZEOF;}
(\x4e32|string) {return (int) TT_STRING;}
(\x221a|sqrt) {return (int) TT_SQRT;}
(\x540e\x79fb|succ) {return (int) TT_SUCC;}
(\x6b63\x5207|tan)  {return (int) TT_TAN;}
(\x90a3\x4e48|then)  {return (int) TT_THEN;}
(\x5230|to) {return (int) TT_TO;}
(\x8ddd\x9635\x53d8\x6362|trans)  {return (int) TT_TRANS;}
(\x771f|true) {return (int) TT_TRUE;}
(\x7c7b\x578b|type) {return (int) TT_TYPE;}
(\x53d8\x91cf|var) {return (int) TT_VAR;}
(\x4e0e|with) {return (int) TT_WITH;}
(\x5f53|while)  {return (int) TT_WHILE;}
(\x5199|write)  {return (int) TT_WRITE;}
(\x5199\x884c|writeln)  {return (int) TT_WRITELN;}
(\x5355\x5143|unit)  {return (int) TT_UNIT;}
(\x76f4\x5230|until)  {return (int) TT_UNTIL;}
(\x4f7f\x7528|uses)  {return (int) TT_USES;}
 

// other identifiers
{alpha}{alphanumeric}* {return TT_WORD;/* standard identifiers*/}
{alpha} {return TT_WORD;}
{cjk} {return TT_WORD;}
// numbers
{digit}+\.{digit}+ {return TT_REAL;}
{digit}+\.{digit}+{exp}{digit}+ {return TT_REAL;}
{digit}+\.{digit}+{exp}-{digit}+ {return TT_REAL;}
{digit}+\.{digit}+{exp}\+{digit}+ {return TT_REAL;}
{digit}+{exp}{digit}+ {return TT_REAL;}
{digit}+{exp}-{digit}+ {return TT_REAL;}
{digit}+{exp}\+{digit}+ {return TT_REAL;}
\${hexdigit}+ {return TT_NUMBER;}
{digit}+ {return TT_NUMBER;}
{digit}+#{alphanumeric}+ {return TT_NUMBER;}
. {printzerotermstr(0,yywtext);printf(" Unmatched text line %d\n",yywlineno);}

%%

/////////////////////////////////////////////////////////////////////////////
// programs section

 
void readcharnarrow(FILE * f,char *c)/* reads an ascii char */
{
	  *c=getc(f);
}
int readwchar(FILE *fn )/* reads a unicode char in utf8 format */
{
	int c;
	unsigned char a;
	c= getc(fn);
	if(a<0) return -1;
//	printf("%x",c);
    a=c;
	if(a <128) return c;
	if(a <(128+64+32)) {
//    printf("2 byte ");
		/* two byte pattern */
		c=( a& 31) << 6;
		readcharnarrow(fn,&a);
		c += ( a & 63);
		return c;
	}
	/* 3 byte code */
//printf("3byte");
        c= (a &15)<<12;
	readcharnarrow(fn,&a);
	c += (a&63)<<6;
	readcharnarrow(fn,&a);
	c += (a&63);
	return c;
}

 
void unicode2utf8(unsigned short unicode, unsigned char * utf8)
{
	if (unicode <128) {
		utf8[0]=(unsigned char )unicode;
		utf8[1]=0;
		return;
	}
	if (unicode<=0x7ff){
		utf8[0]=((unicode >> 6) &31)+ 128+64;
		utf8[1]=(unicode &63)+128;
		utf8[2]=0;
		return;
	}
	utf8[0]= ((unicode >>12)&15)+128+64+32;
	utf8[1]= ((unicode >>6)&63) +128;
	utf8[2]= ((unicode &63) +128);
	utf8[3]= 0;
}	
void printchar(FILE * f,int x )
{	 
	unsigned char utf8[5];int i;

	unicode2utf8(x,utf8);
	i=0;
	x=utf8[i];
	
	if (x<128){
	 
		if(f==0)putchar(x); 
		else putc(x,f); 
		return;	
	}
	
 
	if(f==0)printf("%s",utf8); 
	else fprintf(f,"%s",utf8); 
}
int printzerotermstr(FILE * f, unsigned short * t)// returns length of string
{  int i=0;
   if(t == 0) return 0;
   while (*t){ printchar(f,*t);i++; t++;}
   return i;
}

FILE *src;
yywint_t yywgetchar(void)

{
   int wc = readwchar(src);
   

     

    return wc;

}



int main(int argc, char ** argv)
{	int i,j;
    if(argc<1) {
		printf("Usage: plex srcfile");
		return -1;
	}
	printf("open %s",argv[1]);
	src=fopen(argv[1],"rb");
	if(src==NULL) {
		printf("cant open input");
		return -1;
	}
    j=0;
	i= (int) yywlex();
	while(i != TT_END)
	{	j++;
		if(j>400) break;
		printzerotermstr(0,yywtext);
		
		printf("  = %d\n",i);
		i = (int) yywlex();
	}
}