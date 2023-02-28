/*
ilcg pascal run time library



*/
#include <stdio.h>
#include <signal.h>
#ifndef UNISTD
#include <unistd.h>
#endif
#include <string.h>
#ifndef SYSTIME
#include <sys/time.h>
#endif
#include <sys/timeb.h>
#ifndef NIOS
#include <dirent.h>
#endif
#include <sys/stat.h>
#include <time.h>
#define MALLOC malloc
#define FREE free
#include <stdlib.h>
#ifdef BOEHM
#include <gc.h>
#endif
#ifdef CLSIMD
void openclCleanUp();
void initopencl();
#endif
#ifdef nvidia
void nvidiaClean();
void setupNvidia();
#endif
#ifndef MSVC
#define INT64 long long
#else
#define INT64 long
#endif
#define null 0
#define filemax 31
#define CLOSED 0
#define OPEN 1
#define RESERVED -1
#define NOFREEFILES 4
#define ORDINALREADERROR 301
float double2float(double d) {
    return d;
}

struct {
    FILE *f;
    char name[245];
    int status;
    int recsize;
} files[filemax+1];
int iores=0;
void assign(int * , unsigned short * );
void initfs()/* initialises all of the file blocks to unopened */
{
    int i;


    for(i=0; i<filemax; i++) {
        files[i].status=CLOSED;
        files[i].recsize=1;
        files[i].name[2]='a'+i;
        files[i].name[0]='V';
        files[i].name[1]='P';
        files[i].name[3]=0;
    }
    files[0].status=OPEN;
    files[0].f=stdin;
    files[1].status=OPEN;
    files[1].f=stdout;

}
#ifndef NIOS
char * entryname(struct dirent *p) {
    return p->d_name;
}
int isdir(char *name) {
    struct stat buf;
    stat(name,&buf);
    return
        S_ISDIR(buf.st_mode);
}
#endif
void closefiles();
void exit(int);
void checkerr(int );
void pascalexit(int code) {
	static int count =0;
	if(count>0) exit(code);
	count++;
    closefiles();
    exit(code);
}
char * getenvariable(char * p){return getenv(p);}
int findfreefileblock()
{   int i;
    for(i=0; i<filemax; i++)if (files[i].status==CLOSED)return i;
    return -1;
}
int exec(char *fn, char * * params){
	return execvp(fn,( char *const*) params);
}
int execcommand(char *com)
{ return system(com);}
void pasclose(int * filenum)
{
    checkerr(*filenum);
    fclose(files[*filenum].f);
    files[*filenum].status=CLOSED;
}
void closefiles()
{
    int i;
    for(i=0; i<filemax; i++)if(files[i].status==OPEN)pasclose(&i);
}
int crand(void){return rand();}
void csrand(int seed){srand(seed);}
void cmemset(void *str,int c,size_t n){memset(str,c,n);}
time_t  ctimes(time_t *t){return time(t);}

void setchan(int * filenum, int num) {
    * filenum=num;
}
int pascaleof(int *filenum)
{   long here,there;
    checkerr(*filenum);
    if(feof(files[*filenum].f)) return -1;
    here= ftell(files[*filenum].f);
    fseek(files[*filenum].f,0,SEEK_END);
    there=ftell(files[*filenum].f);
    fseek(files[*filenum].f,here,SEEK_SET);
    if(here==there) return -1;
    return 0;
}
int eoln(int *filenum)
{   int c;
    checkerr(*filenum);
    if(pascaleof(filenum)==0) {
        c=fgetc(files[*filenum].f);
        ungetc(c,files[*filenum].f);
        if(c=='\n') return -1;
    }
    return 0;
}
/** takes a pascal unicode string and generates a asciiz string  by truncation*/
void u2asciitrunc(unsigned short *src, char * dest)
{   int i ;

    for(i=1; i<=((*src)&255); i++)dest[i-1]=(src[i]&127);
    dest[((*src)&255)]=0;
}
/* reads the pascal string an converts to an integer */
void vali(unsigned short * pascalstring, int * result, int * code)
{   char cstr[255];
    u2asciitrunc(pascalstring,cstr);
    *code=1;
    if( sscanf(cstr,"%d",result)==1)*code =0;
}
/* reads the pascal string an converts to a float */
void valr(unsigned short * pascalstring, float * result, int * code)
{   char cstr[255];
    u2asciitrunc(pascalstring,cstr);
    *code=1;
    if( sscanf(cstr,"%f",result)==1)*code =0;
}
/* reads the pascal string an converts to a double */
void vald(unsigned short * pascalstring, double * result, int * code)
{   char cstr[255];
    u2asciitrunc(pascalstring,cstr);
    *code=1;
    if( sscanf(cstr,"%lf",result)==1)*code =0;
}
void move(char *src,char *dest, int len)
{
    memcpy(src,dest,len);
}
void erase(unsigned short *filename) {
    char str[257];
    u2asciitrunc(filename,str);
    unlink(&str[0]);
}
int filesize(int *filenum)
{
    long p,l;
    FILE *f;
    checkerr(*filenum);
    f=files[*filenum].f;
    p =ftell(f);
    fseek(f,0L,SEEK_END);
    l= ftell(f);
    fseek(f,p,SEEK_SET);
    return (int)l;
}
void checkerr(int fn) {
	 
    if(iores) {
        fprintf(stderr,"Pascal file sub-system  error: %d",iores);
        pascalexit(iores);
    }
    if((fn<0)||(fn>filemax)) {
        fprintf(stderr,"Unassigned file handle %d",fn);
        pascalexit(iores);
    }
    if(files[fn].status==CLOSED) {
        fprintf(stderr,"Unassigned or closed file handle %d",fn);
        pascalexit(iores);
    }
}
int filepos(int *filenum) {
    FILE *f;
    checkerr(*filenum);
    f=files[*filenum].f;
    return ftell(f);
}
int seek(int *filenum,int pos, int mode)
{   FILE *f;
    checkerr(*filenum);
    f=files[*filenum].f;
    return fseek(f,pos,mode);
}

/*
	 procedure blockread(var f:fileptr;var buf;count:integer; var resultcount:integer);
	procedure blockwrite(var f:fileptr;var buf;count:integer; var resultcount:integer);
	*/
void blockread(int * filenum, char * buf,int count, int * resultcount)
{
#ifdef DEBUG
    printf("blockread(%d,%c,%d,%d)\n",*filenum,*buf,count,*resultcount);
#endif
    checkerr(*filenum);
    *resultcount =   fread(buf, files[*filenum].recsize,count,files[*filenum].f);
}
void blockwrite(int * filenum, char * buf,int count, int * resultcount)
{
    checkerr(*filenum);
    *resultcount =   fwrite(buf, files[*filenum].recsize,count,files[*filenum].f);
}
void rewrite(int *filenum)
{
#ifdef DEBUG
    printf("in rewrite filnum = %d\n",*filenum);
#endif
    if((*filenum<0)||(*filenum>filemax)) {
        *filenum=findfreefileblock();
    }
    checkerr(*filenum);
    files[*filenum].f=fopen(files[*filenum].name,"w+b");
    files[*filenum].status=OPEN;
}
void reset(int *filenum)
{
    checkerr(*filenum);
    if(files[*filenum].status!=OPEN) {
        files[*filenum].f=fopen(files[*filenum].name,"r+b");
    } else {
        fseek(files[*filenum].f,0,SEEK_SET);
    }
    if(files[*filenum].f ==NULL)iores=2;
    else
        files[*filenum].status=OPEN;
}
void append(int *filenum)
{
    checkerr(*filenum);
    files[*filenum].f=fopen(files[*filenum].name,"ab");
    if(files[*filenum].f ==NULL)iores=2;
    else
        files[*filenum].status=OPEN;
}
void setiores(int val) {
    iores=val;
}
void assign(int * filenum, unsigned short * f)
{   int i;
    int fn;
    char filename[256];
    u2asciitrunc(f,filename);

    fn = findfreefileblock();
    if(fn<0) {
        iores=NOFREEFILES;
        *filenum=-1;
        return;
    }
    for(i=0; i<(f[0]&255); i++)files[fn].name[i]=filename[i];
    files[fn].name[(f[0]&255)]=0;
    files[fn].status=RESERVED;
    *filenum=fn;
}
int ioresult() {
    int temp=iores;
    iores=0;
    return temp;
}
void readcharnarrow(int fn,unsigned char *c)/* reads an ascii char */
{
    FILE *f;
    checkerr(fn);
    f=files[fn].f;
    if(fn==null)*c = getc(stdin);
    else *c=getc(f);
    
}
void readchar(int fn,unsigned short *c)/* reads a unicode char in utf8 format */
{
    int C;
    unsigned char a;
    readcharnarrow(fn,&a);
    *c=(unsigned char)a;
    if(a <128) {}else
    if( (0xe0 &a) ==(128+64)) {
        /* two byte pattern */
        *c=( a& 31) << 6;
        readcharnarrow(fn,&a);
        *c += ( a & 63);
    }else{
    /* 3 byte code */
    *c= (a &15)<<12;
    readcharnarrow(fn,&a);
    *c += (a&63)<<6;
    readcharnarrow(fn,&a);
    *c += (a&63);}
    
}
void unicode2utf8(unsigned short unicode, unsigned char * utf8)
{
    if (unicode <128) {
        utf8[0]=unicode;
        utf8[1]=0;
        return;
    }
    if (unicode<=0x7ff) {
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
void printspaces(int fn, int width)
{   FILE *f ;

    char  spaces[1001];
    int i;
    checkerr(fn);
    f =files[fn].f;
    if(width>999)width=999;
    spaces[0]='\0';
    for(i=0; i<(width); i++) {
        spaces[i]=' ';
        spaces[i+1]='\0';
    }
    if(fn==null)printf("%s",spaces );
    else fprintf(f,"%s",spaces );
}

void printchar(int fn,int x, int width, int afterpoint)
{   FILE *f;
    unsigned char utf8[5];
    printspaces(fn,width-1);
    if (x<128) {
        checkerr(fn);
        f =files[fn].f;
        if(fn==null)putchar(x);
        else putc(x,f);
        return;
    }
    unicode2utf8(x,utf8);
    checkerr(fn);
    f =files[fn].f;
    if(fn==null)printf("%s",utf8);
    else fprintf(f,"%s",utf8);
}
void readline(int fn)
{   char c;
    FILE *f;
    checkerr(fn);
    f=files[fn].f;
    if(fn==null)f=stdin;
    c=getc(f);
    while(c!='\n')c=getc(f);
}
int endoffile(int fn)
{   int c,r;
    FILE *f;
    checkerr(fn);
    f=files[fn].f;
    if(fn==null)f=stdin;
    c=getc(f);
    if(c==EOF)r=1;
    else {
        r=0;
        ungetc(c,f);
    }
    return r;
}
int endofline(int fn)
{   char c,r;
    FILE *f;
    checkerr(fn);
    f=files[fn].f;
    if(fn==null)f=stdin;
    c=getc(f);
    if(c=='\n')r=1;
    else {
        r=0;
        ungetc(c,f);
    }
    return r;
}
void println(int fn )
{   FILE *f;
    checkerr(fn);
    f=files[fn].f;

    if(fn==null)printf("\n");
    else {
#ifdef DOS
        fprintf(f,"\r");
#endif
        fprintf(f,"\n");
    }
}
void pascalerror(char *e)
{
    fprintf(stderr,"%s",e);
    pascalexit(-1);
}
int length(unsigned short *s) {
    return s[0];
}
void incr(unsigned short  **s) {
    *s= *s+1;
}
void readstring(int fn,unsigned short *s, int len)
{
    unsigned short c;
    int count;
    FILE *f;
    checkerr(fn);
    f=files[fn].f;
    if (fn==null)f=stdin;
    count=0;
    s[0]=count;
    c=' ';
    while((*s<len)&&(c!='\n') ) {

        readchar(fn,&c);
        if(c!='\n') {
            count++;
            s[count]=c;
            s[0]=count;
        } else ungetc(c,f);
    }
}

void printstring(int fn,unsigned short * s, int e1,int e2 )
{   int i,l ,n;
    int c;
    int totalwidth=e1;
    FILE *f ;
    checkerr(fn);
    f =files[fn].f;
    n=s[0];
    if (totalwidth<0) totalwidth=n;
    if (totalwidth<n ) {
        for( i=1; i<=  totalwidth; i++) {
            c=s[i];
            printchar(fn, c,1,1);
        }

    }
    else
    {
        if (totalwidth> n ) printspaces(fn,totalwidth -n);
        for( i=1; i<=  n; i++) {
            c=s[i];
            printchar(fn, c,1,1);
        }
    }
}
void cprintstring( unsigned short * s )
{   int i,l ,n;
    char c;
    n=s[0];

    for( i=1; i<=  n; i++) {
        c=(char)s[i];
        printf("%c", c );
    }

}
void printordinal(int fn,int o, int e1,int e2, unsigned short ** tab )
{
    printstring(fn,tab[o],e1,e2);
}
void skipspaces(FILE *f)
{
    char c;
    for(c=' '; c==' '; c=getc(f));
    ungetc(c,f);
}
int utolower(unsigned short c)
{
    if (c>='A' && c<='Z') return c -'A'+'a';// { latin lower case }
    if (c>= 0x391 && c<= 0x3a9) return c- 0x391 + 0x3b1; //{geek lower case}
    if (c>= 0x410 && c<= 0x42f) return c- 0x410 + 0x430; //{cyrillic lower case}
    return c;
}
int tolower(),cstringcompare(),toupper();
void readordinal(int fn, char *b,unsigned short ** tab,int len)
{   unsigned short c;
    int i,count;
    unsigned short string[256];
    FILE *f;
    checkerr(fn);
    f=files[fn].f;
    if (fn==null)f=stdin;
    skipspaces(f);
    c=tolower(getc(f));
    string[0]=0;
    count=0;
    if((c<='z'&&c>='a')) {
        while(((c<='z'&&c>='a')||(c<='9'&&c>='0'))&&(count<254)) {

            string[count+1]=c;
            string[0]++;
            count++;
            string[count+1]=0;
            readchar(fn,&c);

            c=utolower(c);
        }
    }
    ungetc(c,f);
//       cprintstring( string); printf("\n");
    for(i=0; i<len; i++)
    {
//		cprintstring( tab[i]);
        if (cstringcompare(&string,tab[i])==0)
        {
            if (len<256) {
                //	  printf(" terminating with ordinal %d\n",i);
                *b=i;
                return;
            }
            *((short*)b)=i;
            //return;
        }
        //   printf("\n");
    }
    iores=ORDINALREADERROR;
}

/* return -1 if set 1 less than set 2 , len encodes num bytes in set
   return o if the sets are equal
   return 1 if set 1 > set 2
   return 2 if both sets contain elements not in the other set*/
int setcmprtl(char * set1,char * set2, int len)
{
    int i;
    int c,d,nd,nc;
    int eq=1;
    int set2extra=0;
    int set1extra=0;
    for (i=0; i<len; i++)
    {
        c=set1[i];
        d=set2[i];
//		printf("in setcmprtl in rtl.c i=%d c=%d d=%d\n",i,c,d);
        if((c != d)) eq=0;
        if((c & ~d))set1extra=1;
        if((~c & d))set2extra=1;

    }
    if(eq) return 0;  /* if eq not less than */
    if(set1extra&set2extra) return 2;
    if(set1extra)return 1;
    return -1;
}

/* return -1 if s1<s2,0 if s1=s2, 1if s1>s2 */
int cstringcompare(unsigned short *s1,unsigned short* s2)
{   //	printf("cstringcompare called ");
    int i,len;
//	return cmplt(s1,s2);
    len=s1[0];
    if(s2[0]<len)len=s2[0];
//	printf("%d =len",len);
    for(i=1; (i<=len); i++) {
//		printf("%c:%c ",s1[i],s2[i]);
        if(s1[i]<s2[i])return -1;
        if(s1[i]>s2[i])return 1;
    }
    if(s1[0]<s2[0])return -1;
    if(s1[0]>s2[0])return 1;
    return 0;
}
#ifdef NIOS
int stringcompare(unsigned short *s1,unsigned short *s2) {
    return cstringcompare(s1,s2);
}
#endif
void readbool(int fn,char *b)
{   char c;
    FILE *f;
    checkerr(fn);
    f=files[fn].f;
    if (fn==null)f=stdin;
    skipspaces(f);
    c=toupper(getc(f));
    if(c=='F') {
        if(toupper(getc(f))=='A')
            if(toupper(getc(f))=='L')
                if(toupper(getc(f))=='S')
                    if(toupper(getc(f))=='E') {
                        *b=0;
                        return;
                    }
    } else if(c=='T') {
        if(toupper(getc(f))=='R')
            if(toupper(getc(f))=='U')
                if(toupper(getc(f))=='E') {
                    *b=1;
                    return;
                }
    }
    pascalerror("error in reading a boolean");

}
void printbool(int fn,char  b, int e1,int e2 )
{
    FILE *f;
    checkerr(fn);
    f =files[fn].f;
    if (e1>5)printspaces(fn,e1-5);
    if (fn==null)  {
        if(b) printf( " true") ;
        else printf("false");
    } else {
        if(b) fprintf( f," true") ;
        else fprintf(f,"false");
    }

}
void readint(int fn, int *x)
{
    FILE *f;
    checkerr(fn);
    f=files[fn].f;
    if (fn==null)f=stdin;

    fscanf(f,"%d",x);
}
void readbyte(int fn, unsigned char *c)
{
    int b;
    readint(fn,&b);
    if(b>=0 && b<=255)*c=b;
    if(b<0) *c=0;
    if(b>255) *c=255;
}
void printint64(int fn,INT64 x,int width,int afterpoint) {


    char buf[100],format[100];
    int len ,i;

    FILE *f ;
    checkerr(fn);
    f =files[fn].f;
    sprintf(format,"%c%dld",'%',width);

    if(fn==null)printf(format,x,width);
    else fprintf(f,format,x,width);
}
void printint(int fn,int x,int width,int afterpoint) {


    char buf[100],format[100];
    int len ,i;

    FILE *f ;
    checkerr(fn);
    f =files[fn].f;
    sprintf(format,"%c%dd",'%',width);

#ifdef DEBUG
    printf("in printint filnum = %d, f=%d ",fn,f);
#endif
    if(fn==null)printf(format,x);
    else fprintf(f,format,x);
}
void readreal(int fn , float *x)
{

    FILE *f;
    checkerr(fn);
    f=files[fn].f;
    if (fn==null)f=stdin;

    fscanf(f,"%f",x);

}
void real2str(float x,char * buf){ sprintf(buf,"%g",x);}
void printdouble(int fn,double x,int width,int afterpoint) {
    char buf[100],format[100];
    int len ,i;

    FILE *f ;
    checkerr(fn);
    f =files[fn].f;
    if(afterpoint==0)  sprintf(format,"%c%d.%dg",'%',width,6);
    else sprintf(format,"%c%d.%df",'%',width,afterpoint);
    /*if(afterpoint==0)sprintf(format,"%d.%d%s",width,afterpoint,"%g");
    else sprintf(format,"%d.%d%s",width,afterpoint,"%f");

    len=strlen(buf);
    if(width>80)width=80;
    if(len>=width)spaces[0]='\0';
    else{
    	for(i=0;i<(width-len);i++){
    		spaces[i]=' ';
    		spaces[i+1]='\0';
    	}
    }
      */

    if(fn==null)printf(format,x);
    else fprintf(f,format,x);
}
void printreal(int fn,float x,int width,int afterpoint) {
    double d=x;
    return printdouble(fn,d,width,afterpoint);
}


void cstringassign(unsigned short *s1, int len,unsigned  short* s2)
{
    int tocopy = len;
    int i;
    if (s2[0]<tocopy) tocopy=s2[0];
    s1[0]=tocopy;
    //printf("to copy %d",tocopy);
    for(i=1; i<=tocopy; i++)s1[i]=s2[i];
    //if (tocopy<len)s1[tocopy+1]=0;
}
#ifdef NIOS
void stringassign(unsigned short *s1, int len,unsigned  short* s2) {
    cstringassign(s1,len,s2);
}
#endif
void stringappend(unsigned short *s1, int len, unsigned short* s2)
{   int start=s1[0];
    int tocopy = len-start;
    int i;
    if (s2[0]<tocopy) tocopy=s2[0];
    s1[0]+=tocopy;
    for(i=1; i<=tocopy; i++)s1[start+i]=s2[i];
    //if (s1[0]<len)s1[s1[0]+1]=0;
}
void gettime(int * hour, int* min, int* sec, int * hundredths)
{
    long h;
    struct timeb tp;
#ifdef NIOS
    time_t clocks;
    struct tm *loc;
    time_t t1;
    ftime(&tp);
    loc=localtime(&tp.time);
    *hour=	loc->tm_hour;
    *min = loc->tm_min;
    *sec =loc->tm_sec;
    *hundredths=(short)(tp.millitm/10);
#endif
#ifndef NIOS
    struct timeval tv;
    struct timezone tz;
    gettimeofday(&tv,&tz);
    *sec=(int)( tv.tv_sec %60);
    *min= (int)((tv.tv_sec /60)%60);
    *hour= (int)(tv.tv_sec /3600);
    *hundredths=(int)(tv.tv_usec/10000);
#endif
}
double secs()
{
    /*	struct timeval t;
    	gettimeofday(&t,NULL);
    	double s;
    	if ( ((int)((t.tv_sec /3600)) > 0 ))
    		t.tv_sec+=3600;
    	else
    		if ( ((int)((t.tv_sec /60)%60)) > 0 )
    			t.tv_sec+=60;
    	s=(double ) ((t.tv_sec*1000000+t.tv_usec));*/
    int hour,min,sec,hundredths;


    double s;
    gettime(&hour,&min,&sec,&hundredths);

    s= 60.0*((60.0*hour)+min)+sec+0.01*hundredths;

    return s;
}

//int trunc(float f){int a=(int)f;
//                      if(f>0){if(a>f) return a-1;return a;}
//		      else{if(a<f) return a+1;}
//                      return (int)f;
//}




/* This does the work of actual initialisation, the delphi flag should be set to 1
   when initialising a delphi dynamic array. In this case the allocation of the
   descriptor is not done only the allocation of the pointer and the setup of the steps */
typedef char *  Addr;
void doinitvec(Addr ** phdr, int rank,int elemsize,int delphi)
{   long newsize,i,pos,hdrsize,step;
    Addr * newhdr;
    Addr low,high;
    Addr * hdr= *phdr;
    step=elemsize;
    for (i=rank; i>0; i--)
    {   pos=i-1;
        low=(Addr)hdr[pos*3+1];
        high=(Addr)hdr[pos*3+2];
        step=step*(high -low +1);
        hdr[pos*3 ]=(Addr)step;

    }
    if(delphi==0) {
        hdrsize = sizeof(Addr)*rank*3; /* that gives the header size */
        newsize= hdrsize	+ step;
        newhdr = (Addr *)MALLOC(newsize);
        hdr[0]=(Addr)&(((char*)newhdr)[hdrsize]);
        // header is now initialised copy it to the correct position
        for(i=0; i<(rank*3); i++)newhdr[i]=hdr[i];
        *phdr = newhdr;
        FREE(hdr); // get rid of the old header
    }
    else
    {
        hdr[0]=(Addr)(MALLOC(step));
    }

}

/* this is called to initialise a dynamic array.
   it is given a pointer to a pointer to a header block of the format
   base of array
   low 0                 index of lowest element of dimension 0
   high 0                index of highest element of dimension 0
   step 0                step size for dimension 0
   low 1
   high 1
   ....
   step n-1
   low n
   high n

   where n = rank-1
   It calculates the store required for the array+ the header, allocates it,
   copies the header into the new space, and then updates the header pointer
   to point at the new header */
void initvec(Addr ** phdr, int rank,int elemsize) {
    doinitvec(phdr,rank,elemsize,0);
}

void delphiinitvec(Addr * phdr, int rank,int elemsize) {
    doinitvec(&phdr,rank,elemsize,1);
}

void getmem(int **pntr, int size)
{
    *pntr=(int*)MALLOC(size);
}
void calias(int ** pntr, int size, int * srchddr)
{
    *pntr = (int*)MALLOC(size);
    int * p =  *pntr;
    int * s =  srchddr;
    int i;
    for(i=0; i<size/4; i++) {
        p[i]=s[i];

    }
}
void freemem(int *pntr, int size)
{
    FREE (pntr);

}
void printpointer(int p)
{
    printf( "%x",p);
}

void pdispose(int *p) {
    /*	printf("pdispose %x",p);*/
    FREE(p);
}
extern int Pmain();/* the entry point of the pascal program */
extern int Pdllmain();/* the entry point of the pascal program */

void boundsfault(int x)
{
    if(x==(256+5)) {
        printf("bounds fault\n");
    }
    raise(SIGABRT);

}



struct dset {
    int bottom,top,isstatic,padding;
    char * bits;
};
/* Create a dynamic set on the heap initialising it from the ranges */
struct dset * createdset		(int rangeslength,int* ranges)
{   char * p;
    int   top,bottom,i,j,realtop,realbottom,space,nindex,offset,ent;
    struct dset *    pp;
    bottom=ranges[0];
    top=ranges[1];

    for( i=0 ; i< rangeslength ; i+=2)
    {
        ent= ranges[i];
        bottom=bottom < ent ?bottom :ent ;
        ent= ranges[i+1];
        top= top <ent ?ent:top;
    }
    realbottom= bottom &0xfffffff8;
    realtop = top | 7;
    space = ( (realtop -realbottom) / 8)+1;

    p= malloc(space);
    for (i=0; i<space; i++)p[i]=0;
    for( i=0 ; i< rangeslength ; i+=2) {
        for( j= ranges[i] ; j<= ranges[i+1]; j++) {

            nindex = j - (realbottom );
            offset = nindex >> 3;
            p[offset] |= (1 << (nindex & 7));

        }
    }
    pp=malloc(sizeof(struct dset));
    pp->top=realtop;
    pp->bottom=realbottom;
    pp->bits=p;
    pp->isstatic=0;
    return pp;
}



int cround(float f) {
    return (int)f;
}

void grabstack() {
    int big[1000002];   // Called below by main
}

/*------------------------ Entry point ---------------------------*/
int Argc;
int paramcount() {
    return Argc;
}
char **Argv;
char * parampntr(int i) {
    return Argv[i];
}
#ifndef LIBRARY
#ifndef BUILD_DLL
int main(int argc,char ** argv) {
    Argc=argc;
    Argv=argv;
    initfs();
#ifdef CLSIMD
    initopencl();
#endif

#ifdef nvidia
	setupNvidia();
#endif

    /* Comment out signal function if needed to avoid problem during runtime under cygwin */
    //signal(SIGSEGV,boundsfault);
// grabstack encourages cl.exe v2005 to insert a call to _chkstk - now needed by Pmain
#if defined (_MSC_VER) && (_MSC_VER >= 1400)
    grabstack();	// cl.exe will also need a large stack; set by command line, e.g. /F4000000
#endif
    Pmain();

#ifdef CLSIMD
    openclCleanUp();
#endif

#ifdef nvidia
	nvidiaClean();
#endif
 closefiles();
 return 0;
  //  pascalexit(0);
}
#endif
#endif
#ifdef BUILD_DLL
void dllinit() {

    Argc=0;
    Argv=0;
    initfs();
    /* Comment out signal function if needed to avoid problem during runtime under cygwin */
    //signal(SIGSEGV,boundsfault);
#if defined (_MSC_VER) && (_MSC_VER >= 1400)
    grabstack();	// grabstack's purpose is explained at its call from main.
#endif
    Pdllmain();
}
#endif

