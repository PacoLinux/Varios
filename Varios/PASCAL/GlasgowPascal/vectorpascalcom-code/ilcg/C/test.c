//#include<stdio.h>
#define x 10
   extern char * malloc();
 
int y[2][8] = {{1,2,3,4,5,6,7,8},{110,120,130,140,150,0,0,0}};
 //int printf();
extern int printf (const char *__restrict __format, ...);
//int bye(int a){printf("bye !\n");return ;} 
int main(int argc, char ** argv)
{ 
    int **p,*q ,f,*r; 
  
    f=2;
     p=malloc(x*sizeof(q));
    q=malloc(4*x*sizeof(f));
    
    r=malloc(4*x*sizeof(f));
    
     q[0:x*4]=iota0;
   //  p[0:f]=q[0:f];
//   p[0:x]=&q[0:x:4];
   
//   printf("  %d   ",p[0:2][0:3]);
   printf("\n");
    f=\+ q[0:3];
   printf("f= %d \n",f);
    r[1:2]= \+ q[0:4];
 //    printf("r[ %d ]=%d\n",iota0,r[0:3]);
    r[1:2]=q[:];  
 //    printf("r[ %d ]=%d\n",iota0,r[0:3]);
//    f=p[1][1]+1;
 //  r[0:2]= \+ p[0:2][0:3];
 //    printf("r[ %d ]=%d\n",iota0,r[0:3]); 
//   printf(" %d \n", p[0:2][0:3]);
 //  r[2:2]
// f= \+( \+ p[0:2][0:2]+ \* p[0:2][1:2]);
 //  printf("f=%d\n",f);
 //  printf("sum of y=", \+ \+ y[:][:]);
 // printf("q[ %d ]=%d\n",iota0,q[0:2]);
//leave:bye(1);
   return 0;
}
 

