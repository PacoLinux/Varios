
#include <stdlib.h>

conv(char *im, int planes, int rows,int  cols,float c1,float c2,float c3)
/* C version of a convolution routine */
{ int i,j,p,temp;
  int planestep=rows*cols;
  char * plane, * buffplane;
  char * buff = malloc( rows*planes*cols);
  for (p=0;p<planes;p++){
   plane = &im[p*planestep];
   buffplane= &buff[p*planestep];
   /* convolve horizontally */
   for(i=0;i<rows;i++){
    for(j=1;j<(cols-1);j++) {
      temp=plane[i*cols+j-1]*c1+plane[i*cols+j]*c2+plane[i*cols+j+1]*c3;
      if (temp<0){temp=0;}
      else if (temp>255)  { temp=255;}    ;
      buffplane[i*cols+j]=temp;
    }
    buffplane[i*cols]=plane[i*cols];
    buffplane[i*cols+cols-1]=plane[i*cols+cols-1];
   }
   /* convolve vertically */
   for(j=0;j<cols;j++) {
    for(i=1;i<rows-1;i++){

      temp=buffplane[(i-1)*cols+j]*c1+buffplane[i*cols+j]*c2+buffplane[(1+i)*cols+j]*c3;
      if(temp<0){temp=0;}
      else if (temp>255)  { temp=255;}  ;
      plane[i*cols+j]=temp;

    }
    plane[j]=buffplane[j];
    plane[(rows-1)*cols+j]=buffplane[ (rows-1)*cols+j];
   }
  }
  free(buff);
}
cconv(float *im,   int rows,int  cols,float c1,float c2,float c3)
/* C version of a float matrix convolution routine */
{ int i,j,p,temp;
  
  
  float * buff = malloc( rows *cols*sizeof(float));
  {
  
   /* convolve horizontally */
   for(i=0;i<rows;i++){
    for(j=1;j<(cols-1);j++) {
      buff [i*cols+j]= im[i*cols+j-1]*c1+im[i*cols+j]*c2+im[i*cols+j+1]*c3;
       
      
    }
    buff [i*cols]=im[i*cols];
    buff [i*cols+cols-1]=im[i*cols+cols-1];
   }
   /* convolve vertically */
   for(j=0;j<cols;j++) {
    for(i=1;i<rows-1;i++){

       im[i*cols+j]=buff [(i-1)*cols+j]*c1+buff[i*cols+j]*c2+buff [(1+i)*cols+j]*c3;
    

    }
    im[j]=buff [j];
    im[(rows-1)*cols+j]=buff[ (rows-1)*cols+j];
   }
  }
  free(buff);
}



