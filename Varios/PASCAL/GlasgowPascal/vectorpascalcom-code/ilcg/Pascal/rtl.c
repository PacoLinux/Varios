/*
ilcg pascal run time library
 

*/
#include <stdio.h>
#include <sys/time.h>
#define null 0
#define filemax 31
#define CLOSED 0
#define OPEN 1
#define RESERVED -1
#define NOFREEFILES 300
#define ORDINALREADERROR 301

struct {FILE *f;char name[245];int status;int recsize;} files[filemax+1];
int iores=0;
void initfs()/* initialises all of the file blocks to unopened */
{
	int i;
	for(i=0;i<filemax;i++){files[i].status=CLOSED;  files[i].recsize=1;}
	files[0].status=OPEN;
	files[0].f=stdin;
}
void closefiles();
void pascalexit(int code){closefiles();exit(code);} 
void checkerr(int fn){
	if(iores){fprintf(stderr,"File sub-system  error: %d",iores);pascalexit(iores);}
	if((fn<0)||(fn>filemax)){fprintf(stderr,"Unassigned file handle %d",fn);pascalexit(iores);}
	//if(files[fn].status==CLOSED){fprintf(stderr,"Unassigned or closed file handle %d",fn);pascalexit(iores);}
}
int findfreefileblock()
{      int i;
	for(i=0;i<filemax;i++)if (files[i].status==CLOSED)return i;
	return -1;
}
void closefiles()
{
	int i;
	for(i=0;i<filemax;i++)if(files[i].status==OPEN)fclose(files[i].f);
}

void close(int * filenum)
{
	checkerr(*filenum);
	fclose(files[*filenum].f);
	files[*filenum].status=CLOSED;
}
int eof(int *filenum)
{
	checkerr(*filenum);
	if(feof(files[*filenum].f)) return 1;
	return 0;
}
void erase(char *filename){ unlink(&filename[1]);}
int filesize(int *filenum)
{
	long p,l;FILE *f;checkerr(*filenum);f=files[*filenum].f;
	p =ftell(f);
	fseek(f,0L,SEEK_END);
	l= ftell(f);
	fseek(f,p,SEEK_SET);
	return (int)l;
}
int filepos(int *filenum){  FILE *f;checkerr(*filenum);f=files[*filenum].f; return ftell(f);}

/*
	 procedure blockread(var f:fileptr;var buf;count:integer; var resultcount:integer);
	procedure blockwrite(var f:fileptr;var buf;count:integer; var resultcount:integer);
	*/
void blockread(int * filenum, char * buf,int count, int * resultcount)
{
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
	checkerr(*filenum);
	files[*filenum].f=fopen(files[*filenum].name,"w");
	files[*filenum].status=OPEN;
}
void reset(int *filenum)
{
	checkerr(*filenum);
	files[*filenum].f=fopen(files[*filenum].name,"r+");
	files[*filenum].status=OPEN;
}
void append(int *filenum)
{
	checkerr(*filenum);
	files[*filenum].f=fopen(files[*filenum].name,"a");
	files[*filenum].status=OPEN;
}
void assign(int * filenum, unsigned char * filename)
{	int i;
	int fn = findfreefileblock();
	if(fn<0){ iores=NOFREEFILES;*filenum=-1;return;}
	for(i=0;i<filename[0];i++)files[fn].name[i]=filename[i+1];
	files[fn].name[filename[0]]=0;
	files[fn].status=RESERVED;
	*filenum=fn;
}
int ioresult(){ int temp=iores;iores=0;return temp;}
void readchar(int fn,char *c)
{
	FILE *f;checkerr(fn);
	f=files[fn].f;
	if(fn==null)*c = getc(stdin);
	else *c=getc(f);
}
void printchar(int fn,int x, int width, int afterpoint)
{	FILE *f;checkerr(fn);
	f =files[fn].f;
	if(fn==null)printf("%c",x); 
	else fprintf(f,"%c",x); 
}
void readline(int fn)
{	char c;FILE *f;checkerr(fn);
	f=files[fn].f;
 	if(fn==null)f=stdin;
	c=getc(f);
	while(c!='\n')c=getc(f);
}
int endoffile(int fn)
{int c,r;FILE *f;checkerr(fn);
	f=files[fn].f;
 	if(fn==null)f=stdin;
	c=getc(f);
	if(c==EOF)r=1;else{ r=0;ungetc(c,f);}
	return r;
}
int endofline(int fn)
{char c,r;FILE *f;checkerr(fn);
	f=files[fn].f;
 	if(fn==null)f=stdin;
	c=getc(f);
	if(c=='\n')r=1;else{ r=0;ungetc(c,f);}
	return r;
}	
void println(int fn )
{	FILE *f;checkerr(fn);
	f=files[fn].f;
	
	if(fn==null)printf("\n"); 
	else fprintf(f,"\n"); 
}
void printspaces(int fn, int width)
{	FILE *f ;
	
	char  spaces[100];
	int i;
	checkerr(fn);
	f =files[fn].f;
	if(width>80)width=80;	
	for(i=0;i<(width);i++){
			spaces[i]=' ';
			spaces[i+1]='\0';
	}
	if(fn==null)printf("%s",spaces );
	else fprintf(f,"%s",spaces );
}
void pascalerror(char *e)
{
	fprintf(stderr,"%s",e);
	pascalexit(-1);
}
void readstring(int fn,char *s, int len)
{
	char c;int count;
	FILE *f;checkerr(fn);
	f=files[fn].f;
	if (fn==null)f=stdin;
	count=0;
	c=' ';
	while((*s<len)&&(c!='\n') ){
		c=getc(f);
	 
		if(c!='\n'){
			count++;
			s[count]=c;
			s[0]=count;
		}else ungetc(c,f);
	}
}
void printstring(int fn,unsigned char * s, int e1,int e2 )
{	int i,l ;char c;
	
	FILE *f ;checkerr(fn);
	f =files[fn].f;
	l=s[0];
	if (e1> l ) printspaces(fn,e1-l);
	for( i=1;i<=  l;i++){
			c=s[i];
			printchar(fn, c,1,1);
		}
}
void printordinal(int fn,int o, int e1,int e2, unsigned char ** tab )
{
	printstring(fn,tab[o],e1,e2);
}
void skipspaces(FILE *f)
{
	char c;
	for(c=' ';c==' ';c=getc(f));
	ungetc(c,f);
}
void readordinal(int fn, int *b,char ** tab,int len)
{	char c;
	int i,count;
	char string[255];
	FILE *f;checkerr(fn);
	f=files[fn].f;
	if (fn==null)f=stdin;
	skipspaces(f);
        c=tolower(getc(f));
        string[0]=0;count=0;
	while(((c<='z'&&c>='a')||(c<='9'&&c>='0'))&&(count<254)){
           
	  string[count+1]=c;string[0]++;count++;
	  c=tolower(getc(f));	
	}
	ungetc(c,f);
	for(i=0;i<len;i++)
	{
	    if (stringcompare(&string,tab[i])==0)
	    {
		if (len<256){ *b=i;return;}
		*((short*)b)=i;
		
            }
	} 
	iores=ORDINALREADERROR;
}
/* return -1 if s1<s2,0 if s1=s2, 1if s1>s2 */
int stringcompare(char *s1,char* s2)
{
	int i,len;
	len=s1[0];
        if(s2[0]<len)len=s2[0];
	
	for(i=1;(i<=len);i++){
               
		if(s1[i]<s2[i])return -1;
		if(s1[i]>s2[i])return 1;
	}
	if(s1[0]<s2[0])return -1;
	if(s1[0]>s2[0])return 1;
	return 0;
}	
void readbool(int fn,char *b)
{	char c;
	FILE *f;checkerr(fn);
	f=files[fn].f;
	if (fn==null)f=stdin;
	skipspaces(f);
	c=toupper(getc(f));
	if(c=='F'){
		if(toupper(getc(f))=='A')
		if(toupper(getc(f))=='L')
		if(toupper(getc(f))=='S')
		if(toupper(getc(f))=='E'){*b=0;return;}
	}else
	if(c=='T'){
		if(toupper(getc(f))=='R')
		if(toupper(getc(f))=='U')
		if(toupper(getc(f))=='E'){*b=1;return;}
	}
	pascalerror("error in reading a boolean");
	
}
 void printbool(int fn,char  b, int e1,int e2 )
{	
	FILE *f;checkerr(fn);
	f =files[fn].f; 
		if (e1>5)printspaces(fn,e1-5);
         if (fn==null)  {
	   if(b) printf( "true ") ; else printf("false");
         }else{
         	 if(b) fprintf( f,"true ") ; else fprintf(f,"false");
         }
	
}
void readint(int fn, int *x)
{
	FILE *f;checkerr(fn);
	f=files[fn].f;
	if (fn==null)f=stdin;
	
	fscanf(f,"%d",x);
}
void printint(int fn,int x,int width,int afterpoint){
	

	char buf[100],format[100];
	int len ,i;
	
	FILE *f ;checkerr(fn);
	f =files[fn].f;
	  sprintf(format,"%c%dd",'%',width);
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
void readreal(int fn , float *x)
{
	
	FILE *f;checkerr(fn);
	f=files[fn].f;
	if (fn==null)f=stdin;
	
	fscanf(f,"%f",x);
	
}	
void printreal(int fn,float x,int width,int afterpoint){
	char buf[100],format[100];
	int len ,i;
	
	FILE *f ;checkerr(fn);
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
void stringassign(unsigned char *s1, int len,unsigned  char* s2)
{
	int tocopy = len;
	int i;
	if (s2[0]<tocopy) tocopy=s2[0];
	s1[0]=tocopy;
	//printf("to copy %d",tocopy);
	for(i=1;i<=tocopy;i++)s1[i]=s2[i];
	//if (tocopy<len)s1[tocopy+1]=0;
}
void stringappend(unsigned char *s1, int len, unsigned char* s2)
{	int start=s1[0];
	int tocopy = len-start;
	int i;
	if (s2[0]<tocopy) tocopy=s2[0];
	s1[0]+=tocopy;
	for(i=1;i<=tocopy;i++)s1[start+i]=s2[i];
	//if (s1[0]<len)s1[s1[0]+1]=0;
}
void gettime(int * hour, int* min, int* sec, int * hundredths)
{   int scale = CLOCKS_PER_SEC/100;
    long h;
    time_t clocks;struct tm *loc;time_t t1;
	clocks=clock();
	time(&t1);
	loc=localtime(&t1);
	*hour=	loc->tm_hour;
	*min = loc->tm_min;
	*sec =loc->tm_sec;
    h=clocks/scale;
    h= h % 100;
	*hundredths=(short)(h);
}
float secs()
{
	clock_t c ;
	float s;
	c=clock();
	s= c;
	s= s/ CLOCKS_PER_SEC;
	return s;
}
int trunc(float f){ return (int)f;}
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

void initvec(int ** phdr, int rank,int elemsize)
{     int newsize,i,pos,low,high,step,hdrsize;
	int * newhdr;
	int* hdr= *phdr;
	
	step=elemsize;
	
	for (i=rank;i>0;i--)
	{       pos=i-1;
		low=hdr[pos*3+1];
		high=hdr[pos*3+2];	
                
		step=step*(high -low +1);
		 hdr[pos*3 ]=step;
	}
	
	hdrsize = sizeof(int)*rank*3; /* that gives the header size */
	newsize= hdrsize	+ step;
	*phdr = (int*)malloc(newsize);
	hdr[0]=(int)(*phdr)+hdrsize;
	// header is now initialised copy it to the correct position
	newhdr= *phdr;
	for(i=0;i<(rank*3);i++)newhdr[i]=hdr[i];

	free(hdr); // get rid of the old header
}
void getmem(int **pntr, int size)
{
	*pntr=(int*)malloc(size);
}
void freemem(int **pntr, int size)
{
	free (*pntr);
	
}
void printpointer(int p)
{
	printf( "%x",p);
}

void pdispose(int *p){
	printf("pdispose %x",p);
	free(p);
}
extern int Pmain();/* the entry point of the pascal program */


/*------------------------ Entry point ---------------------------*/

int main(int argc,char ** argv){
	initfs();
	 Pmain();	
	pascalexit(0);
}
